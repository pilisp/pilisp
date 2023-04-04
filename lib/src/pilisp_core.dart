// TODO Call this file pilisp_core_impl.dart
import 'dart:collection';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pilisp/src/pilisp_error.dart';

import 'pilisp_env.dart';
import 'pilisp_expr.dart';
import 'pilisp_print.dart';

// To Implement:
//
//  - sublist/subvec
//  - booleanCast
//  - type predicates
//  - read-string
//  - eval

abstract class PLDeref {
  Object? dereference({int timeout = 10000});
}

/// Container for mutable state.
///
/// Akin to Clojure's `clojure.lang.Volatile`, by default this is just a "place"
/// for mutable in-memory state from an otherwise immutable PiLisp program.
class PLState extends PLExpr implements PLDeref {
  static final readRequired = Object();
  Object? value = readRequired;
  PLEnv env;

  PLState(this.env);

  PLState.withValue(this.env, this.value);

  /// If read from disk, returns a [Future]. Otherwise synchronously returns
  /// the state's [value].
  Object? readFromState({int timeout = 10000, bool refresh = false}) {
    return value;
  }

  /// Set a new value for the [PLState], persisting first if configured.
  Object? writeValueToStateSync(Object? val) {
    return value = val;
  }

  @override
  Object? dereference({int timeout = 10000}) {
    return readFromState();
  }

  @override
  String printToString(PLEnv env) {
    return '#<state: ${plPrintToString(env, value)}>';
  }

  @override
  String typeName() {
    return 'state';
  }
}

class PLAwait extends PLExpr implements PLDeref {
  Future<Object?> value;
  PLAwait._(this.value);

  factory PLAwait.forValue(Object? x) {
    final v = x is Future ? x : Future.value(x);
    return PLAwait._(v);
  }

  @override
  Object? dereference({int timeout = 10000}) {
    return value;
  }

  @override
  String printToString(PLEnv env) {
    return '#<await $value>';
  }

  @override
  String typeName() {
    return 'await';
  }
}

/// Dispatch based on aritrary dispatch functions, with specializations for
/// faster type-based dispatch.
///
/// Since PiLisp is interpreted and there is no story for dynamic class creation
/// in Dart, both protocols and multi-methods are backed by [PLMultiMethod].
class PLMultiMethod extends PLNamedInvocable {
  final bool isTypeDispatched;
  IMap<PLSymbol, PLInvocable> implsByType = IMap({});

  PLMultiMethod(this.isTypeDispatched);

  @override
  String typeName() {
    return isTypeDispatched ? 'protocol' : 'multi-method';
  }

  @override
  String printToString(PLEnv env) {
    return '#<${isTypeDispatched ? 'protocol' : 'multi-method'}: $name>';
  }

  @override
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    if (isTypeDispatched) {
      return invokeTypeDispatchedMethod(env, args);
    } else {
      return invokeFunctionDispatchedMethod(env, args);
    }
  }

  // Protocols

  Object? invokeTypeDispatchedMethod(PLEnv env, Iterable<Object?> args) {
    if (args.isNotEmpty) {
      final dispatcher = args.first;
      final dispatcherType = PLSymbol(typeString(dispatcher));
      final impl = implsByType[dispatcherType];
      if (impl != null) {
        return impl.invoke(env, args);
      } else {
        throw ArgumentError(
            'No method in protocol $name for type: $dispatcherType');
      }
    } else {
      throw ArgumentError(
          'The $name protocol method expects at least 1 argument, but received none.');
    }
  }

  void addTypeDispatchedMethod(PLSymbol dispatchType, PLInvocable invocable) {
    implsByType = implsByType.add(dispatchType, invocable);
  }

  void removeTypeDispatchedMethod(PLSymbol dispatchType) {
    implsByType = implsByType.remove(dispatchType);
  }

  // Multi-methods

  Object? invokeFunctionDispatchedMethod(PLEnv env, Iterable<Object?> args) {}
}

bool isIdenticalFn(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final x = args[0];
    final y = args[1];
    return identical(x, y);
  } else {
    throw ArgumentError(
        'The identical? function expects 2 arguments, but received ${args.length} arguments.');
  }
}

/// Functions bound in [PLEnv]
IMap<PLSymbol, IMap<Object?, Object?>> bindingsFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    Map<PLSymbol, PLBindingEntry> m = {};
    for (final scope in env.scopes) {
      m.addAll(scope); // later scopes override earlier ones
    }
    Map<PLSymbol, IMap<Object?, Object?>> ret = {};
    for (final key in m.keys) {
      final bindingEntry = m[key]!;
      ret[key] = bindingEntry.toPLExpr();
    }
    return ret.toIMap();
  } else {
    throw FormatException(
        'The bindings function expects 0 arguments but received ${args.length} arguments.');
  }
}

PLList arglistsFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final fn = args[0];
    if (fn is Function) {
      // As close as we can get for now.
      return PLList([fn.toString()]);
    } else if (fn is PLFunction) {
      final arities = fn.arities;
      final l = <PLVector>[];
      for (final arity in arities.values) {
        l.add(arity.params);
      }
      return PLList(l);
    } else if (fn is PLTerm) {
      return PLList([
        [PLSymbol('map')].toPLVector(),
        [PLSymbol('map'), PLSymbol('default-not-found')].toPLVector(),
      ]);
    } else if (fn is PLVector) {
      return PLList([
        [PLSymbol('index')].toPLVector(),
        [PLSymbol('index'), PLSymbol('default-not-found')].toPLVector(),
      ]);
    } else if (fn is PLMap) {
      return PLList([
        [PLSymbol('key')].toPLVector(),
        [PLSymbol('key'), PLSymbol('default-not-found')].toPLVector(),
      ]);
    } else {
      throw ArgumentError(
          'The arglists function expects an invocable value, but received a ${typeString(fn)}');
    }
  } else {
    throw ArgumentError(
        'The arglists function expects 1 argument, but received ${args.length} arguments.');
  }
}

PLEnv envFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return env;
  } else {
    throw ArgumentError(
        'The pl/env function does not accept any arguments, but received ${args.length} arguments.');
  }
}

bool debugBangFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final bl = args[0];
    if (bl is bool) {
      env.isDebug = bl;
      return bl;
    } else {
      throw ArgumentError(
          'The debug! function expects its argument to be a bool, but received a ${typeString(bl)} value.');
    }
  } else {
    throw FormatException(
        'The debug! function expects 1 argument, but received ${args.length} arguments.');
  }
}

Object? plSetParentFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    env.parent = args[0];
    return env.parent;
  } else if (args.isEmpty) {
    env.parent = null;
    return null;
  } else {
    throw FormatException(
        'The pl/set-parent function expects 0 or 1 argument, but received ${args.length} arguments.');
  }
}

Object? plSetParentSelectorFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    return env.parentSelector = args[0];
  } else if (args.length == 0) {
    env.parentSelector = null;
    return null;
  } else {
    throw ArgumentError(
        'The pl/set-parent-selector function expects 0 or 1 argument, but received ${args.length} arguments.');
  }
}

Object? plGetParentFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return env.parent;
  } else {
    throw ArgumentError(
        'The pl/get-parent function expects 0 arguments, but received ${args.length} arguments.');
  }
}

Object? plGetParentSelectorFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return env.parentSelector;
  } else {
    throw ArgumentError(
        'The pl/get-parent-selector function expects 0 arguments, but received ${args.length} arguments.');
  }
}

Object? resolveFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final sym = args[0];
    if (sym is PLSymbol) {
      if (env.isBound(sym)) {
        // [env.isBound] ensures it's present
        return env.getBinding(sym)!.toPLExpr();
      } else {
        throw UndefinedSymbol(sym);
      }
    } else {
      throw ArgumentError(
          'The resolve* function expects its first argument to be a symbol, but received a ${typeString(sym)} value.');
    }
  } else {
    throw ArgumentError(
        'The resolve* function expects 1 argument, but received ${args.length} arguments.');
  }
}

BigInt nextSymbolIdFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return env.nextId();
  } else {
    throw FormatException(
        'The next-symbol-id function expects 0 arguments, but received ${args.length} arguments.');
  }
}

PLSymbol makeSymbolFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final symbolName = args[0];
    if (symbolName is String) {
      return PLSymbol(symbolName);
    } else {
      throw ArgumentError(
          'The symbol function expects its argument to be a string, but received a ${typeString(symbolName)} value.');
    }
  } else if (args.length == 2) {
    final symbolNamespace = args[0];
    final symbolName = args[1];
    if (symbolNamespace is String) {
      if (symbolName is String) {
        return PLSymbol('$symbolNamespace/$symbolName');
      } else {
        throw ArgumentError(
            'The symbol function expects its second argument to be a string, but received a ${typeString(symbolName)} value.');
      }
    } else if (symbolNamespace == null) {
      if (symbolName is String) {
        return PLSymbol(symbolName);
      } else {
        throw ArgumentError(
            'The symbol function expects its second argument to be a string, but received a ${typeString(symbolName)} value.');
      }
    } else {
      throw ArgumentError(
          'The symbol function expects its first argument to be a string, but received a ${typeString(symbolNamespace)} value.');
    }
  } else {
    throw FormatException(
        'The symbol function expects 1 or 2 arguments, but received ${args.length} arguments.');
  }
}

PLTerm? makeTermFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final termName = args[0];
    if (termName is String) {
      return PLTerm(termName);
    } else if (termName == null) {
      // NB: Inconsistent with makeSymbolFn but matches Clojure's (also inconsistent) behavior.
      return null;
    } else {
      throw ArgumentError(
          'The term function expects its argument to be a string, but received a ${typeString(termName)} value.');
    }
  } else if (args.length == 2) {
    final termNamespace = args[0];
    final termName = args[1];
    if (termNamespace is String) {
      if (termName is String) {
        return PLTerm('$termNamespace/$termName');
      } else {
        throw ArgumentError(
            'The term function expects its second argument to be a string, but received a ${typeString(termName)} value.');
      }
    } else if (termNamespace == null) {
      if (termName is String) {
        return PLTerm(termName);
      } else {
        throw ArgumentError(
            'The term function expects its second argument to be a string, but received a ${typeString(termName)} value.');
      }
    } else {
      throw ArgumentError(
          'The term function expects its first argument to be a string, but received a ${typeString(termNamespace)} value.');
    }
  } else {
    throw FormatException(
        'The term function expects 1 or 2 arguments, but received ${args.length} arguments.');
  }
}

Object? nameFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final nameable = args[0];
    if (nameable is String) {
      return nameable;
    } else if (nameable is PLTerm) {
      return nameable.name;
    } else if (nameable is PLSymbol) {
      return nameable.name;
    } else {
      throw ArgumentError(
          'The name* function expects its argument to be a string, symbol, or term, but received a ${typeString(nameable)} value.');
    }
  } else {
    throw ArgumentError(
        'The name* function expects 1 argument, but received ${args.length} arguments.');
  }
}

Object? macroexpand1Fn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final form = args[0];
    return macroExpand1(env, form);
  } else {
    throw FormatException(
        'The macroexpand-1 function expects 1 argument, but received ${args.length} arguments.');
  }
}

Object? macroexpandFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final form = args[0];
    return macroExpand(env, form);
  } else {
    throw FormatException(
        'The macroexpand function expects 1 argument, but received ${args.length} arguments.');
  }
}

PLVector _vecOfEntries(Iterable<MapEntry<Object?, Object?>> entries) {
  var l = <Object?>[];
  for (final entry in entries) {
    final vector = PLVector([entry.key, entry.value]);
    vector.isMapEntry = true;
    l.add(vector);
  }
  return PLVector(l);
}

bool isMapEntryFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final x = args[0];
    return (x is PLVector && x.isMapEntry);
  } else {
    throw FormatException(
        'The map-entry? function expects 1 argument, but received ${args.length} arguments.');
  }
}

Object? seqFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final coll = args[0];
    if (coll == null) {
      return null;
    } else {
      if (coll is PLVector) {
        if (coll.isEmpty) {
          return null;
        } else {
          return coll;
        }
      } else if (coll is PLList) {
        if (coll.isEmpty) {
          return null;
        } else {
          return coll;
        }
      } else if (coll is Iterable<Object?>) {
        if (coll.isEmpty) {
          return null;
        } else {
          return PLVector(coll);
        }
      } else if (coll is IMap<Object?, Object?>) {
        if (coll.isEmpty) {
          return null;
        } else {
          return _vecOfEntries(coll.entries);
        }
      } else if (coll is String) {
        if (coll.isEmpty) {
          return null;
        } else {
          return PLVector(coll.codeUnits);
        }
      } else if (coll is Map<Object?, Object?>) {
        if (coll.isEmpty) {
          return null;
        } else {
          return _vecOfEntries(coll.entries);
        }
      } else if (coll is MapView<Object?, Object?>) {
        if (coll.isEmpty) {
          return null;
        } else {
          return _vecOfEntries(coll.entries);
        }
      }

      throw UnsupportedError('Cannot create a seq from a ${typeString(coll)}');
    }
  }
  throw FormatException(
      'The seq function expects 1 argument, but received ${args.length} arguments.');
}

int seqLength(Object o) {
  if (o is PLVector) {
    return o.length;
  } else if (o is PLList) {
    return o.length;
  } else if (o is Iterable) {
    return o.length;
  } else {
    throw 'Developer Error: seq should return null or a sequential collection, but returned ${typeString(o)}';
  }
}

PLVector vectorFn(PLEnv env, PLVector args) => args;

PLList listFn(PLEnv env, PLVector args) => args.toPLList();

IMap<Object?, Object?> hashMapFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return IMap({});
  } else if (args.length.isEven) {
    Map<Object?, Object?> m = {};
    var key = args[0];
    // NB: Starting on 1 to prepopulate `key` as non-null
    for (var i = 1; i < args.length; i++) {
      if ((i + 1).isEven) {
        m[key] = args[i];
      } else {
        key = args[i];
      }
    }
    return m.toIMap();
  } else {
    throw ArgumentError(
        'The hash-map function expects an even number of arguments, but received ${args.length} arguments.');
  }
}

List<Object?> toDartListFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final coll = args[0];
    if (coll is PLList) {
      return coll.toList();
    } else if (coll is PLVector) {
      return coll.toList();
    } else if (coll is IList) {
      return coll.toList();
    } else if (coll is List) {
      return coll;
    }
    throw ArgumentError(
        'The to-dart-list function does not know how to convert a ${typeString(coll)} value into a Dart List.');
  } else {
    throw FormatException(
        'The to-dart-list function expects 1 argument, but received ${args.length} arguments.');
  }
}

List<int> toDartIntListFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final coll = args[0];
    List<int> l = [];
    if (coll is PLList) {
      for (final x in coll.iter) {
        if (x is int) {
          l.add(x);
        } else {
          throw ArgumentError(
              'The to-dart-int-list function expects all of the items in the collection passed to it to be ints, but received a ${typeString(x)} value.');
        }
      }
    } else if (coll is PLVector) {
      for (final x in coll.iter) {
        if (x is int) {
          l.add(x);
        } else {
          throw ArgumentError(
              'The to-dart-int-list function expects all of the items in the collection passed to it to be ints, but received a ${typeString(x)} value.');
        }
      }
    } else if (coll is IList) {
      for (final x in coll) {
        if (x is int) {
          l.add(x);
        } else {
          throw ArgumentError(
              'The to-dart-int-list function expects all of the items in the collection passed to it to be ints, but received a ${typeString(x)} value.');
        }
      }
    } else if (coll is List) {
      if (coll is List<int>) {
        return coll;
      } else {
        throw ArgumentError(
            'The dart-to-int-list function expects a list passed to it to be List<int>, but received a ${typeString(coll)} value.');
      }
    } else {
      throw ArgumentError(
          'The to-dart-int-list function does not know how to convert a ${typeString(coll)} value into a Dart List.');
    }
    return l;
  } else {
    throw FormatException(
        'The to-dart-int-list function expects 1 argument, but received ${args.length} arguments.');
  }
}

List<Future<dynamic>> toDartFutureListFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final coll = args[0];
    List<Future<dynamic>> l = [];
    if (coll is PLList) {
      for (final x in coll.iter) {
        if (x is Future) {
          l.add(x);
        } else {
          throw ArgumentError(
              'The to-dart-future-list function expects all of the items in the collection passed to it to be Futures, but received a ${typeString(x)} value.');
        }
      }
    } else if (coll is PLVector) {
      for (final x in coll.iter) {
        if (x is Future) {
          l.add(x);
        } else {
          throw ArgumentError(
              'The to-dart-future-list function expects all of the items in the collection passed to it to be Futures, but received a ${typeString(x)} value.');
        }
      }
    } else if (coll is IList) {
      for (final x in coll) {
        if (x is Future) {
          l.add(x);
        } else {
          throw ArgumentError(
              'The to-dart-future-list function expects all of the items in the collection passed to it to be Futures, but received a ${typeString(x)} value.');
        }
      }
    } else if (coll is List) {
      if (coll is List<Future>) {
        return coll;
      } else {
        throw ArgumentError(
            'The dart-to-int-list function expects a list passed to it to be List<Future<dynamic>>, but received a ${typeString(coll)} value.');
      }
    } else {
      throw ArgumentError(
          'The to-dart-future-list function does not know how to convert a ${typeString(coll)} value into a Dart List.');
    }
    return l;
  } else {
    throw FormatException(
        'The to-dart-future-list function expects 1 argument, but received ${args.length} arguments.');
  }
}

Map<Object?, Object?> toDartMapFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final coll = args[0];
    if (coll is IMap) {
      return Map<Object?, Object?>.from(coll.unlock);
    } else if (coll is Map) {
      return coll;
    }
    throw ArgumentError(
        'The to-dart-map function does not know how to convert a ${typeString(coll)} value into a Dart Map.');
  } else {
    throw FormatException(
        'The to-dart-map function expects 1 argument, but received ${args.length} arguments.');
  }
}

Set<Object?> toDartSetFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final coll = args[0];
    if (coll is PLList) {
      return coll.toSet();
    } else if (coll is PLVector) {
      return coll.toSet();
    } else if (coll is IList) {
      return coll.toSet();
    } else if (coll is ISet) {
      return coll.toSet();
    } else if (coll is Set) {
      return coll;
    }
    throw ArgumentError(
        'The to-dart-set function does not know how to convert a ${typeString(coll)} value into a Dart Set.');
  } else {
    throw FormatException(
        'The to-dart-set function expects 1 argument, but received ${args.length} arguments.');
  }
}

Object? conjFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return args;
  }
  final coll = args[0];
  final xs = args.skip(1);
  if (coll == null) {
    return PLVector([...xs]);
  } else if (coll is PLVector) {
    return coll.addAll(xs);
  } else if (coll is IMap) {
    Map<Object?, Object?> m = {};
    for (final x in xs) {
      if (x is PLVector && x.length == 2) {
        m[x[0]] = x[1];
      } else if (x is IMap<Object?, Object?>) {
        m.addAll(x.unlock);
      } else if (x == null) {
      } else {
        throw ArgumentError(
            'Cannot conj ${plPrintToString(env, x)} onto a map. Only maps and two-item vectors supported.');
      }
    }
    m.addAll(coll.unlock);
    return IMap(m);
  } else if (coll is PLList) {
    List<Object?> l = coll.toList();
    for (final x in xs) {
      l.insert(0, x);
    }
    return PLList(l);
  } else if (coll is ISet) {
    return coll.addAll(xs);
  } else {
    final seq = seqFn(env, PLVector([coll]));
    if (seq == null) {
      return PLVector(xs);
    } else if (seq is PLVector) {
      return seq.addAll(xs);
    } else {
      throw 'Developer Error: the seq fn must return null or a collection.';
    }
  }
}

Object? assocFn(PLEnv env, PLVector args) {
  if (args.length >= 3) {
    final coll = args[0];
    final key = args[1];
    final value = args[2];
    if (coll is IMap<Object?, Object?>) {
      return coll.add(key, value);
    } else if (coll is PLVector) {
      if (key is int) {
        if (key == coll.length) {
          // NB. Match Clojure behavior
          return coll.add(value);
        } else {
          return coll.put(key, value);
        }
      } else {
        throw ArgumentError(
            'When assoc-ing into a vector, the key must be an integer, but received a ${typeString(key)} value.');
      }
    } else {
      throw ArgumentError(
          'The assoc* function expects its first argument to be a map, but received a ${typeString(coll)}');
    }
  } else {
    throw ArgumentError(
        'The assoc* function expects at least 3 arguments, but only received ${args.length} arguments.');
  }
}

Object? dissocFn(PLEnv env, PLVector args) {
  if (args.length >= 2) {
    final coll = args[0];
    final keys = args.skip(1);
    if (coll is IMap<Object?, Object?>) {
      IMap<Object?, Object?> m = coll;
      for (final key in keys) {
        m = m.remove(key);
      }
      return m;
    } else if (coll is ISet<Object?>) {
      return coll.removeAll(keys);
    } else {
      throw FormatException(
          'The dissoc function expects its first argument to be a map or set, but received a ${typeString(coll)}');
    }
  } else {
    throw FormatException(
        'The dissoc function expects at least 2 arguments, but only received ${args.length} arguments.');
  }
}

PLList consFn(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final item = args[0];
    final coll = args[1];
    final seq = seqFn(env, PLVector([coll]));
    if (seq == null) {
      return PLList([item]);
    } else {
      if (seq is PLVector) {
        return seq.toPLList().insert(0, item);
      } else if (seq is PLList) {
        return seq.insert(0, item);
      } else {
        throw 'Developer Error: cons should return null or a list';
      }
    }
  }
  throw UnsupportedError(
      'The cons function expects two arguments, but received ${args.length} arguments.');
}

Object? applyFn(PLEnv env, PLVector args) {
  if (args.length >= 2) {
    final fn = args[0];
    final applyArgs = args.skip(1);
    final finalArgColl = seqFn(env, PLVector([applyArgs.last]));
    final allButFinalArgs = applyArgs.take(applyArgs.length - 1);
    PLVector fnArgs;
    if (finalArgColl == null) {
      fnArgs = PLVector(allButFinalArgs);
    } else if (finalArgColl is List) {
      fnArgs = PLVector(allButFinalArgs).addAll(finalArgColl);
    } else if (finalArgColl is PLVector) {
      fnArgs = PLVector(allButFinalArgs).addAll(finalArgColl.iter);
    } else if (finalArgColl is PLList) {
      fnArgs = PLVector(allButFinalArgs).addAll(finalArgColl.iter);
    } else {
      throw ArgumentError(
          'The final argument to apply must be a sequential collection, but received a ${typeString(finalArgColl)} value.');
    }
    if (fn is PLInvocable) {
      return fn.invoke(env, fnArgs.toIList);
    } else if (fn is IMap) {
      return fn.invoke(env, fnArgs.toIList);
    } else if (fn is ISet) {
      return fn.invoke(env, fnArgs.toIList);
    } else if (fn is Function) {
      // Assume these built-ins
      return fn(env, fnArgs);
    } else {
      throw FormatException(
          'The apply function expects its first argument to be a function, but received a ${typeString(fn)} value.');
    }
  } else {
    throw FormatException(
        'The apply function expects two arguments, but received ${args.length}');
  }
}

// Object? Function(Iterable<Object?>) dartFnFn(PLEnv env, PLVector args) {
//   if (args.length == 1) {
//     final plFn = args[0];
//     if (plFn is PLFunction) {
//       return ((Iterable<Object?> params) => plFn.invoke(env, params));
//     } else {
//       throw ArgumentError(
//           'The dart/fn function expects its argument to be a function, but received a ${typeString(plFn)} value.');
//     }
//   } else {
//     throw FormatException(
//         'The dart/fn function expects 1 argument, but received ${args.length} arguments.');
//   }
// }

Object? nthFn(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final coll = seqFn(env, PLVector([args[0]]));
    final idx = args[1];
    if (idx is int) {
      if (coll == null) {
        return null;
      } else if (coll is PLVector) {
        return coll[idx];
      } else if (coll is PLList) {
        return coll[idx];
      } else if (coll is List) {
        return coll[idx];
      } else {
        throw 'Developer Error: seq should return null or a sequential collection, but returned a ${typeString(coll)} value.';
      }
    } else {
      throw FormatException(
          'The nth* function expects its second argument to be an integer, but received a ${typeString(idx)} value.');
    }
  } else {
    throw FormatException(
        'The nth* function expects two arguments, but received ${args.length} arguments.');
  }
}

Object? getFn(PLEnv env, PLVector args) {
  if (args.length == 2) {
    return getFn(env, args.add(null));
  } else if (args.length == 3) {
    final coll = args[0];
    final selector = args[1];
    final defaultIfMissing = args[2];
    if (coll == null) {
      return defaultIfMissing;
    } else if (coll is IMap) {
      if (coll.containsKey(selector)) {
        return coll.get(selector);
      } else {
        return defaultIfMissing;
      }
    } else if (coll is PLVector) {
      if (selector is int) {
        if (selector >= 0 && selector < coll.length) {
          return coll[selector];
        } else {
          // NB. Model Clojure's behavior.
          return null;
        }
      } else {
        // NB. Model Clojure's behavior.
        return null;
      }
    } else if (coll is ISet) {
      if (coll.contains(selector)) {
        return selector;
      } else {
        return defaultIfMissing;
      }
    } else {
      throw FormatException(
          'The get* function expects its first argument to be a map, set, or vector, but received a ${typeString(coll)} argument.');
    }
  } else {
    throw FormatException(
        'The get* function expects 2 or 3 arguments, but received ${args.length} arguments.');
  }
}

int countFn(PLEnv env, PLVector args) {
  final fst = args[0];
  if (fst is String) {
    return fst.length;
  }
  // TODO Don't create a seq just to do count. Check types, use seq as fallback.
  final seq = seqFn(env, PLVector([fst]));
  if (seq == null) {
    return 0;
  } else {
    return seqLength(seq);
  }
}

Object? nextFn(PLEnv env, PLVector args) {
  final seq = seqFn(env, PLVector([args[0]]));
  if (seq == null) {
    return null;
  } else {
    if (seq is List) {
      if (seq.isEmpty || seq.length == 1) {
        return null;
      } else {
        return seq.sublist(1).toPLVector();
      }
    } else if (seq is PLVector) {
      if (seq.isEmpty || seq.length == 1) {
        return null;
      } else {
        return seq.sublist(1);
      }
    } else if (seq is PLList) {
      if (seq.isEmpty || seq.length == 1) {
        return null;
      } else {
        return seq.sublist(1);
      }
    } else {
      throw 'The next function does not support collections of type ${typeString(seq)}';
    }
  }
}

PLVector keysFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final m = args[0];
    if (m is IMap) {
      return PLVector(m.keys);
    } else if (m is Map) {
      return PLVector(m.keys);
    } else {
      throw FormatException(
          'The keys function expects its first argument to be a map, but received a ${typeString(m)} argument.');
    }
  } else {
    throw FormatException(
        'The keys function expects 1 argument, but received ${args.length} arguments.');
  }
}

PLVector valuesFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final m = args[0];
    if (m is IMap) {
      return PLVector(m.values);
    } else if (m is Map) {
      return PLVector(m.values);
    } else {
      throw FormatException(
          'The values function expects its first argument to be a map, but received a ${typeString(m)} argument.');
    }
  } else {
    throw FormatException(
        'The values function expects 1 argument, but received ${args.length} arguments.');
  }
}

/// This function exists to get around type issues with [Comparable.compare] and
/// [IList.sort]
int defaultCompare(Object? a, Object? b) {
  if (a is Comparable) {
    if (b is Comparable) {
      return Comparable.compare(a, b);
    } else {
      throw ArgumentError(
          'The second argument $b does not implement Comparable.');
    }
  } else {
    throw ArgumentError('The first argument $a does not implement Comparable.');
  }
}

PLExprIterable sortFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    return sortFn(env, args.insert(0, defaultCompare));
  } else if (args.length == 2) {
    final comparator = args[0];
    final coll = seqFn(env, PLVector([args[1]]));
    if (comparator is int Function(Object?, Object?)) {
      if (coll is PLVector) {
        return coll.sort(comparator);
      } else if (coll is PLList) {
        return coll.sort(comparator);
      } else if (coll is List) {
        // NB: Audit interop with List, Map throughout
        final newColl = List<Object?>.from(coll);
        newColl.sort();
        return PLVector(newColl);
      } else {
        throw FormatException(
            'The sort function expects its second argument to be a list, vector, or Dart list, but received a ${typeString(coll)} value.');
      }
    } else {
      throw FormatException(
          'The sort function expects its first argument to be a comparator function, but received a ${typeString(comparator)} value.');
    }
  } else {
    throw FormatException(
        'The sort function expects 1 or 2 arguments, but received ${args.length} arguments.');
  }
}

// TODO These suggest a PLSeq class is likely best.
bool seqIsEmpty(Object o) {
  if (o is Iterable) {
    return o.isEmpty;
  } else if (o is PLVector) {
    return o.isEmpty;
  } else if (o is PLList) {
    return o.isEmpty;
  }
  throw ArgumentError('The value ${typeString(o)} cannot check for emptiness.');
}

Object? seqFirst(Object o) {
  if (o is Iterable) {
    return o.first;
  } else if (o is PLVector) {
    return o.first;
  } else if (o is PLList) {
    return o.first;
  }
  throw ArgumentError(
      'The value ${typeString(o)} cannot provide a first value.');
}

Object seqSkip(Object o, int n) {
  if (o is Iterable) {
    return o.skip(n);
  } else if (o is PLVector) {
    return o.skip(n);
  } else if (o is PLList) {
    return o.skip(n);
  }
  throw ArgumentError(
      'The value ${typeString(o)} cannot provide a sub-sequence using skip.');
}

class PLReduced {
  final Object? value;
  PLReduced(this.value);
}

PLReduced reducedFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    return PLReduced(args[0]);
  } else {
    throw ArgumentError(
        'The reduced function expects 1 argument, but received ${args.length} arguments.');
  }
}

/// Matches Clojure semantics for reduce
Object? reduceFn(PLEnv env, PLVector args) {
  final al = args.length;
  final arity2 = al == 2;
  final arity3 = al == 3;
  if (arity2 || arity3) {
    final fn = args[0];
    final lastArg = args.last;
    if (lastArg is PLReduced) {
      return lastArg.value;
    }
    final coll = seqFn(env, PLVector([lastArg]));

    if (coll == null ||
        coll is Iterable ||
        coll is PLList ||
        coll is PLVector) {
      if (coll == null || seqIsEmpty(coll)) {
        if (arity3) {
          final arg1 = args[1];
          return arg1 is PLReduced
              ? arg1.value
              : arg1; // initial accumulator value
        } else {
          if (fn is Function) {
            // Questioning design choice of _not_ making all of these PLInvocable instances.
            final ret = fn(env, PLVector([]));
            return ret is PLReduced ? ret.value : ret;
          } else if (fn is PLFunction) {
            final ret = fn.invoke(env, []);
            return ret is PLReduced ? ret.value : ret;
          } else {
            throw FormatException(
                'The reduce function expects its first argument to be a function, but received a ${typeString(fn)} value.');
          }
        }
      } else if (seqLength(coll) == 1) {
        if (arity3) {
          final item1 = args[1];
          final item2 = seqFirst(coll);
          if (fn is Function) {
            final ret = fn(env, PLVector([item1, item2]));
            return ret is PLReduced ? ret.value : ret;
          } else if (fn is PLFunction) {
            final ret = fn.invoke(env, PLVector([item1, item2]).toIList);
            return ret is PLReduced ? ret.value : ret;
          } else {
            throw 'The reduce function expects its first argument to be a function, but received a ${typeString(fn)} value.';
          }
        } else {
          // NB. Reduced not likely possible here.
          final ret = nthFn(env, PLVector([coll, 0]));
          return ret is PLReduced ? ret.value : ret;
        }
      } else {
        if (args.length == 2) {
          final item1 = nthFn(env, PLVector([coll, 0]));
          final item2 = nthFn(env, PLVector([coll, 1]));
          Object? initialAcc;
          if (fn is Function) {
            initialAcc = fn(env, PLVector([item1, item2]));
          } else if (fn is PLFunction) {
            initialAcc = fn.invoke(env, PLVector([item1, item2]).toIList);
          } else {
            throw 'The reduce function expects its first argument to be a function, but received a ${typeString(fn)} value';
          }
          final rest = seqSkip(coll, 2);
          if (seqIsEmpty(rest)) {
            return initialAcc is PLReduced ? initialAcc.value : initialAcc;
          } else {
            Iterable<Object?> restIter;
            if (rest is Iterable) {
              restIter = rest;
            } else if (rest is PLVector) {
              restIter = rest.iter;
            } else if (rest is PLList) {
              restIter = rest.iter;
            } else {
              throw 'Developer Error: `rest` must be a sequential collection, but encountered a ${typeString(rest)} value.';
            }
            Object? acc = initialAcc;
            if (fn is Function) {
              for (final x in restIter) {
                if (acc is PLReduced) {
                  return acc.value;
                } else if (x is PLReduced) {
                  return x.value;
                }
                acc = fn(env, PLVector([acc, x]));
              }
              return acc is PLReduced ? acc.value : acc;
            } else if (fn is PLFunction) {
              for (final x in restIter) {
                if (acc is PLReduced) {
                  return acc.value;
                } else if (x is PLReduced) {
                  return x.value;
                }
                acc = fn.invoke(env, PLVector([acc, x]).toIList);
              }
              return acc is PLReduced ? acc.value : acc;
            } else {
              throw 'The reduce function expects its first argument to be a function, but received a ${typeString(fn)} value';
            }
          }
        } else if (args.length == 3) {
          final initialAcc = args[1];
          Object? acc = initialAcc;
          Iterable<Object?> collIter;
          if (coll is Iterable) {
            collIter = coll;
          } else if (coll is PLVector) {
            collIter = coll.iter;
          } else if (coll is PLList) {
            collIter = coll.iter;
          } else {
            throw 'Developer Error: `coll` must be a sequential collection, but encountered a ${typeString(coll)} value.';
          }

          if (fn is Function) {
            for (final x in collIter) {
              if (acc is PLReduced) {
                return acc.value;
              } else if (x is PLReduced) {
                return x.value;
              }
              acc = fn(env, PLVector([acc, x]));
            }
            return acc is PLReduced ? acc.value : acc;
          } else if (fn is PLFunction) {
            for (final x in collIter) {
              if (acc is PLReduced) {
                return acc.value;
              } else if (x is PLReduced) {
                return x.value;
              }
              acc = fn.invoke(env, PLVector([acc, x]).toIList);
            }
            return acc is PLReduced ? acc.value : acc;
          } else {
            throw 'The reduce function expects its first argument to be a function, but received a ${typeString(fn)} value';
          }
        } else {
          throw 'Unreachable';
        }
      }
    } else {
      throw ArgumentError(
          'The reduce function expects its last argument to be a sequential collection, but received a ${typeString(coll)} value.');
    }
  } else {
    throw FormatException(
        'The reduce function expects 2 or 3 arguments, but received ${args.length} arguments.');
  }
}

/// Niladic arity returns a range of 0 to 1000 exclusive.
PLVector rangeFn(PLEnv env, PLVector args) {
  int start = 0;
  int end = 1000;
  int step = 1;
  if (args.length == 1) {
    final x = args[0];
    if (x is int) {
      end = x;
    } else {
      throw ArgumentError(
          'The range function expects its first argument to be an integer, but received a ${typeString(x)} value.');
    }
  } else if (args.length == 2) {
    final x = args[0];
    if (x is int) {
      start = x;
      final y = args[1];
      if (y is int) {
        end = y;
      } else {
        throw ArgumentError(
            'The range function expects its second argument to be an integer, but received a ${typeString(x)} value.');
      }
    } else {
      throw ArgumentError(
          'The range function expects its first argument to be an integer, but received a ${typeString(x)} value.');
    }
  } else if (args.length == 3) {
    final x = args[0];
    if (x is int) {
      start = x;
      final y = args[1];
      if (y is int) {
        end = y;
        final z = args[2];
        if (z is int) {
          step = z;
        } else {
          throw ArgumentError(
              'The range function expects its third argument to be an integer, but received a ${typeString(x)} value.');
        }
      } else {
        throw ArgumentError(
            'The range function expects its second argument to be an integer, but received a ${typeString(x)} value.');
      }
    } else {
      throw ArgumentError(
          'The range function expects its first argument to be an integer, but received a ${typeString(x)} value.');
    }
  }
  return [for (var i = start; i < end; i = i + step) i].toPLVector();
}

bool equalToFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return true;
  } else {
    final head = args.first;
    for (final arg in args.skip(1)) {
      if (arg == head) {
        continue;
      } else {
        return false;
      }
    }
    return true;
  }
}

bool lessThanFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return true;
  } else {
    var previous = args.first;
    for (final arg in args.skip(1)) {
      if (arg is num) {
        if (previous is num) {
          if (previous < arg) {
            previous = arg;
            continue;
          } else {
            return false;
          }
        }
      }
      throw UnsupportedError(
          'Error invoking < : Arithmetic comparisons are only supported for numbers, but encountered a ${typeString(arg)}');
    }
    return true;
  }
}

bool lessThanEqualToFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return true;
  } else {
    var previous = args.first;
    for (final arg in args.skip(1)) {
      if (arg is num) {
        if (previous is num) {
          if (previous <= arg) {
            previous = arg;
            continue;
          } else {
            return false;
          }
        }
      }
      throw UnsupportedError(
          'Error invoking <= : Arithmetic comparisons are only supported for numbers, but encountered a ${typeString(arg)}');
    }
    return true;
  }
}

bool greaterThanFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return true;
  } else {
    var previous = args.first;
    for (final arg in args.skip(1)) {
      if (arg is num) {
        if (previous is num) {
          if (previous > arg) {
            previous = arg;
            continue;
          } else {
            return false;
          }
        }
      }
      throw UnsupportedError(
          'Error invoking > : Arithmetic comparisons are only supported for numbers, but encountered a ${typeString(arg)}');
    }
    return true;
  }
}

bool greaterThanEqualToFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return true;
  } else {
    var previous = args.first;
    for (final arg in args.skip(1)) {
      if (arg is num) {
        if (previous is num) {
          if (previous >= arg) {
            previous = arg;
            continue;
          } else {
            return false;
          }
        }
      }
      throw UnsupportedError(
          'Error invoking >= : Arithmetic comparisons are only supported for numbers, but encountered a ${typeString(arg)}');
    }
    return true;
  }
}

num addFn(PLEnv env, PLVector args) {
  return args.fold(0, (acc, n) {
    if (n is num) {
      return acc + n;
    } else {
      throw UnsupportedError(
          'The + function expects numbers, but encountered a ${typeString(n)}');
    }
  });
}

num subtractFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    throw FormatException(
        'The - function expects at least one argument, but received none.');
  }
  final head = args.first;
  if (head is num) {
    if (args.length == 1) {
      return -head;
    }
    return args.skip(1).fold(head, (acc, n) {
      if (n is num) {
        return acc - n;
      } else {
        throw UnsupportedError(
            'The - function expects numbers, but encountered a ${typeString(n)}');
      }
    });
  } else {
    throw UnsupportedError(
        'The - function expects numbers, but encountered a ${typeString(head)}');
  }
}

num multiplyFn(PLEnv env, PLVector args) {
  return args.fold(1, (acc, n) {
    if (n is num) {
      return acc * n;
    } else {
      throw UnsupportedError(
          'The * function expects numbers, but encountered a ${typeString(n)}');
    }
  });
}

num divideFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    throw FormatException(
        'The / function expects at least one argument, but received none.');
  }
  final head = args.first;
  if (head is num) {
    if (args.length == 1) {
      return 1 / head;
    }
    return args.skip(1).fold(head, (acc, n) {
      if (n is num) {
        return acc / n;
      } else {
        throw UnsupportedError(
            'The / function expects numbers, but encountered a ${typeString(n)}');
      }
    });
  } else {
    throw UnsupportedError(
        'The / function expects numbers, but encountered a ${typeString(head)}');
  }
}

num remainderFn(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final n = args[0];
    final div = args[1];
    if (n is num) {
      if (div is num) {
        return n.remainder(div);
      } else {
        throw FormatException(
            'The rem function expects its second argument to be a number, but received a ${typeString(div)} value.');
      }
    } else {
      throw FormatException(
          'The rem function expects its first argument to be a number, but received a ${typeString(n)} value.');
    }
  } else {
    throw FormatException(
        'The rem function expects 2 arguments, but received ${args.length} arguments.');
  }
}

String strFn(PLEnv env, PLVector args) {
  final sb = StringBuffer();
  for (final arg in args.iter) {
    if (arg is String) {
      sb.write(arg);
    } else if (arg == null) {
      continue;
    } else {
      sb.write(plPrintToString(env, arg));
    }
  }
  return sb.toString();
}

PLSymbol typeFn(PLEnv env, PLVector args) {
  if (args.length != 1) {
    throw FormatException(
        'The type function expects only one argument, but received ${args.length} arguments.');
  }
  return PLSymbol(typeString(args[0]));
}

bool isFnFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final maybeFn = args[0];
    return maybeFn is PLFunction || maybeFn is Function;
  } else {
    throw FormatException(
        'The function? function expects 1 argument, but received ${args.length} arguments.');
  }
}

PLException exInfoFn(PLEnv env, PLVector args) {
  var data = IMap({});
  if (args.length == 1 || args.length == 2) {
    final message = args[0];
    if (args.length == 2) {
      final maybeMap = args[1];
      if (maybeMap is IMap) {
        data = maybeMap;
      } else {
        throw FormatException(
            'The ex-info function expects its second argument to be a map, but received a ${typeString(data)} value.');
      }
    }
    if (message is String) {
      return PLException.withData(message, data);
    } else {
      throw FormatException(
          'The ex-info function expects its first argument to be a String, but received a ${typeString(message)} value.');
    }
  } else {
    throw ArgumentError(
        'The ex-info expects 1 or 2 arguments, but received ${args.length} arguments.');
  }
}

Object? stacktraceFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final type = args[0];
    if (type == PLTerm('dart')) {
      return StackTrace.current;
    } else {
      throw FormatException(
          'The stacktrace/current function supports an additional argument of :dart, but received ${plPrintToString(env, type)}');
    }
  } else {
    return PLVector(env.currentStackTrace());
  }
}

// ignore: prefer_void_to_null
Null printFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    print('');
    return null;
  } else {
    final msg = args.map((x) {
      if (x is String) {
        return x;
      } else {
        return plPrintToString(env, x);
      }
    }).join(' ');
    print(msg);
  }
}

String prStrFn(PLEnv env, PLVector args) {
  return args.map((x) => plPrintToString(env, x)).join(' ');
}

PLState stateFn(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    return PLState(env);
  } else if (args.length == 1) {
    return PLState.withValue(env, args[0]);
  }
  throw FormatException(
      'The state function expects 0 or 1 argument, but received ${args.length} arguments');
}

Object? derefFn(PLEnv env, PLVector args) {
  if (args.length == 1 || args.length == 2) {
    final plDeref = args[0];
    if (plDeref is PLDeref) {
      if (args.length == 2) {
        final timeout = args[1];
        if (timeout is int) {
          return plDeref.dereference(timeout: timeout);
        } else {
          throw 'Timeout must be int';
        }
      } else {
        return plDeref.dereference();
      }
    } else {
      throw 'Can only deref state objects.';
    }
  } else {
    throw 'The deref function expects 1 or 2 arguments, but received ${args.length} arguments.';
  }
}

Object? readStateFn(PLEnv env, PLVector args) {
  if (args.length == 1 || args.length == 2) {
    final state = args[0];
    if (state is PLState) {
      if (args.length == 2) {
        final options = args[1];
        if (options is IMap) {
          final maybeTimeout = options.get(PLTerm('timeout'));
          int timeout = 10000;
          if (maybeTimeout is int) {
            timeout = maybeTimeout;
          }

          final maybeRefresh = options.get(PLTerm('refresh?'));
          bool refresh = false;
          if (maybeRefresh is bool) {
            refresh = maybeRefresh;
          }

          return state.readFromState(timeout: timeout, refresh: refresh);
        } else {
          throw 'The read-state function expects its second argument to be an int, but received a ${typeString(options)} argument.';
        }
      } else {
        return state.dereference();
      }
    }
  }
  throw FormatException(
      'The read-state function expects 1 or 2 arguments, but received ${args.length} arguments.');
}

/// If an invocable value is provided the assumption is that the given function will be invoked with the _current_ state as a first argument.
Object? _calculateNewState(PLState state, Object? value, PLVector args) {
  if (value is PLFunction) {
    return value.invoke(state.env, args.insert(0, state.value).toIList);
  } else if (value is Function) {
    return value(state.env, args.insert(0, state.value));
  } else {
    return value;
  }
}

Object? bufferStateFn(PLEnv env, PLVector args) {
  if (args.length >= 2) {
    final state = args[0];
    final newValue = args[1];
    if (state is PLState) {
      final newArgs = args.skip(2);
      state.value = _calculateNewState(state, newValue, PLVector(newArgs));
      return state.value;
    } else {
      throw FormatException(
          'The buffer-state function expects its first argument to be a state object, but received a ${typeString(state)} value.');
    }
  }
  throw FormatException(
      'The buffer-state function expects at least 2 arguments, but received ${args.length} arguments');
}

Object? writeStateFn(PLEnv env, PLVector args) {
  if (args.length >= 2) {
    final state = args[0];
    final newValue = args[1];
    if (state is PLState) {
      final newArgs = args.skip(2);
      final newCalculatedState =
          _calculateNewState(state, newValue, PLVector(newArgs));
      return state.writeValueToStateSync(newCalculatedState);
    } else {
      throw FormatException(
          'The write-state function expects its first argument to be a state object, but received a ${typeString(state)} value.');
    }
  }
  throw FormatException(
      'The write-state function expects at least 2 arguments, but received ${args.length} arguments');
}

Future<Object> futureValueFn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    return Future<Object>.value(args[0]);
  } else {
    throw ArgumentError(
        'The future/value function expects 1 argument, but received ${args.length} arguments.');
  }
}

dynamic Function() dartDynamicFunction0Fn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final plFn = args[0];
    if (plFn is PLFunction) {
      if (plFn.arities.containsKey(0)) {
        return () => plFn.invoke(env, []);
      } else {
        throw ArgumentError(
            'The dart-dynamic-function-0 function expects its function to support taking 0 arguments, but received a function with arities: ${plFn.arities.keys.toIList().sort().join(', ')}');
      }
    } else {
      throw ArgumentError(
          'The dart-dynamic-function-0 function expects its first argument to be a PiLisp function, but received ${args.length} arguments.');
    }
  } else {
    throw ArgumentError(
        'The dart-dynamic-function-0 function expects 1 argument, but received ${args.length} arguments.');
  }
}

dynamic Function(dynamic) dartDynamicFunction1Fn(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final plFn = args[0];
    if (plFn is PLFunction) {
      if (plFn.arities.containsKey(1)) {
        return (dynamic o) => plFn.invoke(env, [o]);
      } else {
        throw ArgumentError(
            'The dart-dynamic-function-1 function expects its function to support taking 1 argument, but received a function with arities: ${plFn.arities.keys.toIList().sort().join(', ')}');
      }
    } else {
      throw ArgumentError(
          'The dart-dynamic-function-1 function expects its first argument to be a PiLisp function, but received a ${typeString(plFn)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart-dynamic-function-1 function expects 1 argument, but received ${args.length} arguments.');
  }
}

Function dartFunctionFn(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final arity = args[0];
    final plFn = args[1];
    if (arity is int) {
      if (plFn is PLFunction) {
        if (plFn.arities.containsKey(arity)) {
          switch (arity) {
            case 0:
              return (PLEnv env, PLVector args) => args.isEmpty
                  ? plFn.invoke(env, [])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 0 arguments, but received ${args.length} arguments.');
            case 1:
              return (PLEnv env, PLVector args) => args.length == 1
                  ? plFn.invoke(env, [args[0]])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 1 arguments, but received ${args.length} arguments.');
            case 2:
              return (PLEnv env, PLVector args) => args.length == 2
                  ? plFn.invoke(env, [args[0], args[1]])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 2 arguments, but received ${args.length} arguments.');
            case 3:
              return (PLEnv env, PLVector args) => args.length == 3
                  ? plFn.invoke(env, [args[0], args[1], args[2]])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 3 arguments, but received ${args.length} arguments.');
            case 4:
              return (PLEnv env, PLVector args) => args.length == 4
                  ? plFn.invoke(env, [args[0], args[1], args[2], args[3]])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 4 arguments, but received ${args.length} arguments.');
            case 5:
              return (PLEnv env, PLVector args) => args.length == 5
                  ? plFn.invoke(
                      env, [args[0], args[1], args[2], args[3], args[4]])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 5 arguments, but received ${args.length} arguments.');
            case 6:
              return (PLEnv env, PLVector args) => args.length == 6
                  ? plFn.invoke(env,
                      [args[0], args[1], args[2], args[3], args[4], args[5]])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 6 arguments, but received ${args.length} arguments.');
            case 7:
              return (PLEnv env, PLVector args) => args.length == 7
                  ? plFn.invoke(env, [
                      args[0],
                      args[1],
                      args[2],
                      args[3],
                      args[4],
                      args[5],
                      args[6]
                    ])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 7 arguments, but received ${args.length} arguments.');
            case 8:
              return (PLEnv env, PLVector args) => args.length == 8
                  ? plFn.invoke(env, [
                      args[0],
                      args[1],
                      args[2],
                      args[3],
                      args[4],
                      args[5],
                      args[6],
                      args[7]
                    ])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 8 arguments, but received ${args.length} arguments.');
            case 9:
              return (PLEnv env, PLVector args) => args.length == 9
                  ? plFn.invoke(env, [
                      args[0],
                      args[1],
                      args[2],
                      args[3],
                      args[4],
                      args[5],
                      args[6],
                      args[7],
                      args[8]
                    ])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 9 arguments, but received ${args.length} arguments.');
            case 10:
              return (PLEnv env, PLVector args) => args.length == 10
                  ? plFn.invoke(env, [
                      args[0],
                      args[1],
                      args[2],
                      args[3],
                      args[4],
                      args[5],
                      args[6],
                      args[7],
                      args[8],
                      args[9]
                    ])
                  : throw ArgumentError(
                      'The function ${plFn.name} expects 10 arguments, but received ${args.length} arguments.');
            default:
              throw UnsupportedError(
                  'The dart-function function only supports creating a Dart function with up to 10 arguments, but received a specification of $arity arguments.');
          }
        } else {
          throw ArgumentError(
              'You asked dart-function to invoke your function with $arity arguments, but it only supports arities of these numbers of arguments: ${plFn.arities.keys.toIList().sort().join(', ')}');
        }
      } else {
        throw ArgumentError(
            'The dart-function function expects its second argument to be a PiLisp function, but received a ${typeString(plFn)} value.');
      }
    } else {
      throw ArgumentError(
          'The dart-function function expects its first argument to be a number, but received a ${typeString(arity)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart-function function expects 2 arguments, but received ${args.length} arguments.');
  }
}
