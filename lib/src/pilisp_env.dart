import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'pilisp_core.dart';
import 'pilisp_core.stub.dart';
import 'pilisp_expr.dart';

final termDoc = PLTerm('doc');
final termPrivate = PLTerm('private');

typedef PLMap = IMap<Object?, Object?>;

const declaredValue = Object();

/// The [PLEnv] class stores the bindings and language-level settings for the
/// current environment.
class PLEnv {
  bool isPrintJson = false;
  int indentIndex = 0;
  int indentSize = 2;
  bool printStackTraces = true;
  List<String> stackFrames = [];
  BigInt _symbolId = BigInt.zero;

  bool isDebug = false;

  BigInt nextId() => _symbolId += BigInt.one;

  /// These sets of [PLSymbol] are created as part of lexical closure processing.
  List<Set<PLSymbol>> closureScopes = [];

  // TODO Consider prefixing most of these with `PL/` and simplifying them, leveraging multi-arity func. in PiLisp rather than by hand here in Dart
  static final IMap<PLSymbol, PLBindingEntry> baseScope = IMap({
    PLSymbol('*pilisp-version*'): PLBindingEntry.withMeta('1.0.0-alpha.1',
        IMap({termDoc: 'Returns the current version of PiLisp.'})),
    PLSymbol('identical?'): PLBindingEntry.withMeta(isIdenticalFn,
        IMap({termDoc: 'Returns true if x and y are the same object.'})),
    PLSymbol('bindings'): PLBindingEntry.withMeta(
      bindingsFn,
      IMap({
        termDoc:
            'Returns a map of all bindings currently in scope. Keys are the symbols, values are a map of :value and :meta'
      }),
    ),
    PLSymbol('pl/debug!'): PLBindingEntry.withMeta(debugBangFn,
        IMap({termDoc: 'Set the debug environment to true or false.'})),
    PLSymbol('next-symbol-id'): PLBindingEntry.withMeta(
        nextSymbolIdFn,
        IMap({
          termDoc:
              'Returns the next unique numeric (BigInt) id for symbols. See gensym.'
        })),
    PLSymbol('symbol'): PLBindingEntry.withMeta(makeSymbolFn,
        IMap({termDoc: 'Returns a symbol with the given string name.'})),
    PLSymbol('keyword'): PLBindingEntry.withMeta(
        makeTermFn,
        IMap(
            {termDoc: 'Returns a term (keyword) with the given string name.'})),
    PLSymbol('term'): PLBindingEntry.withMeta(
        makeTermFn,
        IMap(
            {termDoc: 'Returns a term (keyword) with the given string name.'})),
    PLSymbol('name*'): PLBindingEntry.withMeta(
        nameFn,
        IMap({
          termDoc:
              'Returns the full name of a symbol or term. Returns strings as-is.'
        })),
    PLSymbol('apply'): PLBindingEntry.withMeta(
        applyFn,
        IMap({
          termDoc:
              'Applies the given function to the given arguments. Final argument must be a sequence.'
        })),
    // PLSymbol('dart/fn'): PLBindingEntry.withMeta(
    //     dartFnFn,
    //     IMap({
    //       termDoc:
    //           'Returns a Dart function that—when called—invokes the given PiLisp function.'
    //     })),
    PLSymbol('macroexpand-1'): PLBindingEntry.withMeta(
        macroexpand1Fn,
        IMap({
          termDoc: 'Perform one phase of macro expansion on the given form.'
        })),
    PLSymbol('macroexpand'): PLBindingEntry.withMeta(macroexpandFn,
        IMap({termDoc: 'Macro expand the given form until fully expanded.'})),
    PLSymbol('list'): PLBindingEntry.withMeta(
        listFn, IMap({termDoc: 'Returns a list of the arguments.'})),
    PLSymbol('seq'): PLBindingEntry.withMeta(
        seqFn, IMap({termDoc: 'Returns a sequence from a collection.'})),
    PLSymbol('vector'): PLBindingEntry.withMeta(
        vectorFn, IMap({termDoc: 'Returns a vector of the arguments.'})),
    PLSymbol('hash-map'): PLBindingEntry.withMeta(
        hashMapFn, IMap({termDoc: 'Returns a hash-map of the arguments.'})),
    PLSymbol('conj'): PLBindingEntry.withMeta(
        conjFn,
        IMap({
          termDoc: 'Returns a new collection with the item added (conjoined).'
        })),
    PLSymbol('to-dart-list'): PLBindingEntry.withMeta(
        toDartListFn,
        IMap({
          termDoc: 'Returns a Dart List representation of the given collection.'
        })),
    PLSymbol('to-dart-map'): PLBindingEntry.withMeta(
        toDartMapFn,
        IMap({
          termDoc: 'Returns a Dart Map representation of the given collection.'
        })),
    PLSymbol('to-dart-set'): PLBindingEntry.withMeta(
        toDartSetFn,
        IMap({
          termDoc: 'Returns a Dart Set representation of the given collection.'
        })),
    PLSymbol('cons'): PLBindingEntry.withMeta(consFn,
        IMap({termDoc: 'Returns a new collection with the item prepended.'})),
    PLSymbol('map-entry?'): PLBindingEntry.withMeta(
        isMapEntryFn,
        IMap({
          termDoc:
              'Returns true if this is a map entry (vector tagged as such).'
        })),
    PLSymbol('assoc*'): PLBindingEntry.withMeta(assocFn,
        IMap({termDoc: 'Returns a new map with the value mapped to key.'})),
    PLSymbol('dissoc'): PLBindingEntry.withMeta(
        dissocFn,
        IMap({
          termDoc:
              'Returns a new map with the given keys removed from the given one.'
        })),
    PLSymbol('count'): PLBindingEntry.withMeta(
        countFn, IMap({termDoc: 'Returns length of collection.'})),
    PLSymbol('next'): PLBindingEntry.withMeta(
        nextFn, IMap({termDoc: 'Returns all but the first items.'})),
    PLSymbol('get*'): PLBindingEntry.withMeta(
        getFn,
        IMap(
            {termDoc: 'Returns value at key. Prefer get.', termPrivate: true})),
    PLSymbol('nth*'): PLBindingEntry.withMeta(
        nthFn,
        IMap({
          termDoc: 'Returns item at index. Prefer nth.',
          termPrivate: true
        })),
    PLSymbol('sort'): PLBindingEntry.withMeta(
        sortFn,
        IMap({
          termDoc:
              'Returns the collection sorted. Uses Comparable.compare by default.'
        })),
    PLSymbol('reduce'): PLBindingEntry.withMeta(
        reduceFn,
        IMap({
          termDoc:
              'Reduce the collection using the given function. Uses initial value as accumulator if provided, else the function must support a zero arity that is used to generate the initial accumulator.'
        })),
    PLSymbol('keys'): PLBindingEntry.withMeta(keysFn,
        IMap({termDoc: 'Returns a vector of the keys of the given map.'})),
    PLSymbol('vals'): PLBindingEntry.withMeta(valuesFn,
        IMap({termDoc: 'Returns a vector of the values of the given map.'})),
    PLSymbol('+'): PLBindingEntry.withMeta(
        addFn, IMap({termDoc: 'Returns the sum of all arguments.'})),
    PLSymbol('-'): PLBindingEntry.withMeta(subtractFn,
        IMap({termDoc: 'Returns the difference of all arguments.'})),
    PLSymbol('*'): PLBindingEntry.withMeta(
        multiplyFn, IMap({termDoc: 'Returns the product of all arguments.'})),
    PLSymbol('/'): PLBindingEntry.withMeta(
        divideFn, IMap({termDoc: 'Returns the quotient of all arguments.'})),
    PLSymbol('rem'): PLBindingEntry.withMeta(
        remainderFn,
        IMap({
          termDoc:
              'Returns the remainder after dividing the num by the divisor.'
        })),
    PLSymbol('='): PLBindingEntry.withMeta(equalToFn,
        IMap({termDoc: 'Returns true if all arguments equal one another.'})),
    PLSymbol('<'): PLBindingEntry.withMeta(
        lessThanFn,
        IMap({
          termDoc:
              'Returns true if arguments are less than one another, left to right.'
        })),
    PLSymbol('<='): PLBindingEntry.withMeta(
        lessThanEqualToFn,
        IMap({
          termDoc:
              'Returns true if arguments are less than or equal to one another, left to right.'
        })),
    PLSymbol('>'): PLBindingEntry.withMeta(
        greaterThanFn,
        IMap({
          termDoc:
              'Returns true if arguments are greater than one another, left to right.'
        })),
    PLSymbol('>='): PLBindingEntry.withMeta(
        greaterThanEqualToFn,
        IMap({
          termDoc:
              'Returns true if arguments are greater than or equal to one another, left to right.'
        })),
    PLSymbol('str'): PLBindingEntry.withMeta(
        strFn,
        IMap({
          termDoc: 'Returns a string representation of all the arguments.'
        })),
    PLSymbol('type'): PLBindingEntry.withMeta(typeFn,
        IMap({termDoc: 'Returns the type of the argument as a symbol.'})),
    PLSymbol('fn?'): PLBindingEntry.withMeta(
        isFnFn, IMap({termDoc: 'Returns true if the value is a function.'})),
    PLSymbol('ex-info'): PLBindingEntry.withMeta(
        exInfoFn,
        IMap({
          termDoc:
              'Returns an exception object, given a message and a data map.'
        })),
    PLSymbol('stacktrace/current'): PLBindingEntry.withMeta(
        stacktraceFn, IMap({termDoc: 'Returns the current stacktrace.'})),
    PLSymbol('print'): PLBindingEntry.withMeta(
        printFn,
        IMap({
          termDoc:
              'Prints its arguments to the console using Dart print(). Returns nil.'
        })),
    PLSymbol('pr-str'): PLBindingEntry.withMeta(
        prStrFn,
        IMap({
          termDoc:
              'Returns PiLisp-readable string representation of the forms provided.'
        })),
    PLSymbol('uri'): PLBindingEntry.withMeta(
        uriFn,
        IMap({
          termDoc:
              'Tries to parse its argument as a Uri. Throws if not a valid Uri.'
        })),
    PLSymbol('state'): PLBindingEntry.withMeta(
        stateFn,
        IMap({
          termDoc:
              'Returns a new state object for reading/writing mutable state.'
        })),
    PLSymbol('deref'): PLBindingEntry.withMeta(
        derefFn,
        IMap({
          termDoc:
              'Reads a value from an object that supports dereferencing, which includes state objects at this time.'
        })),
    PLSymbol('read-state'): PLBindingEntry.withMeta(
        readStateFn,
        IMap({
          termDoc:
              'Returns the value of the state object, reading from persistent storage if configured and the state is uninitialized.'
        })),
    PLSymbol('buffer-state'): PLBindingEntry.withMeta(
        bufferStateFn,
        IMap({
          termDoc:
              'Updates the state object in memory with a new value, but does not attempt to persist. The write-state fn is equivalent to this for non-persistent state objects.'
        })),
    PLSymbol('write-state'): PLBindingEntry.withMeta(
        writeStateFn,
        IMap({
          termDoc:
              'Writes a value into a state object. If the state object is persistent, persists synchronously before returning.'
        })),
  }).addAll(wrapperBindings.toIMap());

  /// PiLisp does not have namespaces. As such, nested scopes perform the work
  /// of both a global "namespace" (the 0th scope) and smaller lexical scopes
  /// introduced by `fn` and `let`.
  List<Map<PLSymbol, PLBindingEntry>> scopes = [baseScope.unlock];

  PLEnv();

  Future<void> shutDown() async {}

  /// Read and evaluate PiLisp [programSource], returning the [PLEnv] after
  /// that code has been loaded.
  PLEnv loadString(String programSource) {
    plLoad(this, programSource);
    return this;
  }

  void addBindingValue(PLSymbol symbol, Object? value) {
    scopes.last[symbol] = PLBindingEntry(value);
  }

  void addGlobalBindingWithValue(PLSymbol symbol, Object? value) {
    addGlobalBinding(symbol, PLBindingEntry(value));
  }

  void addDeclaredBindingValue(PLSymbol symbol) {
    addGlobalBinding(symbol, PLBindingEntry(declaredValue));
  }

  void addGlobalBinding(PLSymbol symbol, PLBindingEntry bindingEntry) {
    scopes.first[symbol] = bindingEntry;
  }

  void removeGlobalBinding(PLSymbol symbol) {
    scopes.first.remove(symbol);
  }

  PLBindingEntry? getBinding(PLSymbol symbol) {
    for (final scope in scopes.reversed) {
      if (scope.containsKey(symbol) && scope[symbol]!.value != declaredValue) {
        return scope[symbol];
      }
    }
    return null;
  }

  Object? getBindingValue(PLSymbol symbol) {
    return getBinding(symbol)?.value;
  }

  IMap<Object?, Object?>? getBindingMeta(PLSymbol symbol) {
    return getBinding(symbol)?.meta;
  }

  bool isBound(PLSymbol symbol) {
    for (final scope in scopes.reversed) {
      if (scope.containsKey(symbol)) return true;
    }
    return false;
  }

  void pushEmptyScope() {
    scopes.add({});
  }

  void pushScope(Map<PLSymbol, PLBindingEntry> scope) {
    scopes.add(scope);
  }

  void popScope() {
    scopes.removeLast();
  }

  void pushEmptyClosureScope() {
    closureScopes.add({});
  }

  void popClosureScope() {
    closureScopes.removeLast();
  }

  void addClosureScopedSymbol(PLSymbol sym) {
    closureScopes.last.add(sym);
  }

  void addAllClosureScopedSymbols(Iterable<PLSymbol> syms) {
    closureScopes.last.addAll(syms);
  }

  bool isClosureScopedSymbol(PLSymbol symbol) {
    for (final closureScope in closureScopes.reversed) {
      if (closureScope.contains(symbol)) return true;
    }
    return false;
  }

  void pushStackFrame(PLSymbol frameName) {
    stackFrames.add(frameName.toString());
  }

  void popStackFrame() {
    stackFrames.removeLast();
  }

  List<String> currentStackTrace() {
    return stackFrames.map((e) => 'fn: $e').toList();
  }

  String currentIndentation() => ' ' * (indentSize * indentIndex);

  int indentInc() => indentIndex += 1;

  int indentDec() => indentIndex -= 1;

  void withIndent(void Function() f) {
    indentInc();
    f();
    indentDec();
  }

  void debugPrint(String s) {
    if (isDebug) {
      print(s);
    }
  }

  String indentedString(String s) {
    return currentIndentation() + s;
  }

  /// Callers should push an empty scope before calling this if needed.
  void registerCatchAndFinallyFunctions(PLCatchFinally pcf) {
    addBindingValue(symbolCatchHandlers, pcf.catchClauses);
    addBindingValue(symbolFinallyHandler, pcf.finallyClause);
  }
}

class PLBindingEntry {
  Object? value;
  IMap<Object?, Object?> meta = IMap({});

  PLBindingEntry(this.value);

  factory PLBindingEntry.withMeta(Object? value, IMap<Object?, Object?> meta) {
    final plBindingEntry = PLBindingEntry(value);
    plBindingEntry.meta = meta;
    return plBindingEntry;
  }

  bool get isMacro => meta.get(PLTerm('macro')) == true;
}
