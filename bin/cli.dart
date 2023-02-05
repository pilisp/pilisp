import 'dart:convert';
import 'dart:io';

import 'package:pilisp/pilisp.dart';

void repl() {
  piLispEnv.addBindingValue(PLSymbol('*3'), null);
  piLispEnv.addBindingValue(PLSymbol('*2'), null);
  piLispEnv.addBindingValue(PLSymbol('*1'), null);
  piLispEnv.addBindingValue(PLSymbol('*e'), null);

  String multiLineProgram = '';
  bool showPrompt = true;

  // TODO Handle interrupts.
  while (true) {
    if (showPrompt) {
      stdout.write('pl> ');
    }
    final line = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!);
    if (line == null) break;
    final programSource =
        multiLineProgram.isEmpty ? line : '$multiLineProgram\n$line';

    try {
      final programData = PiLisp.readString(programSource);
      final programResult = PiLisp.loadString(programSource);
      // NB: Make it stress-free to eval these REPL-specific bindings.
      if (programData != PLSymbol('*3') &&
          programData != PLSymbol('*2') &&
          programData != PLSymbol('*1') &&
          programData != PLSymbol('*e')) {
        piLispEnv.addBindingValue(
            PLSymbol('*3'), piLispEnv.getBindingValue(PLSymbol('*2')));
        piLispEnv.addBindingValue(
            PLSymbol('*2'), piLispEnv.getBindingValue(PLSymbol('*1')));
        piLispEnv.addBindingValue(PLSymbol('*1'), programResult);
      }
      stdout.writeln(PiLisp.printToString(programResult));
      // Clean-up
      showPrompt = true;
      multiLineProgram = '';
    } on UnexpectedEndOfInput {
      // In practice, these are async errors (see above) because the function is async.
      showPrompt = false;
      multiLineProgram += '\n$line';
    } catch (e, st) {
      piLispEnv.addBindingValue(PLSymbol('*e'), e);
      showPrompt = true;
      multiLineProgram = '';
      stderr.writeln(e);
      stderr.writeln(st);
    }
  }
}

String readFile(String path) {
  return File(path).readAsStringSync();
}

Future<void> loadFile(String path) async {
  final programSource = readFile(path);
  stdout.writeln(PiLisp.printToString(PiLisp.loadString(programSource)));
  await piLispEnv.shutDown();
}

final usage = r'''
PiLisp

pl        - Run REPL
pl [file] - Loads the file as PiLisp code
''';

void main(List<String> args) async {
  if (args.isEmpty) {
    repl();
  } else if (args.length == 1) {
    final arg = args[0].trim();
    if (arg == '-h' || arg == '--help') {
      print(usage);
      exit(0);
    } else {
      await loadFile(args[0]);
    }
    exit(0);
  } else {
    print(usage);
    exit(1);
  }
}
