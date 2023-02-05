// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// PiLispDartGenerator
// **************************************************************************

// START Dart wrappers for PiLisp
import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'pilisp_env.dart';
import 'pilisp_expr.dart';

Map<PLSymbol, PLBindingEntry> wrapperBindings = {
// Class BigInt with 42 declarations
// START zero -----------------------
  PLSymbol('dart/BigInt.zero'): PLBindingEntry(dart_BigInt_zero),
// END zero -----------------------
// START one -----------------------
  PLSymbol('dart/BigInt.one'): PLBindingEntry(dart_BigInt_one),
// END one -----------------------
// START two -----------------------
  PLSymbol('dart/BigInt.two'): PLBindingEntry(dart_BigInt_two),
// END two -----------------------
// START parse -----------------------
  PLSymbol('dart/BigInt.parse'): PLBindingEntry(dart_BigInt_parse),
// END parse -----------------------
// START tryParse -----------------------
  PLSymbol('dart/BigInt.tryParse'): PLBindingEntry(dart_BigInt_tryParse),
// END tryParse -----------------------
// START abs -----------------------
  PLSymbol('dart/BigInt.abs'): PLBindingEntry(dart_BigInt_abs),
// END abs -----------------------
// START unary- -----------------------
// END unary- -----------------------
// START + -----------------------
// END + -----------------------
// START - -----------------------
// END - -----------------------
// START * -----------------------
// END * -----------------------
// START / -----------------------
// END / -----------------------
// START ~/ -----------------------
// END ~/ -----------------------
// START % -----------------------
// END % -----------------------
// START remainder -----------------------
  PLSymbol('dart/BigInt.remainder'): PLBindingEntry(dart_BigInt_remainder),
// END remainder -----------------------
// START << -----------------------
// END << -----------------------
// START >> -----------------------
// END >> -----------------------
// START & -----------------------
// END & -----------------------
// START | -----------------------
// END | -----------------------
// START ^ -----------------------
// END ^ -----------------------
// START ~ -----------------------
// END ~ -----------------------
// START < -----------------------
// END < -----------------------
// START <= -----------------------
// END <= -----------------------
// START > -----------------------
// END > -----------------------
// START >= -----------------------
// END >= -----------------------
// START compareTo -----------------------
  PLSymbol('dart/BigInt.compareTo'): PLBindingEntry(dart_BigInt_compareTo),
// END compareTo -----------------------
// START bitLength -----------------------
  PLSymbol('dart/BigInt.bitLength'): PLBindingEntry(dart_BigInt_bitLength),
// END bitLength -----------------------
// START sign -----------------------
  PLSymbol('dart/BigInt.sign'): PLBindingEntry(dart_BigInt_sign),
// END sign -----------------------
// START isEven -----------------------
  PLSymbol('dart/BigInt.isEven'): PLBindingEntry(dart_BigInt_isEven),
// END isEven -----------------------
// START isOdd -----------------------
  PLSymbol('dart/BigInt.isOdd'): PLBindingEntry(dart_BigInt_isOdd),
// END isOdd -----------------------
// START isNegative -----------------------
  PLSymbol('dart/BigInt.isNegative'): PLBindingEntry(dart_BigInt_isNegative),
// END isNegative -----------------------
// START pow -----------------------
  PLSymbol('dart/BigInt.pow'): PLBindingEntry(dart_BigInt_pow),
// END pow -----------------------
// START modPow -----------------------
  PLSymbol('dart/BigInt.modPow'): PLBindingEntry(dart_BigInt_modPow),
// END modPow -----------------------
// START modInverse -----------------------
  PLSymbol('dart/BigInt.modInverse'): PLBindingEntry(dart_BigInt_modInverse),
// END modInverse -----------------------
// START gcd -----------------------
  PLSymbol('dart/BigInt.gcd'): PLBindingEntry(dart_BigInt_gcd),
// END gcd -----------------------
// START toUnsigned -----------------------
  PLSymbol('dart/BigInt.toUnsigned'): PLBindingEntry(dart_BigInt_toUnsigned),
// END toUnsigned -----------------------
// START toSigned -----------------------
  PLSymbol('dart/BigInt.toSigned'): PLBindingEntry(dart_BigInt_toSigned),
// END toSigned -----------------------
// START isValidInt -----------------------
  PLSymbol('dart/BigInt.isValidInt'): PLBindingEntry(dart_BigInt_isValidInt),
// END isValidInt -----------------------
// START toInt -----------------------
  PLSymbol('dart/BigInt.toInt'): PLBindingEntry(dart_BigInt_toInt),
// END toInt -----------------------
// START toDouble -----------------------
  PLSymbol('dart/BigInt.toDouble'): PLBindingEntry(dart_BigInt_toDouble),
// END toDouble -----------------------
// START toString -----------------------
  PLSymbol('dart/BigInt.toString'): PLBindingEntry(dart_BigInt_toString),
// END toString -----------------------
// START toRadixString -----------------------
  PLSymbol('dart/BigInt.toRadixString'):
      PLBindingEntry(dart_BigInt_toRadixString),
// END toRadixString -----------------------
// START CTOR from -----------------------
  PLSymbol('dart/BigInt.from'): PLBindingEntry(dart_BigInt_from),
// END from -----------------------
// Class DateTime with 55 declarations
// START monday -----------------------
  PLSymbol('dart/DateTime.monday'): PLBindingEntry(DateTime.monday),
// END monday -----------------------
// START tuesday -----------------------
  PLSymbol('dart/DateTime.tuesday'): PLBindingEntry(DateTime.tuesday),
// END tuesday -----------------------
// START wednesday -----------------------
  PLSymbol('dart/DateTime.wednesday'): PLBindingEntry(DateTime.wednesday),
// END wednesday -----------------------
// START thursday -----------------------
  PLSymbol('dart/DateTime.thursday'): PLBindingEntry(DateTime.thursday),
// END thursday -----------------------
// START friday -----------------------
  PLSymbol('dart/DateTime.friday'): PLBindingEntry(DateTime.friday),
// END friday -----------------------
// START saturday -----------------------
  PLSymbol('dart/DateTime.saturday'): PLBindingEntry(DateTime.saturday),
// END saturday -----------------------
// START sunday -----------------------
  PLSymbol('dart/DateTime.sunday'): PLBindingEntry(DateTime.sunday),
// END sunday -----------------------
// START daysPerWeek -----------------------
  PLSymbol('dart/DateTime.daysPerWeek'): PLBindingEntry(DateTime.daysPerWeek),
// END daysPerWeek -----------------------
// START january -----------------------
  PLSymbol('dart/DateTime.january'): PLBindingEntry(DateTime.january),
// END january -----------------------
// START february -----------------------
  PLSymbol('dart/DateTime.february'): PLBindingEntry(DateTime.february),
// END february -----------------------
// START march -----------------------
  PLSymbol('dart/DateTime.march'): PLBindingEntry(DateTime.march),
// END march -----------------------
// START april -----------------------
  PLSymbol('dart/DateTime.april'): PLBindingEntry(DateTime.april),
// END april -----------------------
// START may -----------------------
  PLSymbol('dart/DateTime.may'): PLBindingEntry(DateTime.may),
// END may -----------------------
// START june -----------------------
  PLSymbol('dart/DateTime.june'): PLBindingEntry(DateTime.june),
// END june -----------------------
// START july -----------------------
  PLSymbol('dart/DateTime.july'): PLBindingEntry(DateTime.july),
// END july -----------------------
// START august -----------------------
  PLSymbol('dart/DateTime.august'): PLBindingEntry(DateTime.august),
// END august -----------------------
// START september -----------------------
  PLSymbol('dart/DateTime.september'): PLBindingEntry(DateTime.september),
// END september -----------------------
// START october -----------------------
  PLSymbol('dart/DateTime.october'): PLBindingEntry(DateTime.october),
// END october -----------------------
// START november -----------------------
  PLSymbol('dart/DateTime.november'): PLBindingEntry(DateTime.november),
// END november -----------------------
// START december -----------------------
  PLSymbol('dart/DateTime.december'): PLBindingEntry(DateTime.december),
// END december -----------------------
// START monthsPerYear -----------------------
  PLSymbol('dart/DateTime.monthsPerYear'):
      PLBindingEntry(DateTime.monthsPerYear),
// END monthsPerYear -----------------------
// START isUtc -----------------------
  PLSymbol('dart/DateTime.isUtc'): PLBindingEntry(dart_DateTime_isUtc),
// END isUtc -----------------------
// START parse -----------------------
  PLSymbol('dart/DateTime.parse'): PLBindingEntry(dart_DateTime_parse),
// END parse -----------------------
// START tryParse -----------------------
  PLSymbol('dart/DateTime.tryParse'): PLBindingEntry(dart_DateTime_tryParse),
// END tryParse -----------------------
// START == -----------------------
// END == -----------------------
// START isBefore -----------------------
  PLSymbol('dart/DateTime.isBefore'): PLBindingEntry(dart_DateTime_isBefore),
// END isBefore -----------------------
// START isAfter -----------------------
  PLSymbol('dart/DateTime.isAfter'): PLBindingEntry(dart_DateTime_isAfter),
// END isAfter -----------------------
// START isAtSameMomentAs -----------------------
  PLSymbol('dart/DateTime.isAtSameMomentAs'):
      PLBindingEntry(dart_DateTime_isAtSameMomentAs),
// END isAtSameMomentAs -----------------------
// START compareTo -----------------------
  PLSymbol('dart/DateTime.compareTo'): PLBindingEntry(dart_DateTime_compareTo),
// END compareTo -----------------------
// START hashCode -----------------------
  PLSymbol('dart/DateTime.hashCode'): PLBindingEntry(dart_DateTime_hashCode),
// END hashCode -----------------------
// START toLocal -----------------------
  PLSymbol('dart/DateTime.toLocal'): PLBindingEntry(dart_DateTime_toLocal),
// END toLocal -----------------------
// START toUtc -----------------------
  PLSymbol('dart/DateTime.toUtc'): PLBindingEntry(dart_DateTime_toUtc),
// END toUtc -----------------------
// START toString -----------------------
  PLSymbol('dart/DateTime.toString'): PLBindingEntry(dart_DateTime_toString),
// END toString -----------------------
// START toIso8601String -----------------------
  PLSymbol('dart/DateTime.toIso8601String'):
      PLBindingEntry(dart_DateTime_toIso8601String),
// END toIso8601String -----------------------
// START add -----------------------
  PLSymbol('dart/DateTime.add'): PLBindingEntry(dart_DateTime_add),
// END add -----------------------
// START subtract -----------------------
  PLSymbol('dart/DateTime.subtract'): PLBindingEntry(dart_DateTime_subtract),
// END subtract -----------------------
// START difference -----------------------
  PLSymbol('dart/DateTime.difference'):
      PLBindingEntry(dart_DateTime_difference),
// END difference -----------------------
// START millisecondsSinceEpoch -----------------------
  PLSymbol('dart/DateTime.millisecondsSinceEpoch'):
      PLBindingEntry(dart_DateTime_millisecondsSinceEpoch),
// END millisecondsSinceEpoch -----------------------
// START microsecondsSinceEpoch -----------------------
  PLSymbol('dart/DateTime.microsecondsSinceEpoch'):
      PLBindingEntry(dart_DateTime_microsecondsSinceEpoch),
// END microsecondsSinceEpoch -----------------------
// START timeZoneName -----------------------
  PLSymbol('dart/DateTime.timeZoneName'):
      PLBindingEntry(dart_DateTime_timeZoneName),
// END timeZoneName -----------------------
// START timeZoneOffset -----------------------
  PLSymbol('dart/DateTime.timeZoneOffset'):
      PLBindingEntry(dart_DateTime_timeZoneOffset),
// END timeZoneOffset -----------------------
// START year -----------------------
  PLSymbol('dart/DateTime.year'): PLBindingEntry(dart_DateTime_year),
// END year -----------------------
// START month -----------------------
  PLSymbol('dart/DateTime.month'): PLBindingEntry(dart_DateTime_month),
// END month -----------------------
// START day -----------------------
  PLSymbol('dart/DateTime.day'): PLBindingEntry(dart_DateTime_day),
// END day -----------------------
// START hour -----------------------
  PLSymbol('dart/DateTime.hour'): PLBindingEntry(dart_DateTime_hour),
// END hour -----------------------
// START minute -----------------------
  PLSymbol('dart/DateTime.minute'): PLBindingEntry(dart_DateTime_minute),
// END minute -----------------------
// START second -----------------------
  PLSymbol('dart/DateTime.second'): PLBindingEntry(dart_DateTime_second),
// END second -----------------------
// START millisecond -----------------------
  PLSymbol('dart/DateTime.millisecond'):
      PLBindingEntry(dart_DateTime_millisecond),
// END millisecond -----------------------
// START microsecond -----------------------
  PLSymbol('dart/DateTime.microsecond'):
      PLBindingEntry(dart_DateTime_microsecond),
// END microsecond -----------------------
// START weekday -----------------------
  PLSymbol('dart/DateTime.weekday'): PLBindingEntry(dart_DateTime_weekday),
// END weekday -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/DateTime.'): PLBindingEntry(dart_DateTime_),
  PLSymbol('dart/DateTime.-full'): PLBindingEntry(dart_DateTime__full),
// END  -----------------------
// START CTOR utc -----------------------
  PLSymbol('dart/DateTime.utc'): PLBindingEntry(dart_DateTime_utc),
  PLSymbol('dart/DateTime.utc-full'): PLBindingEntry(dart_DateTime_utc_full),
// END utc -----------------------
// START CTOR now -----------------------
  PLSymbol('dart/DateTime.now'): PLBindingEntry(dart_DateTime_now),
// END now -----------------------
// START CTOR fromMillisecondsSinceEpoch -----------------------
  PLSymbol('dart/DateTime.fromMillisecondsSinceEpoch'):
      PLBindingEntry(dart_DateTime_fromMillisecondsSinceEpoch),
// END fromMillisecondsSinceEpoch -----------------------
// START CTOR fromMicrosecondsSinceEpoch -----------------------
  PLSymbol('dart/DateTime.fromMicrosecondsSinceEpoch'):
      PLBindingEntry(dart_DateTime_fromMicrosecondsSinceEpoch),
// END fromMicrosecondsSinceEpoch -----------------------
// Class double with 27 declarations
// START nan -----------------------
  PLSymbol('dart/double.nan'): PLBindingEntry(double.nan),
// END nan -----------------------
// START infinity -----------------------
  PLSymbol('dart/double.infinity'): PLBindingEntry(double.infinity),
// END infinity -----------------------
// START negativeInfinity -----------------------
  PLSymbol('dart/double.negativeInfinity'):
      PLBindingEntry(double.negativeInfinity),
// END negativeInfinity -----------------------
// START minPositive -----------------------
  PLSymbol('dart/double.minPositive'): PLBindingEntry(double.minPositive),
// END minPositive -----------------------
// START maxFinite -----------------------
  PLSymbol('dart/double.maxFinite'): PLBindingEntry(double.maxFinite),
// END maxFinite -----------------------
// START remainder -----------------------
  PLSymbol('dart/double.remainder'): PLBindingEntry(dart_double_remainder),
// END remainder -----------------------
// START + -----------------------
// END + -----------------------
// START - -----------------------
// END - -----------------------
// START * -----------------------
// END * -----------------------
// START % -----------------------
// END % -----------------------
// START / -----------------------
// END / -----------------------
// START ~/ -----------------------
// END ~/ -----------------------
// START unary- -----------------------
// END unary- -----------------------
// START abs -----------------------
  PLSymbol('dart/double.abs'): PLBindingEntry(dart_double_abs),
// END abs -----------------------
// START sign -----------------------
  PLSymbol('dart/double.sign'): PLBindingEntry(dart_double_sign),
// END sign -----------------------
// START round -----------------------
  PLSymbol('dart/double.round'): PLBindingEntry(dart_double_round),
// END round -----------------------
// START floor -----------------------
  PLSymbol('dart/double.floor'): PLBindingEntry(dart_double_floor),
// END floor -----------------------
// START ceil -----------------------
  PLSymbol('dart/double.ceil'): PLBindingEntry(dart_double_ceil),
// END ceil -----------------------
// START truncate -----------------------
  PLSymbol('dart/double.truncate'): PLBindingEntry(dart_double_truncate),
// END truncate -----------------------
// START roundToDouble -----------------------
  PLSymbol('dart/double.roundToDouble'):
      PLBindingEntry(dart_double_roundToDouble),
// END roundToDouble -----------------------
// START floorToDouble -----------------------
  PLSymbol('dart/double.floorToDouble'):
      PLBindingEntry(dart_double_floorToDouble),
// END floorToDouble -----------------------
// START ceilToDouble -----------------------
  PLSymbol('dart/double.ceilToDouble'):
      PLBindingEntry(dart_double_ceilToDouble),
// END ceilToDouble -----------------------
// START truncateToDouble -----------------------
  PLSymbol('dart/double.truncateToDouble'):
      PLBindingEntry(dart_double_truncateToDouble),
// END truncateToDouble -----------------------
// START toString -----------------------
  PLSymbol('dart/double.toString'): PLBindingEntry(dart_double_toString),
// END toString -----------------------
// START parse -----------------------
  PLSymbol('dart/double.parse'): PLBindingEntry(dart_double_parse),
  PLSymbol('dart/double.parse-full'): PLBindingEntry(dart_double_parse_full),
// END parse -----------------------
// START tryParse -----------------------
  PLSymbol('dart/double.tryParse'): PLBindingEntry(dart_double_tryParse),
// END tryParse -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class double
// END  -----------------------
// Class Duration with 38 declarations
// START microsecondsPerMillisecond -----------------------
  PLSymbol('dart/Duration.microsecondsPerMillisecond'):
      PLBindingEntry(Duration.microsecondsPerMillisecond),
// END microsecondsPerMillisecond -----------------------
// START millisecondsPerSecond -----------------------
  PLSymbol('dart/Duration.millisecondsPerSecond'):
      PLBindingEntry(Duration.millisecondsPerSecond),
// END millisecondsPerSecond -----------------------
// START secondsPerMinute -----------------------
  PLSymbol('dart/Duration.secondsPerMinute'):
      PLBindingEntry(Duration.secondsPerMinute),
// END secondsPerMinute -----------------------
// START minutesPerHour -----------------------
  PLSymbol('dart/Duration.minutesPerHour'):
      PLBindingEntry(Duration.minutesPerHour),
// END minutesPerHour -----------------------
// START hoursPerDay -----------------------
  PLSymbol('dart/Duration.hoursPerDay'): PLBindingEntry(Duration.hoursPerDay),
// END hoursPerDay -----------------------
// START microsecondsPerSecond -----------------------
  PLSymbol('dart/Duration.microsecondsPerSecond'):
      PLBindingEntry(Duration.microsecondsPerSecond),
// END microsecondsPerSecond -----------------------
// START microsecondsPerMinute -----------------------
  PLSymbol('dart/Duration.microsecondsPerMinute'):
      PLBindingEntry(Duration.microsecondsPerMinute),
// END microsecondsPerMinute -----------------------
// START microsecondsPerHour -----------------------
  PLSymbol('dart/Duration.microsecondsPerHour'):
      PLBindingEntry(Duration.microsecondsPerHour),
// END microsecondsPerHour -----------------------
// START microsecondsPerDay -----------------------
  PLSymbol('dart/Duration.microsecondsPerDay'):
      PLBindingEntry(Duration.microsecondsPerDay),
// END microsecondsPerDay -----------------------
// START millisecondsPerMinute -----------------------
  PLSymbol('dart/Duration.millisecondsPerMinute'):
      PLBindingEntry(Duration.millisecondsPerMinute),
// END millisecondsPerMinute -----------------------
// START millisecondsPerHour -----------------------
  PLSymbol('dart/Duration.millisecondsPerHour'):
      PLBindingEntry(Duration.millisecondsPerHour),
// END millisecondsPerHour -----------------------
// START millisecondsPerDay -----------------------
  PLSymbol('dart/Duration.millisecondsPerDay'):
      PLBindingEntry(Duration.millisecondsPerDay),
// END millisecondsPerDay -----------------------
// START secondsPerHour -----------------------
  PLSymbol('dart/Duration.secondsPerHour'):
      PLBindingEntry(Duration.secondsPerHour),
// END secondsPerHour -----------------------
// START secondsPerDay -----------------------
  PLSymbol('dart/Duration.secondsPerDay'):
      PLBindingEntry(Duration.secondsPerDay),
// END secondsPerDay -----------------------
// START minutesPerDay -----------------------
  PLSymbol('dart/Duration.minutesPerDay'):
      PLBindingEntry(Duration.minutesPerDay),
// END minutesPerDay -----------------------
// START zero -----------------------
  PLSymbol('dart/Duration.zero'): PLBindingEntry(Duration.zero),
// END zero -----------------------
// START + -----------------------
// END + -----------------------
// START - -----------------------
// END - -----------------------
// START * -----------------------
// END * -----------------------
// START ~/ -----------------------
// END ~/ -----------------------
// START < -----------------------
// END < -----------------------
// START > -----------------------
// END > -----------------------
// START <= -----------------------
// END <= -----------------------
// START >= -----------------------
// END >= -----------------------
// START inDays -----------------------
  PLSymbol('dart/Duration.inDays'): PLBindingEntry(dart_Duration_inDays),
// END inDays -----------------------
// START inHours -----------------------
  PLSymbol('dart/Duration.inHours'): PLBindingEntry(dart_Duration_inHours),
// END inHours -----------------------
// START inMinutes -----------------------
  PLSymbol('dart/Duration.inMinutes'): PLBindingEntry(dart_Duration_inMinutes),
// END inMinutes -----------------------
// START inSeconds -----------------------
  PLSymbol('dart/Duration.inSeconds'): PLBindingEntry(dart_Duration_inSeconds),
// END inSeconds -----------------------
// START inMilliseconds -----------------------
  PLSymbol('dart/Duration.inMilliseconds'):
      PLBindingEntry(dart_Duration_inMilliseconds),
// END inMilliseconds -----------------------
// START inMicroseconds -----------------------
  PLSymbol('dart/Duration.inMicroseconds'):
      PLBindingEntry(dart_Duration_inMicroseconds),
// END inMicroseconds -----------------------
// START == -----------------------
// END == -----------------------
// START hashCode -----------------------
  PLSymbol('dart/Duration.hashCode'): PLBindingEntry(dart_Duration_hashCode),
// END hashCode -----------------------
// START compareTo -----------------------
  PLSymbol('dart/Duration.compareTo'): PLBindingEntry(dart_Duration_compareTo),
// END compareTo -----------------------
// START toString -----------------------
  PLSymbol('dart/Duration.toString'): PLBindingEntry(dart_Duration_toString),
// END toString -----------------------
// START isNegative -----------------------
  PLSymbol('dart/Duration.isNegative'):
      PLBindingEntry(dart_Duration_isNegative),
// END isNegative -----------------------
// START abs -----------------------
  PLSymbol('dart/Duration.abs'): PLBindingEntry(dart_Duration_abs),
// END abs -----------------------
// START unary- -----------------------
// END unary- -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Duration.'): PLBindingEntry(dart_Duration_),
// END  -----------------------
// Class Enum with 4 declarations
// START index -----------------------
  PLSymbol('dart/Enum.index'): PLBindingEntry(dart_Enum_index),
// END index -----------------------
// START compareByIndex -----------------------
// START compareByName -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Enum
// END  -----------------------
// Class Function with 4 declarations
// START apply -----------------------
  PLSymbol('dart/Function.apply'): PLBindingEntry(dart_Function_apply),
  PLSymbol('dart/Function.apply-full'):
      PLBindingEntry(dart_Function_apply_full),
// END apply -----------------------
// START hashCode -----------------------
  PLSymbol('dart/Function.hashCode'): PLBindingEntry(dart_Function_hashCode),
// END hashCode -----------------------
// START == -----------------------
// END == -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Function
// END  -----------------------
// Class int with 31 declarations
// START & -----------------------
// END & -----------------------
// START | -----------------------
// END | -----------------------
// START ^ -----------------------
// END ^ -----------------------
// START ~ -----------------------
// END ~ -----------------------
// START << -----------------------
// END << -----------------------
// START >> -----------------------
// END >> -----------------------
// START >>> -----------------------
// START modPow -----------------------
  PLSymbol('dart/int.modPow'): PLBindingEntry(dart_int_modPow),
// END modPow -----------------------
// START modInverse -----------------------
  PLSymbol('dart/int.modInverse'): PLBindingEntry(dart_int_modInverse),
// END modInverse -----------------------
// START gcd -----------------------
  PLSymbol('dart/int.gcd'): PLBindingEntry(dart_int_gcd),
// END gcd -----------------------
// START isEven -----------------------
  PLSymbol('dart/int.isEven'): PLBindingEntry(dart_int_isEven),
// END isEven -----------------------
// START isOdd -----------------------
  PLSymbol('dart/int.isOdd'): PLBindingEntry(dart_int_isOdd),
// END isOdd -----------------------
// START bitLength -----------------------
  PLSymbol('dart/int.bitLength'): PLBindingEntry(dart_int_bitLength),
// END bitLength -----------------------
// START toUnsigned -----------------------
  PLSymbol('dart/int.toUnsigned'): PLBindingEntry(dart_int_toUnsigned),
// END toUnsigned -----------------------
// START toSigned -----------------------
  PLSymbol('dart/int.toSigned'): PLBindingEntry(dart_int_toSigned),
// END toSigned -----------------------
// START unary- -----------------------
// END unary- -----------------------
// START abs -----------------------
  PLSymbol('dart/int.abs'): PLBindingEntry(dart_int_abs),
// END abs -----------------------
// START sign -----------------------
  PLSymbol('dart/int.sign'): PLBindingEntry(dart_int_sign),
// END sign -----------------------
// START round -----------------------
  PLSymbol('dart/int.round'): PLBindingEntry(dart_int_round),
// END round -----------------------
// START floor -----------------------
  PLSymbol('dart/int.floor'): PLBindingEntry(dart_int_floor),
// END floor -----------------------
// START ceil -----------------------
  PLSymbol('dart/int.ceil'): PLBindingEntry(dart_int_ceil),
// END ceil -----------------------
// START truncate -----------------------
  PLSymbol('dart/int.truncate'): PLBindingEntry(dart_int_truncate),
// END truncate -----------------------
// START roundToDouble -----------------------
  PLSymbol('dart/int.roundToDouble'): PLBindingEntry(dart_int_roundToDouble),
// END roundToDouble -----------------------
// START floorToDouble -----------------------
  PLSymbol('dart/int.floorToDouble'): PLBindingEntry(dart_int_floorToDouble),
// END floorToDouble -----------------------
// START ceilToDouble -----------------------
  PLSymbol('dart/int.ceilToDouble'): PLBindingEntry(dart_int_ceilToDouble),
// END ceilToDouble -----------------------
// START truncateToDouble -----------------------
  PLSymbol('dart/int.truncateToDouble'):
      PLBindingEntry(dart_int_truncateToDouble),
// END truncateToDouble -----------------------
// START toString -----------------------
  PLSymbol('dart/int.toString'): PLBindingEntry(dart_int_toString),
// END toString -----------------------
// START toRadixString -----------------------
  PLSymbol('dart/int.toRadixString'): PLBindingEntry(dart_int_toRadixString),
// END toRadixString -----------------------
// START parse -----------------------
  PLSymbol('dart/int.parse'): PLBindingEntry(dart_int_parse),
// END parse -----------------------
// START tryParse -----------------------
  PLSymbol('dart/int.tryParse'): PLBindingEntry(dart_int_tryParse),
// END tryParse -----------------------
// START CTOR fromEnvironment -----------------------
  PLSymbol('dart/int.fromEnvironment'):
      PLBindingEntry(dart_int_fromEnvironment),
// END fromEnvironment -----------------------
// Class Invocation with 13 declarations
// START memberName -----------------------
  PLSymbol('dart/Invocation.memberName'):
      PLBindingEntry(dart_Invocation_memberName),
// END memberName -----------------------
// START typeArguments -----------------------
  PLSymbol('dart/Invocation.typeArguments'):
      PLBindingEntry(dart_Invocation_typeArguments),
// END typeArguments -----------------------
// START positionalArguments -----------------------
  PLSymbol('dart/Invocation.positionalArguments'):
      PLBindingEntry(dart_Invocation_positionalArguments),
// END positionalArguments -----------------------
// START namedArguments -----------------------
  PLSymbol('dart/Invocation.namedArguments'):
      PLBindingEntry(dart_Invocation_namedArguments),
// END namedArguments -----------------------
// START isMethod -----------------------
  PLSymbol('dart/Invocation.isMethod'):
      PLBindingEntry(dart_Invocation_isMethod),
// END isMethod -----------------------
// START isGetter -----------------------
  PLSymbol('dart/Invocation.isGetter'):
      PLBindingEntry(dart_Invocation_isGetter),
// END isGetter -----------------------
// START isSetter -----------------------
  PLSymbol('dart/Invocation.isSetter'):
      PLBindingEntry(dart_Invocation_isSetter),
// END isSetter -----------------------
// START isAccessor -----------------------
  PLSymbol('dart/Invocation.isAccessor'):
      PLBindingEntry(dart_Invocation_isAccessor),
// END isAccessor -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Invocation
// END  -----------------------
// START CTOR method -----------------------
  PLSymbol('dart/Invocation.method'): PLBindingEntry(dart_Invocation_method),
  PLSymbol('dart/Invocation.method-full'):
      PLBindingEntry(dart_Invocation_method_full),
// END method -----------------------
// START CTOR genericMethod -----------------------
  PLSymbol('dart/Invocation.genericMethod'):
      PLBindingEntry(dart_Invocation_genericMethod),
  PLSymbol('dart/Invocation.genericMethod-full'):
      PLBindingEntry(dart_Invocation_genericMethod_full),
// END genericMethod -----------------------
// START CTOR getter -----------------------
  PLSymbol('dart/Invocation.getter'): PLBindingEntry(dart_Invocation_getter),
// END getter -----------------------
// START CTOR setter -----------------------
  PLSymbol('dart/Invocation.setter'): PLBindingEntry(dart_Invocation_setter),
// END setter -----------------------
// Class Iterable with 36 declarations
// START castFrom -----------------------
  PLSymbol('dart/Iterable.castFrom'): PLBindingEntry(dart_Iterable_castFrom),
// END castFrom -----------------------
// START iterator -----------------------
  PLSymbol('dart/Iterable.iterator'): PLBindingEntry(dart_Iterable_iterator),
// END iterator -----------------------
// START cast -----------------------
  PLSymbol('dart/Iterable.cast'): PLBindingEntry(dart_Iterable_cast),
// END cast -----------------------
// START followedBy -----------------------
// START map -----------------------
  PLSymbol('dart/Iterable.map'): PLBindingEntry(dart_Iterable_map),
// END map -----------------------
// START where -----------------------
  PLSymbol('dart/Iterable.where'): PLBindingEntry(dart_Iterable_where),
// END where -----------------------
// START whereType -----------------------
  PLSymbol('dart/Iterable.whereType'): PLBindingEntry(dart_Iterable_whereType),
// END whereType -----------------------
// START expand -----------------------
  PLSymbol('dart/Iterable.expand'): PLBindingEntry(dart_Iterable_expand),
// END expand -----------------------
// START contains -----------------------
  PLSymbol('dart/Iterable.contains'): PLBindingEntry(dart_Iterable_contains),
// END contains -----------------------
// START forEach -----------------------
  PLSymbol('dart/Iterable.forEach'): PLBindingEntry(dart_Iterable_forEach),
// END forEach -----------------------
// START reduce -----------------------
// START fold -----------------------
  PLSymbol('dart/Iterable.fold'): PLBindingEntry(dart_Iterable_fold),
// END fold -----------------------
// START every -----------------------
  PLSymbol('dart/Iterable.every'): PLBindingEntry(dart_Iterable_every),
// END every -----------------------
// START join -----------------------
  PLSymbol('dart/Iterable.join'): PLBindingEntry(dart_Iterable_join),
  PLSymbol('dart/Iterable.join-full'): PLBindingEntry(dart_Iterable_join_full),
// END join -----------------------
// START any -----------------------
  PLSymbol('dart/Iterable.any'): PLBindingEntry(dart_Iterable_any),
// END any -----------------------
// START toList -----------------------
  PLSymbol('dart/Iterable.toList'): PLBindingEntry(dart_Iterable_toList),
// END toList -----------------------
// START toSet -----------------------
  PLSymbol('dart/Iterable.toSet'): PLBindingEntry(dart_Iterable_toSet),
// END toSet -----------------------
// START length -----------------------
  PLSymbol('dart/Iterable.length'): PLBindingEntry(dart_Iterable_length),
// END length -----------------------
// START isEmpty -----------------------
  PLSymbol('dart/Iterable.isEmpty'): PLBindingEntry(dart_Iterable_isEmpty),
// END isEmpty -----------------------
// START isNotEmpty -----------------------
  PLSymbol('dart/Iterable.isNotEmpty'):
      PLBindingEntry(dart_Iterable_isNotEmpty),
// END isNotEmpty -----------------------
// START take -----------------------
  PLSymbol('dart/Iterable.take'): PLBindingEntry(dart_Iterable_take),
// END take -----------------------
// START takeWhile -----------------------
  PLSymbol('dart/Iterable.takeWhile'): PLBindingEntry(dart_Iterable_takeWhile),
// END takeWhile -----------------------
// START skip -----------------------
  PLSymbol('dart/Iterable.skip'): PLBindingEntry(dart_Iterable_skip),
// END skip -----------------------
// START skipWhile -----------------------
  PLSymbol('dart/Iterable.skipWhile'): PLBindingEntry(dart_Iterable_skipWhile),
// END skipWhile -----------------------
// START first -----------------------
// START last -----------------------
// START single -----------------------
// START firstWhere -----------------------
// START lastWhere -----------------------
// START singleWhere -----------------------
// START elementAt -----------------------
// START toString -----------------------
  PLSymbol('dart/Iterable.toString'): PLBindingEntry(dart_Iterable_toString),
// END toString -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Iterable
// END  -----------------------
// START CTOR generate -----------------------
// START CTOR empty -----------------------
  PLSymbol('dart/Iterable.empty'): PLBindingEntry(dart_Iterable_empty),
// END empty -----------------------
// START X0 -----------------------
// END X0 -----------------------
// Class Iterator with 4 declarations
// START moveNext -----------------------
  PLSymbol('dart/Iterator.moveNext'): PLBindingEntry(dart_Iterator_moveNext),
// END moveNext -----------------------
// START current -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Iterator
// END  -----------------------
// START X0 -----------------------
// END X0 -----------------------
// Class List with 45 declarations
// START castFrom -----------------------
  PLSymbol('dart/List.castFrom'): PLBindingEntry(dart_List_castFrom),
// END castFrom -----------------------
// START copyRange -----------------------
  PLSymbol('dart/List.copyRange'): PLBindingEntry(dart_List_copyRange),
  PLSymbol('dart/List.copyRange-full'):
      PLBindingEntry(dart_List_copyRange_full),
// END copyRange -----------------------
// START writeIterable -----------------------
  PLSymbol('dart/List.writeIterable'): PLBindingEntry(dart_List_writeIterable),
// END writeIterable -----------------------
// START cast -----------------------
  PLSymbol('dart/List.cast'): PLBindingEntry(dart_List_cast),
// END cast -----------------------
// START [] -----------------------
// END [] -----------------------
// START []= -----------------------
// END []= -----------------------
// START first= -----------------------
// START last= -----------------------
// START length -----------------------
  PLSymbol('dart/List.length'): PLBindingEntry(dart_List_length),
// END length -----------------------
// START length= -----------------------
// START add -----------------------
// START addAll -----------------------
// START reversed -----------------------
  PLSymbol('dart/List.reversed'): PLBindingEntry(dart_List_reversed),
// END reversed -----------------------
// START sort -----------------------
  PLSymbol('dart/List.sort'): PLBindingEntry(dart_List_sort),
  PLSymbol('dart/List.sort-full'): PLBindingEntry(dart_List_sort_full),
// END sort -----------------------
// START shuffle -----------------------
  PLSymbol('dart/List.shuffle'): PLBindingEntry(dart_List_shuffle),
  PLSymbol('dart/List.shuffle-full'): PLBindingEntry(dart_List_shuffle_full),
// END shuffle -----------------------
// START indexOf -----------------------
// START indexWhere -----------------------
  PLSymbol('dart/List.indexWhere'): PLBindingEntry(dart_List_indexWhere),
  PLSymbol('dart/List.indexWhere-full'):
      PLBindingEntry(dart_List_indexWhere_full),
// END indexWhere -----------------------
// START lastIndexWhere -----------------------
  PLSymbol('dart/List.lastIndexWhere'):
      PLBindingEntry(dart_List_lastIndexWhere),
  PLSymbol('dart/List.lastIndexWhere-full'):
      PLBindingEntry(dart_List_lastIndexWhere_full),
// END lastIndexWhere -----------------------
// START lastIndexOf -----------------------
// START clear -----------------------
  PLSymbol('dart/List.clear'): PLBindingEntry(dart_List_clear),
// END clear -----------------------
// START insert -----------------------
// START insertAll -----------------------
// START setAll -----------------------
// START remove -----------------------
  PLSymbol('dart/List.remove'): PLBindingEntry(dart_List_remove),
// END remove -----------------------
// START removeAt -----------------------
// START removeLast -----------------------
// START removeWhere -----------------------
  PLSymbol('dart/List.removeWhere'): PLBindingEntry(dart_List_removeWhere),
// END removeWhere -----------------------
// START retainWhere -----------------------
  PLSymbol('dart/List.retainWhere'): PLBindingEntry(dart_List_retainWhere),
// END retainWhere -----------------------
// START + -----------------------
// END + -----------------------
// START sublist -----------------------
  PLSymbol('dart/List.sublist'): PLBindingEntry(dart_List_sublist),
  PLSymbol('dart/List.sublist-full'): PLBindingEntry(dart_List_sublist_full),
// END sublist -----------------------
// START getRange -----------------------
  PLSymbol('dart/List.getRange'): PLBindingEntry(dart_List_getRange),
// END getRange -----------------------
// START setRange -----------------------
// START removeRange -----------------------
  PLSymbol('dart/List.removeRange'): PLBindingEntry(dart_List_removeRange),
// END removeRange -----------------------
// START fillRange -----------------------
// START replaceRange -----------------------
// START asMap -----------------------
  PLSymbol('dart/List.asMap'): PLBindingEntry(dart_List_asMap),
// END asMap -----------------------
// START == -----------------------
// END == -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class List
// Skipping binding for constructor of abstract class List
// END  -----------------------
// START CTOR filled -----------------------
// START CTOR empty -----------------------
  PLSymbol('dart/List.empty'): PLBindingEntry(dart_List_empty),
// END empty -----------------------
// START CTOR from -----------------------
  PLSymbol('dart/List.from'): PLBindingEntry(dart_List_from),
// END from -----------------------
// START CTOR of -----------------------
// START CTOR generate -----------------------
// START CTOR unmodifiable -----------------------
  PLSymbol('dart/List.unmodifiable'): PLBindingEntry(dart_List_unmodifiable),
// END unmodifiable -----------------------
// START X0 -----------------------
// END X0 -----------------------
// Class Map with 32 declarations
// START castFrom -----------------------
  PLSymbol('dart/Map.castFrom'): PLBindingEntry(dart_Map_castFrom),
// END castFrom -----------------------
// START cast -----------------------
  PLSymbol('dart/Map.cast'): PLBindingEntry(dart_Map_cast),
// END cast -----------------------
// START containsValue -----------------------
  PLSymbol('dart/Map.containsValue'): PLBindingEntry(dart_Map_containsValue),
// END containsValue -----------------------
// START containsKey -----------------------
  PLSymbol('dart/Map.containsKey'): PLBindingEntry(dart_Map_containsKey),
// END containsKey -----------------------
// START [] -----------------------
// END [] -----------------------
// START []= -----------------------
// END []= -----------------------
// START entries -----------------------
  PLSymbol('dart/Map.entries'): PLBindingEntry(dart_Map_entries),
// END entries -----------------------
// START map -----------------------
  PLSymbol('dart/Map.map'): PLBindingEntry(dart_Map_map),
// END map -----------------------
// START addEntries -----------------------
  PLSymbol('dart/Map.addEntries'): PLBindingEntry(dart_Map_addEntries),
// END addEntries -----------------------
// START update -----------------------
// START updateAll -----------------------
// START removeWhere -----------------------
  PLSymbol('dart/Map.removeWhere'): PLBindingEntry(dart_Map_removeWhere),
// END removeWhere -----------------------
// START putIfAbsent -----------------------
// START addAll -----------------------
// START remove -----------------------
// START clear -----------------------
  PLSymbol('dart/Map.clear'): PLBindingEntry(dart_Map_clear),
// END clear -----------------------
// START forEach -----------------------
  PLSymbol('dart/Map.forEach'): PLBindingEntry(dart_Map_forEach),
// END forEach -----------------------
// START keys -----------------------
  PLSymbol('dart/Map.keys'): PLBindingEntry(dart_Map_keys),
// END keys -----------------------
// START values -----------------------
  PLSymbol('dart/Map.values'): PLBindingEntry(dart_Map_values),
// END values -----------------------
// START length -----------------------
  PLSymbol('dart/Map.length'): PLBindingEntry(dart_Map_length),
// END length -----------------------
// START isEmpty -----------------------
  PLSymbol('dart/Map.isEmpty'): PLBindingEntry(dart_Map_isEmpty),
// END isEmpty -----------------------
// START isNotEmpty -----------------------
  PLSymbol('dart/Map.isNotEmpty'): PLBindingEntry(dart_Map_isNotEmpty),
// END isNotEmpty -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Map
// END  -----------------------
// START CTOR from -----------------------
  PLSymbol('dart/Map.from'): PLBindingEntry(dart_Map_from),
// END from -----------------------
// START CTOR of -----------------------
// START CTOR unmodifiable -----------------------
  PLSymbol('dart/Map.unmodifiable'): PLBindingEntry(dart_Map_unmodifiable),
// END unmodifiable -----------------------
// START CTOR identity -----------------------
  PLSymbol('dart/Map.identity'): PLBindingEntry(dart_Map_identity),
// END identity -----------------------
// START CTOR fromIterable -----------------------
  PLSymbol('dart/Map.fromIterable'): PLBindingEntry(dart_Map_fromIterable),
// END fromIterable -----------------------
// START CTOR fromIterables -----------------------
// START CTOR fromEntries -----------------------
  PLSymbol('dart/Map.fromEntries'): PLBindingEntry(dart_Map_fromEntries),
// END fromEntries -----------------------
// START X0 -----------------------
// END X0 -----------------------
// START X1 -----------------------
// END X1 -----------------------
// Class Match with 9 declarations
// START start -----------------------
  PLSymbol('dart/Match.start'): PLBindingEntry(dart_Match_start),
// END start -----------------------
// START end -----------------------
  PLSymbol('dart/Match.end'): PLBindingEntry(dart_Match_end),
// END end -----------------------
// START group -----------------------
  PLSymbol('dart/Match.group'): PLBindingEntry(dart_Match_group),
// END group -----------------------
// START [] -----------------------
// END [] -----------------------
// START groups -----------------------
  PLSymbol('dart/Match.groups'): PLBindingEntry(dart_Match_groups),
// END groups -----------------------
// START groupCount -----------------------
  PLSymbol('dart/Match.groupCount'): PLBindingEntry(dart_Match_groupCount),
// END groupCount -----------------------
// START input -----------------------
  PLSymbol('dart/Match.input'): PLBindingEntry(dart_Match_input),
// END input -----------------------
// START pattern -----------------------
  PLSymbol('dart/Match.pattern'): PLBindingEntry(dart_Match_pattern),
// END pattern -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Match
// END  -----------------------
// Class num with 39 declarations
// START == -----------------------
// END == -----------------------
// START hashCode -----------------------
  PLSymbol('dart/num.hashCode'): PLBindingEntry(dart_num_hashCode),
// END hashCode -----------------------
// START compareTo -----------------------
  PLSymbol('dart/num.compareTo'): PLBindingEntry(dart_num_compareTo),
// END compareTo -----------------------
// START + -----------------------
// END + -----------------------
// START - -----------------------
// END - -----------------------
// START * -----------------------
// END * -----------------------
// START % -----------------------
// END % -----------------------
// START / -----------------------
// END / -----------------------
// START ~/ -----------------------
// END ~/ -----------------------
// START unary- -----------------------
// END unary- -----------------------
// START remainder -----------------------
  PLSymbol('dart/num.remainder'): PLBindingEntry(dart_num_remainder),
// END remainder -----------------------
// START < -----------------------
// END < -----------------------
// START <= -----------------------
// END <= -----------------------
// START > -----------------------
// END > -----------------------
// START >= -----------------------
// END >= -----------------------
// START isNaN -----------------------
  PLSymbol('dart/num.isNaN'): PLBindingEntry(dart_num_isNaN),
// END isNaN -----------------------
// START isNegative -----------------------
  PLSymbol('dart/num.isNegative'): PLBindingEntry(dart_num_isNegative),
// END isNegative -----------------------
// START isInfinite -----------------------
  PLSymbol('dart/num.isInfinite'): PLBindingEntry(dart_num_isInfinite),
// END isInfinite -----------------------
// START isFinite -----------------------
  PLSymbol('dart/num.isFinite'): PLBindingEntry(dart_num_isFinite),
// END isFinite -----------------------
// START abs -----------------------
  PLSymbol('dart/num.abs'): PLBindingEntry(dart_num_abs),
// END abs -----------------------
// START sign -----------------------
  PLSymbol('dart/num.sign'): PLBindingEntry(dart_num_sign),
// END sign -----------------------
// START round -----------------------
  PLSymbol('dart/num.round'): PLBindingEntry(dart_num_round),
// END round -----------------------
// START floor -----------------------
  PLSymbol('dart/num.floor'): PLBindingEntry(dart_num_floor),
// END floor -----------------------
// START ceil -----------------------
  PLSymbol('dart/num.ceil'): PLBindingEntry(dart_num_ceil),
// END ceil -----------------------
// START truncate -----------------------
  PLSymbol('dart/num.truncate'): PLBindingEntry(dart_num_truncate),
// END truncate -----------------------
// START roundToDouble -----------------------
  PLSymbol('dart/num.roundToDouble'): PLBindingEntry(dart_num_roundToDouble),
// END roundToDouble -----------------------
// START floorToDouble -----------------------
  PLSymbol('dart/num.floorToDouble'): PLBindingEntry(dart_num_floorToDouble),
// END floorToDouble -----------------------
// START ceilToDouble -----------------------
  PLSymbol('dart/num.ceilToDouble'): PLBindingEntry(dart_num_ceilToDouble),
// END ceilToDouble -----------------------
// START truncateToDouble -----------------------
  PLSymbol('dart/num.truncateToDouble'):
      PLBindingEntry(dart_num_truncateToDouble),
// END truncateToDouble -----------------------
// START clamp -----------------------
  PLSymbol('dart/num.clamp'): PLBindingEntry(dart_num_clamp),
// END clamp -----------------------
// START toInt -----------------------
  PLSymbol('dart/num.toInt'): PLBindingEntry(dart_num_toInt),
// END toInt -----------------------
// START toDouble -----------------------
  PLSymbol('dart/num.toDouble'): PLBindingEntry(dart_num_toDouble),
// END toDouble -----------------------
// START toStringAsFixed -----------------------
  PLSymbol('dart/num.toStringAsFixed'):
      PLBindingEntry(dart_num_toStringAsFixed),
// END toStringAsFixed -----------------------
// START toStringAsExponential -----------------------
  PLSymbol('dart/num.toStringAsExponential'):
      PLBindingEntry(dart_num_toStringAsExponential),
  PLSymbol('dart/num.toStringAsExponential-full'):
      PLBindingEntry(dart_num_toStringAsExponential_full),
// END toStringAsExponential -----------------------
// START toStringAsPrecision -----------------------
  PLSymbol('dart/num.toStringAsPrecision'):
      PLBindingEntry(dart_num_toStringAsPrecision),
// END toStringAsPrecision -----------------------
// START toString -----------------------
  PLSymbol('dart/num.toString'): PLBindingEntry(dart_num_toString),
// END toString -----------------------
// START parse -----------------------
  PLSymbol('dart/num.parse'): PLBindingEntry(dart_num_parse),
  PLSymbol('dart/num.parse-full'): PLBindingEntry(dart_num_parse_full),
// END parse -----------------------
// START tryParse -----------------------
  PLSymbol('dart/num.tryParse'): PLBindingEntry(dart_num_tryParse),
// END tryParse -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class num
// END  -----------------------
// Class Object with 9 declarations
// START == -----------------------
// END == -----------------------
// START hashCode -----------------------
  PLSymbol('dart/Object.hashCode'): PLBindingEntry(dart_Object_hashCode),
// END hashCode -----------------------
// START toString -----------------------
  PLSymbol('dart/Object.toString'): PLBindingEntry(dart_Object_toString),
// END toString -----------------------
// START noSuchMethod -----------------------
  PLSymbol('dart/Object.noSuchMethod'):
      PLBindingEntry(dart_Object_noSuchMethod),
// END noSuchMethod -----------------------
// START runtimeType -----------------------
  PLSymbol('dart/Object.runtimeType'): PLBindingEntry(dart_Object_runtimeType),
// END runtimeType -----------------------
// START hash -----------------------
  PLSymbol('dart/Object.hash'): PLBindingEntry(dart_Object_hash),
  PLSymbol('dart/Object.hash-full'): PLBindingEntry(dart_Object_hash_full),
// END hash -----------------------
// START hashAll -----------------------
  PLSymbol('dart/Object.hashAll'): PLBindingEntry(dart_Object_hashAll),
// END hashAll -----------------------
// START hashAllUnordered -----------------------
  PLSymbol('dart/Object.hashAllUnordered'):
      PLBindingEntry(dart_Object_hashAllUnordered),
// END hashAllUnordered -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Object.'): PLBindingEntry(dart_Object_),
// END  -----------------------
// Class Pattern with 3 declarations
// START allMatches -----------------------
  PLSymbol('dart/Pattern.allMatches'): PLBindingEntry(dart_Pattern_allMatches),
  PLSymbol('dart/Pattern.allMatches-full'):
      PLBindingEntry(dart_Pattern_allMatches_full),
// END allMatches -----------------------
// START matchAsPrefix -----------------------
  PLSymbol('dart/Pattern.matchAsPrefix'):
      PLBindingEntry(dart_Pattern_matchAsPrefix),
  PLSymbol('dart/Pattern.matchAsPrefix-full'):
      PLBindingEntry(dart_Pattern_matchAsPrefix_full),
// END matchAsPrefix -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class Pattern
// END  -----------------------
// Class RegExp with 11 declarations
// START escape -----------------------
  PLSymbol('dart/RegExp.escape'): PLBindingEntry(dart_RegExp_escape),
// END escape -----------------------
// START firstMatch -----------------------
  PLSymbol('dart/RegExp.firstMatch'): PLBindingEntry(dart_RegExp_firstMatch),
// END firstMatch -----------------------
// START allMatches -----------------------
  PLSymbol('dart/RegExp.allMatches'): PLBindingEntry(dart_RegExp_allMatches),
  PLSymbol('dart/RegExp.allMatches-full'):
      PLBindingEntry(dart_RegExp_allMatches_full),
// END allMatches -----------------------
// START hasMatch -----------------------
  PLSymbol('dart/RegExp.hasMatch'): PLBindingEntry(dart_RegExp_hasMatch),
// END hasMatch -----------------------
// START stringMatch -----------------------
  PLSymbol('dart/RegExp.stringMatch'): PLBindingEntry(dart_RegExp_stringMatch),
// END stringMatch -----------------------
// START pattern -----------------------
  PLSymbol('dart/RegExp.pattern'): PLBindingEntry(dart_RegExp_pattern),
// END pattern -----------------------
// START isMultiLine -----------------------
  PLSymbol('dart/RegExp.isMultiLine'): PLBindingEntry(dart_RegExp_isMultiLine),
// END isMultiLine -----------------------
// START isCaseSensitive -----------------------
  PLSymbol('dart/RegExp.isCaseSensitive'):
      PLBindingEntry(dart_RegExp_isCaseSensitive),
// END isCaseSensitive -----------------------
// START isUnicode -----------------------
  PLSymbol('dart/RegExp.isUnicode'): PLBindingEntry(dart_RegExp_isUnicode),
// END isUnicode -----------------------
// START isDotAll -----------------------
  PLSymbol('dart/RegExp.isDotAll'): PLBindingEntry(dart_RegExp_isDotAll),
// END isDotAll -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/RegExp.'): PLBindingEntry(dart_RegExp_),
// END  -----------------------
// Class RegExpMatch with 3 declarations
// START namedGroup -----------------------
  PLSymbol('dart/RegExpMatch.namedGroup'):
      PLBindingEntry(dart_RegExpMatch_namedGroup),
// END namedGroup -----------------------
// START groupNames -----------------------
  PLSymbol('dart/RegExpMatch.groupNames'):
      PLBindingEntry(dart_RegExpMatch_groupNames),
// END groupNames -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class RegExpMatch
// END  -----------------------
// Class RuneIterator with 11 declarations
// START string -----------------------
  PLSymbol('dart/RuneIterator.string'):
      PLBindingEntry(dart_RuneIterator_string),
// END string -----------------------
// START rawIndex -----------------------
  PLSymbol('dart/RuneIterator.rawIndex'):
      PLBindingEntry(dart_RuneIterator_rawIndex),
// END rawIndex -----------------------
// START rawIndex= -----------------------
// START reset -----------------------
  PLSymbol('dart/RuneIterator.reset'): PLBindingEntry(dart_RuneIterator_reset),
  PLSymbol('dart/RuneIterator.reset-full'):
      PLBindingEntry(dart_RuneIterator_reset_full),
// END reset -----------------------
// START current -----------------------
  PLSymbol('dart/RuneIterator.current'):
      PLBindingEntry(dart_RuneIterator_current),
// END current -----------------------
// START currentSize -----------------------
  PLSymbol('dart/RuneIterator.currentSize'):
      PLBindingEntry(dart_RuneIterator_currentSize),
// END currentSize -----------------------
// START currentAsString -----------------------
  PLSymbol('dart/RuneIterator.currentAsString'):
      PLBindingEntry(dart_RuneIterator_currentAsString),
// END currentAsString -----------------------
// START moveNext -----------------------
  PLSymbol('dart/RuneIterator.moveNext'):
      PLBindingEntry(dart_RuneIterator_moveNext),
// END moveNext -----------------------
// START movePrevious -----------------------
  PLSymbol('dart/RuneIterator.movePrevious'):
      PLBindingEntry(dart_RuneIterator_movePrevious),
// END movePrevious -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/RuneIterator.'): PLBindingEntry(dart_RuneIterator_),
// END  -----------------------
// START CTOR at -----------------------
  PLSymbol('dart/RuneIterator.at'): PLBindingEntry(dart_RuneIterator_at),
// END at -----------------------
// Class Runes with 4 declarations
// START string -----------------------
  PLSymbol('dart/Runes.string'): PLBindingEntry(dart_Runes_string),
// END string -----------------------
// START iterator -----------------------
  PLSymbol('dart/Runes.iterator'): PLBindingEntry(dart_Runes_iterator),
// END iterator -----------------------
// START last -----------------------
  PLSymbol('dart/Runes.last'): PLBindingEntry(dart_Runes_last),
// END last -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Runes.'): PLBindingEntry(dart_Runes_),
// END  -----------------------
// Class Set with 24 declarations
// START castFrom -----------------------
  PLSymbol('dart/Set.castFrom'): PLBindingEntry(dart_Set_castFrom),
// END castFrom -----------------------
// START cast -----------------------
  PLSymbol('dart/Set.cast'): PLBindingEntry(dart_Set_cast),
// END cast -----------------------
// START iterator -----------------------
  PLSymbol('dart/Set.iterator'): PLBindingEntry(dart_Set_iterator),
// END iterator -----------------------
// START contains -----------------------
  PLSymbol('dart/Set.contains'): PLBindingEntry(dart_Set_contains),
// END contains -----------------------
// START add -----------------------
// START addAll -----------------------
// START remove -----------------------
  PLSymbol('dart/Set.remove'): PLBindingEntry(dart_Set_remove),
// END remove -----------------------
// START lookup -----------------------
// START removeAll -----------------------
  PLSymbol('dart/Set.removeAll'): PLBindingEntry(dart_Set_removeAll),
// END removeAll -----------------------
// START retainAll -----------------------
  PLSymbol('dart/Set.retainAll'): PLBindingEntry(dart_Set_retainAll),
// END retainAll -----------------------
// START removeWhere -----------------------
  PLSymbol('dart/Set.removeWhere'): PLBindingEntry(dart_Set_removeWhere),
// END removeWhere -----------------------
// START retainWhere -----------------------
  PLSymbol('dart/Set.retainWhere'): PLBindingEntry(dart_Set_retainWhere),
// END retainWhere -----------------------
// START containsAll -----------------------
  PLSymbol('dart/Set.containsAll'): PLBindingEntry(dart_Set_containsAll),
// END containsAll -----------------------
// START intersection -----------------------
  PLSymbol('dart/Set.intersection'): PLBindingEntry(dart_Set_intersection),
// END intersection -----------------------
// START union -----------------------
// START difference -----------------------
  PLSymbol('dart/Set.difference'): PLBindingEntry(dart_Set_difference),
// END difference -----------------------
// START clear -----------------------
  PLSymbol('dart/Set.clear'): PLBindingEntry(dart_Set_clear),
// END clear -----------------------
// START toSet -----------------------
  PLSymbol('dart/Set.toSet'): PLBindingEntry(dart_Set_toSet),
// END toSet -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Set.'): PLBindingEntry(dart_Set_),
// END  -----------------------
// START CTOR identity -----------------------
  PLSymbol('dart/Set.identity'): PLBindingEntry(dart_Set_identity),
// END identity -----------------------
// START CTOR from -----------------------
  PLSymbol('dart/Set.from'): PLBindingEntry(dart_Set_from),
// END from -----------------------
// START CTOR of -----------------------
// START CTOR unmodifiable -----------------------
// START X0 -----------------------
// END X0 -----------------------
// Class StackTrace with 5 declarations
// START empty -----------------------
  PLSymbol('dart/StackTrace.empty'): PLBindingEntry(StackTrace.empty),
// END empty -----------------------
// START current -----------------------
  PLSymbol('dart/StackTrace.current'): PLBindingEntry(dart_StackTrace_current),
// END current -----------------------
// START toString -----------------------
  PLSymbol('dart/StackTrace.toString'):
      PLBindingEntry(dart_StackTrace_toString),
// END toString -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class StackTrace
// END  -----------------------
// START CTOR fromString -----------------------
  PLSymbol('dart/StackTrace.fromString'):
      PLBindingEntry(dart_StackTrace_fromString),
// END fromString -----------------------
// Class Stopwatch with 10 declarations
// START frequency -----------------------
  PLSymbol('dart/Stopwatch.frequency'):
      PLBindingEntry(dart_Stopwatch_frequency),
// END frequency -----------------------
// START start -----------------------
  PLSymbol('dart/Stopwatch.start'): PLBindingEntry(dart_Stopwatch_start),
// END start -----------------------
// START stop -----------------------
  PLSymbol('dart/Stopwatch.stop'): PLBindingEntry(dart_Stopwatch_stop),
// END stop -----------------------
// START reset -----------------------
  PLSymbol('dart/Stopwatch.reset'): PLBindingEntry(dart_Stopwatch_reset),
// END reset -----------------------
// START elapsedTicks -----------------------
  PLSymbol('dart/Stopwatch.elapsedTicks'):
      PLBindingEntry(dart_Stopwatch_elapsedTicks),
// END elapsedTicks -----------------------
// START elapsed -----------------------
  PLSymbol('dart/Stopwatch.elapsed'): PLBindingEntry(dart_Stopwatch_elapsed),
// END elapsed -----------------------
// START elapsedMicroseconds -----------------------
  PLSymbol('dart/Stopwatch.elapsedMicroseconds'):
      PLBindingEntry(dart_Stopwatch_elapsedMicroseconds),
// END elapsedMicroseconds -----------------------
// START elapsedMilliseconds -----------------------
  PLSymbol('dart/Stopwatch.elapsedMilliseconds'):
      PLBindingEntry(dart_Stopwatch_elapsedMilliseconds),
// END elapsedMilliseconds -----------------------
// START isRunning -----------------------
  PLSymbol('dart/Stopwatch.isRunning'):
      PLBindingEntry(dart_Stopwatch_isRunning),
// END isRunning -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Stopwatch.'): PLBindingEntry(dart_Stopwatch_),
// END  -----------------------
// Class String with 35 declarations
// START [] -----------------------
// END [] -----------------------
// START codeUnitAt -----------------------
  PLSymbol('dart/String.codeUnitAt'): PLBindingEntry(dart_String_codeUnitAt),
// END codeUnitAt -----------------------
// START length -----------------------
  PLSymbol('dart/String.length'): PLBindingEntry(dart_String_length),
// END length -----------------------
// START hashCode -----------------------
  PLSymbol('dart/String.hashCode'): PLBindingEntry(dart_String_hashCode),
// END hashCode -----------------------
// START == -----------------------
// END == -----------------------
// START compareTo -----------------------
  PLSymbol('dart/String.compareTo'): PLBindingEntry(dart_String_compareTo),
// END compareTo -----------------------
// START endsWith -----------------------
  PLSymbol('dart/String.endsWith'): PLBindingEntry(dart_String_endsWith),
// END endsWith -----------------------
// START startsWith -----------------------
  PLSymbol('dart/String.startsWith'): PLBindingEntry(dart_String_startsWith),
  PLSymbol('dart/String.startsWith-full'):
      PLBindingEntry(dart_String_startsWith_full),
// END startsWith -----------------------
// START indexOf -----------------------
  PLSymbol('dart/String.indexOf'): PLBindingEntry(dart_String_indexOf),
  PLSymbol('dart/String.indexOf-full'):
      PLBindingEntry(dart_String_indexOf_full),
// END indexOf -----------------------
// START lastIndexOf -----------------------
  PLSymbol('dart/String.lastIndexOf'): PLBindingEntry(dart_String_lastIndexOf),
  PLSymbol('dart/String.lastIndexOf-full'):
      PLBindingEntry(dart_String_lastIndexOf_full),
// END lastIndexOf -----------------------
// START isEmpty -----------------------
  PLSymbol('dart/String.isEmpty'): PLBindingEntry(dart_String_isEmpty),
// END isEmpty -----------------------
// START isNotEmpty -----------------------
  PLSymbol('dart/String.isNotEmpty'): PLBindingEntry(dart_String_isNotEmpty),
// END isNotEmpty -----------------------
// START + -----------------------
// END + -----------------------
// START substring -----------------------
  PLSymbol('dart/String.substring'): PLBindingEntry(dart_String_substring),
  PLSymbol('dart/String.substring-full'):
      PLBindingEntry(dart_String_substring_full),
// END substring -----------------------
// START trim -----------------------
  PLSymbol('dart/String.trim'): PLBindingEntry(dart_String_trim),
// END trim -----------------------
// START trimLeft -----------------------
  PLSymbol('dart/String.trimLeft'): PLBindingEntry(dart_String_trimLeft),
// END trimLeft -----------------------
// START trimRight -----------------------
  PLSymbol('dart/String.trimRight'): PLBindingEntry(dart_String_trimRight),
// END trimRight -----------------------
// START * -----------------------
// END * -----------------------
// START padLeft -----------------------
  PLSymbol('dart/String.padLeft'): PLBindingEntry(dart_String_padLeft),
  PLSymbol('dart/String.padLeft-full'):
      PLBindingEntry(dart_String_padLeft_full),
// END padLeft -----------------------
// START padRight -----------------------
  PLSymbol('dart/String.padRight'): PLBindingEntry(dart_String_padRight),
  PLSymbol('dart/String.padRight-full'):
      PLBindingEntry(dart_String_padRight_full),
// END padRight -----------------------
// START contains -----------------------
  PLSymbol('dart/String.contains'): PLBindingEntry(dart_String_contains),
  PLSymbol('dart/String.contains-full'):
      PLBindingEntry(dart_String_contains_full),
// END contains -----------------------
// START replaceFirst -----------------------
  PLSymbol('dart/String.replaceFirst'):
      PLBindingEntry(dart_String_replaceFirst),
  PLSymbol('dart/String.replaceFirst-full'):
      PLBindingEntry(dart_String_replaceFirst_full),
// END replaceFirst -----------------------
// START replaceFirstMapped -----------------------
  PLSymbol('dart/String.replaceFirstMapped'):
      PLBindingEntry(dart_String_replaceFirstMapped),
  PLSymbol('dart/String.replaceFirstMapped-full'):
      PLBindingEntry(dart_String_replaceFirstMapped_full),
// END replaceFirstMapped -----------------------
// START replaceAll -----------------------
  PLSymbol('dart/String.replaceAll'): PLBindingEntry(dart_String_replaceAll),
// END replaceAll -----------------------
// START replaceAllMapped -----------------------
  PLSymbol('dart/String.replaceAllMapped'):
      PLBindingEntry(dart_String_replaceAllMapped),
// END replaceAllMapped -----------------------
// START replaceRange -----------------------
  PLSymbol('dart/String.replaceRange'):
      PLBindingEntry(dart_String_replaceRange),
// END replaceRange -----------------------
// START split -----------------------
  PLSymbol('dart/String.split'): PLBindingEntry(dart_String_split),
// END split -----------------------
// START splitMapJoin -----------------------
  PLSymbol('dart/String.splitMapJoin'):
      PLBindingEntry(dart_String_splitMapJoin),
// END splitMapJoin -----------------------
// START codeUnits -----------------------
  PLSymbol('dart/String.codeUnits'): PLBindingEntry(dart_String_codeUnits),
// END codeUnits -----------------------
// START runes -----------------------
  PLSymbol('dart/String.runes'): PLBindingEntry(dart_String_runes),
// END runes -----------------------
// START toLowerCase -----------------------
  PLSymbol('dart/String.toLowerCase'): PLBindingEntry(dart_String_toLowerCase),
// END toLowerCase -----------------------
// START toUpperCase -----------------------
  PLSymbol('dart/String.toUpperCase'): PLBindingEntry(dart_String_toUpperCase),
// END toUpperCase -----------------------
// START CTOR fromCharCodes -----------------------
  PLSymbol('dart/String.fromCharCodes'):
      PLBindingEntry(dart_String_fromCharCodes),
  PLSymbol('dart/String.fromCharCodes-full'):
      PLBindingEntry(dart_String_fromCharCodes_full),
// END fromCharCodes -----------------------
// START CTOR fromCharCode -----------------------
  PLSymbol('dart/String.fromCharCode'):
      PLBindingEntry(dart_String_fromCharCode),
// END fromCharCode -----------------------
// START CTOR fromEnvironment -----------------------
  PLSymbol('dart/String.fromEnvironment'):
      PLBindingEntry(dart_String_fromEnvironment),
// END fromEnvironment -----------------------
// Class StringBuffer with 10 declarations
// START length -----------------------
  PLSymbol('dart/StringBuffer.length'):
      PLBindingEntry(dart_StringBuffer_length),
// END length -----------------------
// START isEmpty -----------------------
  PLSymbol('dart/StringBuffer.isEmpty'):
      PLBindingEntry(dart_StringBuffer_isEmpty),
// END isEmpty -----------------------
// START isNotEmpty -----------------------
  PLSymbol('dart/StringBuffer.isNotEmpty'):
      PLBindingEntry(dart_StringBuffer_isNotEmpty),
// END isNotEmpty -----------------------
// START write -----------------------
  PLSymbol('dart/StringBuffer.write'): PLBindingEntry(dart_StringBuffer_write),
// END write -----------------------
// START writeCharCode -----------------------
  PLSymbol('dart/StringBuffer.writeCharCode'):
      PLBindingEntry(dart_StringBuffer_writeCharCode),
// END writeCharCode -----------------------
// START writeAll -----------------------
  PLSymbol('dart/StringBuffer.writeAll'):
      PLBindingEntry(dart_StringBuffer_writeAll),
  PLSymbol('dart/StringBuffer.writeAll-full'):
      PLBindingEntry(dart_StringBuffer_writeAll_full),
// END writeAll -----------------------
// START writeln -----------------------
  PLSymbol('dart/StringBuffer.writeln'):
      PLBindingEntry(dart_StringBuffer_writeln),
  PLSymbol('dart/StringBuffer.writeln-full'):
      PLBindingEntry(dart_StringBuffer_writeln_full),
// END writeln -----------------------
// START clear -----------------------
  PLSymbol('dart/StringBuffer.clear'): PLBindingEntry(dart_StringBuffer_clear),
// END clear -----------------------
// START toString -----------------------
  PLSymbol('dart/StringBuffer.toString'):
      PLBindingEntry(dart_StringBuffer_toString),
// END toString -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/StringBuffer.'): PLBindingEntry(dart_StringBuffer_),
  PLSymbol('dart/StringBuffer.-full'): PLBindingEntry(dart_StringBuffer__full),
// END  -----------------------
// Class StringSink with 5 declarations
// START write -----------------------
  PLSymbol('dart/StringSink.write'): PLBindingEntry(dart_StringSink_write),
// END write -----------------------
// START writeAll -----------------------
  PLSymbol('dart/StringSink.writeAll'):
      PLBindingEntry(dart_StringSink_writeAll),
  PLSymbol('dart/StringSink.writeAll-full'):
      PLBindingEntry(dart_StringSink_writeAll_full),
// END writeAll -----------------------
// START writeln -----------------------
  PLSymbol('dart/StringSink.writeln'): PLBindingEntry(dart_StringSink_writeln),
  PLSymbol('dart/StringSink.writeln-full'):
      PLBindingEntry(dart_StringSink_writeln_full),
// END writeln -----------------------
// START writeCharCode -----------------------
  PLSymbol('dart/StringSink.writeCharCode'):
      PLBindingEntry(dart_StringSink_writeCharCode),
// END writeCharCode -----------------------
// START CTOR  -----------------------
// Skipping binding for constructor of abstract class StringSink
// END  -----------------------
// Class Symbol with 5 declarations
// START unaryMinus -----------------------
  PLSymbol('dart/Symbol.unaryMinus'): PLBindingEntry(Symbol.unaryMinus),
// END unaryMinus -----------------------
// START empty -----------------------
  PLSymbol('dart/Symbol.empty'): PLBindingEntry(Symbol.empty),
// END empty -----------------------
// START hashCode -----------------------
  PLSymbol('dart/Symbol.hashCode'): PLBindingEntry(dart_Symbol_hashCode),
// END hashCode -----------------------
// START == -----------------------
// END == -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Symbol.'): PLBindingEntry(dart_Symbol_),
// END  -----------------------
// Class Uri with 50 declarations
// START base -----------------------
  PLSymbol('dart/Uri.base'): PLBindingEntry(dart_Uri_base),
// END base -----------------------
// START scheme -----------------------
  PLSymbol('dart/Uri.scheme'): PLBindingEntry(dart_Uri_scheme),
// END scheme -----------------------
// START authority -----------------------
  PLSymbol('dart/Uri.authority'): PLBindingEntry(dart_Uri_authority),
// END authority -----------------------
// START userInfo -----------------------
  PLSymbol('dart/Uri.userInfo'): PLBindingEntry(dart_Uri_userInfo),
// END userInfo -----------------------
// START host -----------------------
  PLSymbol('dart/Uri.host'): PLBindingEntry(dart_Uri_host),
// END host -----------------------
// START port -----------------------
  PLSymbol('dart/Uri.port'): PLBindingEntry(dart_Uri_port),
// END port -----------------------
// START path -----------------------
  PLSymbol('dart/Uri.path'): PLBindingEntry(dart_Uri_path),
// END path -----------------------
// START query -----------------------
  PLSymbol('dart/Uri.query'): PLBindingEntry(dart_Uri_query),
// END query -----------------------
// START fragment -----------------------
  PLSymbol('dart/Uri.fragment'): PLBindingEntry(dart_Uri_fragment),
// END fragment -----------------------
// START pathSegments -----------------------
  PLSymbol('dart/Uri.pathSegments'): PLBindingEntry(dart_Uri_pathSegments),
// END pathSegments -----------------------
// START queryParameters -----------------------
  PLSymbol('dart/Uri.queryParameters'):
      PLBindingEntry(dart_Uri_queryParameters),
// END queryParameters -----------------------
// START queryParametersAll -----------------------
  PLSymbol('dart/Uri.queryParametersAll'):
      PLBindingEntry(dart_Uri_queryParametersAll),
// END queryParametersAll -----------------------
// START isAbsolute -----------------------
  PLSymbol('dart/Uri.isAbsolute'): PLBindingEntry(dart_Uri_isAbsolute),
// END isAbsolute -----------------------
// START hasScheme -----------------------
  PLSymbol('dart/Uri.hasScheme'): PLBindingEntry(dart_Uri_hasScheme),
// END hasScheme -----------------------
// START hasAuthority -----------------------
  PLSymbol('dart/Uri.hasAuthority'): PLBindingEntry(dart_Uri_hasAuthority),
// END hasAuthority -----------------------
// START hasPort -----------------------
  PLSymbol('dart/Uri.hasPort'): PLBindingEntry(dart_Uri_hasPort),
// END hasPort -----------------------
// START hasQuery -----------------------
  PLSymbol('dart/Uri.hasQuery'): PLBindingEntry(dart_Uri_hasQuery),
// END hasQuery -----------------------
// START hasFragment -----------------------
  PLSymbol('dart/Uri.hasFragment'): PLBindingEntry(dart_Uri_hasFragment),
// END hasFragment -----------------------
// START hasEmptyPath -----------------------
  PLSymbol('dart/Uri.hasEmptyPath'): PLBindingEntry(dart_Uri_hasEmptyPath),
// END hasEmptyPath -----------------------
// START hasAbsolutePath -----------------------
  PLSymbol('dart/Uri.hasAbsolutePath'):
      PLBindingEntry(dart_Uri_hasAbsolutePath),
// END hasAbsolutePath -----------------------
// START origin -----------------------
  PLSymbol('dart/Uri.origin'): PLBindingEntry(dart_Uri_origin),
// END origin -----------------------
// START isScheme -----------------------
  PLSymbol('dart/Uri.isScheme'): PLBindingEntry(dart_Uri_isScheme),
// END isScheme -----------------------
// START toFilePath -----------------------
  PLSymbol('dart/Uri.toFilePath'): PLBindingEntry(dart_Uri_toFilePath),
// END toFilePath -----------------------
// START data -----------------------
  PLSymbol('dart/Uri.data'): PLBindingEntry(dart_Uri_data),
// END data -----------------------
// START hashCode -----------------------
  PLSymbol('dart/Uri.hashCode'): PLBindingEntry(dart_Uri_hashCode),
// END hashCode -----------------------
// START == -----------------------
// END == -----------------------
// START toString -----------------------
  PLSymbol('dart/Uri.toString'): PLBindingEntry(dart_Uri_toString),
// END toString -----------------------
// START replace -----------------------
  PLSymbol('dart/Uri.replace'): PLBindingEntry(dart_Uri_replace),
// END replace -----------------------
// START removeFragment -----------------------
  PLSymbol('dart/Uri.removeFragment'): PLBindingEntry(dart_Uri_removeFragment),
// END removeFragment -----------------------
// START resolve -----------------------
  PLSymbol('dart/Uri.resolve'): PLBindingEntry(dart_Uri_resolve),
// END resolve -----------------------
// START resolveUri -----------------------
  PLSymbol('dart/Uri.resolveUri'): PLBindingEntry(dart_Uri_resolveUri),
// END resolveUri -----------------------
// START normalizePath -----------------------
  PLSymbol('dart/Uri.normalizePath'): PLBindingEntry(dart_Uri_normalizePath),
// END normalizePath -----------------------
// START parse -----------------------
  PLSymbol('dart/Uri.parse'): PLBindingEntry(dart_Uri_parse),
  PLSymbol('dart/Uri.parse-full'): PLBindingEntry(dart_Uri_parse_full),
// END parse -----------------------
// START tryParse -----------------------
  PLSymbol('dart/Uri.tryParse'): PLBindingEntry(dart_Uri_tryParse),
  PLSymbol('dart/Uri.tryParse-full'): PLBindingEntry(dart_Uri_tryParse_full),
// END tryParse -----------------------
// START encodeComponent -----------------------
  PLSymbol('dart/Uri.encodeComponent'):
      PLBindingEntry(dart_Uri_encodeComponent),
// END encodeComponent -----------------------
// START encodeQueryComponent -----------------------
  PLSymbol('dart/Uri.encodeQueryComponent'):
      PLBindingEntry(dart_Uri_encodeQueryComponent),
// END encodeQueryComponent -----------------------
// START decodeComponent -----------------------
  PLSymbol('dart/Uri.decodeComponent'):
      PLBindingEntry(dart_Uri_decodeComponent),
// END decodeComponent -----------------------
// START decodeQueryComponent -----------------------
  PLSymbol('dart/Uri.decodeQueryComponent'):
      PLBindingEntry(dart_Uri_decodeQueryComponent),
// END decodeQueryComponent -----------------------
// START encodeFull -----------------------
  PLSymbol('dart/Uri.encodeFull'): PLBindingEntry(dart_Uri_encodeFull),
// END encodeFull -----------------------
// START decodeFull -----------------------
  PLSymbol('dart/Uri.decodeFull'): PLBindingEntry(dart_Uri_decodeFull),
// END decodeFull -----------------------
// START splitQueryString -----------------------
  PLSymbol('dart/Uri.splitQueryString'):
      PLBindingEntry(dart_Uri_splitQueryString),
// END splitQueryString -----------------------
// START parseIPv4Address -----------------------
  PLSymbol('dart/Uri.parseIPv4Address'):
      PLBindingEntry(dart_Uri_parseIPv4Address),
// END parseIPv4Address -----------------------
// START parseIPv6Address -----------------------
  PLSymbol('dart/Uri.parseIPv6Address'):
      PLBindingEntry(dart_Uri_parseIPv6Address),
  PLSymbol('dart/Uri.parseIPv6Address-full'):
      PLBindingEntry(dart_Uri_parseIPv6Address_full),
// END parseIPv6Address -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Uri.'): PLBindingEntry(dart_Uri_),
// END  -----------------------
// START CTOR http -----------------------
  PLSymbol('dart/Uri.http'): PLBindingEntry(dart_Uri_http),
  PLSymbol('dart/Uri.http-full'): PLBindingEntry(dart_Uri_http_full),
// END http -----------------------
// START CTOR https -----------------------
  PLSymbol('dart/Uri.https'): PLBindingEntry(dart_Uri_https),
  PLSymbol('dart/Uri.https-full'): PLBindingEntry(dart_Uri_https_full),
// END https -----------------------
// START CTOR file -----------------------
  PLSymbol('dart/Uri.file'): PLBindingEntry(dart_Uri_file),
// END file -----------------------
// START CTOR directory -----------------------
  PLSymbol('dart/Uri.directory'): PLBindingEntry(dart_Uri_directory),
// END directory -----------------------
// START CTOR dataFromString -----------------------
  PLSymbol('dart/Uri.dataFromString'): PLBindingEntry(dart_Uri_dataFromString),
// END dataFromString -----------------------
// START CTOR dataFromBytes -----------------------
  PLSymbol('dart/Uri.dataFromBytes'): PLBindingEntry(dart_Uri_dataFromBytes),
// END dataFromBytes -----------------------
// Class UriData with 16 declarations
// START parse -----------------------
  PLSymbol('dart/UriData.parse'): PLBindingEntry(dart_UriData_parse),
// END parse -----------------------
// START uri -----------------------
  PLSymbol('dart/UriData.uri'): PLBindingEntry(dart_UriData_uri),
// END uri -----------------------
// START mimeType -----------------------
  PLSymbol('dart/UriData.mimeType'): PLBindingEntry(dart_UriData_mimeType),
// END mimeType -----------------------
// START isMimeType -----------------------
  PLSymbol('dart/UriData.isMimeType'): PLBindingEntry(dart_UriData_isMimeType),
// END isMimeType -----------------------
// START charset -----------------------
  PLSymbol('dart/UriData.charset'): PLBindingEntry(dart_UriData_charset),
// END charset -----------------------
// START isCharset -----------------------
  PLSymbol('dart/UriData.isCharset'): PLBindingEntry(dart_UriData_isCharset),
// END isCharset -----------------------
// START isEncoding -----------------------
  PLSymbol('dart/UriData.isEncoding'): PLBindingEntry(dart_UriData_isEncoding),
// END isEncoding -----------------------
// START isBase64 -----------------------
  PLSymbol('dart/UriData.isBase64'): PLBindingEntry(dart_UriData_isBase64),
// END isBase64 -----------------------
// START contentText -----------------------
  PLSymbol('dart/UriData.contentText'):
      PLBindingEntry(dart_UriData_contentText),
// END contentText -----------------------
// START contentAsBytes -----------------------
// START contentAsString -----------------------
  PLSymbol('dart/UriData.contentAsString'):
      PLBindingEntry(dart_UriData_contentAsString),
// END contentAsString -----------------------
// START parameters -----------------------
  PLSymbol('dart/UriData.parameters'): PLBindingEntry(dart_UriData_parameters),
// END parameters -----------------------
// START toString -----------------------
  PLSymbol('dart/UriData.toString'): PLBindingEntry(dart_UriData_toString),
// END toString -----------------------
// START CTOR fromString -----------------------
  PLSymbol('dart/UriData.fromString'): PLBindingEntry(dart_UriData_fromString),
// END fromString -----------------------
// START CTOR fromBytes -----------------------
  PLSymbol('dart/UriData.fromBytes'): PLBindingEntry(dart_UriData_fromBytes),
// END fromBytes -----------------------
// START CTOR fromUri -----------------------
  PLSymbol('dart/UriData.fromUri'): PLBindingEntry(dart_UriData_fromUri),
// END fromUri -----------------------
// Class Random with 5 declarations
// START nextInt -----------------------
  PLSymbol('dart/Random.nextInt'): PLBindingEntry(dart_Random_nextInt),
// END nextInt -----------------------
// START nextDouble -----------------------
  PLSymbol('dart/Random.nextDouble'): PLBindingEntry(dart_Random_nextDouble),
// END nextDouble -----------------------
// START nextBool -----------------------
  PLSymbol('dart/Random.nextBool'): PLBindingEntry(dart_Random_nextBool),
// END nextBool -----------------------
// START CTOR  -----------------------
  PLSymbol('dart/Random.'): PLBindingEntry(dart_Random_),
  PLSymbol('dart/Random.-full'): PLBindingEntry(dart_Random__full),
// END  -----------------------
// START CTOR secure -----------------------
  PLSymbol('dart/Random.secure'): PLBindingEntry(dart_Random_secure),
// END secure -----------------------
// Library dart:core
// START Function print
  PLSymbol('dart/dart-core-print'): PLBindingEntry(dart_dart_core_print),
// END Function print
// START Function identical
  PLSymbol('dart/dart-core-identical'):
      PLBindingEntry(dart_dart_core_identical),
// END Function identical
// START Function identityHashCode
  PLSymbol('dart/dart-core-identityHashCode'):
      PLBindingEntry(dart_dart_core_identityHashCode),
// END Function identityHashCode
// Library dart:convert
// START Function base64Encode
  PLSymbol('dart/dart-convert-base64Encode'):
      PLBindingEntry(dart_dart_convert_base64Encode),
// END Function base64Encode
// START Function jsonDecode
  PLSymbol('dart/dart-convert-jsonDecode'):
      PLBindingEntry(dart_dart_convert_jsonDecode),
// END Function jsonDecode
// START Function base64Decode
  PLSymbol('dart/dart-convert-base64Decode'):
      PLBindingEntry(dart_dart_convert_base64Decode),
// END Function base64Decode
// START Function jsonEncode
  PLSymbol('dart/dart-convert-jsonEncode'):
      PLBindingEntry(dart_dart_convert_jsonEncode),
// END Function jsonEncode
// START Function base64UrlEncode
  PLSymbol('dart/dart-convert-base64UrlEncode'):
      PLBindingEntry(dart_dart_convert_base64UrlEncode),
// END Function base64UrlEncode
// Library dart:math
// START Function atan2
  PLSymbol('dart/dart-math-atan2'): PLBindingEntry(dart_dart_math_atan2),
// END Function atan2
// START Function sqrt
  PLSymbol('dart/dart-math-sqrt'): PLBindingEntry(dart_dart_math_sqrt),
// END Function sqrt
// START Function atan
  PLSymbol('dart/dart-math-atan'): PLBindingEntry(dart_dart_math_atan),
// END Function atan
// START Function asin
  PLSymbol('dart/dart-math-asin'): PLBindingEntry(dart_dart_math_asin),
// END Function asin
// START Function exp
  PLSymbol('dart/dart-math-exp'): PLBindingEntry(dart_dart_math_exp),
// END Function exp
// START Function sin
  PLSymbol('dart/dart-math-sin'): PLBindingEntry(dart_dart_math_sin),
// END Function sin
// START Function tan
  PLSymbol('dart/dart-math-tan'): PLBindingEntry(dart_dart_math_tan),
// END Function tan
// START Function cos
  PLSymbol('dart/dart-math-cos'): PLBindingEntry(dart_dart_math_cos),
// END Function cos
// START Function log
  PLSymbol('dart/dart-math-log'): PLBindingEntry(dart_dart_math_log),
// END Function log
// START Function acos
  PLSymbol('dart/dart-math-acos'): PLBindingEntry(dart_dart_math_acos),
// END Function acos
// START Function pow
  PLSymbol('dart/dart-math-pow'): PLBindingEntry(dart_dart_math_pow),
// END Function pow
};

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_zero(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = BigInt.zero;
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/BigInt.zero function expects 0 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_one(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = BigInt.one;
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/BigInt.one function expects 0 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_two(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = BigInt.two;
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/BigInt.two function expects 0 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/BigInt.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = BigInt.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/BigInt.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_tryParse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/BigInt.tryParse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = BigInt.tryParse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/BigInt.tryParse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_abs(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.abs();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.abs function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.abs function expects 1 argument(s) (the BigInt object + abs args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_remainder(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! BigInt) {
        throw ArgumentError(
            'The dart/BigInt.remainder function expects its 2nd argument to be a BigInt value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.remainder(
        args[1] as BigInt,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.remainder function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.remainder function expects 2 argument(s) (the BigInt object + remainder args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_BigInt_compareTo(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! BigInt) {
        throw ArgumentError(
            'The dart/BigInt.compareTo function expects its 2nd argument to be a BigInt value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.compareTo(
        args[1] as BigInt,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.compareTo function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.compareTo function expects 2 argument(s) (the BigInt object + compareTo args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_BigInt_bitLength(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.bitLength;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.bitLength function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.bitLength function expects 1 argument(s) (the BigInt object + bitLength args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_BigInt_sign(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.sign;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.sign function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.sign function expects 1 argument(s) (the BigInt object + sign args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_BigInt_isEven(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.isEven;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.isEven function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.isEven function expects 1 argument(s) (the BigInt object + isEven args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_BigInt_isOdd(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.isOdd;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.isOdd function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.isOdd function expects 1 argument(s) (the BigInt object + isOdd args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_BigInt_isNegative(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.isNegative;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.isNegative function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.isNegative function expects 1 argument(s) (the BigInt object + isNegative args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_pow(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/BigInt.pow function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.pow(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.pow function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.pow function expects 2 argument(s) (the BigInt object + pow args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_modPow(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! BigInt) {
        throw ArgumentError(
            'The dart/BigInt.modPow function expects its 2nd argument to be a BigInt value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! BigInt) {
        throw ArgumentError(
            'The dart/BigInt.modPow function expects its 3rd argument to be a BigInt value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.modPow(
        args[1] as BigInt,
        args[2] as BigInt,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.modPow function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.modPow function expects 3 argument(s) (the BigInt object + modPow args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_modInverse(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! BigInt) {
        throw ArgumentError(
            'The dart/BigInt.modInverse function expects its 2nd argument to be a BigInt value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.modInverse(
        args[1] as BigInt,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.modInverse function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.modInverse function expects 2 argument(s) (the BigInt object + modInverse args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_gcd(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! BigInt) {
        throw ArgumentError(
            'The dart/BigInt.gcd function expects its 2nd argument to be a BigInt value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.gcd(
        args[1] as BigInt,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.gcd function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.gcd function expects 2 argument(s) (the BigInt object + gcd args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_toUnsigned(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/BigInt.toUnsigned function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toUnsigned(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.toUnsigned function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.toUnsigned function expects 2 argument(s) (the BigInt object + toUnsigned args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_toSigned(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/BigInt.toSigned function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toSigned(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.toSigned function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.toSigned function expects 2 argument(s) (the BigInt object + toSigned args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_BigInt_isValidInt(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.isValidInt;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.isValidInt function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.isValidInt function expects 1 argument(s) (the BigInt object + isValidInt args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_BigInt_toInt(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.toInt();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.toInt function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.toInt function expects 1 argument(s) (the BigInt object + toInt args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_BigInt_toDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.toDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.toDouble function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.toDouble function expects 1 argument(s) (the BigInt object + toDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_BigInt_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is BigInt) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.toString function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.toString function expects 1 argument(s) (the BigInt object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_BigInt_toRadixString(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is BigInt) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/BigInt.toRadixString function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toRadixString(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/BigInt.toRadixString function expects its first argument to be a BigInt object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/BigInt.toRadixString function expects 2 argument(s) (the BigInt object + toRadixString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
BigInt? dart_BigInt_from(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/BigInt.from function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = BigInt.from(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/BigInt.from function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool dart_DateTime_isUtc(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      return o.isUtc;
    } else {
      throw ArgumentError(
          'The dart/DateTime.isUtc function expects its argument to be a bool but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.isUtc function expects 1 argument of type bool but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/DateTime.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = DateTime.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_tryParse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/DateTime.tryParse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = DateTime.tryParse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.tryParse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_DateTime_isBefore(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! DateTime) {
        throw ArgumentError(
            'The dart/DateTime.isBefore function expects its 2nd argument to be a DateTime value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isBefore(
        args[1] as DateTime,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.isBefore function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.isBefore function expects 2 argument(s) (the DateTime object + isBefore args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_DateTime_isAfter(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! DateTime) {
        throw ArgumentError(
            'The dart/DateTime.isAfter function expects its 2nd argument to be a DateTime value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isAfter(
        args[1] as DateTime,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.isAfter function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.isAfter function expects 2 argument(s) (the DateTime object + isAfter args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_DateTime_isAtSameMomentAs(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! DateTime) {
        throw ArgumentError(
            'The dart/DateTime.isAtSameMomentAs function expects its 2nd argument to be a DateTime value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isAtSameMomentAs(
        args[1] as DateTime,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.isAtSameMomentAs function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.isAtSameMomentAs function expects 2 argument(s) (the DateTime object + isAtSameMomentAs args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_compareTo(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! DateTime) {
        throw ArgumentError(
            'The dart/DateTime.compareTo function expects its 2nd argument to be a DateTime value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.compareTo(
        args[1] as DateTime,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.compareTo function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.compareTo function expects 2 argument(s) (the DateTime object + compareTo args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.hashCode function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.hashCode function expects 1 argument(s) (the DateTime object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_toLocal(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.toLocal();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.toLocal function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.toLocal function expects 1 argument(s) (the DateTime object + toLocal args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_toUtc(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.toUtc();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.toUtc function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.toUtc function expects 1 argument(s) (the DateTime object + toUtc args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_DateTime_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.toString function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.toString function expects 1 argument(s) (the DateTime object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_DateTime_toIso8601String(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.toIso8601String();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.toIso8601String function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.toIso8601String function expects 1 argument(s) (the DateTime object + toIso8601String args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_add(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! Duration) {
        throw ArgumentError(
            'The dart/DateTime.add function expects its 2nd argument to be a Duration value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.add(
        args[1] as Duration,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.add function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.add function expects 2 argument(s) (the DateTime object + add args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_subtract(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! Duration) {
        throw ArgumentError(
            'The dart/DateTime.subtract function expects its 2nd argument to be a Duration value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.subtract(
        args[1] as Duration,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.subtract function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.subtract function expects 2 argument(s) (the DateTime object + subtract args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Duration? dart_DateTime_difference(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is DateTime) {
      if (args[1] is! DateTime) {
        throw ArgumentError(
            'The dart/DateTime.difference function expects its 2nd argument to be a DateTime value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.difference(
        args[1] as DateTime,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.difference function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.difference function expects 2 argument(s) (the DateTime object + difference args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_millisecondsSinceEpoch(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.millisecondsSinceEpoch;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.millisecondsSinceEpoch function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.millisecondsSinceEpoch function expects 1 argument(s) (the DateTime object + millisecondsSinceEpoch args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_microsecondsSinceEpoch(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.microsecondsSinceEpoch;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.microsecondsSinceEpoch function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.microsecondsSinceEpoch function expects 1 argument(s) (the DateTime object + microsecondsSinceEpoch args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_DateTime_timeZoneName(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.timeZoneName;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.timeZoneName function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.timeZoneName function expects 1 argument(s) (the DateTime object + timeZoneName args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Duration? dart_DateTime_timeZoneOffset(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.timeZoneOffset;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.timeZoneOffset function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.timeZoneOffset function expects 1 argument(s) (the DateTime object + timeZoneOffset args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_year(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.year;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.year function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.year function expects 1 argument(s) (the DateTime object + year args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_month(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.month;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.month function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.month function expects 1 argument(s) (the DateTime object + month args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_day(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.day;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.day function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.day function expects 1 argument(s) (the DateTime object + day args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_hour(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.hour;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.hour function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.hour function expects 1 argument(s) (the DateTime object + hour args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_minute(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.minute;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.minute function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.minute function expects 1 argument(s) (the DateTime object + minute args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_second(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.second;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.second function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.second function expects 1 argument(s) (the DateTime object + second args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_millisecond(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.millisecond;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.millisecond function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.millisecond function expects 1 argument(s) (the DateTime object + millisecond args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_microsecond(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.microsecond;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.microsecond function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.microsecond function expects 1 argument(s) (the DateTime object + microsecond args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_DateTime_weekday(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is DateTime) {
      final returnValue = o.weekday;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/DateTime.weekday function expects its first argument to be a DateTime object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/DateTime.weekday function expects 1 argument(s) (the DateTime object + weekday args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/DateTime. function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = DateTime(
      args[0] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime. function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime__full(PLEnv env, PLVector args) {
  if (args.length == 8) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
    }
    if (args[3] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 4th argument to be a int value, but received a ${typeString(args[3])} value.');
    }
    if (args[4] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 5th argument to be a int value, but received a ${typeString(args[4])} value.');
    }
    if (args[5] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 6th argument to be a int value, but received a ${typeString(args[5])} value.');
    }
    if (args[6] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 7th argument to be a int value, but received a ${typeString(args[6])} value.');
    }
    if (args[7] is! int) {
      throw ArgumentError(
          'The dart/DateTime.-full function expects its 8th argument to be a int value, but received a ${typeString(args[7])} value.');
    }

    final returnValue = DateTime(
      args[0] as int,
      args[1] as int,
      args[2] as int,
      args[3] as int,
      args[4] as int,
      args[5] as int,
      args[6] as int,
      args[7] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.-full function expects 8 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_utc(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = DateTime.utc(
      args[0] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.utc function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_utc_full(PLEnv env, PLVector args) {
  if (args.length == 8) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
    }
    if (args[3] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 4th argument to be a int value, but received a ${typeString(args[3])} value.');
    }
    if (args[4] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 5th argument to be a int value, but received a ${typeString(args[4])} value.');
    }
    if (args[5] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 6th argument to be a int value, but received a ${typeString(args[5])} value.');
    }
    if (args[6] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 7th argument to be a int value, but received a ${typeString(args[6])} value.');
    }
    if (args[7] is! int) {
      throw ArgumentError(
          'The dart/DateTime.utc-full function expects its 8th argument to be a int value, but received a ${typeString(args[7])} value.');
    }

    final returnValue = DateTime.utc(
      args[0] as int,
      args[1] as int,
      args[2] as int,
      args[3] as int,
      args[4] as int,
      args[5] as int,
      args[6] as int,
      args[7] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.utc-full function expects 8 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_now(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = DateTime.now();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.now function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_fromMillisecondsSinceEpoch(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/DateTime.fromMillisecondsSinceEpoch function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = DateTime.fromMillisecondsSinceEpoch(
      args[0] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.fromMillisecondsSinceEpoch function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
DateTime? dart_DateTime_fromMicrosecondsSinceEpoch(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/DateTime.fromMicrosecondsSinceEpoch function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = DateTime.fromMicrosecondsSinceEpoch(
      args[0] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/DateTime.fromMicrosecondsSinceEpoch function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_remainder(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is double) {
      if (args[1] is! num) {
        throw ArgumentError(
            'The dart/double.remainder function expects its 2nd argument to be a num value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.remainder(
        args[1] as num,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.remainder function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.remainder function expects 2 argument(s) (the double object + remainder args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_abs(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.abs();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.abs function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.abs function expects 1 argument(s) (the double object + abs args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_sign(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.sign;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.sign function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.sign function expects 1 argument(s) (the double object + sign args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_double_round(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.round();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.round function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.round function expects 1 argument(s) (the double object + round args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_double_floor(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.floor();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.floor function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.floor function expects 1 argument(s) (the double object + floor args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_double_ceil(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.ceil();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.ceil function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.ceil function expects 1 argument(s) (the double object + ceil args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_double_truncate(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.truncate();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.truncate function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.truncate function expects 1 argument(s) (the double object + truncate args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_roundToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.roundToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.roundToDouble function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.roundToDouble function expects 1 argument(s) (the double object + roundToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_floorToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.floorToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.floorToDouble function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.floorToDouble function expects 1 argument(s) (the double object + floorToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_ceilToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.ceilToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.ceilToDouble function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.ceilToDouble function expects 1 argument(s) (the double object + ceilToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_truncateToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.truncateToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.truncateToDouble function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.truncateToDouble function expects 1 argument(s) (the double object + truncateToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_double_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is double) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/double.toString function expects its first argument to be a double object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/double.toString function expects 1 argument(s) (the double object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/double.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = double.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/double.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_parse_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/double.parse-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! double Function(String)) {
      throw ArgumentError(
          'The dart/double.parse-full function expects its 2nd argument to be a (dart.core.String) -> dart.core.double value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = double.parse(
      args[0] as String,
      args[1] as double Function(String),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/double.parse-full function expects 2 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_double_tryParse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/double.tryParse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = double.tryParse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/double.tryParse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_inDays(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.inDays;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.inDays function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.inDays function expects 1 argument(s) (the Duration object + inDays args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_inHours(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.inHours;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.inHours function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.inHours function expects 1 argument(s) (the Duration object + inHours args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_inMinutes(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.inMinutes;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.inMinutes function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.inMinutes function expects 1 argument(s) (the Duration object + inMinutes args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_inSeconds(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.inSeconds;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.inSeconds function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.inSeconds function expects 1 argument(s) (the Duration object + inSeconds args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_inMilliseconds(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.inMilliseconds;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.inMilliseconds function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.inMilliseconds function expects 1 argument(s) (the Duration object + inMilliseconds args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_inMicroseconds(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.inMicroseconds;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.inMicroseconds function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.inMicroseconds function expects 1 argument(s) (the Duration object + inMicroseconds args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.hashCode function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.hashCode function expects 1 argument(s) (the Duration object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Duration_compareTo(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Duration) {
      if (args[1] is! Duration) {
        throw ArgumentError(
            'The dart/Duration.compareTo function expects its 2nd argument to be a Duration value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.compareTo(
        args[1] as Duration,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.compareTo function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.compareTo function expects 2 argument(s) (the Duration object + compareTo args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Duration_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.toString function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.toString function expects 1 argument(s) (the Duration object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Duration_isNegative(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.isNegative;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.isNegative function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.isNegative function expects 1 argument(s) (the Duration object + isNegative args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Duration? dart_Duration_abs(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Duration) {
      final returnValue = o.abs();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Duration.abs function expects its first argument to be a Duration object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Duration.abs function expects 1 argument(s) (the Duration object + abs args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Duration? dart_Duration_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Duration();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Duration. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Enum_index(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Enum) {
      final returnValue = o.index;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Enum.index function expects its first argument to be a Enum object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Enum.index function expects 1 argument(s) (the Enum object + index args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
dynamic dart_Function_apply(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! Function) {
      throw ArgumentError(
          'The dart/Function.apply function expects its 1st argument to be a Function value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! List) {
      throw ArgumentError(
          'The dart/Function.apply function expects its 2nd argument to be a List value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = Function.apply(
      args[0] as Function,
      List<dynamic>.from(args[1] as List<Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Function.apply function expects 2 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
dynamic dart_Function_apply_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! Function) {
      throw ArgumentError(
          'The dart/Function.apply-full function expects its 1st argument to be a Function value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! List) {
      throw ArgumentError(
          'The dart/Function.apply-full function expects its 2nd argument to be a List value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Map) {
      throw ArgumentError(
          'The dart/Function.apply-full function expects its 3rd argument to be a Map value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Function.apply(
      args[0] as Function,
      List<dynamic>.from(args[1] as List<Object?>),
      Map<Symbol, dynamic>.from(args[2] as Map<Object?, Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Function.apply-full function expects 3 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Function_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Function) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Function.hashCode function expects its first argument to be a Function object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Function.hashCode function expects 1 argument(s) (the Function object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_modPow(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is int) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/int.modPow function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/int.modPow function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.modPow(
        args[1] as int,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.modPow function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.modPow function expects 3 argument(s) (the int object + modPow args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_modInverse(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is int) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/int.modInverse function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.modInverse(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.modInverse function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.modInverse function expects 2 argument(s) (the int object + modInverse args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_gcd(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is int) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/int.gcd function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.gcd(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.gcd function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.gcd function expects 2 argument(s) (the int object + gcd args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_int_isEven(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.isEven;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.isEven function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.isEven function expects 1 argument(s) (the int object + isEven args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_int_isOdd(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.isOdd;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.isOdd function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.isOdd function expects 1 argument(s) (the int object + isOdd args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_bitLength(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.bitLength;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.bitLength function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.bitLength function expects 1 argument(s) (the int object + bitLength args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_toUnsigned(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is int) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/int.toUnsigned function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toUnsigned(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.toUnsigned function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.toUnsigned function expects 2 argument(s) (the int object + toUnsigned args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_toSigned(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is int) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/int.toSigned function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toSigned(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.toSigned function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.toSigned function expects 2 argument(s) (the int object + toSigned args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_abs(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.abs();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.abs function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.abs function expects 1 argument(s) (the int object + abs args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_sign(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.sign;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.sign function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.sign function expects 1 argument(s) (the int object + sign args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_round(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.round();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.round function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.round function expects 1 argument(s) (the int object + round args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_floor(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.floor();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.floor function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.floor function expects 1 argument(s) (the int object + floor args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_ceil(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.ceil();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.ceil function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.ceil function expects 1 argument(s) (the int object + ceil args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_truncate(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.truncate();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.truncate function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.truncate function expects 1 argument(s) (the int object + truncate args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_int_roundToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.roundToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.roundToDouble function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.roundToDouble function expects 1 argument(s) (the int object + roundToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_int_floorToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.floorToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.floorToDouble function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.floorToDouble function expects 1 argument(s) (the int object + floorToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_int_ceilToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.ceilToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.ceilToDouble function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.ceilToDouble function expects 1 argument(s) (the int object + ceilToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_int_truncateToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.truncateToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.truncateToDouble function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.truncateToDouble function expects 1 argument(s) (the int object + truncateToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_int_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is int) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.toString function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.toString function expects 1 argument(s) (the int object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_int_toRadixString(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is int) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/int.toRadixString function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toRadixString(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/int.toRadixString function expects its first argument to be a int object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/int.toRadixString function expects 2 argument(s) (the int object + toRadixString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/int.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = int.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/int.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_tryParse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/int.tryParse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = int.tryParse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/int.tryParse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_int_fromEnvironment(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/int.fromEnvironment function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = int.fromEnvironment(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/int.fromEnvironment function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Symbol? dart_Invocation_memberName(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.memberName;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Invocation.memberName function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.memberName function expects 1 argument(s) (the Invocation object + memberName args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Invocation_typeArguments(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.typeArguments;
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/Invocation.typeArguments function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.typeArguments function expects 1 argument(s) (the Invocation object + typeArguments args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Invocation_positionalArguments(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.positionalArguments;
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/Invocation.positionalArguments function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.positionalArguments function expects 1 argument(s) (the Invocation object + positionalArguments args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Invocation_namedArguments(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.namedArguments;
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/Invocation.namedArguments function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.namedArguments function expects 1 argument(s) (the Invocation object + namedArguments args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Invocation_isMethod(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.isMethod;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Invocation.isMethod function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.isMethod function expects 1 argument(s) (the Invocation object + isMethod args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Invocation_isGetter(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.isGetter;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Invocation.isGetter function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.isGetter function expects 1 argument(s) (the Invocation object + isGetter args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Invocation_isSetter(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.isSetter;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Invocation.isSetter function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.isSetter function expects 1 argument(s) (the Invocation object + isSetter args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Invocation_isAccessor(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Invocation) {
      final returnValue = o.isAccessor;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Invocation.isAccessor function expects its first argument to be a Invocation object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Invocation.isAccessor function expects 1 argument(s) (the Invocation object + isAccessor args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Invocation? dart_Invocation_method(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! Symbol) {
      throw ArgumentError(
          'The dart/Invocation.method function expects its 1st argument to be a Symbol value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Iterable) {
      throw ArgumentError(
          'The dart/Invocation.method function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = Invocation.method(
      args[0] as Symbol,
      args[1] as Iterable<Object>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Invocation.method function expects 2 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Invocation? dart_Invocation_method_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! Symbol) {
      throw ArgumentError(
          'The dart/Invocation.method-full function expects its 1st argument to be a Symbol value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Iterable) {
      throw ArgumentError(
          'The dart/Invocation.method-full function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Map) {
      throw ArgumentError(
          'The dart/Invocation.method-full function expects its 3rd argument to be a Map value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Invocation.method(
      args[0] as Symbol,
      args[1] as Iterable<Object>,
      Map<Symbol, Object>.from(args[2] as Map<Object?, Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Invocation.method-full function expects 3 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Invocation? dart_Invocation_genericMethod(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! Symbol) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod function expects its 1st argument to be a Symbol value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Iterable) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Iterable) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod function expects its 3rd argument to be a Iterable value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Invocation.genericMethod(
      args[0] as Symbol,
      args[1] as Iterable<Type>,
      args[2] as Iterable<Object>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Invocation.genericMethod function expects 3 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Invocation? dart_Invocation_genericMethod_full(PLEnv env, PLVector args) {
  if (args.length == 4) {
    if (args[0] is! Symbol) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod-full function expects its 1st argument to be a Symbol value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Iterable) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod-full function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Iterable) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod-full function expects its 3rd argument to be a Iterable value, but received a ${typeString(args[2])} value.');
    }
    if (args[3] is! Map) {
      throw ArgumentError(
          'The dart/Invocation.genericMethod-full function expects its 4th argument to be a Map value, but received a ${typeString(args[3])} value.');
    }

    final returnValue = Invocation.genericMethod(
      args[0] as Symbol,
      args[1] as Iterable<Type>,
      args[2] as Iterable<Object>,
      Map<Symbol, Object>.from(args[3] as Map<Object?, Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Invocation.genericMethod-full function expects 4 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Invocation? dart_Invocation_getter(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Symbol) {
      throw ArgumentError(
          'The dart/Invocation.getter function expects its 1st argument to be a Symbol value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Invocation.getter(
      args[0] as Symbol,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Invocation.getter function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Invocation? dart_Invocation_setter(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! Symbol) {
      throw ArgumentError(
          'The dart/Invocation.setter function expects its 1st argument to be a Symbol value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Object) {
      throw ArgumentError(
          'The dart/Invocation.setter function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = Invocation.setter(
      args[0] as Symbol,
      args[1] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Invocation.setter function expects 2 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_castFrom(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/Iterable.castFrom function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Iterable.castFrom(
      args[0] as Iterable<dynamic>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Iterable.castFrom function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterator? dart_Iterable_iterator(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.iterator;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.iterator function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.iterator function expects 1 argument(s) (the Iterable object + iterator args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_cast(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.cast();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.cast function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.cast function expects 1 argument(s) (the Iterable object + cast args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_map(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! dynamic Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.map function expects its 2nd argument to be a (dynamic) -> dynamic value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.map(
        args[1] as dynamic Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.map function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.map function expects 2 argument(s) (the Iterable object + map args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_where(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.where function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.where(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.where function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.where function expects 2 argument(s) (the Iterable object + where args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_whereType(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.whereType();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.whereType function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.whereType function expects 1 argument(s) (the Iterable object + whereType args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_expand(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! Iterable Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.expand function expects its 2nd argument to be a (dynamic) -> dart.core.Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.expand(
        args[1] as Iterable Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.expand function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.expand function expects 2 argument(s) (the Iterable object + expand args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Iterable_contains(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/Iterable.contains function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.contains(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.contains function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.contains function expects 2 argument(s) (the Iterable object + contains args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Iterable_forEach(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! void Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.forEach function expects its 2nd argument to be a (dynamic) -> void value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.forEach(
        args[1] as void Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.forEach function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.forEach function expects 2 argument(s) (the Iterable object + forEach args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
dynamic dart_Iterable_fold(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! dynamic) {
        throw ArgumentError(
            'The dart/Iterable.fold function expects its 2nd argument to be a dynamic value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! dynamic Function(dynamic, dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.fold function expects its 3rd argument to be a (dynamic, dynamic) -> dynamic value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.fold(
        args[1] as dynamic,
        args[2] as dynamic Function(dynamic, dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.fold function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.fold function expects 3 argument(s) (the Iterable object + fold args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Iterable_every(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.every function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.every(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.every function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.every function expects 2 argument(s) (the Iterable object + every args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Iterable_join(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.join();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.join function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.join function expects 1 argument(s) (the Iterable object + join args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Iterable_join_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Iterable.join-full function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.join(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.join-full function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.join-full function expects 2 argument(s) (the Iterable object + join args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Iterable_any(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.any function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.any(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.any function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.any function expects 2 argument(s) (the Iterable object + any args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Iterable_toList(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.toList();
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/Iterable.toList function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.toList function expects 1 argument(s) (the Iterable object + toList args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Iterable_toSet(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.toSet();
      return returnValue.toISet();
    } else {
      throw ArgumentError(
          'The dart/Iterable.toSet function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.toSet function expects 1 argument(s) (the Iterable object + toSet args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Iterable_length(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.length;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.length function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.length function expects 1 argument(s) (the Iterable object + length args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Iterable_isEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.isEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.isEmpty function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.isEmpty function expects 1 argument(s) (the Iterable object + isEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Iterable_isNotEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.isNotEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.isNotEmpty function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.isNotEmpty function expects 1 argument(s) (the Iterable object + isNotEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_take(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/Iterable.take function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.take(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.take function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.take function expects 2 argument(s) (the Iterable object + take args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_takeWhile(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.takeWhile function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.takeWhile(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.takeWhile function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.takeWhile function expects 2 argument(s) (the Iterable object + takeWhile args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_skip(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/Iterable.skip function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.skip(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.skip function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.skip function expects 2 argument(s) (the Iterable object + skip args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_skipWhile(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Iterable) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Iterable.skipWhile function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.skipWhile(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.skipWhile function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.skipWhile function expects 2 argument(s) (the Iterable object + skipWhile args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Iterable_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterable) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterable.toString function expects its first argument to be a Iterable object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterable.toString function expects 1 argument(s) (the Iterable object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Iterable_empty(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Iterable.empty();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Iterable.empty function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Iterator_moveNext(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Iterator) {
      final returnValue = o.moveNext();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Iterator.moveNext function expects its first argument to be a Iterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Iterator.moveNext function expects 1 argument(s) (the Iterator object + moveNext args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_castFrom(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/List.castFrom function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = List.castFrom(
      List<dynamic>.from(args[0] as List<Object?>),
    );
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/List.castFrom function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_copyRange(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/List.copyRange function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/List.copyRange function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! List) {
      throw ArgumentError(
          'The dart/List.copyRange function expects its 3rd argument to be a List value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = List.copyRange(
      List<dynamic>.from(args[0] as List<Object?>),
      args[1] as int,
      List<dynamic>.from(args[2] as List<Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/List.copyRange function expects 3 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_copyRange_full(PLEnv env, PLVector args) {
  if (args.length == 5) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/List.copyRange-full function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/List.copyRange-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! List) {
      throw ArgumentError(
          'The dart/List.copyRange-full function expects its 3rd argument to be a List value, but received a ${typeString(args[2])} value.');
    }
    if (args[3] is! int) {
      throw ArgumentError(
          'The dart/List.copyRange-full function expects its 4th argument to be a int value, but received a ${typeString(args[3])} value.');
    }
    if (args[4] is! int) {
      throw ArgumentError(
          'The dart/List.copyRange-full function expects its 5th argument to be a int value, but received a ${typeString(args[4])} value.');
    }

    final returnValue = List.copyRange(
      List<dynamic>.from(args[0] as List<Object?>),
      args[1] as int,
      List<dynamic>.from(args[2] as List<Object?>),
      args[3] as int,
      args[4] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/List.copyRange-full function expects 5 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_writeIterable(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/List.writeIterable function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/List.writeIterable function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Iterable) {
      throw ArgumentError(
          'The dart/List.writeIterable function expects its 3rd argument to be a Iterable value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = List.writeIterable(
      List<dynamic>.from(args[0] as List<Object?>),
      args[1] as int,
      args[2] as Iterable<dynamic>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/List.writeIterable function expects 3 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_cast(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.cast();
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/List.cast function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.cast function expects 1 argument(s) (the List object + cast args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_List_length(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.length;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.length function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.length function expects 1 argument(s) (the List object + length args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_List_reversed(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.reversed;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.reversed function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.reversed function expects 1 argument(s) (the List object + reversed args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_sort(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.sort();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.sort function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.sort function expects 1 argument(s) (the List object + sort args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_sort_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! int Function(dynamic, dynamic)) {
        throw ArgumentError(
            'The dart/List.sort-full function expects its 2nd argument to be a (dynamic, dynamic) -> dart.core.int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.sort(
        args[1] as int Function(dynamic, dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.sort-full function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.sort-full function expects 2 argument(s) (the List object + sort args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_shuffle(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.shuffle();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.shuffle function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.shuffle function expects 1 argument(s) (the List object + shuffle args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_shuffle_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! Random) {
        throw ArgumentError(
            'The dart/List.shuffle-full function expects its 2nd argument to be a Random value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.shuffle(
        args[1] as Random,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.shuffle-full function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.shuffle-full function expects 2 argument(s) (the List object + shuffle args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_List_indexWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/List.indexWhere function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.indexWhere(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.indexWhere function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.indexWhere function expects 2 argument(s) (the List object + indexWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_List_indexWhere_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/List.indexWhere-full function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/List.indexWhere-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.indexWhere(
        args[1] as bool Function(dynamic),
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.indexWhere-full function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.indexWhere-full function expects 3 argument(s) (the List object + indexWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_List_lastIndexWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/List.lastIndexWhere function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.lastIndexWhere(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.lastIndexWhere function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.lastIndexWhere function expects 2 argument(s) (the List object + lastIndexWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_List_lastIndexWhere_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/List.lastIndexWhere-full function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/List.lastIndexWhere-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.lastIndexWhere(
        args[1] as bool Function(dynamic),
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.lastIndexWhere-full function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.lastIndexWhere-full function expects 3 argument(s) (the List object + lastIndexWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_clear(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.clear();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.clear function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.clear function expects 1 argument(s) (the List object + clear args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_List_remove(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/List.remove function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.remove(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.remove function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.remove function expects 2 argument(s) (the List object + remove args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_removeWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/List.removeWhere function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.removeWhere(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.removeWhere function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.removeWhere function expects 2 argument(s) (the List object + removeWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_retainWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/List.retainWhere function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.retainWhere(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.retainWhere function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.retainWhere function expects 2 argument(s) (the List object + retainWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_sublist(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/List.sublist function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.sublist(
        args[1] as int,
      );
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/List.sublist function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.sublist function expects 2 argument(s) (the List object + sublist args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_sublist_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/List.sublist-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/List.sublist-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.sublist(
        args[1] as int,
        args[2] as int,
      );
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/List.sublist-full function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.sublist-full function expects 3 argument(s) (the List object + sublist args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_List_getRange(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/List.getRange function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/List.getRange function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.getRange(
        args[1] as int,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.getRange function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.getRange function expects 3 argument(s) (the List object + getRange args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_List_removeRange(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is List) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/List.removeRange function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/List.removeRange function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.removeRange(
        args[1] as int,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/List.removeRange function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.removeRange function expects 3 argument(s) (the List object + removeRange args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_List_asMap(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is List) {
      final returnValue = o.asMap();
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/List.asMap function expects its first argument to be a List object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/List.asMap function expects 1 argument(s) (the List object + asMap args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_empty(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = List.empty();
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/List.empty function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_from(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/List.from function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = List.from(
      args[0] as Iterable<dynamic>,
    );
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/List.from function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_List_unmodifiable(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/List.unmodifiable function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = List.unmodifiable(
      args[0] as Iterable<dynamic>,
    );
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/List.unmodifiable function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_castFrom(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Map) {
      throw ArgumentError(
          'The dart/Map.castFrom function expects its 1st argument to be a Map value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Map.castFrom(
      Map<dynamic, dynamic>.from(args[0] as Map<Object?, Object?>),
    );
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Map.castFrom function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_cast(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.cast();
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/Map.cast function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.cast function expects 1 argument(s) (the Map object + cast args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Map_containsValue(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Map) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/Map.containsValue function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.containsValue(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.containsValue function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.containsValue function expects 2 argument(s) (the Map object + containsValue args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Map_containsKey(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Map) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/Map.containsKey function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.containsKey(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.containsKey function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.containsKey function expects 2 argument(s) (the Map object + containsKey args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Map_entries(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.entries;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.entries function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.entries function expects 1 argument(s) (the Map object + entries args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_map(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Map) {
      if (args[1] is! MapEntry Function(dynamic, dynamic)) {
        throw ArgumentError(
            'The dart/Map.map function expects its 2nd argument to be a (dynamic, dynamic) -> dart.core.MapEntry value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.map(
        args[1] as MapEntry Function(dynamic, dynamic),
      );
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/Map.map function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.map function expects 2 argument(s) (the Map object + map args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Map_addEntries(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Map) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/Map.addEntries function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.addEntries(
        args[1] as Iterable<MapEntry>,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.addEntries function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.addEntries function expects 2 argument(s) (the Map object + addEntries args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Map_removeWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Map) {
      if (args[1] is! bool Function(dynamic, dynamic)) {
        throw ArgumentError(
            'The dart/Map.removeWhere function expects its 2nd argument to be a (dynamic, dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.removeWhere(
        args[1] as bool Function(dynamic, dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.removeWhere function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.removeWhere function expects 2 argument(s) (the Map object + removeWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Map_clear(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.clear();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.clear function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.clear function expects 1 argument(s) (the Map object + clear args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Map_forEach(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Map) {
      if (args[1] is! void Function(dynamic, dynamic)) {
        throw ArgumentError(
            'The dart/Map.forEach function expects its 2nd argument to be a (dynamic, dynamic) -> void value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.forEach(
        args[1] as void Function(dynamic, dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.forEach function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.forEach function expects 2 argument(s) (the Map object + forEach args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Map_keys(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.keys;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.keys function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.keys function expects 1 argument(s) (the Map object + keys args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Map_values(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.values;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.values function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.values function expects 1 argument(s) (the Map object + values args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Map_length(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.length;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.length function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.length function expects 1 argument(s) (the Map object + length args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Map_isEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.isEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.isEmpty function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.isEmpty function expects 1 argument(s) (the Map object + isEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Map_isNotEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Map) {
      final returnValue = o.isNotEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Map.isNotEmpty function expects its first argument to be a Map object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Map.isNotEmpty function expects 1 argument(s) (the Map object + isNotEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_from(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Map) {
      throw ArgumentError(
          'The dart/Map.from function expects its 1st argument to be a Map value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Map.from(
      Map<dynamic, dynamic>.from(args[0] as Map<Object?, Object?>),
    );
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Map.from function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_unmodifiable(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Map) {
      throw ArgumentError(
          'The dart/Map.unmodifiable function expects its 1st argument to be a Map value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Map.unmodifiable(
      Map<dynamic, dynamic>.from(args[0] as Map<Object?, Object?>),
    );
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Map.unmodifiable function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_identity(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Map.identity();
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Map.identity function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_fromIterable(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/Map.fromIterable function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Map.fromIterable(
      args[0] as Iterable<dynamic>,
    );
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Map.fromIterable function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Map_fromEntries(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/Map.fromEntries function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Map.fromEntries(
      args[0] as Iterable<MapEntry>,
    );
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Map.fromEntries function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Match_start(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Match) {
      final returnValue = o.start;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Match.start function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.start function expects 1 argument(s) (the Match object + start args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Match_end(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Match) {
      final returnValue = o.end;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Match.end function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.end function expects 1 argument(s) (the Match object + end args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Match_group(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Match) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/Match.group function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.group(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Match.group function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.group function expects 2 argument(s) (the Match object + group args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Match_groups(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Match) {
      if (args[1] is! List) {
        throw ArgumentError(
            'The dart/Match.groups function expects its 2nd argument to be a List value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.groups(
        List<int>.from(args[1] as List<Object?>),
      );
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/Match.groups function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.groups function expects 2 argument(s) (the Match object + groups args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Match_groupCount(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Match) {
      final returnValue = o.groupCount;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Match.groupCount function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.groupCount function expects 1 argument(s) (the Match object + groupCount args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Match_input(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Match) {
      final returnValue = o.input;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Match.input function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.input function expects 1 argument(s) (the Match object + input args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Pattern? dart_Match_pattern(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Match) {
      final returnValue = o.pattern;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Match.pattern function expects its first argument to be a Match object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Match.pattern function expects 1 argument(s) (the Match object + pattern args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.hashCode function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.hashCode function expects 1 argument(s) (the num object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_compareTo(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is num) {
      if (args[1] is! num) {
        throw ArgumentError(
            'The dart/num.compareTo function expects its 2nd argument to be a num value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.compareTo(
        args[1] as num,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.compareTo function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.compareTo function expects 2 argument(s) (the num object + compareTo args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_remainder(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is num) {
      if (args[1] is! num) {
        throw ArgumentError(
            'The dart/num.remainder function expects its 2nd argument to be a num value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.remainder(
        args[1] as num,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.remainder function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.remainder function expects 2 argument(s) (the num object + remainder args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_num_isNaN(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.isNaN;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.isNaN function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.isNaN function expects 1 argument(s) (the num object + isNaN args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_num_isNegative(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.isNegative;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.isNegative function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.isNegative function expects 1 argument(s) (the num object + isNegative args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_num_isInfinite(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.isInfinite;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.isInfinite function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.isInfinite function expects 1 argument(s) (the num object + isInfinite args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_num_isFinite(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.isFinite;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.isFinite function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.isFinite function expects 1 argument(s) (the num object + isFinite args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_abs(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.abs();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.abs function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.abs function expects 1 argument(s) (the num object + abs args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_sign(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.sign;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.sign function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.sign function expects 1 argument(s) (the num object + sign args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_round(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.round();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.round function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.round function expects 1 argument(s) (the num object + round args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_floor(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.floor();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.floor function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.floor function expects 1 argument(s) (the num object + floor args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_ceil(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.ceil();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.ceil function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.ceil function expects 1 argument(s) (the num object + ceil args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_truncate(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.truncate();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.truncate function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.truncate function expects 1 argument(s) (the num object + truncate args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_num_roundToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.roundToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.roundToDouble function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.roundToDouble function expects 1 argument(s) (the num object + roundToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_num_floorToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.floorToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.floorToDouble function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.floorToDouble function expects 1 argument(s) (the num object + floorToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_num_ceilToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.ceilToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.ceilToDouble function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.ceilToDouble function expects 1 argument(s) (the num object + ceilToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_num_truncateToDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.truncateToDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.truncateToDouble function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.truncateToDouble function expects 1 argument(s) (the num object + truncateToDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_clamp(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is num) {
      if (args[1] is! num) {
        throw ArgumentError(
            'The dart/num.clamp function expects its 2nd argument to be a num value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! num) {
        throw ArgumentError(
            'The dart/num.clamp function expects its 3rd argument to be a num value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.clamp(
        args[1] as num,
        args[2] as num,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.clamp function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.clamp function expects 3 argument(s) (the num object + clamp args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_num_toInt(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.toInt();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toInt function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toInt function expects 1 argument(s) (the num object + toInt args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_num_toDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.toDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toDouble function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toDouble function expects 1 argument(s) (the num object + toDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_num_toStringAsFixed(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is num) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/num.toStringAsFixed function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toStringAsFixed(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toStringAsFixed function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toStringAsFixed function expects 2 argument(s) (the num object + toStringAsFixed args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_num_toStringAsExponential(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.toStringAsExponential();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toStringAsExponential function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toStringAsExponential function expects 1 argument(s) (the num object + toStringAsExponential args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_num_toStringAsExponential_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is num) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/num.toStringAsExponential-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toStringAsExponential(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toStringAsExponential-full function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toStringAsExponential-full function expects 2 argument(s) (the num object + toStringAsExponential args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_num_toStringAsPrecision(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is num) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/num.toStringAsPrecision function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.toStringAsPrecision(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toStringAsPrecision function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toStringAsPrecision function expects 2 argument(s) (the num object + toStringAsPrecision args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_num_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is num) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/num.toString function expects its first argument to be a num object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/num.toString function expects 1 argument(s) (the num object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/num.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = num.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/num.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_parse_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/num.parse-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! num Function(String)) {
      throw ArgumentError(
          'The dart/num.parse-full function expects its 2nd argument to be a (dart.core.String) -> dart.core.num value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = num.parse(
      args[0] as String,
      args[1] as num Function(String),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/num.parse-full function expects 2 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_num_tryParse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/num.tryParse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = num.tryParse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/num.tryParse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Object_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Object) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Object.hashCode function expects its first argument to be a Object object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Object.hashCode function expects 1 argument(s) (the Object object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Object_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Object) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Object.toString function expects its first argument to be a Object object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Object.toString function expects 1 argument(s) (the Object object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
dynamic dart_Object_noSuchMethod(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Object) {
      if (args[1] is! Invocation) {
        throw ArgumentError(
            'The dart/Object.noSuchMethod function expects its 2nd argument to be a Invocation value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.noSuchMethod(
        args[1] as Invocation,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Object.noSuchMethod function expects its first argument to be a Object object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Object.noSuchMethod function expects 2 argument(s) (the Object object + noSuchMethod args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Type? dart_Object_runtimeType(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Object) {
      final returnValue = o.runtimeType;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Object.runtimeType function expects its first argument to be a Object object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Object.runtimeType function expects 1 argument(s) (the Object object + runtimeType args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Object_hash(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = Object.hash(
      args[0] as Object,
      args[1] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Object.hash function expects 2 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Object_hash_full(PLEnv env, PLVector args) {
  if (args.length == 20) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 3rd argument to be a Object value, but received a ${typeString(args[2])} value.');
    }
    if (args[3] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 4th argument to be a Object value, but received a ${typeString(args[3])} value.');
    }
    if (args[4] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 5th argument to be a Object value, but received a ${typeString(args[4])} value.');
    }
    if (args[5] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 6th argument to be a Object value, but received a ${typeString(args[5])} value.');
    }
    if (args[6] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 7th argument to be a Object value, but received a ${typeString(args[6])} value.');
    }
    if (args[7] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 8th argument to be a Object value, but received a ${typeString(args[7])} value.');
    }
    if (args[8] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 9th argument to be a Object value, but received a ${typeString(args[8])} value.');
    }
    if (args[9] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 10th argument to be a Object value, but received a ${typeString(args[9])} value.');
    }
    if (args[10] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 11th argument to be a Object value, but received a ${typeString(args[10])} value.');
    }
    if (args[11] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 12th argument to be a Object value, but received a ${typeString(args[11])} value.');
    }
    if (args[12] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 13th argument to be a Object value, but received a ${typeString(args[12])} value.');
    }
    if (args[13] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 14th argument to be a Object value, but received a ${typeString(args[13])} value.');
    }
    if (args[14] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 15th argument to be a Object value, but received a ${typeString(args[14])} value.');
    }
    if (args[15] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 16th argument to be a Object value, but received a ${typeString(args[15])} value.');
    }
    if (args[16] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 17th argument to be a Object value, but received a ${typeString(args[16])} value.');
    }
    if (args[17] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 18th argument to be a Object value, but received a ${typeString(args[17])} value.');
    }
    if (args[18] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 19th argument to be a Object value, but received a ${typeString(args[18])} value.');
    }
    if (args[19] is! Object) {
      throw ArgumentError(
          'The dart/Object.hash-full function expects its 20th argument to be a Object value, but received a ${typeString(args[19])} value.');
    }

    final returnValue = Object.hash(
      args[0] as Object,
      args[1] as Object,
      args[2] as Object,
      args[3] as Object,
      args[4] as Object,
      args[5] as Object,
      args[6] as Object,
      args[7] as Object,
      args[8] as Object,
      args[9] as Object,
      args[10] as Object,
      args[11] as Object,
      args[12] as Object,
      args[13] as Object,
      args[14] as Object,
      args[15] as Object,
      args[16] as Object,
      args[17] as Object,
      args[18] as Object,
      args[19] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Object.hash-full function expects 20 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Object_hashAll(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/Object.hashAll function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Object.hashAll(
      args[0] as Iterable<Object>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Object.hashAll function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Object_hashAllUnordered(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/Object.hashAllUnordered function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Object.hashAllUnordered(
      args[0] as Iterable<Object>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Object.hashAllUnordered function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Object? dart_Object_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Object();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Object. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Pattern_allMatches(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Pattern) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Pattern.allMatches function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.allMatches(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Pattern.allMatches function expects its first argument to be a Pattern object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Pattern.allMatches function expects 2 argument(s) (the Pattern object + allMatches args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_Pattern_allMatches_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is Pattern) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Pattern.allMatches-full function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/Pattern.allMatches-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.allMatches(
        args[1] as String,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Pattern.allMatches-full function expects its first argument to be a Pattern object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Pattern.allMatches-full function expects 3 argument(s) (the Pattern object + allMatches args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Match? dart_Pattern_matchAsPrefix(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Pattern) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Pattern.matchAsPrefix function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.matchAsPrefix(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Pattern.matchAsPrefix function expects its first argument to be a Pattern object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Pattern.matchAsPrefix function expects 2 argument(s) (the Pattern object + matchAsPrefix args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Match? dart_Pattern_matchAsPrefix_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is Pattern) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Pattern.matchAsPrefix-full function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/Pattern.matchAsPrefix-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.matchAsPrefix(
        args[1] as String,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Pattern.matchAsPrefix-full function expects its first argument to be a Pattern object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Pattern.matchAsPrefix-full function expects 3 argument(s) (the Pattern object + matchAsPrefix args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_RegExp_escape(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/RegExp.escape function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = RegExp.escape(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/RegExp.escape function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
RegExpMatch? dart_RegExp_firstMatch(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is RegExp) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/RegExp.firstMatch function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.firstMatch(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.firstMatch function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.firstMatch function expects 2 argument(s) (the RegExp object + firstMatch args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_RegExp_allMatches(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is RegExp) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/RegExp.allMatches function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.allMatches(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.allMatches function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.allMatches function expects 2 argument(s) (the RegExp object + allMatches args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_RegExp_allMatches_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is RegExp) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/RegExp.allMatches-full function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/RegExp.allMatches-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.allMatches(
        args[1] as String,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.allMatches-full function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.allMatches-full function expects 3 argument(s) (the RegExp object + allMatches args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RegExp_hasMatch(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is RegExp) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/RegExp.hasMatch function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.hasMatch(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.hasMatch function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.hasMatch function expects 2 argument(s) (the RegExp object + hasMatch args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_RegExp_stringMatch(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is RegExp) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/RegExp.stringMatch function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.stringMatch(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.stringMatch function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.stringMatch function expects 2 argument(s) (the RegExp object + stringMatch args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_RegExp_pattern(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RegExp) {
      final returnValue = o.pattern;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.pattern function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.pattern function expects 1 argument(s) (the RegExp object + pattern args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RegExp_isMultiLine(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RegExp) {
      final returnValue = o.isMultiLine;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.isMultiLine function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.isMultiLine function expects 1 argument(s) (the RegExp object + isMultiLine args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RegExp_isCaseSensitive(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RegExp) {
      final returnValue = o.isCaseSensitive;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.isCaseSensitive function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.isCaseSensitive function expects 1 argument(s) (the RegExp object + isCaseSensitive args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RegExp_isUnicode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RegExp) {
      final returnValue = o.isUnicode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.isUnicode function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.isUnicode function expects 1 argument(s) (the RegExp object + isUnicode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RegExp_isDotAll(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RegExp) {
      final returnValue = o.isDotAll;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExp.isDotAll function expects its first argument to be a RegExp object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExp.isDotAll function expects 1 argument(s) (the RegExp object + isDotAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
RegExp? dart_RegExp_(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/RegExp. function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = RegExp(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/RegExp. function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_RegExpMatch_namedGroup(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is RegExpMatch) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/RegExpMatch.namedGroup function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.namedGroup(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExpMatch.namedGroup function expects its first argument to be a RegExpMatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExpMatch.namedGroup function expects 2 argument(s) (the RegExpMatch object + namedGroup args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterable? dart_RegExpMatch_groupNames(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RegExpMatch) {
      final returnValue = o.groupNames;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RegExpMatch.groupNames function expects its first argument to be a RegExpMatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RegExpMatch.groupNames function expects 1 argument(s) (the RegExpMatch object + groupNames args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String dart_RuneIterator_string(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      return o.string;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.string function expects its argument to be a String but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.string function expects 1 argument of type String but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_RuneIterator_rawIndex(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.rawIndex;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.rawIndex function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.rawIndex function expects 1 argument(s) (the RuneIterator object + rawIndex args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_RuneIterator_reset(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.reset();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.reset function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.reset function expects 1 argument(s) (the RuneIterator object + reset args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_RuneIterator_reset_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is RuneIterator) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/RuneIterator.reset-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.reset(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.reset-full function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.reset-full function expects 2 argument(s) (the RuneIterator object + reset args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_RuneIterator_current(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.current;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.current function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.current function expects 1 argument(s) (the RuneIterator object + current args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_RuneIterator_currentSize(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.currentSize;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.currentSize function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.currentSize function expects 1 argument(s) (the RuneIterator object + currentSize args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_RuneIterator_currentAsString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.currentAsString;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.currentAsString function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.currentAsString function expects 1 argument(s) (the RuneIterator object + currentAsString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RuneIterator_moveNext(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.moveNext();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.moveNext function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.moveNext function expects 1 argument(s) (the RuneIterator object + moveNext args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_RuneIterator_movePrevious(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is RuneIterator) {
      final returnValue = o.movePrevious();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/RuneIterator.movePrevious function expects its first argument to be a RuneIterator object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.movePrevious function expects 1 argument(s) (the RuneIterator object + movePrevious args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
RuneIterator? dart_RuneIterator_(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/RuneIterator. function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = RuneIterator(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/RuneIterator. function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
RuneIterator? dart_RuneIterator_at(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/RuneIterator.at function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/RuneIterator.at function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = RuneIterator.at(
      args[0] as String,
      args[1] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/RuneIterator.at function expects 2 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String dart_Runes_string(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Runes) {
      return o.string;
    } else {
      throw ArgumentError(
          'The dart/Runes.string function expects its argument to be a String but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Runes.string function expects 1 argument of type String but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
RuneIterator? dart_Runes_iterator(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Runes) {
      final returnValue = o.iterator;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Runes.iterator function expects its first argument to be a Runes object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Runes.iterator function expects 1 argument(s) (the Runes object + iterator args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Runes_last(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Runes) {
      final returnValue = o.last;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Runes.last function expects its first argument to be a Runes object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Runes.last function expects 1 argument(s) (the Runes object + last args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Runes? dart_Runes_(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Runes. function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Runes(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Runes. function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_castFrom(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Set) {
      throw ArgumentError(
          'The dart/Set.castFrom function expects its 1st argument to be a Set value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Set.castFrom(
      Set<dynamic>.from(args[0] as Set<Object?>),
    );
    return returnValue.toISet();
  } else {
    throw ArgumentError(
        'The dart/Set.castFrom function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_cast(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Set) {
      final returnValue = o.cast();
      return returnValue.toISet();
    } else {
      throw ArgumentError(
          'The dart/Set.cast function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.cast function expects 1 argument(s) (the Set object + cast args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Iterator? dart_Set_iterator(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Set) {
      final returnValue = o.iterator;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.iterator function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.iterator function expects 1 argument(s) (the Set object + iterator args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Set_contains(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/Set.contains function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.contains(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.contains function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.contains function expects 2 argument(s) (the Set object + contains args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Set_remove(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/Set.remove function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.remove(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.remove function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.remove function expects 2 argument(s) (the Set object + remove args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Set_removeAll(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/Set.removeAll function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.removeAll(
        args[1] as Iterable<Object>,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.removeAll function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.removeAll function expects 2 argument(s) (the Set object + removeAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Set_retainAll(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/Set.retainAll function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.retainAll(
        args[1] as Iterable<Object>,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.retainAll function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.retainAll function expects 2 argument(s) (the Set object + retainAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Set_removeWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Set.removeWhere function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.removeWhere(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.removeWhere function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.removeWhere function expects 2 argument(s) (the Set object + removeWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Set_retainWhere(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! bool Function(dynamic)) {
        throw ArgumentError(
            'The dart/Set.retainWhere function expects its 2nd argument to be a (dynamic) -> dart.core.bool value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.retainWhere(
        args[1] as bool Function(dynamic),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.retainWhere function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.retainWhere function expects 2 argument(s) (the Set object + retainWhere args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Set_containsAll(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/Set.containsAll function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.containsAll(
        args[1] as Iterable<Object>,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.containsAll function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.containsAll function expects 2 argument(s) (the Set object + containsAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_intersection(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Set) {
        throw ArgumentError(
            'The dart/Set.intersection function expects its 2nd argument to be a Set value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.intersection(
        Set<Object>.from(args[1] as Set<Object?>),
      );
      return returnValue.toISet();
    } else {
      throw ArgumentError(
          'The dart/Set.intersection function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.intersection function expects 2 argument(s) (the Set object + intersection args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_difference(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Set) {
      if (args[1] is! Set) {
        throw ArgumentError(
            'The dart/Set.difference function expects its 2nd argument to be a Set value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.difference(
        Set<Object>.from(args[1] as Set<Object?>),
      );
      return returnValue.toISet();
    } else {
      throw ArgumentError(
          'The dart/Set.difference function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.difference function expects 2 argument(s) (the Set object + difference args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Set_clear(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Set) {
      final returnValue = o.clear();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Set.clear function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.clear function expects 1 argument(s) (the Set object + clear args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_toSet(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Set) {
      final returnValue = o.toSet();
      return returnValue.toISet();
    } else {
      throw ArgumentError(
          'The dart/Set.toSet function expects its first argument to be a Set object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Set.toSet function expects 1 argument(s) (the Set object + toSet args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Set();
    return returnValue.toISet();
  } else {
    throw ArgumentError(
        'The dart/Set. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_identity(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Set.identity();
    return returnValue.toISet();
  } else {
    throw ArgumentError(
        'The dart/Set.identity function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
ISet? dart_Set_from(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/Set.from function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Set.from(
      args[0] as Iterable<dynamic>,
    );
    return returnValue.toISet();
  } else {
    throw ArgumentError(
        'The dart/Set.from function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
StackTrace? dart_StackTrace_current(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = StackTrace.current;
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/StackTrace.current function expects 0 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_StackTrace_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StackTrace) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StackTrace.toString function expects its first argument to be a StackTrace object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StackTrace.toString function expects 1 argument(s) (the StackTrace object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
StackTrace? dart_StackTrace_fromString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/StackTrace.fromString function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = StackTrace.fromString(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/StackTrace.fromString function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Stopwatch_frequency(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.frequency;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.frequency function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.frequency function expects 1 argument(s) (the Stopwatch object + frequency args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Stopwatch_start(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.start();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.start function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.start function expects 1 argument(s) (the Stopwatch object + start args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Stopwatch_stop(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.stop();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.stop function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.stop function expects 1 argument(s) (the Stopwatch object + stop args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_Stopwatch_reset(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.reset();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.reset function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.reset function expects 1 argument(s) (the Stopwatch object + reset args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Stopwatch_elapsedTicks(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.elapsedTicks;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.elapsedTicks function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.elapsedTicks function expects 1 argument(s) (the Stopwatch object + elapsedTicks args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Duration? dart_Stopwatch_elapsed(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.elapsed;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.elapsed function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.elapsed function expects 1 argument(s) (the Stopwatch object + elapsed args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Stopwatch_elapsedMicroseconds(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.elapsedMicroseconds;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.elapsedMicroseconds function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.elapsedMicroseconds function expects 1 argument(s) (the Stopwatch object + elapsedMicroseconds args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Stopwatch_elapsedMilliseconds(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.elapsedMilliseconds;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.elapsedMilliseconds function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.elapsedMilliseconds function expects 1 argument(s) (the Stopwatch object + elapsedMilliseconds args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Stopwatch_isRunning(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Stopwatch) {
      final returnValue = o.isRunning;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Stopwatch.isRunning function expects its first argument to be a Stopwatch object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Stopwatch.isRunning function expects 1 argument(s) (the Stopwatch object + isRunning args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Stopwatch? dart_Stopwatch_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Stopwatch();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Stopwatch. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_codeUnitAt(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.codeUnitAt function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.codeUnitAt(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.codeUnitAt function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.codeUnitAt function expects 2 argument(s) (the String object + codeUnitAt args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_length(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.length;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.length function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.length function expects 1 argument(s) (the String object + length args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.hashCode function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.hashCode function expects 1 argument(s) (the String object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_compareTo(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/String.compareTo function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.compareTo(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.compareTo function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.compareTo function expects 2 argument(s) (the String object + compareTo args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_endsWith(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/String.endsWith function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.endsWith(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.endsWith function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.endsWith function expects 2 argument(s) (the String object + endsWith args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_startsWith(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.startsWith function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.startsWith(
        args[1] as Pattern,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.startsWith function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.startsWith function expects 2 argument(s) (the String object + startsWith args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_startsWith_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.startsWith-full function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/String.startsWith-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.startsWith(
        args[1] as Pattern,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.startsWith-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.startsWith-full function expects 3 argument(s) (the String object + startsWith args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_indexOf(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.indexOf function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.indexOf(
        args[1] as Pattern,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.indexOf function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.indexOf function expects 2 argument(s) (the String object + indexOf args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_indexOf_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.indexOf-full function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/String.indexOf-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.indexOf(
        args[1] as Pattern,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.indexOf-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.indexOf-full function expects 3 argument(s) (the String object + indexOf args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_lastIndexOf(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.lastIndexOf function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.lastIndexOf(
        args[1] as Pattern,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.lastIndexOf function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.lastIndexOf function expects 2 argument(s) (the String object + lastIndexOf args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_String_lastIndexOf_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.lastIndexOf-full function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/String.lastIndexOf-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.lastIndexOf(
        args[1] as Pattern,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.lastIndexOf-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.lastIndexOf-full function expects 3 argument(s) (the String object + lastIndexOf args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_isEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.isEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.isEmpty function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.isEmpty function expects 1 argument(s) (the String object + isEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_isNotEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.isNotEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.isNotEmpty function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.isNotEmpty function expects 1 argument(s) (the String object + isNotEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_substring(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.substring function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.substring(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.substring function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.substring function expects 2 argument(s) (the String object + substring args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_substring_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.substring-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/String.substring-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.substring(
        args[1] as int,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.substring-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.substring-full function expects 3 argument(s) (the String object + substring args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_trim(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.trim();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.trim function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.trim function expects 1 argument(s) (the String object + trim args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_trimLeft(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.trimLeft();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.trimLeft function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.trimLeft function expects 1 argument(s) (the String object + trimLeft args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_trimRight(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.trimRight();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.trimRight function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.trimRight function expects 1 argument(s) (the String object + trimRight args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_padLeft(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.padLeft function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.padLeft(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.padLeft function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.padLeft function expects 2 argument(s) (the String object + padLeft args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_padLeft_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.padLeft-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/String.padLeft-full function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.padLeft(
        args[1] as int,
        args[2] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.padLeft-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.padLeft-full function expects 3 argument(s) (the String object + padLeft args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_padRight(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.padRight function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.padRight(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.padRight function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.padRight function expects 2 argument(s) (the String object + padRight args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_padRight_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.padRight-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/String.padRight-full function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.padRight(
        args[1] as int,
        args[2] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.padRight-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.padRight-full function expects 3 argument(s) (the String object + padRight args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_contains(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.contains function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.contains(
        args[1] as Pattern,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.contains function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.contains function expects 2 argument(s) (the String object + contains args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_String_contains_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.contains-full function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/String.contains-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.contains(
        args[1] as Pattern,
        args[2] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.contains-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.contains-full function expects 3 argument(s) (the String object + contains args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceFirst(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.replaceFirst function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/String.replaceFirst function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.replaceFirst(
        args[1] as Pattern,
        args[2] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceFirst function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceFirst function expects 3 argument(s) (the String object + replaceFirst args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceFirst_full(PLEnv env, PLVector args) {
  if (args.length == 4) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.replaceFirst-full function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/String.replaceFirst-full function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }
      if (args[3] is! int) {
        throw ArgumentError(
            'The dart/String.replaceFirst-full function expects its 4th argument to be a int value, but received a ${typeString(args[3])} value.');
      }

      final returnValue = o.replaceFirst(
        args[1] as Pattern,
        args[2] as String,
        args[3] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceFirst-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceFirst-full function expects 4 argument(s) (the String object + replaceFirst args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceFirstMapped(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.replaceFirstMapped function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String Function(Match)) {
        throw ArgumentError(
            'The dart/String.replaceFirstMapped function expects its 3rd argument to be a (dart.core.Match) -> dart.core.String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.replaceFirstMapped(
        args[1] as Pattern,
        args[2] as String Function(Match),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceFirstMapped function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceFirstMapped function expects 3 argument(s) (the String object + replaceFirstMapped args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceFirstMapped_full(PLEnv env, PLVector args) {
  if (args.length == 4) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.replaceFirstMapped-full function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String Function(Match)) {
        throw ArgumentError(
            'The dart/String.replaceFirstMapped-full function expects its 3rd argument to be a (dart.core.Match) -> dart.core.String value, but received a ${typeString(args[2])} value.');
      }
      if (args[3] is! int) {
        throw ArgumentError(
            'The dart/String.replaceFirstMapped-full function expects its 4th argument to be a int value, but received a ${typeString(args[3])} value.');
      }

      final returnValue = o.replaceFirstMapped(
        args[1] as Pattern,
        args[2] as String Function(Match),
        args[3] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceFirstMapped-full function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceFirstMapped-full function expects 4 argument(s) (the String object + replaceFirstMapped args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceAll(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.replaceAll function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/String.replaceAll function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.replaceAll(
        args[1] as Pattern,
        args[2] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceAll function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceAll function expects 3 argument(s) (the String object + replaceAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceAllMapped(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.replaceAllMapped function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String Function(Match)) {
        throw ArgumentError(
            'The dart/String.replaceAllMapped function expects its 3rd argument to be a (dart.core.Match) -> dart.core.String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.replaceAllMapped(
        args[1] as Pattern,
        args[2] as String Function(Match),
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceAllMapped function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceAllMapped function expects 3 argument(s) (the String object + replaceAllMapped args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_replaceRange(PLEnv env, PLVector args) {
  if (args.length == 4) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/String.replaceRange function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! int) {
        throw ArgumentError(
            'The dart/String.replaceRange function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
      }
      if (args[3] is! String) {
        throw ArgumentError(
            'The dart/String.replaceRange function expects its 4th argument to be a String value, but received a ${typeString(args[3])} value.');
      }

      final returnValue = o.replaceRange(
        args[1] as int,
        args[2] as int,
        args[3] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.replaceRange function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.replaceRange function expects 4 argument(s) (the String object + replaceRange args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_String_split(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.split function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.split(
        args[1] as Pattern,
      );
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/String.split function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.split function expects 2 argument(s) (the String object + split args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_splitMapJoin(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is String) {
      if (args[1] is! Pattern) {
        throw ArgumentError(
            'The dart/String.splitMapJoin function expects its 2nd argument to be a Pattern value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.splitMapJoin(
        args[1] as Pattern,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.splitMapJoin function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.splitMapJoin function expects 2 argument(s) (the String object + splitMapJoin args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_String_codeUnits(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.codeUnits;
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/String.codeUnits function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.codeUnits function expects 1 argument(s) (the String object + codeUnits args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Runes? dart_String_runes(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.runes;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.runes function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.runes function expects 1 argument(s) (the String object + runes args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_toLowerCase(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.toLowerCase();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.toLowerCase function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.toLowerCase function expects 1 argument(s) (the String object + toLowerCase args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_toUpperCase(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is String) {
      final returnValue = o.toUpperCase();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/String.toUpperCase function expects its first argument to be a String object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/String.toUpperCase function expects 1 argument(s) (the String object + toUpperCase args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_fromCharCodes(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/String.fromCharCodes function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = String.fromCharCodes(
      args[0] as Iterable<int>,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/String.fromCharCodes function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_fromCharCodes_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! Iterable) {
      throw ArgumentError(
          'The dart/String.fromCharCodes-full function expects its 1st argument to be a Iterable value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/String.fromCharCodes-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! int) {
      throw ArgumentError(
          'The dart/String.fromCharCodes-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = String.fromCharCodes(
      args[0] as Iterable<int>,
      args[1] as int,
      args[2] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/String.fromCharCodes-full function expects 3 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_fromCharCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/String.fromCharCode function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = String.fromCharCode(
      args[0] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/String.fromCharCode function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_String_fromEnvironment(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/String.fromEnvironment function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = String.fromEnvironment(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/String.fromEnvironment function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_StringBuffer_length(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringBuffer) {
      final returnValue = o.length;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.length function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.length function expects 1 argument(s) (the StringBuffer object + length args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_StringBuffer_isEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringBuffer) {
      final returnValue = o.isEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.isEmpty function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.isEmpty function expects 1 argument(s) (the StringBuffer object + isEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_StringBuffer_isNotEmpty(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringBuffer) {
      final returnValue = o.isNotEmpty;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.isNotEmpty function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.isNotEmpty function expects 1 argument(s) (the StringBuffer object + isNotEmpty args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_write(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringBuffer) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/StringBuffer.write function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.write(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.write function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.write function expects 2 argument(s) (the StringBuffer object + write args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_writeCharCode(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringBuffer) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/StringBuffer.writeCharCode function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.writeCharCode(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.writeCharCode function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.writeCharCode function expects 2 argument(s) (the StringBuffer object + writeCharCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_writeAll(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringBuffer) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/StringBuffer.writeAll function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.writeAll(
        args[1] as Iterable<dynamic>,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.writeAll function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.writeAll function expects 2 argument(s) (the StringBuffer object + writeAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_writeAll_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is StringBuffer) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/StringBuffer.writeAll-full function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/StringBuffer.writeAll-full function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.writeAll(
        args[1] as Iterable<dynamic>,
        args[2] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.writeAll-full function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.writeAll-full function expects 3 argument(s) (the StringBuffer object + writeAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_writeln(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringBuffer) {
      final returnValue = o.writeln();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.writeln function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.writeln function expects 1 argument(s) (the StringBuffer object + writeln args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_writeln_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringBuffer) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/StringBuffer.writeln-full function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.writeln(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.writeln-full function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.writeln-full function expects 2 argument(s) (the StringBuffer object + writeln args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringBuffer_clear(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringBuffer) {
      final returnValue = o.clear();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.clear function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.clear function expects 1 argument(s) (the StringBuffer object + clear args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_StringBuffer_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringBuffer) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringBuffer.toString function expects its first argument to be a StringBuffer object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.toString function expects 1 argument(s) (the StringBuffer object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
StringBuffer? dart_StringBuffer_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = StringBuffer();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/StringBuffer. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
StringBuffer? dart_StringBuffer__full(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/StringBuffer.-full function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = StringBuffer(
      args[0] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/StringBuffer.-full function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringSink_write(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringSink) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/StringSink.write function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.write(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringSink.write function expects its first argument to be a StringSink object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringSink.write function expects 2 argument(s) (the StringSink object + write args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringSink_writeAll(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringSink) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/StringSink.writeAll function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.writeAll(
        args[1] as Iterable<dynamic>,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringSink.writeAll function expects its first argument to be a StringSink object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringSink.writeAll function expects 2 argument(s) (the StringSink object + writeAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringSink_writeAll_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    final o = args[0];
    if (o is StringSink) {
      if (args[1] is! Iterable) {
        throw ArgumentError(
            'The dart/StringSink.writeAll-full function expects its 2nd argument to be a Iterable value, but received a ${typeString(args[1])} value.');
      }
      if (args[2] is! String) {
        throw ArgumentError(
            'The dart/StringSink.writeAll-full function expects its 3rd argument to be a String value, but received a ${typeString(args[2])} value.');
      }

      final returnValue = o.writeAll(
        args[1] as Iterable<dynamic>,
        args[2] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringSink.writeAll-full function expects its first argument to be a StringSink object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringSink.writeAll-full function expects 3 argument(s) (the StringSink object + writeAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringSink_writeln(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is StringSink) {
      final returnValue = o.writeln();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringSink.writeln function expects its first argument to be a StringSink object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringSink.writeln function expects 1 argument(s) (the StringSink object + writeln args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringSink_writeln_full(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringSink) {
      if (args[1] is! Object) {
        throw ArgumentError(
            'The dart/StringSink.writeln-full function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.writeln(
        args[1] as Object,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringSink.writeln-full function expects its first argument to be a StringSink object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringSink.writeln-full function expects 2 argument(s) (the StringSink object + writeln args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_StringSink_writeCharCode(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is StringSink) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/StringSink.writeCharCode function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.writeCharCode(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/StringSink.writeCharCode function expects its first argument to be a StringSink object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/StringSink.writeCharCode function expects 2 argument(s) (the StringSink object + writeCharCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Symbol_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Symbol) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Symbol.hashCode function expects its first argument to be a Symbol object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Symbol.hashCode function expects 1 argument(s) (the Symbol object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Symbol? dart_Symbol_(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Symbol. function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Symbol(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Symbol. function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_base(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Uri.base;
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.base function expects 0 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_scheme(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.scheme;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.scheme function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.scheme function expects 1 argument(s) (the Uri object + scheme args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_authority(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.authority;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.authority function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.authority function expects 1 argument(s) (the Uri object + authority args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_userInfo(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.userInfo;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.userInfo function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.userInfo function expects 1 argument(s) (the Uri object + userInfo args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_host(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.host;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.host function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.host function expects 1 argument(s) (the Uri object + host args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Uri_port(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.port;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.port function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.port function expects 1 argument(s) (the Uri object + port args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_path(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.path;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.path function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.path function expects 1 argument(s) (the Uri object + path args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_query(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.query;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.query function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.query function expects 1 argument(s) (the Uri object + query args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_fragment(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.fragment;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.fragment function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.fragment function expects 1 argument(s) (the Uri object + fragment args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Uri_pathSegments(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.pathSegments;
      return returnValue.toIList();
    } else {
      throw ArgumentError(
          'The dart/Uri.pathSegments function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.pathSegments function expects 1 argument(s) (the Uri object + pathSegments args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Uri_queryParameters(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.queryParameters;
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/Uri.queryParameters function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.queryParameters function expects 1 argument(s) (the Uri object + queryParameters args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Uri_queryParametersAll(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.queryParametersAll;
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/Uri.queryParametersAll function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.queryParametersAll function expects 1 argument(s) (the Uri object + queryParametersAll args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_isAbsolute(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.isAbsolute;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.isAbsolute function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.isAbsolute function expects 1 argument(s) (the Uri object + isAbsolute args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasScheme(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasScheme;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasScheme function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasScheme function expects 1 argument(s) (the Uri object + hasScheme args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasAuthority(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasAuthority;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasAuthority function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasAuthority function expects 1 argument(s) (the Uri object + hasAuthority args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasPort(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasPort;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasPort function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasPort function expects 1 argument(s) (the Uri object + hasPort args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasQuery(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasQuery;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasQuery function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasQuery function expects 1 argument(s) (the Uri object + hasQuery args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasFragment(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasFragment;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasFragment function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasFragment function expects 1 argument(s) (the Uri object + hasFragment args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasEmptyPath(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasEmptyPath;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasEmptyPath function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasEmptyPath function expects 1 argument(s) (the Uri object + hasEmptyPath args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_hasAbsolutePath(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hasAbsolutePath;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hasAbsolutePath function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hasAbsolutePath function expects 1 argument(s) (the Uri object + hasAbsolutePath args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_origin(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.origin;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.origin function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.origin function expects 1 argument(s) (the Uri object + origin args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Uri_isScheme(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Uri) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Uri.isScheme function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isScheme(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.isScheme function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.isScheme function expects 2 argument(s) (the Uri object + isScheme args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_toFilePath(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.toFilePath();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.toFilePath function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.toFilePath function expects 1 argument(s) (the Uri object + toFilePath args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
UriData? dart_Uri_data(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.data;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.data function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.data function expects 1 argument(s) (the Uri object + data args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Uri_hashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.hashCode;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.hashCode function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.hashCode function expects 1 argument(s) (the Uri object + hashCode args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.toString function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.toString function expects 1 argument(s) (the Uri object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_replace(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.replace();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.replace function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.replace function expects 1 argument(s) (the Uri object + replace args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_removeFragment(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.removeFragment();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.removeFragment function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.removeFragment function expects 1 argument(s) (the Uri object + removeFragment args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_resolve(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Uri) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/Uri.resolve function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.resolve(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.resolve function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.resolve function expects 2 argument(s) (the Uri object + resolve args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_resolveUri(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Uri) {
      if (args[1] is! Uri) {
        throw ArgumentError(
            'The dart/Uri.resolveUri function expects its 2nd argument to be a Uri value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.resolveUri(
        args[1] as Uri,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.resolveUri function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.resolveUri function expects 2 argument(s) (the Uri object + resolveUri args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_normalizePath(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Uri) {
      final returnValue = o.normalizePath();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Uri.normalizePath function expects its first argument to be a Uri object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Uri.normalizePath function expects 1 argument(s) (the Uri object + normalizePath args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_parse_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.parse-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/Uri.parse-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! int) {
      throw ArgumentError(
          'The dart/Uri.parse-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Uri.parse(
      args[0] as String,
      args[1] as int,
      args[2] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.parse-full function expects 3 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_tryParse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.tryParse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.tryParse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.tryParse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_tryParse_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.tryParse-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/Uri.tryParse-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! int) {
      throw ArgumentError(
          'The dart/Uri.tryParse-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Uri.tryParse(
      args[0] as String,
      args[1] as int,
      args[2] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.tryParse-full function expects 3 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_encodeComponent(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.encodeComponent function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.encodeComponent(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.encodeComponent function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_encodeQueryComponent(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.encodeQueryComponent function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.encodeQueryComponent(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.encodeQueryComponent function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_decodeComponent(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.decodeComponent function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.decodeComponent(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.decodeComponent function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_decodeQueryComponent(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.decodeQueryComponent function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.decodeQueryComponent(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.decodeQueryComponent function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_encodeFull(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.encodeFull function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.encodeFull(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.encodeFull function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_Uri_decodeFull(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.decodeFull function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.decodeFull(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.decodeFull function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_Uri_splitQueryString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.splitQueryString function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.splitQueryString(
      args[0] as String,
    );
    return returnValue.toIMap();
  } else {
    throw ArgumentError(
        'The dart/Uri.splitQueryString function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Uri_parseIPv4Address(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.parseIPv4Address function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.parseIPv4Address(
      args[0] as String,
    );
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/Uri.parseIPv4Address function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Uri_parseIPv6Address(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.parseIPv6Address function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.parseIPv6Address(
      args[0] as String,
    );
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/Uri.parseIPv6Address function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IList? dart_Uri_parseIPv6Address_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.parseIPv6Address-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! int) {
      throw ArgumentError(
          'The dart/Uri.parseIPv6Address-full function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! int) {
      throw ArgumentError(
          'The dart/Uri.parseIPv6Address-full function expects its 3rd argument to be a int value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Uri.parseIPv6Address(
      args[0] as String,
      args[1] as int,
      args[2] as int,
    );
    return returnValue.toIList();
  } else {
    throw ArgumentError(
        'The dart/Uri.parseIPv6Address-full function expects 3 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Uri();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_http(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.http function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.http(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.http function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_http_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.http-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! String) {
      throw ArgumentError(
          'The dart/Uri.http-full function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Map) {
      throw ArgumentError(
          'The dart/Uri.http-full function expects its 3rd argument to be a Map value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Uri.http(
      args[0] as String,
      args[1] as String,
      Map<String, dynamic>.from(args[2] as Map<Object?, Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.http-full function expects 3 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_https(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.https function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.https(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.https function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_https_full(PLEnv env, PLVector args) {
  if (args.length == 3) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.https-full function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! String) {
      throw ArgumentError(
          'The dart/Uri.https-full function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
    }
    if (args[2] is! Map) {
      throw ArgumentError(
          'The dart/Uri.https-full function expects its 3rd argument to be a Map value, but received a ${typeString(args[2])} value.');
    }

    final returnValue = Uri.https(
      args[0] as String,
      args[1] as String,
      Map<String, dynamic>.from(args[2] as Map<Object?, Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.https-full function expects 3 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_file(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.file function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.file(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.file function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_directory(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.directory function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.directory(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.directory function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_dataFromString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/Uri.dataFromString function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.dataFromString(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.dataFromString function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_Uri_dataFromBytes(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/Uri.dataFromBytes function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Uri.dataFromBytes(
      List<int>.from(args[0] as List<Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Uri.dataFromBytes function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
UriData? dart_UriData_parse(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/UriData.parse function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = UriData.parse(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/UriData.parse function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uri? dart_UriData_uri(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.uri;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.uri function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.uri function expects 1 argument(s) (the UriData object + uri args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_UriData_mimeType(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.mimeType;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.mimeType function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.mimeType function expects 1 argument(s) (the UriData object + mimeType args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_UriData_isMimeType(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is UriData) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/UriData.isMimeType function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isMimeType(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.isMimeType function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.isMimeType function expects 2 argument(s) (the UriData object + isMimeType args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_UriData_charset(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.charset;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.charset function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.charset function expects 1 argument(s) (the UriData object + charset args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_UriData_isCharset(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is UriData) {
      if (args[1] is! String) {
        throw ArgumentError(
            'The dart/UriData.isCharset function expects its 2nd argument to be a String value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isCharset(
        args[1] as String,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.isCharset function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.isCharset function expects 2 argument(s) (the UriData object + isCharset args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_UriData_isEncoding(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is UriData) {
      if (args[1] is! Encoding) {
        throw ArgumentError(
            'The dart/UriData.isEncoding function expects its 2nd argument to be a Encoding value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.isEncoding(
        args[1] as Encoding,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.isEncoding function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.isEncoding function expects 2 argument(s) (the UriData object + isEncoding args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_UriData_isBase64(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.isBase64;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.isBase64 function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.isBase64 function expects 1 argument(s) (the UriData object + isBase64 args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_UriData_contentText(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.contentText;
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.contentText function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.contentText function expects 1 argument(s) (the UriData object + contentText args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_UriData_contentAsString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.contentAsString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.contentAsString function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.contentAsString function expects 1 argument(s) (the UriData object + contentAsString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
IMap? dart_UriData_parameters(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.parameters;
      return returnValue.toIMap();
    } else {
      throw ArgumentError(
          'The dart/UriData.parameters function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.parameters function expects 1 argument(s) (the UriData object + parameters args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_UriData_toString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is UriData) {
      final returnValue = o.toString();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/UriData.toString function expects its first argument to be a UriData object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/UriData.toString function expects 1 argument(s) (the UriData object + toString args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
UriData? dart_UriData_fromString(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/UriData.fromString function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = UriData.fromString(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/UriData.fromString function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
UriData? dart_UriData_fromBytes(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/UriData.fromBytes function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = UriData.fromBytes(
      List<int>.from(args[0] as List<Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/UriData.fromBytes function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
UriData? dart_UriData_fromUri(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Uri) {
      throw ArgumentError(
          'The dart/UriData.fromUri function expects its 1st argument to be a Uri value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = UriData.fromUri(
      args[0] as Uri,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/UriData.fromUri function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_Random_nextInt(PLEnv env, PLVector args) {
  if (args.length == 2) {
    final o = args[0];
    if (o is Random) {
      if (args[1] is! int) {
        throw ArgumentError(
            'The dart/Random.nextInt function expects its 2nd argument to be a int value, but received a ${typeString(args[1])} value.');
      }

      final returnValue = o.nextInt(
        args[1] as int,
      );
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Random.nextInt function expects its first argument to be a Random object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Random.nextInt function expects 2 argument(s) (the Random object + nextInt args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_Random_nextDouble(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Random) {
      final returnValue = o.nextDouble();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Random.nextDouble function expects its first argument to be a Random object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Random.nextDouble function expects 1 argument(s) (the Random object + nextDouble args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_Random_nextBool(PLEnv env, PLVector args) {
  if (args.length == 1) {
    final o = args[0];
    if (o is Random) {
      final returnValue = o.nextBool();
      return returnValue;
    } else {
      throw ArgumentError(
          'The dart/Random.nextBool function expects its first argument to be a Random object but received a ${typeString(o)} value.');
    }
  } else {
    throw ArgumentError(
        'The dart/Random.nextBool function expects 1 argument(s) (the Random object + nextBool args) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Random? dart_Random_(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Random();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Random. function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Random? dart_Random__full(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! int) {
      throw ArgumentError(
          'The dart/Random.-full function expects its 1st argument to be a int value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = Random(
      args[0] as int,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Random.-full function expects 1 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Random? dart_Random_secure(PLEnv env, PLVector args) {
  if (args.isEmpty) {
    final returnValue = Random.secure();
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/Random.secure function expects 0 constructor argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
void dart_dart_core_print(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/dart-core-print function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = print(
      args[0] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-core-print function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
bool? dart_dart_core_identical(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/dart-core-identical function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! Object) {
      throw ArgumentError(
          'The dart/dart-core-identical function expects its 2nd argument to be a Object value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = identical(
      args[0] as Object,
      args[1] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-core-identical function expects 2 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
int? dart_dart_core_identityHashCode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/dart-core-identityHashCode function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = identityHashCode(
      args[0] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-core-identityHashCode function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_dart_convert_base64Encode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/dart-convert-base64Encode function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = base64Encode(
      List<int>.from(args[0] as List<Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-convert-base64Encode function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
dynamic dart_dart_convert_jsonDecode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/dart-convert-jsonDecode function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = jsonDecode(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-convert-jsonDecode function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
Uint8List? dart_dart_convert_base64Decode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! String) {
      throw ArgumentError(
          'The dart/dart-convert-base64Decode function expects its 1st argument to be a String value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = base64Decode(
      args[0] as String,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-convert-base64Decode function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_dart_convert_jsonEncode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! Object) {
      throw ArgumentError(
          'The dart/dart-convert-jsonEncode function expects its 1st argument to be a Object value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = jsonEncode(
      args[0] as Object,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-convert-jsonEncode function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
String? dart_dart_convert_base64UrlEncode(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! List) {
      throw ArgumentError(
          'The dart/dart-convert-base64UrlEncode function expects its 1st argument to be a List value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = base64UrlEncode(
      List<int>.from(args[0] as List<Object?>),
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-convert-base64UrlEncode function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_atan2(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-atan2 function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! num) {
      throw ArgumentError(
          'The dart/dart-math-atan2 function expects its 2nd argument to be a num value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = atan2(
      args[0] as num,
      args[1] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-atan2 function expects 2 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_sqrt(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-sqrt function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = sqrt(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-sqrt function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_atan(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-atan function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = atan(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-atan function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_asin(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-asin function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = asin(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-asin function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_exp(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-exp function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = exp(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-exp function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_sin(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-sin function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = sin(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-sin function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_tan(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-tan function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = tan(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-tan function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_cos(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-cos function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = cos(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-cos function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_log(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-log function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = log(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-log function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
double? dart_dart_math_acos(PLEnv env, PLVector args) {
  if (args.length == 1) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-acos function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }

    final returnValue = acos(
      args[0] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-acos function expects 1 argument(s) but received ${args.length} arguments.');
  }
}

// ignore: non_constant_identifier_names, strict_raw_type
num? dart_dart_math_pow(PLEnv env, PLVector args) {
  if (args.length == 2) {
    if (args[0] is! num) {
      throw ArgumentError(
          'The dart/dart-math-pow function expects its 1st argument to be a num value, but received a ${typeString(args[0])} value.');
    }
    if (args[1] is! num) {
      throw ArgumentError(
          'The dart/dart-math-pow function expects its 2nd argument to be a num value, but received a ${typeString(args[1])} value.');
    }

    final returnValue = pow(
      args[0] as num,
      args[1] as num,
    );
    return returnValue;
  } else {
    throw ArgumentError(
        'The dart/dart-math-pow function expects 2 argument(s) but received ${args.length} arguments.');
  }
}
// END Dart wrappers for PiLisp
