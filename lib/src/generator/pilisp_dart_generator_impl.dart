import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../../pilisp.dart';
import '../pilisp_core.dart';

final Set<String> prohibitedMethods = {
  'int.>>>', // NB: Labeled as an operator but not excluded by v.isOperator check
  'dart_double_parse_full', // NB: Deprecated optional argument
  'Encoding.decodeStream', // NB: Wrong generic type
  'Enum.compareByIndex', // NB: This and next have type args, which
  'Enum.compareByName', //      are not yet supported
  'Future.doWhile', // NB: Type needs to be specified differently
  'Future.value_full', // NB: Bad type X0
  'Iterable.elementAt', // NB: Type-generic
  'Iterable.first', // NB: Type-generic
  'Iterable.firstWhere', // NB: Type-generic
  'Iterable.followedBy', // NB: Type-generic
  'Iterable.generate', // NB: Type-generic
  'Iterable.last', // NB: Type-generic
  'Iterable.lastWhere', // NB: Type-generic
  'Iterable.reduce', // NB: Type-generic
  'Iterable.single', // NB: Type-generic
  'Iterable.singleWhere', // NB: Type-generic
  'Iterator.current', // NB: Type-generic
  'List.add', // NB: Type-generic
  'List.addAll', // NB: Type-generic
  'List.filled', // NB: Type-generic
  'List.fillRange_full', // NB: Type-generic
  'List.first=', // NB: Type-generic and illegal declName
  'List.generate', // NB: Type-generic
  'List.indexOf', // NB: Type-generic
  'List.insert', // NB: Type-generic
  'List.insertAll', // NB: Type-generic
  'List.last=', // NB: Type-generic and illegal declName
  'List.lastIndexOf', // NB: Type-generic
  'List.length=', // NB: Illegal declName
  'List.of', // NB: Type-generic
  'List.removeAt', // NB: Type-generic
  'List.removeLast', // NB: Type-generic
  'List.replaceRange', // NB: Type-generic
  'List.setAll', // NB: Type-generic
  'List.setRange', // NB: Type-generic
  'PLAwait._', // NB: Private ctor
  'PLAwait.value', // BUG in code gen
  'PLMultiMethod.implsByType', // Non-essential and breaks
  'PLMultiMethod.implsByDispatch', // Non-essential and breaks
  'Map.addAll', // NB: Type-generic
  'Map.fromIterables', // NB: Type-generic
  'Map.of', // NB: Type-generic
  'Map.putIfAbsent', // NB: Type-generic
  'Map.remove', // NB: Type-generic
  'Map.update', // NB: Type-generic
  'Map.updateAll', // NB: Type-generic
  'Request.setContentLength=', // NB: Throws exception anyway
  'RuneIterator.rawIndex=', // NB: Setter
  'Set.add', // NB: Type-generic
  'Set.addAll', // NB: Type-generic
  'Set.lookup', // NB: Type-generic
  'Set.of', // NB: Type-generic
  'Set.union', // NB: Type-generic
  'Set.unmodifiable', // NB: Type-generic
  'UriData.contentAsBytes', // NB: Non-public type, need to extend gen logic for this case
};

final Set<String> prohibitedFunctions = {
  'dart:math.max', // NB: Type-generic
  'dart:math.min', // NB: Type-generic
  'package:http/http.dart._withClient', // NB: Type with leading .
};

final Set<String> prohibitedConstructors = {
  'dart_ByteStream_', // NB. Type-generic argument incorrectly generated
  'dart_StreamedResponse_', // NB. Type-generic argument incorrectly generated
};

final Map<String, String> correctedTypes = {
  'BaseResponse.request': 'BaseRequest?',
  'BaseResponse.reasonPhrase': 'String?',
  'BaseResponse.contentLength': 'int?',
};

/// Libraries are combed for their top-level functions. See [sourceClasses] for
/// the explicit listing of classes that are use for generation.
final sourceLibraries = {
  // dart:async',
  'dart:core',
  'dart:convert',
  'dart:math',
  'package:http/http.dart',
};

final sourceClasses = {
  http.BaseRequest,
  http.BaseResponse,
  BigInt,
  http.ByteStream,
  // bool, // skip
  // Comparable, // skip
  http.Client,
  DateTime,
  // Deprecated, // skip
  double,
  Duration,
  Encoding,
  Enum,
  // Expando, // skip
  // Finalizer, // skip
  Function,
  Future,
  int,
  Invocation,
  Iterable,
  Iterator,
  List,
  Map,
  // MapEntry, // skip
  Match,
  // Null, // skip
  num,
  Object,
  Pattern,
  PiLisp,
  PLAwait,
  PLMultiMethod,
  // pragma, // skip
  RegExp,
  RegExpMatch,
  http.Request,
  http.Response,
  RuneIterator,
  Runes,
  Set,
  // Sink, // skip
  StackTrace,
  Stopwatch,
  // Stream,
  http.StreamedResponse,
  String,
  StringBuffer,
  StringSink,
  Symbol,
  // Type, // skip
  Uri,
  UriData,
  // WeakReference, // skip
  Random,
};

/// [ClassMirror.isAbstract] returns [true] for certain classes, either erroneously
/// or because I do not understand what it is checking for. These class names have
/// regular constructors that we do want in the generated output.
final desiredConstructors = {
  'Future',
  'Object',
  'Random',
  'RegExp',
  'Set',
  'Symbol',
  'Uri',
};

final importsForGenerated = [
  'dart:async',
  'dart:convert',
  'dart:typed_data',
  'dart:math',
  'package:http/http.dart',
  'package:fast_immutable_collections/fast_immutable_collections.dart',
  '../pilisp.dart',
  'pilisp_core.dart',
];
