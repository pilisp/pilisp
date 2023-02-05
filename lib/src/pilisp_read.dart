import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'pilisp_error.dart';
import 'pilisp_expr.dart';

final piLispEof = Object();

RegExp matchesComment = RegExp(r'[^\r\n]*');
RegExp matchesSpace = RegExp(r'[\s,]+');
RegExp matchesStringInnards = RegExp('(?:[^"\\\\]|\\\\.)*');

/// See pages 98-103 in the Dart language specification:
/// https://dart.dev/guides/language/specifications/DartLangSpec-v2.10.pdf
RegExp matchesStringEscape = RegExp(
    r'\\(?:x([0-9a-fA-F]{2})|u([0-9a-fA-F]{4})|u\{([0-9a-fA-F]+)\}|(.))');
RegExp matchesSymbol = RegExp(r'([.:])?([^0-9].*)$');

int backSlash = r'\'.codeUnitAt(0);
int bang = '!'.codeUnitAt(0);
int doubleQuote = '"'.codeUnitAt(0);
int lAngleBracket = '<'.codeUnitAt(0);
int lCurlyBracket = '{'.codeUnitAt(0);
int lParen = '('.codeUnitAt(0);
int lSquareBracket = '['.codeUnitAt(0);
int newline = '\n'.codeUnitAt(0);
int octothorpe = '#'.codeUnitAt(0);
int rCurlyBracket = '}'.codeUnitAt(0);
int rParen = ')'.codeUnitAt(0);
int rSquareBracket = ']'.codeUnitAt(0);
int semicolon = ';'.codeUnitAt(0);
int singleQuote = "'".codeUnitAt(0);
int underscore = '_'.codeUnitAt(0);

Set<int> macroCodeUnits = {
  doubleQuote, // String
  lCurlyBracket, // Map (open)
  lParen, // Invocation (open)
  lSquareBracket, // Vector (open)
  octothorpe, // Dispatch macro
  rCurlyBracket, // Map, Set (close)
  rParen, // Invocation (close)
  rSquareBracket, // Vector (close)
  semicolon, // Comment
  singleQuote, // Lisp quote
};

Set<int> dispatchMacroCodeUnits = {
  bang, // Shebang
  doubleQuote, // RegExp
  lAngleBracket, // Unreadable (open)
  lCurlyBracket, // Set (open)
  lParen, // Anonymous fn (open)
  underscore, // Ignore next expr
};

class Loc {
  int i = 0;
  int j = 0;

  Loc(this.i, this.j);

  Loc get right => Loc(i, j + 1);

  Loc get left => Loc(i, j - 1);

  Loc get top => Loc(i - 1, 0);

  Loc get bottom => Loc(i + 1, 0);

  bool after(Loc other) {
    return i > other.i || (i == other.i && j > other.j);
  }

  @override
  String toString() {
    // TODO Track down why column is off by one.
    return '${i + 1}:$j';
  }

  @override
  bool operator ==(other) {
    return (other is Loc) && other.i == i && other.j == j;
  }

  @override
  int get hashCode => i.hashCode ^ j.hashCode;
}

class PiLispStringReader {
  final String source;

  int start = 0;
  int current = 0;
  Loc loc = Loc(0, 0);
  bool isInAnonymousFn = false;
  ISet<PLSymbol> anonymousFnArgs = ISet({});

  PiLispStringReader(this.source);

  static Object readString(String source) {
    final rdr = PiLispStringReader(source);
    return rdr.read(-1);
  }

  Object read(int delimiter) {
    while (true) {
      skipWhitespace();

      start = current;

      if (isAtEnd) {
        if (delimiter == -1) {
          return piLispEof;
        } else {
          throw UnexpectedEndOfInput(
              'Line $loc Unexpected end of input, expected ${String.fromCharCode(delimiter)}');
        }
      }

      final cu = read1();

      if (cu == delimiter) {
        return this;
      } else {
        if (macroCodeUnits.contains(cu)) {
          Object value = PLNil();
          if (cu == lParen) {
            value = readList();
          } else if (cu == lSquareBracket) {
            value = readVector(rSquareBracket);
          } else if (cu == lCurlyBracket) {
            value = readMap();
          } else if (cu == doubleQuote) {
            value = readStringInnards();
          } else if (cu == semicolon) {
            value = readCommentLine();
          } else if (cu == singleQuote) {
            value = PLList([symbolQuote, read(-1)]);
          } else if (cu == octothorpe) {
            final dispatchCu = read1();
            if (dispatchMacroCodeUnits.contains(dispatchCu)) {
              if (dispatchCu == underscore) {
                // NB: Ignore what is next.
                read(-1);
                value = this;
              } else if (dispatchCu == lParen) {
                value = readAnonymousFn();
              } else if (dispatchCu == lCurlyBracket) {
                value = readSet();
              } else if (dispatchCu == doubleQuote) {
                value = readRegExp();
              } else if (dispatchCu == lAngleBracket) {
                // TODO Need to read until closing [rAngleBracket]
                throw UnreadableFormException('Line $loc Unreadable form');
              } else if (dispatchCu == bang) {
                value = readCommentLine();
              } else {
                throw UnsupportedDispatchMacro(
                    'Line ${loc.left} Unsupported dispatch macro #${String.fromCharCode(dispatchCu)}');
              }
            } else {
              throw UnsupportedDispatchMacro(
                  'Line ${loc.left} Unsupported dispatch macro #${String.fromCharCode(dispatchCu)}');
            }
          } else if (delimiter != -1) {
            throw MismatchedDelimiter(
                'Line ${loc.left} Unexpected closing delimiter. Expected ${String.fromCharCode(delimiter)} but encountered ${String.fromCharCode(cu)}');
          } else {
            // TODO Not sure this is reachable.
            throw UnimplementedError(
                'Line $loc Reader macro ${String.fromCharCode(cu)} has not been implemented yet.');
          }

          if (value == this) {
            continue;
          } else {
            return value;
          }
        } else {
          unread1();
          final beenRead = readToken();
          final beenInterpreted = interpretToken(beenRead);
          return beenInterpreted;
        }
      }
    }
  }

  bool get isAtEnd {
    return current >= source.length;
  }

  String charAt(int index) {
    return source.substring(index, index + 1);
  }

  int codeUnitAt(int index) {
    return source.codeUnitAt(index);
  }

  String? get peek {
    if (isAtEnd) return null;
    return charAt(current);
  }

  int read1() {
    current++;
    loc.j += 1;
    return codeUnitAt(current - 1);
  }

  void unread1() {
    current--;
    loc.j -= 1;
  }

  void newLine() {
    loc.i++;
    loc.j = 0;
  }

  void skipWhitespace() {
    while (true) {
      final c = peek;
      switch (c) {
        case ' ':
        case '\r':
        case '\t':
        case ',':
          read1();
          break;

        case '\n':
          newLine();
          read1();
          break;

        default:
          return;
      }
    }
  }

  bool match(String expected) {
    if (isAtEnd) return false;
    if (peek != expected) return false;
    current++;
    return true;
  }

  PiLispStringReader readCommentLine() {
    while (true) {
      if (isAtEnd) {
        return this;
      }
      final cu = read1();
      if (cu == newline) {
        newLine();
        return this;
      }
    }
  }

  PLVector readVector(int closingDelimiter) {
    List<Object?> l = [];
    while (true) {
      final readValue = read(closingDelimiter);
      if (readValue == this) {
        break;
      } else {
        l.add(readValue);
      }
    }
    return PLVector(l);
  }

  PLList readList() {
    final startingLoc = Loc(loc.i, loc.j);
    final vec = readVector(rParen);
    final list = vec.toPLList();
    list.loc = startingLoc;
    return list;
  }

  RegExp matchesAnonymousArg = RegExp(r'%(\d+)\W?.*');

  /// Takes a [sortedList] of anonymous arg symbols and fills in those that the
  /// code author omitted. This supports calls like `#(%1 %3)` where a `%2` needs
  /// to be filled in for the underlying `fn` form being built.
  List<PLSymbol> fillInAnonymousParamGaps(List<PLSymbol> sortedList) {
    if (sortedList.isEmpty) {
      return sortedList;
    }
    final lastArg = sortedList.last;
    // We have validated elsewhere, so we can be heavier-handed here.
    final m = matchesAnonymousArg.matchAsPrefix(lastArg.name)!;
    final arityNum = int.parse(m.group(1)!);
    final idealizedParams = <PLSymbol>[];
    for (var i = 1; i <= arityNum; i++) {
      idealizedParams.add(PLSymbol('%$i'));
    }
    for (final arg in sortedList) {
      final m = matchesAnonymousArg.matchAsPrefix(arg.name)!;
      final arityNum = int.parse(m.group(1)!);
      idealizedParams[arityNum - 1] = arg;
    }
    return idealizedParams;
  }

  PLList readAnonymousFn() {
    if (isInAnonymousFn) {
      throw IllegalNestedAnonymousFunction(
          'Line $loc Nested anonymous function definitions #() are not supported.');
    }
    isInAnonymousFn = true;
    final fnBody = readList();
    final discoveredArgs = anonymousFnArgs;
    List<PLSymbol> anonymousParamsList = [];
    var hasVariableArity = false;
    for (final arg in discoveredArgs) {
      if (arg == PLSymbol('%&')) {
        hasVariableArity = true;
      }
      // %<num> with suffix is supported
      if (arg != PLSymbol('%&')) {
        final paramNumMatch = matchesAnonymousArg.matchAsPrefix(arg.name);
        if (paramNumMatch != null) {
          final paramNum = paramNumMatch.group(1);
          if (paramNum != null) {
            if (int.tryParse(paramNum) == null) {
              throw MalformedAnonymousArgument(
                  'Line $loc Anonymous function arguments must be %, % followed by a numeral, or %&, but encountered % followed by a non-numeral suffix in $anonymousParamsList');
            }
          } else {
            throw MalformedAnonymousArgument(
                'Line $loc Anonymous function arguments must be %, % followed by a numeral, or %&, but encountered % followed by a non-numeral suffix in $anonymousParamsList');
          }
        } else {
          throw MalformedAnonymousArgument(
              'Line $loc Anonymous function arguments must be %, % followed by a numeral, or %&, but encountered $anonymousParamsList');
        }
      }
      // Dedupe
      if (!anonymousParamsList.contains(arg)) {
        anonymousParamsList.add(arg);
      }
    }
    anonymousParamsList.sort();
    if (hasVariableArity) {
      // NB: %& sorts ahead of all %<n>
      anonymousParamsList = anonymousParamsList.sublist(1);
    }
    // NB: This expects to receive a sorted collection
    anonymousParamsList = fillInAnonymousParamGaps(anonymousParamsList);
    if (hasVariableArity) {
      anonymousParamsList.addAll([PLSymbol('&'), PLSymbol('%&')]);
    }
    final anonymousParams = PLVector(anonymousParamsList);
    isInAnonymousFn = false;
    return PLList([symbolFn, PLSymbol('<anonymous>'), anonymousParams, fnBody]);
  }

  ISet<Object?> readSet() {
    List<Object?> l = [];
    final closingDelimiter = rCurlyBracket;
    while (true) {
      final readValue = read(closingDelimiter);
      if (readValue == this) {
        break;
      } else {
        l.add(readValue);
      }
    }
    return l.toISet();
  }

  IMap<Object?, Object?> readMap() {
    List<Object?> l = [];
    final closingDelimiter = rCurlyBracket;
    while (true) {
      final readValue = read(closingDelimiter);
      if (readValue == this) {
        break;
      } else {
        l.add(readValue);
      }
    }
    if (l.isEmpty) {
      return IMap({});
    } else if (l.length.isEven) {
      Map<Object?, Object?> m = {};
      var key = l[0];
      // NB: Starting on 1 to prepopulate `key` as non-null
      for (var i = 1; i < l.length; i++) {
        if ((i + 1).isEven) {
          m[key] = l[i];
        } else {
          key = l[i];
        }
      }
      return m.toIMap();
    } else {
      throw MalformedMap(
          'Line $loc Maps must have an even number of elements, but found ${l.length} elements.');
    }
  }

  /// See pages 98-103 in the Dart language specification:
  /// https://dart.dev/guides/language/specifications/DartLangSpec-v2.10.pdf
  String readStringInnards({bool isRaw = false}) {
    final rawStringInnards = StringBuffer();
    final startLoc = Loc(loc.i, loc.j);
    int prev = -1;
    while (true) {
      if (isAtEnd) {
        throw UnexpectedEndOfInput(
            'Line $loc Unexpected end of input while reading string ${rawStringInnards.toString()}');
      }

      final cu = read1();

      if (cu == doubleQuote) {
        if (prev != backSlash) {
          break; // NB: End of string
        }
      }
      prev = cu;

      rawStringInnards.write(String.fromCharCode(cu));
    }
    if (isRaw) {
      return rawStringInnards.toString();
    } else {
      return rawStringInnards.toString().replaceAllMapped(matchesStringEscape,
          (match) {
        final xHex = match.group(1);
        final uHex = match.group(2);
        final uHexSeq = match.group(3);
        final hexEscape = [xHex, uHex, uHexSeq].firstWhere(
          (theMatch) => theMatch != null,
          orElse: () => null,
        );
        if (hexEscape != null) {
          return String.fromCharCode(int.parse(hexEscape, radix: 16));
        } else {
          final charEscape = match.group(4);
          // NB: Support Dart's string specification.
          if (charEscape == '"' || charEscape == '\\') {
            return charEscape.toString();
          } else if (charEscape == 'n') {
            return '\n';
          } else if (charEscape == 'r') {
            return '\r';
          } else if (charEscape == 'f') {
            return '\f';
          } else if (charEscape == 'b') {
            return '\b';
          } else if (charEscape == 't') {
            return '\t';
          } else if (charEscape == 'v') {
            return '\v';
          } else {
            // TODO This is stricter than Dart. Consider.
            throw UnsupportedEscapeCharacter(
                'Line $startLoc Unsupported q string escape character: \\$charEscape');
          }
        }
      });
    }
  }

  RegExp readRegExp() {
    return RegExp(readStringInnards(isRaw: true));
  }

  bool isTerminating(int codeUnit) {
    final ch = String.fromCharCode(codeUnit);
    if ("'#%".contains(ch)) {
      return false;
    } else if (macroCodeUnits.contains(codeUnit)) {
      return true;
    } else {
      final match = matchesSpace.matchAsPrefix(ch);
      return match == null ? false : 0 < match.end;
    }
  }

  String readToken() {
    final sb = StringBuffer();
    while (true) {
      if (isAtEnd) {
        return sb.toString();
      }

      final cu = read1();
      if (isTerminating(cu)) {
        unread1();
        return sb.toString();
      }
      sb.write(String.fromCharCode(cu));
    }
  }

  Object interpretToken(String token) {
    if (token == 'nil') {
      return PLNil();
    } else if (token == 'true') {
      return true;
    } else if (token == 'false') {
      return false;
    } else {
      final parsedInt = int.tryParse(token);
      if (parsedInt != null) {
        return parsedInt;
      } else {
        final parsedDouble = double.tryParse(token);
        if (parsedDouble != null) {
          return parsedDouble;
        } else {
          BigInt? parsedBigInt;
          if (token.endsWith('N')) {
            parsedBigInt =
                BigInt.tryParse(token.substring(0, token.length - 1));
          } else {
            parsedBigInt = BigInt.tryParse(token);
          }
          if (parsedBigInt != null) {
            return parsedBigInt;
          } else {
            final parsedSymbol = matchesSymbol.matchAsPrefix(token);
            if (parsedSymbol != null) {
              final isTerm = parsedSymbol.group(1);
              final symbolName = parsedSymbol.group(2);
              if (symbolName != null) {
                if (isTerm != null) {
                  return PLTerm(symbolName);
                } else {
                  var sym = PLSymbol(symbolName);
                  if (isInAnonymousFn && sym.name.startsWith('%')) {
                    if (sym == PLSymbol('%')) {
                      sym = PLSymbol('%1');
                    }
                    anonymousFnArgs = anonymousFnArgs.add(sym);
                  }
                  return sym;
                }
              } else {
                throw FormatException(
                    'Line $loc Developer error: Symbol regexp matched, but symbol name did not.');
              }
            } else {
              throw UnreadableFormException(
                  'Line $loc Unreadable form encountered: $token');
            }
          }
        }
      }
    }
  }
}

Object plReadString(String s) {
  final value = PiLispStringReader.readString(s);
  if (value == piLispEof) {
    // NB: eof is used internally for [load], so that it can support multi-form
    //     reading without using an actual `(do ...)`
    return PLNil();
  } else {
    return value;
  }
}
