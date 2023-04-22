library pilisp.builder;

import 'dart:io' as io;
import 'dart:mirrors';
import 'dart:typed_data';

import 'package:build/build.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:source_gen/source_gen.dart';

import 'generator/pilisp_dart_generator_impl.dart';

final listType = reflectType(List);
final typedDataType = reflectType(TypedData);
final mapType = reflectType(Map);
final setType = reflectType(Set);

class PiLispDartGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final sb = StringBuffer('// START Dart wrappers for PiLisp\n');
    writeImports(sb, importsForGenerated);
    writeOpenBindingMapDeclaration(sb);
    final functionDefs = writeAllWrappers(sb, sourceLibraries, sourceClasses,
        prohibitedFunctions, prohibitedMethods, desiredConstructors);
    writeCloseBindingMapDeclaration(sb);

    for (final s in functionDefs) {
      sb.writeln(s);
    }
    sb.writeln('// END Dart wrappers for PiLisp');
    return sb.toString();
  }
}

void writeImports(StringBuffer sb, List<String> imports) {
  for (final importString in imports) {
    sb.writeln("import '$importString';");
  }
  sb.writeln();
}

void writeOpenBindingMapDeclaration(StringBuffer sb) {
  sb.writeln('Map<PLSymbol, PLBindingEntry> wrapperBindings = {');
}

void writeCloseBindingMapDeclaration(StringBuffer sb) {
  sb.writeln('};\n');
}

List<String> writeAllWrappers(
    StringBuffer sb,
    Set<String> sourceLibraries,
    Set<Type> sourceClasses,
    Set<String> prohibitedFunctions,
    Set<String> prohibitedMethods,
    Set<String> desiredConstructors) {
  final functionDefs = <String>[];
  for (final klass in sourceClasses) {
    functionDefs.addAll(writeWrappers(
        sb, reflectClass(klass), prohibitedMethods, desiredConstructors));
  }
  for (final lib in sourceLibraries) {
    functionDefs.addAll(writeFunctionWrappers(sb, lib, prohibitedFunctions));
  }
  return functionDefs;
}

List<String> writeFunctionWrappers(
    StringBuffer sb, String libName, Set<String> prohibitedFunctions) {
  final libEntries = currentMirrorSystem()
      .libraries
      .entries
      .where((element) => element.key.toString() == libName);
  if (libEntries.isNotEmpty) {
    final libMirror = libEntries.first.value;
    sb.writeln('// Library $libName');
    final List<String> functionDefs = [];
    for (final v in libMirror.declarations.values) {
      String declName = MirrorSystem.getName(v.simpleName);
      // NB: Functions that aren't extension methods.
      if (v is MethodMirror &&
          v.isTopLevel &&
          !declName.contains('.') &&
          !prohibitedFunctions.contains('$libName.$declName')) {
        sb.writeln('// START Function $declName');
        final libraryNameMungedDart = libName.replaceAll(RegExp(r'\W'), '_');
        final wrapperDartName = 'dart_${libraryNameMungedDart}_$declName';
        final libraryNameMungedPiLisp = libName.replaceAll(RegExp(r'\W'), '-');
        final wrapperPiLispName = 'dart/$libraryNameMungedPiLisp-$declName';
        final paramsRequired =
            v.parameters.where((param) => !param.isOptional).toList();
        if (!prohibitedFunctions.contains(wrapperDartName)) {
          writeMethodWrappers(v, paramsRequired, sb, functionDefs, '', declName,
              wrapperDartName, wrapperPiLispName,
              libraryMirror: libMirror);
        }
        final paramsFull =
            v.parameters.where((param) => !param.isNamed).toList();
        if (paramsRequired.length != paramsFull.length) {
          final wrapperDartNameFull = '${wrapperDartName}_full';
          final wrapperPiLispNameFull = '$wrapperPiLispName-full';
          if (!prohibitedFunctions.contains(wrapperDartNameFull)) {
            writeMethodWrappers(v, paramsFull, sb, functionDefs, '', declName,
                wrapperDartNameFull, wrapperPiLispNameFull,
                libraryMirror: libMirror);
          }
        }
        sb.writeln('// END Function $declName');
      }
    }
    return functionDefs;
  } else {
    return [];
  }
}

/// Immediately writes the innards of `wrapperBindings`, returns the function
/// definitions that need to be available for that to compile.
///
/// TODO Consider adding all inherited members into generated output for subclasses, so that something like RegExpMatch.groups is possible, instead of Match.groups
List<String> writeWrappers(StringBuffer sb, ClassMirror cm,
    Set<String> prohibitedMethods, Set<String> desiredConstructors) {
  String className = MirrorSystem.getName(cm.simpleName);
  final List<String> functionDefs = [];
  sb.writeln('// Class $className with ${cm.declarations.length} declarations');
  for (final v in cm.declarations.values) {
    String declName = MirrorSystem.getName(v.simpleName);
    if (v is MethodMirror && v.isConstructor) {
      declName = MirrorSystem.getName(v.constructorName);
      sb.writeln('// START CTOR $declName -----------------------');
    } else {
      sb.writeln('// START $declName -----------------------');
    }
    final wrapperDartName = 'dart_${className}_$declName';
    final wrapperPiLispName = 'dart/$className.$declName';
    if (!prohibitedMethods.contains('$className.$declName') &&
        !prohibitedMethods.contains('$className.${declName}_full') &&
        !prohibitedConstructors.contains(wrapperDartName)) {
      if (v is VariableMirror) {
        writeVariableMirrorWrappers(v, sb, wrapperPiLispName, className,
            declName, wrapperDartName, functionDefs);
      } else if (v is MethodMirror) {
        writeMethodMirrorWrappers(cm, v, sb, functionDefs, className, declName,
            wrapperDartName, wrapperPiLispName, prohibitedMethods,
            desiredConstructors: desiredConstructors);
      }
      sb.writeln('// END $declName -----------------------');
    }
  }
  return functionDefs;
}

void writeMethodMirrorWrappers(
    ClassMirror cm,
    MethodMirror v,
    StringBuffer sb,
    List<String> functionDefs,
    String className,
    String declName,
    String wrapperDartName,
    String wrapperPiLispName,
    Set<String> prohibitedMethods,
    {Set<String>? desiredConstructors}) {
  if (v.isConstructor) {
    final paramsRequired =
        v.parameters.where((element) => !element.isOptional).toList();
    if (!prohibitedFunctions.contains(wrapperDartName)) {
      writeMethodWrappers(v, paramsRequired, sb, functionDefs, className,
          declName, wrapperDartName, wrapperPiLispName,
          classMirror: cm, desiredConstructors: desiredConstructors);
    }
    final paramsFull = v.parameters.where((param) => !param.isNamed).toList();
    if (paramsRequired.length != paramsFull.length) {
      final wrapperDartNameFull = '${wrapperDartName}_full';
      final wrapperPiLispNameFull = '$wrapperPiLispName-full';
      if (!prohibitedMethods.contains(wrapperDartNameFull)) {
        writeMethodWrappers(v, paramsFull, sb, functionDefs, className,
            declName, wrapperDartNameFull, wrapperPiLispNameFull,
            classMirror: cm, desiredConstructors: desiredConstructors);
      }
    }
  } else if (v.isOperator) {
    io.stderr.writeln('Skipping operator: $className.$declName');
  } else if (v.isPrivate) {
    io.stderr.writeln('Skipping private method: $className.$declName');
  } else {
    final paramsRequired =
        v.parameters.where((element) => !element.isOptional).toList();
    if (!prohibitedMethods.contains(wrapperDartName)) {
      writeMethodWrappers(v, paramsRequired, sb, functionDefs, className,
          declName, wrapperDartName, wrapperPiLispName,
          classMirror: cm, desiredConstructors: desiredConstructors);
    }
    final paramsFull = v.parameters.where((param) => !param.isNamed).toList();
    if (paramsRequired.length != paramsFull.length) {
      final wrapperDartNameFull = '${wrapperDartName}_full';
      final wrapperPiLispNameFull = '$wrapperPiLispName-full';
      if (!prohibitedMethods.contains(wrapperDartNameFull)) {
        writeMethodWrappers(v, paramsFull, sb, functionDefs, className,
            declName, wrapperDartNameFull, wrapperPiLispNameFull,
            classMirror: cm, desiredConstructors: desiredConstructors);
      }
    }
  }
}

void writeMethodWrappers(
    MethodMirror v,
    List<ParameterMirror> params,
    StringBuffer sb,
    List<String> functionDefs,
    String className,
    String declName,
    String wrapperDartName,
    String wrapperPiLispName,
    {ClassMirror? classMirror,
    LibraryMirror? libraryMirror,
    Set<String>? desiredConstructors}) {
  int numParams = params.length;
  bool isInstanceMethod = !v.isStatic && !v.isConstructor;
  bool isCtor = v.isConstructor;
  if (isInstanceMethod) {
    // NB: Instance methods, hence arg nth + 1 because first is object
    numParams += 1;
  }
  final paramTypeNames = params.fold(IList<String>([]),
      (acc, param) => acc.add(MirrorSystem.getName(param.type.simpleName)));
  final paramCheckCode = StringBuffer();
  final argCodeBuffer = StringBuffer();
  int argOffset = 0;
  if (isInstanceMethod) {
    argOffset += 1;
  }
  for (int i = 0; i < paramTypeNames.length; i++) {
    final paramTypeName = paramTypeNames[i];
    final argCardinal = i + argOffset;
    final humanCardinal = argCardinal + 1;
    final ordinalSuffix = calcOrdinalSuffix(humanCardinal);
    paramCheckCode.writeln('''
    if (args[$argCardinal] is! ${paramTypeName.contains('->') ? formatFunctionTypeSignature(paramTypeName) : paramTypeName}) {
      throw ArgumentError(
  'The $wrapperPiLispName function expects its $humanCardinal$ordinalSuffix argument to be a $paramTypeName value, but received a \${PiLisp.typeName(args[$argCardinal])} value.');
    }''');
    final paramType = params[i].type;
    final paramTypeArgs = paramType.typeArguments;
    String thisArg = 'args[$argCardinal]';
    if (paramTypeArgs.isNotEmpty) {
      if (paramType.isSubtypeOf(listType)) {
        thisArg =
            'List<${MirrorSystem.getName(paramTypeArgs[0].simpleName)}>.from($thisArg as List<Object?>)';
      } else if (paramType.isSubtypeOf(mapType)) {
        thisArg =
            'Map<${MirrorSystem.getName(paramTypeArgs[0].simpleName)}, ${MirrorSystem.getName(paramTypeArgs[1].simpleName)}>.from($thisArg as Map<Object?, Object?>)';
      } else if (paramType.isSubtypeOf(setType)) {
        thisArg =
            'Set<${MirrorSystem.getName(paramTypeArgs[0].simpleName)}>.from($thisArg as Set<Object?>)';
      } else {
        thisArg =
            '$thisArg as $paramTypeName<${paramTypeArgs.map((t) => MirrorSystem.getName(t.simpleName)).join(', ')}>';
      }
    } else if (paramTypeName.contains('->')) {
      final fnSig = formatFunctionTypeSignature(paramTypeName);
      thisArg = '$thisArg as $fnSig ';
    } else {
      thisArg = '$thisArg as $paramTypeName';
    }
    argCodeBuffer.write('$thisArg, ');
  }
  String argCode = '';
  if (!v.isGetter) {
    argCode = '(${argCodeBuffer.toString()})';
  }
  if (classMirror != null &&
      v.isConstructor &&
      desiredConstructors != null &&
      !desiredConstructors.contains(className) &&
      MirrorSystem.getName(v.constructorName).isEmpty &&
      classMirror.isAbstract) {
    sb.writeln(
        '// Skipping binding for constructor of abstract class $className');
  } else {
    sb.writeln(
        "PLSymbol('$wrapperPiLispName'): PLBindingEntry(${legalMethodName(wrapperDartName)}),");
  }
  final returnType = v.returnType;
  String returnTypeName = MirrorSystem.getName(returnType.simpleName);
  String returnCode = 'return returnValue;';
  if (returnTypeName != 'dynamic') {
    if (returnType.isSubtypeOf(listType) &&
        !returnType.isSubtypeOf(typedDataType)) {
      returnTypeName = 'I$returnTypeName';
      returnCode = 'return returnValue.toIList();';
    } else if (returnType.isSubtypeOf(mapType)) {
      returnTypeName = 'I$returnTypeName';
      returnCode = 'return returnValue.toIMap();';
    } else if (returnType.isSubtypeOf(setType)) {
      returnTypeName = 'I$returnTypeName';
      returnCode = 'return returnValue.toISet();';
    }
  }
  if (libraryMirror != null && v.isTopLevel) {
    // Function
    functionDefs.add('''
    // ignore: non_constant_identifier_names, strict_raw_type
    ${returnTypeName == 'void' || returnTypeName == 'dynamic' ? returnTypeName : '$returnTypeName?'} ${legalMethodName(wrapperDartName)}(PLEnv env, PLVector args) {
      if (${numParams == 0 ? 'args.isEmpty' : 'args.length == $numParams'}) {
        $paramCheckCode
        final returnValue = $declName$argCode;
        $returnCode
      } else {
        throw ArgumentError('The $wrapperPiLispName function expects $numParams argument(s) but received \${args.length} arguments.');
      }
    }''');
  } else if (isInstanceMethod) {
    functionDefs.add('''
    // ignore: non_constant_identifier_names, strict_raw_type
    ${returnTypeName == 'void' || returnTypeName == 'dynamic' ? returnTypeName : '$returnTypeName?'} ${legalMethodName(wrapperDartName)}(PLEnv env, PLVector args) {
      if (${numParams == 0 ? 'args.isEmpty' : 'args.length == $numParams'}) {
        final o = args[0];
        if (o is $className) {
          $paramCheckCode
          ${declName.endsWith('=') ? 'o.${declName.substring(0, declName.length - 1)} = ${argCode.substring(1).substring(0, argCode.length - 4)};' : 'final returnValue = o.$declName$argCode;'}
          ${declName.endsWith('=') ? '' : returnCode}
        } else {
          throw ArgumentError('The $wrapperPiLispName function expects its first argument to be a $className object but received a \${PiLisp.typeName(o)} value.');
        }
      } else {
        throw ArgumentError('The $wrapperPiLispName function expects $numParams argument(s) (the $className object + $declName args) but received \${args.length} arguments.');
      }
    }''');
  } else if (isCtor) {
    final ctorName = MirrorSystem.getName(v.constructorName);
    if (desiredConstructors != null &&
        !desiredConstructors.contains(className) &&
        classMirror != null &&
        classMirror.isAbstract &&
        ctorName.isEmpty) {
      io.stderr.writeln('Skipping constructor for abstract class $className');
    } else {
      // ctor
      if (!prohibitedConstructors.contains(ctorName) &&
          !prohibitedConstructors.contains(wrapperDartName)) {
        functionDefs.add('''
    // ignore: non_constant_identifier_names, strict_raw_type
    ${returnTypeName == 'void' || returnTypeName == 'dynamic' ? returnTypeName : '$returnTypeName?'} ${legalMethodName(wrapperDartName)}(PLEnv env, PLVector args) { // ctor
      if (${numParams == 0 ? 'args.isEmpty' : 'args.length == $numParams'}) {
        $paramCheckCode
        final returnValue = $className${ctorName.isEmpty ? '' : '.$ctorName'}$argCode;
        $returnCode
      } else {
        throw ArgumentError('The $wrapperPiLispName function expects $numParams constructor argument(s) but received \${args.length} arguments.');
      }
    }''');
      }
    }
  } else {
    // Static
    functionDefs.add('''
    // ignore: non_constant_identifier_names, strict_raw_type
    ${returnTypeName == 'void' || returnTypeName == 'dynamic' ? returnTypeName : '$returnTypeName?'} ${legalMethodName(wrapperDartName)}(PLEnv env, PLVector args) {
      if (${numParams == 0 ? 'args.isEmpty' : 'args.length == $numParams'}) {
        $paramCheckCode
        ${declName.endsWith('=') ? '$className.${declName.substring(0, declName.length - 1)} = ${argCode.substring(1).substring(0, argCode.length - 4)};' : 'final returnValue = $className.$declName$argCode;'}
        ${declName.endsWith('=') ? '' : returnCode}
      } else {
        throw ArgumentError('The $wrapperPiLispName function expects $numParams argument(s) but received \${args.length} arguments.');
      }
    }''');
  }
}

void writeVariableMirrorWrappers(
    VariableMirror v,
    StringBuffer sb,
    String wrapperPiLispName,
    String className,
    String declName,
    String wrapperDartName,
    List<String> functionDefs) {
  final classDeclName = '$className.$declName';
  if (v.isStatic && !v.isPrivate) {
    sb.writeln(
        "PLSymbol('$wrapperPiLispName'): PLBindingEntry($classDeclName),");
  } else if (!v.isPrivate) {
    sb.writeln(
        "PLSymbol('$wrapperPiLispName'): PLBindingEntry(${legalMethodName(wrapperDartName)}),");
    String variableTypeName = MirrorSystem.getName(v.type.simpleName);
    if (correctedTypes.containsKey('$className.$declName')) {
      variableTypeName = correctedTypes[classDeclName]!;
    }
    functionDefs.add('''
  // ignore: non_constant_identifier_names, strict_raw_type
  $variableTypeName ${legalMethodName(wrapperDartName)}(PLEnv env, PLVector args) { // variable wrapper
    if (args.length == 1) {
      final o = args[0];
      if (o is $className) {
        return o.$declName;
      } else {
      throw ArgumentError('The $wrapperPiLispName function expects its argument to be a $className but received a \${PiLisp.typeName(o)} value.');
      }
    } else {
      throw ArgumentError('The $wrapperPiLispName function expects 1 argument of type $className but received \${args.length} arguments.');
    }
  }''');
  }
}

String legalMethodName(String name) {
  if (name.endsWith('=')) {
    // NB. This appears to be how setters are designated.
    return '${name.substring(0, name.length - 1)}__set_to';
  } else {
    return name;
  }
}

String calcOrdinalSuffix(int humanCardinal) {
  if (humanCardinal == 1) {
    return 'st';
  } else if (humanCardinal == 2) {
    return 'nd';
  } else if (humanCardinal == 3) {
    return 'rd';
  }
  return 'th';
}

String formatFunctionTypeSignature(String simpleTypeName) {
  final splitSig = simpleTypeName.split(' -> ');
  String fnArgParams = splitSig[0];
  fnArgParams = fnArgParams.replaceAll(RegExp(r'[()]'), '');
  fnArgParams = fnArgParams
      .split(RegExp(r'\s*,\s*'))
      .map((s) => s.replaceAll(RegExp(r'[^\.]+\.'), ''))
      .join(', ');
  String fnArgReturn = splitSig[1];
  fnArgReturn = fnArgReturn.replaceAll(RegExp(r'[^\.]+\.'), '');
  return '$fnArgReturn Function($fnArgParams)';
}
