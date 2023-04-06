import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'pilisp_core.dart';
import 'pilisp_env.dart';
import 'pilisp_error.dart';
import 'pilisp_print.dart';
import 'pilisp_read.dart';

// Special forms
final symbolCatch = PLSymbol('catch');
final symbolDeclare = PLSymbol('declare');
final symbolDef = PLSymbol('def');
final symbolDo = PLSymbol('do');
final symbolIf = PLSymbol('if');
final symbolFinally = PLSymbol('finally');
final symbolFn = PLSymbol('fn*');
final symbolLet = PLSymbol('let*');
final symbolLoop = PLSymbol('loop');
final symbolQuote = PLSymbol('quote');
final symbolRecur = PLSymbol('recur');
final symbolThrow = PLSymbol('throw');
final symbolTry = PLSymbol('try');
final symbolWhile = PLSymbol('while');
final ISet<PLSymbol> specialForms = ISet({
  symbolCatch,
  symbolDeclare,
  symbolDef,
  symbolDo,
  symbolIf,
  symbolFinally,
  symbolFn,
  symbolLet,
  symbolLoop,
  symbolQuote,
  symbolRecur,
  symbolThrow,
  symbolTry,
  symbolWhile,
});

// Oft-used symbols
final symbolCatchHandlers = PLSymbol('pilisp/catch-handlers');
final symbolFinallyHandler = PLSymbol('pilisp/finally-handler');

String typeString(Object? o) {
  if (o is PLAbstractExpr) {
    return o.typeName();
  } else if (o == null) {
    return 'nil';
  } else if (o is IMap) {
    return 'map';
  } else if (o is ISet) {
    return 'set';
  } else if (o is RegExp) {
    // NB: Otherwise _RegExp is returned. Consider whether this is wise.
    return 'RegExp';
  } else {
    return o.runtimeType.toString();
  }
}

abstract class PLAbstractExpr {
  /// Evaluate the current object according to the semantics of PiLisp.
  ///
  /// Most values evaluate to themselves.
  Object? eval(PLEnv env);

  /// Print this object to a [String].
  String printToString(PLEnv env);

  /// Provide the name of the type of this object.
  String typeName();
}

/// A [PLExpr] knows how to evaluate itself within the context of a [PLEnv]
/// instance.
///
/// Non-[PLExpr] values can still be evaluated by PiLisp. Most Dart objects
/// simply evaluate to themselves.
abstract class PLExpr extends PLAbstractExpr {
  @override
  Object? eval(PLEnv env) {
    return this;
  }
}

abstract class PLExprIterable extends PLExpr {
  late ImmutableCollection<Object?> _elements;
}

/// Adapted from https://github.com/petitparser/dart-petitparser-examples/blob/main/lib/src/lisp/name.dart
class PLSymbol extends PLExpr implements Comparable<Object?> {
  /// Factory for new symbols.
  factory PLSymbol(String name) =>
      _interned.putIfAbsent(name, () => PLSymbol._internal(name));

  /// Internal constructor for symbol.
  PLSymbol._internal(this._name);

  /// The interned symbols.
  static final Map<String, PLSymbol> _interned = {};

  /// The name of the symbol.
  final String _name;

  String get name => _name;

  /// Returns the string representation of the symbolic name.
  @override
  String toString() => _name;

  @override
  String typeName() {
    return 'symbol';
  }

  @override
  Object? eval(PLEnv env) {
    if (env.isBound(this)) {
      return env.getBindingValue(this);
    } else {
      throw UndefinedSymbol(this);
    }
  }

  @override
  String printToString(PLEnv env) {
    if (env.isPrintJson) {
      return '"$name"';
    } else {
      return toString();
    }
  }

  @override
  int compareTo(other) {
    if (other is PLSymbol) {
      return name.compareTo(other.name);
    } else if (other is PLTerm) {
      return name.compareTo(other.name);
    } else if (other is String) {
      return name.compareTo(other);
    } else {
      throw ArgumentError(
          'You cannot compare a symbol with a ${typeString(other)}');
    }
  }
}

/// A PiLisp [PLTerm] is equivalent to a Clojure keyword.
///
/// Syntactically, PiLisp terms can start with either a `.` or `:`. They are
/// printed with the `:` for better Clojure/EDN interoperability.
class PLTerm extends PLExpr implements PLInvocable {
  /// Factory for new symbol cells.
  factory PLTerm(String name) =>
      _interned.putIfAbsent(name, () => PLTerm._internal(name));

  /// Internal constructor for symbol.
  PLTerm._internal(this._name);

  String get name => _name;

  /// The interned symbols.
  static final Map<String, PLTerm> _interned = {};

  /// The name of the symbol.
  final String _name;

  PLSymbol get symbol => PLSymbol(_name);

  /// Returns the string representation of the symbolic name.
  @override
  String toString() => ':$_name';

  @override
  String typeName() {
    return 'term';
  }

  @override
  String printToString(PLEnv env) {
    if (env.isPrintJson) {
      return '"$name"';
    } else {
      return toString();
    }
  }

  @override
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    if (args.length == 1) {
      return getFn(env, PLVector([args.first, this]));
    } else if (args.length == 2) {
      return getFn(env, PLVector([args.first, this, args.toList()[1]]));
    } else {
      throw ArgumentError(
          'A term—when invoked—expects 1 or 2 arguments, but received ${args.length} arguments.');
    }
  }
}

class PLException extends PLExpr implements Exception {
  List<String>? _stackTrace;
  bool isThrown = false;
  String message;
  String _stackTraceMessage = '';
  IMap<Object?, Object?> data = IMap<Object?, Object?>({});

  PLException(this.message);

  factory PLException.withData(String message, IMap<Object?, Object?> data) {
    final ex = PLException(message);
    ex.data = data;
    return ex;
  }

  @override
  String printToString(PLEnv env) {
    return '(ex-info $message ${plPrintToString(env, data)})';
  }

  @override
  String typeName() {
    return 'exception';
  }

  List<String> get stackTrace => _stackTrace ?? [];

  void saveStackTrace(PLEnv env, Object? topLevelForm) {
    final st = env.currentStackTrace();
    String msg = '';
    if (st.isNotEmpty) {
      msg = st.reversed.map((e) => '  from $e').join('\n');
    }
    final topLevel =
        'Thrown from expression:\n${plPrintToString(env, topLevelForm)}';
    msg = msg.isEmpty ? topLevel : '$topLevel\n$msg';
    _stackTraceMessage = msg;
    _stackTrace = st;
  }

  @override
  String toString() {
    String msg = 'PiLisp Exception: $message';
    msg += _stackTraceMessage.isEmpty ? '' : '\n$_stackTraceMessage';
    return msg;
  }
}

class PLList extends PLExprIterable
    with FromIListMixin<Object?, PLList>
    implements PLInvocable {
  /// When [PLList] is used to create data from code, this contains the line
  /// number of the source string/file that was read to create it.
  Loc? loc;

  @override
  // ignore: overridden_fields
  final IList<Object?> _elements;

  PLList(Iterable<Object?> elements) : _elements = IList(elements);

  @override
  PLList newInstance(IList<Object?> ilist) => PLList(ilist);

  @override
  IList<Object?> get iter => _elements;

  IList<Object?> get toIList => _elements;

  PLVector toPLVector() => PLVector(_elements);

  @override
  Object? eval(PLEnv env) {
    if (isEmpty) return PLList([]);
    // Special forms first
    if (firstOrNull is PLSymbol) {
      final sym = first as PLSymbol;
      if (sym == symbolDo) {
        // do: Multiple forms, returning value of last.
        final doBody = skip(1);
        if (doBody.isEmpty) {
          return null;
        }
        if (doBody.length == 1) {
          return plEval(env, doBody.first);
        } else {
          Object? rv;
          for (final form in doBody) {
            rv = plEval(env, form);
          }
          return rv;
        }
      } else if (sym == symbolDef) {
        if (length == 3) {
          final defName = this[1];
          final defValue = this[2];
          if (defName is PLSymbol) {
            final evaledValue = plEval(env, defValue);
            env.addGlobalBindingWithValue(defName, evaledValue);
            return evaledValue;
          } else {
            throw FormatException(
                'The def special form expects a symbol name, but encountered a ${typeString(defName)} value.');
          }
        } else if (length == 4) {
          final defName = this[1];
          if (defName is PLSymbol) {
            final defMetaForm = this[2];
            IMap<Object?, Object?> defMeta = IMap({});
            final evaledMeta = plEval(env, defMetaForm);
            if (evaledMeta is String) {
              defMeta = defMeta.add(PLTerm('doc'), evaledMeta);
            } else if (evaledMeta is IMap<Object?, Object?>) {
              defMeta = evaledMeta;
            } else {
              throw FormatException(
                  'The def special form supports optional metadata, and if provided must evaluate to a string or a map, but encountered a ${typeString(evaledMeta)} value.');
            }
            final defValue = this[3];
            final evaledValue = plEval(env, defValue);
            env.addGlobalBinding(
                defName, PLBindingEntry.withMeta(evaledValue, defMeta));
            return evaledValue;
          } else {
            throw FormatException(
                'The def special form expects a symbol name, but encountered a ${typeString(defName)} value.');
          }
        } else {
          throw FormatException(
              'The def special form expects a name, optional metadata, and a value, but encountered ${length - 1} arguments.');
        }
      } else if (sym == symbolDeclare) {
        for (final declaredSymbol in skip(1)) {
          if (declaredSymbol is PLSymbol) {
            if (!env.isBound(declaredSymbol)) {
              env.addDeclaredBindingValue(declaredSymbol);
            }
          } else {
            throw ArgumentError(
                'The declare form only accepts symbols, but received a ${typeString(declaredSymbol)} value.');
          }
        }
        return null;
      } else if (sym == symbolFn) {
        // fn: Function definition
        if (length == 1) {
          throw FormatException(
              'The fn special form expects an optional name, a vector of params, and an optional body; encountered an empty (fn)');
        }
        final eitherNameOrParams = this[1];
        if (eitherNameOrParams is PLSymbol) {
          if (length == 2) {
            throw FormatException(
                'The fn special form expects an optional name, a vector of params, and an optional body; encountered a fn name but no params or body.');
          }
          final fnName = eitherNameOrParams;
          final params = this[2];
          if (params is PLVector) {
            return PLFunction.forArities(env, fnName, IList([sublist(2)]));
          } else if (params is PLList) {
            final arityDefinitions = sublist(2); // here's the difference, (a)
            if (arityDefinitions.every((element) => element is PLList)) {
              return PLFunction.forArities(
                  env, fnName, IList(List<PLList>.from(arityDefinitions.iter)));
            } else {
              throw FormatException(
                  'The special form fn allows multiple arity definitions with each in the format ([args] body), but encountered $arityDefinitions');
            }
          } else {
            throw FormatException(
                'Malformed params for fn*: ${plPrintToString(env, this)}');
          }
        } else {
          final params = this[1];
          final fnName = PLSymbol('<unnamed>');
          if (params is PLVector) {
            final arityDefinitions = IList([sublist(1)]);
            return PLFunction.forArities(env, fnName, arityDefinitions);
          } else if (params is PLList) {
            final arityDefinitions = sublist(1); // here's the difference, (a)
            if (arityDefinitions.every((element) => element is PLList)) {
              return PLFunction.forArities(
                  env, fnName, IList(List<PLList>.from(arityDefinitions.iter)));
            } else {
              throw FormatException(
                  'The special form fn allows multiple arity definitions with each in the format ([args] body), but encountered $arityDefinitions');
            }
          } else {
            throw FormatException(
                'Malformed params for unnamed fn*: ${plPrintToString(env, this)}');
          }
        }
      } else if (sym == symbolQuote) {
        if (length != 2) {
          throw FormatException(
              'The quote special form expects only one argument, but encountered ${length - 1} arguments.');
        }
        final form = this[1];
        // Unevaluated
        return form;
      } else if (sym == symbolLet) {
        // let: Local bindings
        if (length == 1) {
          throw FormatException(
              'The let special form expects a vector of bindings and an optional body; encountered an empty (let)');
        }
        // final letStarArgs = this[1];
        final letStarArgs = skip(1).toPLVector();
        if (letStarArgs.isEmpty) {
          return null;
        }
        final bindings = letStarArgs[0];
        // final bindings = letStarArgs[1];
        if (bindings is PLVector) {
          if (bindings.length.isEven) {
            PLSymbol? symbol;
            Object? value;
            int numScopes = 0;
            try {
              for (var i = 0; i < bindings.length; i++) {
                if (i.isEven) {
                  final maybeSymbol = bindings[i];
                  if (maybeSymbol is PLSymbol) {
                    symbol = maybeSymbol;
                  } else {
                    throw FormatException(
                        "The let special form's bindings must be symbols, but encountered a ${typeString(maybeSymbol)} value: ${plPrintToString(env, maybeSymbol)}");
                  }
                } else {
                  // Follows let semantics of Clojure, in which each binding is
                  // available to the ones that follow.
                  env.pushEmptyScope();
                  // A new scope is pushed _before_ the right-hand side is
                  // evaluated, so that scope-affecting code does not affect
                  // the parent scope of the `let` itself.
                  value = plEval(env, bindings[i]);
                  numScopes += 1;
                  // Known to be populated by previous iteration of loop above.
                  // Known to be a symbol by runtime type check above.
                  env.addBindingValue(symbol!, value);
                }
              }
              final doInvocation = PLList(
                  IList<Object?>([symbolDo]).addAll(letStarArgs.skip(1)));
              return plEval(env, doInvocation);
            } finally {
              // NB. Pop as many scopes as were successfully added before an error.
              for (var i = 0; i < numScopes; i++) {
                env.popScope();
              }
            }
          } else {
            throw FormatException(
                'The let special form\'s bindings vector must have an even number of elements, encountered ${bindings.length} elements.');
          }
        } else {
          throw FormatException(
              'The let special form expects a vector of bindings and an optional body; encountered a ${typeString(bindings)} where a vector of params was expected.');
        }
      } else if (sym == symbolLoop) {
        if (length == 1) {
          throw FormatException('Empty loop is not supported.');
        } else if (length == 2) {
          final bindingVec = this[1];
          if (bindingVec is PLVector) {
            return null;
          } else {
            throw FormatException(
                'The loop special form expects its first argument to be a vector of bindings, but encountered a ${typeString(bindingVec)} value.');
          }
        } else if (length >= 3) {
          final bindingVec = this[1];
          final body = skip(2);
          if (bindingVec is PLVector) {
            if (bindingVec.length.isEven) {
              List<PLSymbol> params = [];
              List<Object?> args = [];
              for (int i = 0; i < bindingVec.length; i++) {
                if ((i + 1).isEven) {
                  args.add(bindingVec[i]);
                } else {
                  final sym = bindingVec[i];
                  if (sym is PLSymbol) {
                    params.add(sym);
                  } else {
                    throw ArgumentError(
                        'The bindings for loop must be symbols, but encountered a ${typeString(sym)} value in position $i');
                  }
                }
              }
              final loopFnSym =
                  PLSymbol('loop-${nextSymbolIdFn(env, PLVector([]))}');
              final functionDef = PLList([
                symbolFn,
                loopFnSym,
                params.toPLVector(),
                PLList([symbolDo]).addAll(body)
              ]);
              env.pushEmptyScope();
              try {
                env.addBindingValue(loopFnSym, plEval(env, functionDef));
                final invocation = PLList([functionDef]).addAll(args);
                final returnValue = plEval(env, invocation);
                return returnValue;
              } finally {
                env.popScope();
              }
            } else {
              throw FormatException(
                  'The loop special form expects its first argument to be a vector of bindings with an even number of items, but encountered ${bindingVec.length} items.');
            }
          } else {
            throw FormatException(
                'The loop special form expects its first argument to be a vector of bindings, but encountered a ${typeString(bindingVec)} value.');
          }
        }
      } else if (sym == symbolRecur) {
        // TODO Error when not in tail position.
        // TODO Don't consume stack.
        final recurArgs = skip(1);
        final fnName = env.stackFrames.last;
        final rewritten = PLList([PLSymbol(fnName)]).addAll(recurArgs);
        return plEval(env, rewritten);
      } else if (sym == symbolWhile) {
        if (length < 2) {
          throw FormatException(
              'The while special form expects a condition and body, but received $length arguments.');
        } else {
          final test = this[1];
          final body = skip(2);
          Object? returnValue;
          while (isTruthy(plEval(env, test))) {
            returnValue =
                plEval(env, PLList(<Object?>[PLSymbol('do'), ...body]));
          }
          // NB. Unlike Clojure, while returns last "returned" value.
          return returnValue;
        }
      } else if (sym == symbolIf) {
        if (length != 4) {
          throw FormatException(
              'The if special form expects a condition, a then branch, and an else branch, but encountered ${length - 1} arguments.');
        }
        final conditionForm = this[1];
        final thenForm = this[2];
        final elseForm = this[3];
        if (isTruthy(plEval(env, conditionForm))) {
          return plEval(env, thenForm);
        } else {
          return plEval(env, elseForm);
        }
      } else if (sym == symbolThrow) {
        if (length != 2) {
          throw FormatException(
              'The throw special form expects a single exception value, but encountered ${length - 1} arguments.');
        }
        final exception = plEval(env, this[1]);
        if (exception is PLException) {
          // NB: What was this boolean for?
          exception.isThrown = true;
          exception.saveStackTrace(env, this);
          throw exception;
        } else {
          throw FormatException(
              'The throw special form expects an exception argument, but received a ${typeString(exception)} value.');
        }
      } else if (sym == symbolTry) {
        final bodyForms = skip(1);
        if (bodyForms.isEmpty) {
          return null;
        }
        env.pushEmptyScope();
        try {
          final tryAndRemainder = extractTryBody(this);
          final tryBody = tryAndRemainder['tryBody'] as PLList;
          final remainder = tryAndRemainder['remainder'] as PLList;
          final catchFinally = extractCatchesAndFinally(env, remainder);
          env.registerCatchAndFinallyFunctions(catchFinally);

          PLList doExpr = PLList([symbolDo]);
          doExpr = doExpr.addAll(tryBody.iter);
          return doExpr.eval(env);
        } catch (e) {
          final catchHandlers = env.getBindingValue(symbolCatchHandlers);
          if (catchHandlers is Iterable<PLCatchClause>) {
            for (final catchHandler in catchHandlers) {
              final targetExceptionSymbol = catchHandler.exceptionClassSymbol;
              final targetExceptionClassName =
                  typeString(targetExceptionSymbol);
              final sourceExceptionClassName = typeString(e);
              if (sourceExceptionClassName == targetExceptionClassName ||
                  targetExceptionSymbol == PLSymbol('_')) {
                return catchHandler.catchFunction.invoke(env, IList([e]));
              }
            }
          } else if (catchHandlers == null) {
          } else {
            throw 'Developer Error: pilisp/catch-handlers must be an iterable of PLCatchClause objects';
          }
          rethrow;
          // Invoke catch function handlers here based on `is` checks on this `e`
        } finally {
          final finallyHandler = env.getBindingValue(symbolFinallyHandler);
          if (finallyHandler is PLFinallyClause) {
            finallyHandler.finallyFunction.invoke(env, IList([]));
          }
          env.popScope();
        }
      }

      // Macro expansion.
      final binding = env.getBinding(sym);

      if (binding != null && binding.isMacro) {
        return plEval(env, macroExpand(env, this));
      } else {
        // NB Laziness of map here may be why eval of args is wonky b/w fns and macros.
        final evaluated = map((expr) => plEval(env, expr));
        final inv = evaluated.first;
        final args = evaluated.skip(1);
        if (inv is PLInvocable) {
          return inv.invoke(env, args);
        } else if (inv is Function) {
          // NB: These are the *Fn functions defined in pilisp_core.dart
          return inv(env, args.toPLVector());
        } else if (inv is IMap) {
          return inv.invoke(env, args);
        } else if (inv is ISet) {
          return inv.invoke(env, args);
        } else {
          throw UnsupportedError(
              'The ${typeString(inv)} value ${plPrintToString(env, inv)} is not invocable.');
        }
      }
    } else if (firstOrNull is PLTerm) {
      // NB Support term invocation.
      final term = first as PLTerm;
      if (length == 1) {
        throw FormatException(
            'Terms expect either 1 or 2 arguments when invoked, but received 0 arguments.');
      } else if (length == 2) {
        final coll = plEval(env, this[1]);
        return getFn(env, PLVector([coll, term]));
      } else if (length == 3) {
        final coll = plEval(env, this[1]);
        final defaultIfMissing = plEval(env, this[2]);
        return getFn(env, PLVector([coll, term, defaultIfMissing]));
      }
    }

    final evaluated = map((expr) => plEval(env, expr));
    final inv = evaluated.first;
    final args = evaluated.skip(1);

    // NB: Consider whether to do OOP gymnastics to have PLTerm implement PLInvocable
    if (inv is PLInvocable) {
      return inv.invoke(env, args);
    } else if (inv is IMap) {
      return inv.invoke(env, args);
    } else if (inv is ISet) {
      return inv.invoke(env, args);
    } else if (inv is Function) {
      return inv(env, args.toPLVector());
    } else {
      throw UnsupportedError('The value $inv is not invocable.');
    }
  }

  @override
  String printToString(PLEnv env) {
    if (isEmpty) return '()';
    final sb = StringBuffer();
    env.withIndent(() {
      final gutter = env.indentedString('');
      sb.write(
          '(\n$gutter${map((e) => plPrintToString(env, e)).join('\n$gutter')}'); // Exclude commas, usually code
    });
    sb.write('\n${env.indentedString(')')}');
    return sb.toString();
  }

  @override
  String toString() {
    return '(${join(' ')})';
  }

  @override
  String typeName() {
    return 'list';
  }

  @override
  bool operator ==(Object other) =>
      other is PLExprIterable && _elements == other._elements;

  @override
  int get hashCode => 31 + _elements.hashCode;

  @override
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    throw UnsupportedError(
        'Lists cannot be invoked. Vectors and maps can. Tried to invoke: $this');
  }
}

class PLVector extends PLExprIterable
    with FromIListMixin<Object?, PLVector>
    implements PLInvocable {
  bool isMapEntry = false;

  @override
  // ignore: overridden_fields
  final IList<Object?> _elements;

  PLVector(Iterable<Object?> elements) : _elements = IList(elements);

  @override
  PLVector newInstance(IList<Object?> ilist) => PLVector(ilist);

  @override
  IList<Object?> get iter => _elements;

  IList<Object?> get toIList => _elements;

  PLList toPLList() => PLList(_elements);

  @override
  Object? eval(PLEnv env) {
    return map((element) => plEval(env, element)).toPLVector();
  }

  @override
  String printToString(PLEnv env) {
    if (isEmpty) return '[]';
    final sb = StringBuffer();
    env.withIndent(() {
      final gutter = env.indentedString('');
      sb.write(
          '[\n$gutter${map((e) => plPrintToString(env, e)).join('\n$gutter')}');
    });
    sb.write('\n${env.indentedString(']')}');
    return sb.toString();
  }

  @override
  String toString() {
    return '[${join(' ')}]';
  }

  @override
  String typeName() {
    return 'vector';
  }

  @override
  bool operator ==(Object other) =>
      other is PLExprIterable && _elements == other._elements;

  @override
  int get hashCode => 31 + _elements.hashCode;

  @override
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    if (args.length == 1) {
      final idx = args.first;
      if (idx is int) {
        return this[idx];
      } else {
        throw ArgumentError(
            'A vector—when invoked—expects its first argument to be an int, but received a ${typeString(idx)} value.');
      }
    } else if (args.length == 2) {
      final idx = args.first;
      if (idx is int) {
        if (idx > 0 && idx < length) {
          return this[idx];
        } else {
          return args.toList()[1];
        }
      } else {
        throw ArgumentError(
            'A vector—when invoked—expects its first argument to be an int, but received a ${typeString(idx)} value.');
      }
    } else {
      throw ArgumentError(
          'A vector—when invoked—expects 1 or 2 arguments, but received ${args.length} arguments. Vector was: ${plPrintToString(env, this)}');
    }
  }
}

Map<String, PLList> extractTryBody(PLList forms) {
  final l = <Object?>[];
  Iterable<Object?> remainder = [];
  // NB: Skip `try`
  for (int i = 1; i < forms.length; i++) {
    final form = forms[i];
    if (form is PLList) {
      if (form.isNotEmpty) {
        if (form.first == symbolCatch || form.first == symbolFinally) {
          remainder = forms.toIList.sublist(i);
          break;
        }
      }
    }
    l.add(form);
  }
  return {'tryBody': PLList(l), 'remainder': PLList(remainder)};
}

class PLCatchClause {
  final PLSymbol? exceptionClassSymbol;
  late final PLFunction catchFunction;

  PLCatchClause._(this.exceptionClassSymbol);

  factory PLCatchClause.withImplicitDo(PLEnv env, PLSymbol exceptionClassSymbol,
      PLSymbol exceptionBindingSymbol, Iterable<Object?> body) {
    final pcc = PLCatchClause._(exceptionClassSymbol);
    PLList arityForm = PLList([
      PLVector([exceptionBindingSymbol])
    ]);
    PLList doForm = PLList([symbolDo]);
    doForm = doForm.addAll(body);
    arityForm = arityForm.add(doForm);
    pcc.catchFunction = PLFunction.forArities(
        env, PLSymbol('catch-$exceptionClassSymbol'), [arityForm]);
    return pcc;
  }
}

class PLFinallyClause {
  PLFunction finallyFunction;

  PLFinallyClause(this.finallyFunction);
}

class PLCatchFinally {
  final Iterable<PLCatchClause> catchClauses;
  late final PLFinallyClause? finallyClause;

  PLCatchFinally(this.catchClauses);

  factory PLCatchFinally.withFinally(
      PLEnv env,
      Iterable<PLCatchClause> catchClauses,
      Iterable<Object?>? finallyClauseForms) {
    final pcf = PLCatchFinally(catchClauses);
    if (finallyClauseForms != null) {
      PLList arityForm = PLList([PLVector([])]); // finally fn is nullary
      PLList doForm = PLList([symbolDo]);
      doForm = doForm.addAll(finallyClauseForms);
      arityForm = arityForm.add(doForm);
      final fn = PLFunction.forArities(env, PLSymbol('finally'), [arityForm]);
      pcf.finallyClause = PLFinallyClause(fn);
    } else {
      pcf.finallyClause = null;
    }
    return pcf;
  }
}

PLCatchFinally extractCatchesAndFinally(PLEnv env, PLList forms) {
  final catches = <PLCatchClause>[];
  Iterable<Object?>? fin;
  for (int i = 0; i < forms.length; i++) {
    final form = forms[i];
    if (form is PLList) {
      if (form.isNotEmpty) {
        if (form.first == symbolCatch) {
          if (form.length < 3) {
            throw FormatException(
                'A catch clause must contain at least the exception class to catch and a symbol to bind the exception to, but found only ${form.length} forms.');
          }
          final exceptionClassSymbol = form[1];
          final exceptionBindingSymbol = form[2];
          final body = form.skip(3);
          if (exceptionClassSymbol is PLSymbol) {
            if (exceptionBindingSymbol is PLSymbol) {
              catches.add(PLCatchClause.withImplicitDo(
                  env, exceptionClassSymbol, exceptionBindingSymbol, body));
            } else {
              throw FormatException(
                  'The third argument in a catch clause must be a symbol, but encountered a ${typeString(exceptionBindingSymbol)}');
            }
          } else {
            throw FormatException(
                'The second argument in a catch clause must be a symbol, but encountered a ${typeString(exceptionClassSymbol)}');
          }
        } else if (form.first == symbolFinally) {
          fin = form.skip(1); // finally sym
          break;
        } else {
          throw FormatException('Malformed try/catch/finally $forms');
        }
      } else {
        throw FormatException('Malformed try/catch/finally $forms');
      }
    } else {
      throw FormatException('Malformed try/catch/finally $forms');
    }
  }

  return PLCatchFinally.withFinally(env, catches, fin);
}

PLList extractFinally(PLList forms) {
  // NB: Error on malformed
  return forms;
}

Iterable<Object?> macroExpandIterable(PLEnv env, Iterable<Object?> form) {
  final l = <Object?>[];
  for (final subForm in form) {
    l.add(macroExpand1(env, subForm));
  }
  return l;
}

Iterable<Object?> macroExpandPLList(PLEnv env, PLList form) {
  final l = <Object?>[];
  for (final subForm in form.iter) {
    l.add(macroExpand1(env, subForm));
  }
  return l;
}

Object? macroExpand1(PLEnv env, Object? form) {
  if (form is PLList) {
    if (form.firstOrNull is PLSymbol) {
      final sym = form.first as PLSymbol;
      final binding = env.getBinding(sym);
      if (binding != null && binding.isMacro) {
        final fn = binding.value;
        if (fn is PLFunction) {
          fn.isMacro = true;
          return fn.invoke(env, form.skip(1));
        } else {
          return PLList(macroExpandPLList(env, form));
        }
      } else {
        return PLList(macroExpandPLList(env, form));
      }
    } else {
      return PLList(macroExpandPLList(env, form));
    }
  } else if (form is PLVector) {
    return PLVector(macroExpandPLList(env, form.toPLList()));
  } else if (form is ISet) {
    return ISet(macroExpandPLList(env, form.toPLList()));
  } else if (form is IMap) {
    final ks = form.keys;
    final m = <Object?, Object?>{};
    for (final k in ks) {
      m[macroExpand1(env, k)] = macroExpand1(env, form.get(k));
    }
    return IMap(m);
  } else {
    return form;
  }
}

Object? macroExpand(PLEnv env, Object? form) {
  final expandedForm = macroExpand1(env, form);
  if (expandedForm != form) {
    return macroExpand(env, expandedForm);
  }
  return form;
}

extension on Iterable<Object?> {
  PLVector toPLVector() {
    return PLVector(this);
  }

  PLList toPLList() {
    return PLList(this);
  }
}

extension on IMap<Object?, Object?> {
  Object? _plEval(PLEnv env) {
    return map((key, value) => MapEntry(plEval(env, key), plEval(env, value)));
  }
}

extension on ISet<Object?> {
  Object? _plEval(PLEnv env) {
    return map((element) => plEval(env, element)).toISet();
  }
}

/// The [List.lock] provided by FIC does not do a deep lock of all elements. This does.
extension PLRecursiveListLock on List<Object?> {
  IList<Object?> get lockRecursive {
    final l = <Object?>[];
    for (final element in this) {
      if (element is List) {
        l.add(element.lockRecursive);
      } else if (element is Map) {
        l.add(element.lockRecursive);
      } else if (element is Set) {
        l.add(element.lockRecursive);
      } else {
        l.add(element);
      }
    }
    return IList(l);
  }
}

/// The [Map.lock] provided by FIC does not do a deep lock of all elements. This does.
extension PLRecursiveMapLock on Map<Object?, Object?> {
  IMap<Object?, Object?> get lockRecursive {
    final m = <Object?, Object?>{};
    for (final key in keys) {
      Object? k;
      if (key is List) {
        k = key.lockRecursive;
      } else if (key is Map) {
        k = key.lockRecursive;
      } else if (key is Set) {
        k = key.lockRecursive;
      } else {
        k = key;
      }

      final value = this[key]; // NB: original key
      Object? v;
      if (value is List) {
        v = value.lockRecursive;
      } else if (value is Map) {
        v = value.lockRecursive;
      } else if (value is Set) {
        v = value.lockRecursive;
      } else {
        v = value;
      }

      m[k] = v;
    }
    return IMap(m);
  }
}

/// The [Set.lock] provided by FIC does not do a deep lock of all elements. This does.
extension PLRecursiveSetLock on Set<Object?> {
  ISet<Object?> get lockRecursive {
    final s = <Object?>{};
    for (final element in this) {
      if (element is List) {
        s.add(element.lockRecursive);
      } else if (element is Map) {
        s.add(element.lockRecursive);
      } else if (element is Set) {
        s.add(element.lockRecursive);
      } else {
        s.add(element);
      }
    }
    return ISet(s);
  }
}

extension IListToPLVector on IList<Object?> {
  PLVector toPLVector() {
    return PLVector(this);
  }
}

extension ListToPLVector on List<Object?> {
  PLVector toPLVector() {
    return PLVector(this);
  }
}

extension InvocableIMap on IMap<Object?, Object?> {
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    if (args.length == 1) {
      final key = args.first;
      return this[key];
    } else if (args.length == 2) {
      final idx = args.first;
      if (containsKey(idx)) {
        return this[idx];
      } else {
        return args.toList()[1];
      }
    } else {
      throw ArgumentError(
          'A map—when invoked—expects 1 or 2 arguments, but received ${args.length} arguments.');
    }
  }
}

extension InvocableISet on ISet<Object?> {
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    if (args.length == 1) {
      final o = args.first;
      return contains(o) ? o : null;
    } else if (args.length == 2) {
      final o = args.first;
      return contains(o) ? o : args.toList()[1];
    } else {
      throw ArgumentError(
          'A set—when invoked—expects 1 or 2 arguments, but received ${args.length} arguments.');
    }
  }
}

bool isTruthy(Object? o) {
  return !(o == false || o == null);
}

// Function API

void validateParams(Object? params) {
  if (params is PLVector) {
    if (params.isNotEmpty) {
      final seenParams = <PLSymbol>{};
      for (final param in params.iter) {
        if (param is! PLSymbol) {
          throw FormatException(
              'Function signatures must consist solely of symbols, but encountered $param of type ${typeString(param)} $params');
        }
        if (!seenParams.add(param)) {
          throw FormatException(
              'Function signatures must consist solely of unique symbol, but encountered duplicate $param in $params');
        }
      }
      validateVariableArityParams(params);
    }
  } else {
    throw FormatException(
        'Function parameters must be specified as a vector, but encountered: $params');
  }
}

void validateVariableArityParams(PLVector params) {
  final indexOfAmpersandParam =
      params.isEmpty ? -1 : params.indexOf(PLSymbol('&'));
  if (indexOfAmpersandParam != -1 &&
      indexOfAmpersandParam < (params.length - 2)) {
    throw FormatException(
        'The special form fn supports specifying variable arity in the params vector, but only one symbol may come after the & symbol.');
  }
}

abstract class PLInvocable extends PLExpr {
  Object? invoke(PLEnv env, Iterable<Object?> args);
}

abstract class PLNamedInvocable extends PLInvocable {
  PLSymbol name = PLSymbol('<nameless>');

  @override

  /// This type name should never be encountered in user land.
  String typeName() {
    return 'invocable';
  }

  @override
  String printToString(PLEnv env) {
    return '#<function: $name>';
  }
}

class PLArity {
  PLSymbol fnName = PLSymbol('nameless-arity');
  late final PLVector params;
  late final PLList body;
  late final PLList? interpretedBody;
  late final int indexOfAmpersandParam;
  late final bool isVariableArity;
  late final int numRequiredArgs;
  late Map<PLSymbol, PLBindingEntry> closedScope;

  PLArity._(this.fnName);

  PLArity.fromDefinition(PLEnv env, PLList arityDefinition) {
    final params = arityDefinition.elementAt(0);
    validateParams(params);
    final unExpandedBody = PLList([symbolDo]).addAll(arityDefinition.skip(1));
    // We macroexpand the body so as to be able to identify symbols that need
    // to be captured from the enclosing scope at the time of definition.
    body = macroExpand(env, unExpandedBody) as PLList;
    if (params is PLVector) {
      this.params = params;
      indexOfAmpersandParam =
          params.isEmpty ? -1 : params.indexOf(PLSymbol('&'));
      validateVariableArityParams(params);
      isVariableArity = indexOfAmpersandParam != -1;
      numRequiredArgs = isVariableArity ? indexOfAmpersandParam : params.length;
    }
  }

  factory PLArity.withEnv(PLEnv env, PLSymbol fnName, PLList arityDefinition) {
    final arity = PLArity.fromDefinition(env, arityDefinition);
    final boundSymbols = arity.params.toList()..add(fnName);
    env.pushEmptyClosureScope();
    env.addAllClosureScopedSymbols(List<PLSymbol>.from(boundSymbols));
    final ic = interpretBody(arity.body, env);
    arity.closedScope = ic.closedScope; // .toIMap();
    if (ic.code is PLList) {
      arity.interpretedBody = ic.code as PLList;
    } else {
      arity.interpretedBody = PLList([symbolDo]).add(ic.code);
    }
    env.popClosureScope();
    return arity;
  }

  @override
  String toString() {
    return 'PLArity[${params.join(' ')}]';
  }

  PLArity clone() {
    final newArity = PLArity._(fnName);
    newArity.body = PLList(body.iter);
    newArity.params = PLVector(params.iter);
    if (interpretedBody != null) {
      newArity.interpretedBody = PLList(interpretedBody!.iter);
    } else {
      newArity.interpretedBody = null;
    }
    newArity.indexOfAmpersandParam = indexOfAmpersandParam;
    newArity.isVariableArity = isVariableArity;
    newArity.numRequiredArgs = numRequiredArgs;
    newArity.closedScope = Map.from(closedScope);
    return newArity;
  }
}

PLInterpretedCode interpretBody(Object? form, PLEnv env) {
  final closedScopeMappings = <PLSymbol, PLBindingEntry>{};
  List<Object?> code = [symbolDo];
  if (form is PLSymbol) {
    final bindingEntry = env.getBinding(form);
    if (bindingEntry != null) {
      closedScopeMappings[form] = bindingEntry;
    } else if (!env.isBound(form) &&
        !specialForms.contains(form) &&
        !env.isClosureScopedSymbol(form)) {
      // NB: Bindings created via declare are env.isBound but env.getBinding returns null,
      //     so we do not want to throw an exception when they are encountered during
      //     this lexical closure interpretation phase.
      throw UndefinedSymbol(form);
    } else {
      // NB: Ensure nested closures track the forms they use.
      closedScopeMappings[form] = PLBindingEntry(declaredValue);
    }
    // CODE ADD
    code.add(form);
  } else if (form is PLList) {
    if (form.isNotEmpty) {
      final headSym = form[0];
      if (headSym == symbolFn) {
        env.pushScope(closedScopeMappings);
        try {
          final plFn = plEval(env, form);
          if (plFn is PLFunction) {
            for (final arity in plFn.arities.values) {
              closedScopeMappings.addAll(arity.closedScope); // .unlock);
            }
          } else {
            throw 'Developer Error: Expects a PLFunction but evaluated to a ${typeString(plFn)}';
          }
          // CODE ADD
          code.add(plFn);
        } finally {
          env.popScope();
        }
      } else if (headSym == symbolQuote) {
        // CODE ADD
        code.add(form);
      } else if (headSym == symbolDeclare) {
        final declaredSymbols = form.skip(1);
        // NB: declare should only be top-level, but for completeness:
        for (final symbol in declaredSymbols) {
          if (symbol is PLSymbol) {
            closedScopeMappings[symbol] = PLBindingEntry(declaredValue);
          } else {
            throw ArgumentError(
                'The declare special form only supports symbols, but received a ${typeString(symbol)} value.');
          }
        }
        // CODE ADD
        code.add(form);
      } else if (headSym == symbolRecur) {
        final recurForms = form.sublist(1);
        final ic = interpretBody(recurForms.iter, env);
        PLList interpretedRecurForm = PLList([symbolRecur]);
        if (ic.code is Iterable) {
          final codeForms = ic.code as Iterable;
          for (final recurArg in codeForms) {
            interpretedRecurForm = interpretedRecurForm.add(recurArg);
          }
        } else {
          throw 'Developer Error: Recur arg interpretation failed.';
        }
        closedScopeMappings.addAll(ic.closedScope);
        code.add(interpretedRecurForm);
      } else if (headSym == symbolLet) {
        final bindingVector = form[1];
        PLList interpretedLetForm = PLList([symbolLet]);
        if (bindingVector is PLVector) {
          PLVector interpretedLetBindingVector = PLVector([]);
          env.pushEmptyClosureScope();
          for (int i = 0; i < bindingVector.length; i++) {
            if (i.isEven) {
              final sym = bindingVector[i];
              if (sym is PLSymbol) {
                env.addClosureScopedSymbol(sym);
                // CODE ADD
                interpretedLetBindingVector =
                    interpretedLetBindingVector.add(sym);
              } else {
                throw 'Developer Error: Bindings must be symbols, but encountered a ${typeString(sym)} value.';
              }
            } else {
              final interpretedBindingValue =
                  interpretBody(bindingVector[i], env);
              closedScopeMappings.addAll(interpretedBindingValue.closedScope);
              // CODE ADD
              interpretedLetBindingVector =
                  interpretedLetBindingVector.add(interpretedBindingValue.code);
            }
          }
          // CODE ADD
          final interpretedLetBodyInterpretedCode =
              interpretBody(PLList([symbolDo]).addAll(form.skip(2)), env);
          closedScopeMappings
              .addAll(interpretedLetBodyInterpretedCode.closedScope);
          interpretedLetForm = interpretedLetForm
              .add(interpretedLetBindingVector)
              .add(interpretedLetBodyInterpretedCode.code);
          code.add(interpretedLetForm);
          env.popClosureScope();
        } else {
          throw 'Developer Error: first arg to let must be a binding vector.';
        }
      } else if (headSym == symbolLoop) {
        final bindingVector = form[1];
        PLList interpretedLoopForm = PLList([symbolLoop]);
        if (bindingVector is PLVector) {
          PLVector interpretedLoopBindingVector = PLVector([]);
          env.pushEmptyClosureScope();
          for (int i = 0; i < bindingVector.length; i++) {
            if (i.isEven) {
              final sym = bindingVector[i];
              if (sym is PLSymbol) {
                env.addClosureScopedSymbol(sym);
                // CODE ADD
                interpretedLoopBindingVector =
                    interpretedLoopBindingVector.add(sym);
              } else {
                throw 'Developer Error: Bindings must be symbols, but encountered a ${typeString(sym)} value.';
              }
            } else {
              // NB: Ensure undefined symbols are caught.
              final interpretedBindingValue =
                  interpretBody(bindingVector[i], env);
              closedScopeMappings.addAll(interpretedBindingValue.closedScope);
              // CODE ADD
              interpretedLoopBindingVector = interpretedLoopBindingVector
                  .add(interpretedBindingValue.code);
            }
          }
          // Analyze body of [symbolLoop]
          final interpretedLoopBodyInterpretedCode =
              interpretBody(PLList([symbolDo]).addAll(form.skip(2)), env);
          closedScopeMappings
              .addAll(interpretedLoopBodyInterpretedCode.closedScope);
          interpretedLoopForm = interpretedLoopForm
              .add(interpretedLoopBindingVector)
              .add(interpretedLoopBodyInterpretedCode.code);
          code.add(interpretedLoopForm);
          env.popClosureScope();
        } else {
          throw 'Developer Error: first arg to loop must be a binding vector, but received a ${typeString(bindingVector)}';
        }
      } else if (headSym == symbolCatch) {
        final targetExceptionClass = form[1];
        final boundExceptionSymbol = form[2];
        env.pushEmptyClosureScope();
        if (targetExceptionClass is PLSymbol) {
          env.addClosureScopedSymbol(targetExceptionClass);
        } else {
          throw FormatException(
              'The catch form expects a symbol for the target class, but encountered a ${typeString(targetExceptionClass)} value.');
        }
        if (boundExceptionSymbol is PLSymbol) {
          env.addClosureScopedSymbol(boundExceptionSymbol);
        } else {
          throw FormatException(
              'The catch form expects a symbol to bind the caught exception, but encountered a ${typeString(targetExceptionClass)} value.');
        }
        // Analyze body of catch
        final ic = interpretBody(PLList([symbolDo]).addAll(form.skip(3)), env);
        closedScopeMappings.addAll(ic.closedScope);
        // CODE ADD
        final interpretedCatchForm =
            PLList([symbolCatch, targetExceptionClass, boundExceptionSymbol])
                .add(ic.code);
        code.add(interpretedCatchForm);
        env.popClosureScope();
      } else if (headSym == symbolDo) {
        final innerForms = form.sublist(1);
        List<Object?> interpretedDo = [symbolDo];
        for (final innerForm in innerForms.iter) {
          final ic = interpretBody(innerForm, env);
          interpretedDo.add(ic.code);
          closedScopeMappings.addAll(ic.closedScope);
        }
        // CODE ADD
        code.add(interpretedDo.toPLList());
      } else {
        List<Object?> interpretedList = [];
        for (final innerForm in form.iter) {
          final ic = interpretBody(innerForm, env);
          interpretedList.add(ic.code);
          closedScopeMappings.addAll(ic.closedScope);
        }
        // CODE ADD
        code.add(interpretedList.toPLList());
      }
    } else {
      // CODE ADD
      code.add(form); // NB: empty PLList
    }
  } else if (form is PLVector) {
    List<Object?> interpretedVector = [];
    for (final innerForm in form.iter) {
      final ic = interpretBody(innerForm, env);
      interpretedVector.add(ic.code);
      closedScopeMappings.addAll(ic.closedScope);
    }
    // CODE ADD
    code.add(interpretedVector.toPLVector());
  } else if (form is ISet) {
    Set<Object?> interpretedSet = {};
    for (final innerForm in form) {
      final ic = interpretBody(innerForm, env);
      interpretedSet.add(ic.code);
      closedScopeMappings.addAll(ic.closedScope);
    }
    // CODE ADD
    code.add(interpretedSet.toISet());
  } else if (form is IMap) {
    final Map<Object?, Object?> interpretedMap = {};
    for (final key in form.keys) {
      final interpretedKey = interpretBody(key, env);
      final interpretedValue = interpretBody(form[key], env);
      closedScopeMappings.addAll(interpretedKey.closedScope);
      closedScopeMappings.addAll(interpretedValue.closedScope);
      final interpretedKeyCode = interpretedKey.code;
      final interpretedValueCode = interpretedValue.code;
      interpretedMap[interpretedKeyCode] = interpretedValueCode;
    }
    code.add(interpretedMap.toIMap());
  } else {
    // CODE ADD
    code.add(form);
  }
  // Do this to get non-interpreted PiLisp functions.
  // final ic = PLInterpretedCode(closedScopeMappings, forms);
  if (code.length == 2) {
    // NB: (do x) => x
    return PLInterpretedCode(closedScopeMappings, code[1]);
  } else {
    // TODO Be even more selective. Things like if, let, loop, etc., have
    //      implicit do as needed.
    return PLInterpretedCode(closedScopeMappings, code.toPLList());
  }
}

/// Part of evaluating PiLisp code is interpreting the forms provided by the
/// programmer. This class represents the result of interpreting code found in
/// function definitions and transforming raw PiLisp data structures into
/// more intentional code units (e.g., list => invocation).
class PLInterpretedCode {
  Map<PLSymbol, PLBindingEntry> closedScope;
  Object? code;

  PLInterpretedCode(this.closedScope, this.code);
}

class PLFunction extends PLNamedInvocable {
  late IMap<int, PLArity> arities;
  late final PLArity? variableArity;

  bool isMacro = false;

  PLFunction._(PLSymbol name) {
    super.name = name;
  }

  factory PLFunction.forArities(
      PLEnv env, PLSymbol name, Iterable<PLList> arityDefinitions) {
    PLFunction fn = PLFunction._(name);
    Map<int, PLArity> m = {};
    int maxNonVariableArity = 0;
    int numVariableArity = 0;
    for (final arityDefinition in arityDefinitions) {
      final arity = PLArity.withEnv(env, name, arityDefinition);
      final num = arity.numRequiredArgs;
      if (arity.isVariableArity) {
        numVariableArity += 1;
        if (numVariableArity > 1) {
          throw FormatException(
              'A function may only define one variable arity, but encountered $numVariableArity function bodies with variable arity.');
        }
        // By definition, variable arity must have args >= max required args of
        // any other arity, so this puts the variable arity at the "end" of the
        // map of arities and avoid overwriting a non-variable arity with [num]
        // number of required args.
        m[num + 1] = arity;
        fn.variableArity = arity;
      } else {
        m[num] = arity;
        if (num > maxNonVariableArity) {
          maxNonVariableArity = num;
        }
      }
    }
    if (numVariableArity == 0) {
      fn.variableArity = null; // ensure initialized
    }
    if (fn.variableArity != null) {
      final va = fn.variableArity!;
      if (va.numRequiredArgs < maxNonVariableArity) {
        throw FormatException(
            'If a function is defined with an arity that is variable, it must have a number of parameters greater than or equal to the largest non-variable arity, but encountered $arityDefinitions');
      }
    }
    fn.arities = IMap(m);
    return fn;
  }

  factory PLFunction.fromFn(PLEnv env, PLSymbol name, PLFunction otherFn) {
    PLFunction fn = PLFunction._(name);
    fn.arities = otherFn.arities;
    fn.variableArity = otherFn.variableArity;
    fn.isMacro = otherFn.isMacro;
    Map<int, PLArity> newArities = {};
    for (final arityNum in fn.arities.keys) {
      final arity = fn.arities[arityNum]!;
      final clonedArity = arity.clone();
      final syms = clonedArity.closedScope.keys;
      for (final sym in syms) {
        final envBinding = env.getBinding(sym);
        if (envBinding != null) {
          clonedArity.closedScope[sym] = PLBindingEntry(envBinding.value);
        }
      }
      newArities[arityNum] = clonedArity;
    }
    fn.arities = newArities.toIMap();
    return fn;
  }

  /// Select the arity to invoke based on their signatures and the number of [args].
  ///
  /// Examples:
  ///  - args:    `a b`
  ///  - arities: `([] ...) ([x] ...) ([x & ys] ...)`
  ///  - return:  `([x & ys] ...)`
  PLArity negotiateArity(Iterable<Object?> args) {
    final len = args.length;
    if (arities.containsKey(len)) {
      return arities.get(len)!;
    } else if (variableArity != null) {
      final va = variableArity!;
      if (len >= va.numRequiredArgs) {
        return va;
      }
    }
    throw FormatException(
        'The function $name supports arities of ${arities.toKeyIList().sort().join(', ')} arguments but encountered $len arguments.');
  }

  @override
  Object? invoke(PLEnv env, Iterable<Object?> args) {
    PLArity arity = negotiateArity(args);
    if (arity.isVariableArity && args.length < arity.numRequiredArgs) {
      throw ArgumentError(
          'The function $name expects at least ${arity.numRequiredArgs} arguments, but received ${args.length} arguments.');
    } else if (!arity.isVariableArity && (args.length != arity.params.length)) {
      throw ArgumentError(
          'The function $name expects ${arity.params.length} arguments, but received ${args.length} arguments.');
    }
    IList<PLSymbol> finalParams;
    IList<Object?> finalArgs;
    if (arity.isVariableArity) {
      final splitParams =
          arity.params.iter.splitAt(arity.indexOfAmpersandParam);
      final requiredParams = splitParams.first;
      final variableParam = splitParams.second.toIList()[1];
      final splitArgs = args.toIList().splitAt(arity.indexOfAmpersandParam);
      final requiredArgs = splitArgs.first;
      final variableArgs = splitArgs.second;
      finalParams = List<PLSymbol>.from(requiredParams
              .take(arity.indexOfAmpersandParam)
              .toIList()
              .add(variableParam))
          .toIList();
      // Bind symbol after `&` to a "vector" of the arguments provided.
      finalArgs = requiredArgs.toIList().add(variableArgs.toPLList());
    } else {
      finalParams = List<PLSymbol>.from(arity.params.iter).toIList();
      finalArgs = args.toIList();
    }
    if (isMacro) {
      Object? returnValue;
      env.pushScope(arity.closedScope); // .unlock);
      env.pushEmptyScope();
      env.pushStackFrame(name);
      try {
        for (var i = 0; i < finalParams.length; i++) {
          final sym = finalParams[i];
          final value = finalArgs[i];
          env.addBindingValue(sym, value);
        }
        returnValue = plEval(env, arity.interpretedBody ?? arity.body);
        // return returnValue;
      } finally {
        env.popStackFrame();
        env.popScope(); // empty scope
        env.popScope(); // closed scope
      }
      return returnValue;
    } else {
      Object? returnValue;
      env.pushScope(arity.closedScope); // .unlock);
      env.pushEmptyScope();
      env.pushStackFrame(name);
      try {
        for (var i = 0; i < finalParams.length; i++) {
          final sym = finalParams[i];
          final value = finalArgs[i];
          env.addBindingValue(sym, value);
        }
        returnValue = plEval(env, arity.interpretedBody ?? arity.body);
      } finally {
        env.popStackFrame();
        env.popScope(); // empty scope
        env.popScope(); // closed scope
      }

      return returnValue;
    }
  }

  @override

  /// When a [PLFunction] is evaluated, it must capture the pertinent parts of
  /// the environment that it closes over.
  Object? eval(PLEnv env) {
    // NB: Mint a new function to mutate its closed scopes. Otherwise you're editing global function arities!
    return PLFunction.fromFn(env, name, this);
  }

  @override
  String toString() {
    return '#<PLFunction: $name>';
  }
}

class PLNil extends PLExpr {
  static final PLNil _instance = PLNil._internal();

  PLNil._internal();

  factory PLNil() => _instance;

  @override
  Object? eval(PLEnv env) {
    return null;
  }

  @override
  String toString() {
    return 'nil';
  }

  @override
  String typeName() {
    return toString();
  }

  @override
  String printToString(PLEnv env) {
    return toString();
  }
}

Object? plEval(PLEnv env, Object? expr) {
  // env.debugPrint('[DEBUG] ${plPrintToString(env, expr)}');
  if (expr is PLExpr) {
    return expr.eval(env);
  } else if (expr is IMap) {
    return expr._plEval(env);
  } else if (expr is ISet) {
    return expr._plEval(env);
  } else {
    // NB: Support Dart interop.
    return expr;
  }
}

/// Given a [programSource], read and evaluate until there is nothing more to read.
Object? plLoad(PLEnv env, String programSource) {
  final rdr = PiLispStringReader(programSource);
  Object? ret;
  for (Object? expr = rdr.read(-1); expr != piLispEof; expr = rdr.read(-1)) {
    ret = plEval(env, expr);
  }
  return ret;
}
