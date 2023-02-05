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
