import 'package:pilisp/src/pilisp_public.dart';

import 'pilisp_expr.dart';

class UndefinedSymbol implements Exception {
  final PLSymbol symbol;

  const UndefinedSymbol(this.symbol);

  @override
  String toString() {
    return 'Symbol $symbol is undefined.';
  }
}

class PiLispReaderException implements Exception {}

class MalformedAnonymousArgument extends PiLispReaderException {
  final String message;
  MalformedAnonymousArgument(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class MalformedMap extends PiLispReaderException {
  final String message;
  MalformedMap(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class MismatchedDelimiter extends PiLispReaderException {
  final String message;
  MismatchedDelimiter(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class IllegalNestedAnonymousFunction extends PiLispReaderException {
  final String message;
  IllegalNestedAnonymousFunction(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class UnexpectedEndOfInput extends PiLispReaderException {
  final String message;
  UnexpectedEndOfInput(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class UnreadableFormException extends PiLispReaderException {
  final String message;
  UnreadableFormException(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class UnsupportedDispatchMacro extends PiLispReaderException {
  final String message;
  UnsupportedDispatchMacro(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class UnsupportedEscapeCharacter extends PiLispReaderException {
  final String message;
  UnsupportedEscapeCharacter(this.message);

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}

class PLInvocationException implements Exception {
  /// Dart allows throwing any value, so this is [Object].
  final Object thrown;

  /// The [PLEnv] Stack frames are popped such that they are not available when
  /// trying to print them up/downstream. This field should be a copy of the
  /// [PLEnv.stackFrames] at the time the underlying [thrown] is caught.
  final List<String> stackFrames;

  PLInvocationException(this.thrown, this.stackFrames);

  @override

  /// Make this exception opaque to the end-user by rendering its string value
  /// like the [thrown] object.
  String toString() {
    return '#<PLInvocationException<${thrown.toString()}>>';
  }

  /// Returns the [thrown] of the innermost [PLInvocationException].
  Object rootCause() {
    if (thrown is PLInvocationException) {
      final t = thrown as PLInvocationException;
      return t.rootCause();
    }
    return thrown;
  }
}
