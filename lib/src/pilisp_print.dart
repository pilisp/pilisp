import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'pilisp_env.dart';
import 'pilisp_expr.dart';

String Function(MapEntry<Object?, Object?> entry) formatMapEntryFn(PLEnv env) {
  return (MapEntry<Object?, Object?> entry) {
    final keyStr = plPrintToString(env, entry.key);
    final valStr = plPrintToString(env, entry.value);
    return '$keyStr $valStr';
  };
}

List<String> Function(List<String> acc, MapEntry<Object?, Object?> entry)
    formatJsonMapEntryFn(PLEnv env) {
  return (List<String> acc, MapEntry<Object?, Object?> entry) {
    final k = entry.key;
    if (k is! String && k is! PLSymbol && k is! PLTerm) {
      return acc;
    } else {
      final keyStr = plPrintToString(env, k);
      final valStr = plPrintToString(env, entry.value);
      acc.add('$keyStr: $valStr');
      return acc;
    }
  };
}

extension on IMap<Object?, Object?> {
  String _plPrintToString(PLEnv env) {
    if (isEmpty) return '{}';
    final sb = StringBuffer();
    env.withIndent(() {
      final gutter = env.indentedString('');
      if (env.isPrintJson) {
        sb.write(
            '{\n$gutter${entries.fold(<String>[], formatJsonMapEntryFn(env)).join(',\n$gutter')},');
      } else {
        sb.write(
            '{\n$gutter${entries.map(formatMapEntryFn(env)).join(',\n$gutter')},');
      }
    });
    sb.write('\n${env.indentedString('}')}');
    return sb.toString();
  }
}

extension on ISet<Object?> {
  String _plPrintToString(PLEnv env) {
    if (isEmpty) return '#{}';
    final sb = StringBuffer('#');
    env.withIndent(() {
      final gutter = env.indentedString('');
      sb.write(
          '{\n$gutter${map((e) => plPrintToString(env, e)).join(',\n$gutter')},');
    });
    sb.write('\n${env.indentedString('}')}');
    return sb.toString();
  }
}

/// All instances of [PLExpr] are readable, so this covers existing classes
/// for which there are no PiLisp wrappers.
bool isPiLispReadableValue(Object x) {
  return x is int ||
      x is double ||
      x is BigInt ||
      x is String ||
      x is bool ||
      x is ImmutableCollection ||
      x is RegExp;
}

String plPrintToString(PLEnv env, Object? value) {
  if (value is PLExpr) {
    return value.printToString(env);
  } else if (value == null) {
    return 'nil';
  } else if (isPiLispReadableValue(value)) {
    if (value is String) {
      // TODO Make this more performant, had weird behavior with replaceAllMapped
      final cleanedUp = value
          .toString()
          .replaceAll('"', '\\"')
          .replaceAll('\n', r'\n')
          .replaceAll('\r', r'\r')
          .replaceAll('\f', r'\f')
          .replaceAll('\b', r'\b')
          .replaceAll('\t', r'\t')
          .replaceAll('\v', r'\v');
      return '"$cleanedUp"';
    } else if (value is IMap) {
      return value._plPrintToString(env);
    } else if (value is ISet) {
      return value._plPrintToString(env);
    } else if (value is RegExp) {
      return "#\"${value.pattern.replaceAll('"', '\\"')}\"";
    } else {
      return value.toString();
    }
  } else if (value is Uri) {
    return '#<Uri{:scheme ${value.scheme}, :host ${value.host}, :path ${value.path}, :queryParams ${value.queryParameters}>';
  } else {
    // Unreadable
    return '#<${typeString(value)}: ${value.toString()}>';
  }
}
