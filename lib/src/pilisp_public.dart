// Classes

import 'package:pilisp/pilisp.dart';

import 'pilisp_expr.dart';
import 'pilisp_print.dart';
import 'pilisp_read.dart';

export 'pilisp_core.dart' show PLState;
export 'pilisp_core_pilisp.dart' show corePiLisp;
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

PLEnv piLispEnv = PLEnv().loadString(corePiLisp);

class PiLisp {
  /// Given a [programSource], read and return the first expression found.
  static Object readString(String programSource) {
    return plReadString(programSource);
  }

  /// Given an [expr] value (presumably returned by [readString] after reading
  /// some PiLisp code), evaluate it and return the resulting value.
  static Object? eval(Object expr, {PLEnv? env}) {
    return plEval(env ?? piLispEnv, expr);
  }

  /// Given a [programSource], read and evaluate every form found, returning the
  /// final one.
  static Object? loadString(String programSource, {PLEnv? env}) {
    return plLoad(env ?? piLispEnv, programSource);
  }

  /// Returns a string of the given [value] as a readable PiLisp form.
  static String printToString(Object? value, {PLEnv? env}) {
    return plPrintToString(env ?? piLispEnv, value);
  }

  /// Prints the given [value] as a readable PiLisp form.
  static void print(Object? value, {PLEnv? env}) {
    print(printToString(value, env: env));
  }

  /// Returns the name of the PiLisp type of the given [value].
  static String piLispTypeName(Object? value) => typeString(value);
}
