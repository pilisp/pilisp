// Classes

import 'package:pilisp/pilisp.dart';

import 'pilisp_expr.dart';
import 'pilisp_print.dart';
import 'pilisp_read.dart';

export 'pilisp_core.dart' show PLAwait, PLState;
export 'pilisp_core_pilisp.dart' show piLispCore;
export 'pilisp_env.dart' show PLEnv, PLBindingEntry;
export 'pilisp_expr.dart'
    show
        PLException,
        PLExpr,
        PLFunction,
        PLInvocable,
        PLNamedInvocable,
        PLList,
        PLNil,
        PLSymbol,
        PLTerm,
        PLVector;
export 'pilisp_error.dart';

/// This is the default language environment for the core PiLisp language.
///
/// The base instance of [PLEnv] creates bindings for those things implemented
/// in Dart. This instance of it is then augmented by evaluating the
/// [piLispCore] PiLisp source code.
///
/// The static methods of the [PiLisp] class use this [PLEnv] instance by
/// default, but accept a custom instance as an optional parameter.
PLEnv piLispEnv = PLEnv().loadString(piLispCore);

/// The [PiLisp] class exposes static methods for reading, evaluating, printing,
/// and identifying the type of PiLisp expressions.
///
/// See the package-level documentation and project README for more information
/// about the language itself.
///
/// The methods that require a [PLEnv] instance rely on the [piLispEnv] instance
/// by default, which loads the core language implementation. In general, you
/// will want to extend this base environment, rather than creating one from
/// scratch. See the
/// [pilisp-native](https://github.com/pilisp/pilisp-native) project for a
/// non-trivial example of extending the base [PLEnv].
class PiLisp {
  /// Given a [programSource], read and return the first expression found.
  static Object readString(String programSource) {
    return plReadString(programSource);
  }

  /// Given an [expr] value (presumably returned by [readString] after reading
  /// some PiLisp code), evaluate it and return the resulting value.
  static Object? eval(Object expr, {PLEnv? env}) {
    final ev = env ?? piLispEnv;
    return plEval(ev, expr);
  }

  static void logEvalException(Object? expr, Object? exception,
      {PLEnv? env, StackTrace? stackTrace}) {
    final ev = env ?? piLispEnv;
    print(exception);
    if (ev.printStackTraces) {
      Iterable<String> frames;
      if (exception is PLInvocationException) {
        frames = PLEnv.formatStackTrace(exception.stackFrames);
      } else {
        frames = ev.currentStackTrace();
      }
      if (frames.isNotEmpty) {
        print('  ${frames.join('\n  ')}');
      }
    }
    if (ev.isDebug && stackTrace != null) {
      print(stackTrace);
    }
    if (expr is PLList) {
      if (expr.loc != null) {
        final id = ev.nextId();
        print('($id) Error on line ${expr.loc}');
        print('($id) Form:\n${plPrintToString(ev, expr)}');
      }
    }
  }

  /// Given a [programSource], read and evaluate every form found, returning the
  /// final one.
  static Object? loadString(String programSource, {PLEnv? env}) {
    final ev = env ?? piLispEnv;
    return plLoad(ev, programSource);
  }

  /// Returns a string of the given [value] as a readable PiLisp form.
  static String printToString(Object? value, {PLEnv? env}) {
    return plPrintToString(env ?? piLispEnv, value);
  }

  /// Prints the given [value] as a readable PiLisp form.
  static void printValue(Object? value, {PLEnv? env}) {
    print(printToString(value, env: env));
  }

  /// Returns the name of the PiLisp type of the given [value].
  static String typeName(Object? value) => typeString(value);
}
