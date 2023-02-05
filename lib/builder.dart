/// This library is **not** intended to be imported by typical end-users unless
/// you are creating a custom compilation pipeline. See documentation for
/// details, and `build.yaml` for how these builders are configured by default.
library pilisp.builder;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/pilisp_dart_generator.dart';
Builder piLispDartLibraryBuilder(BuilderOptions options) => LibraryBuilder(
  PiLispDartGenerator(),
  generatedExtension: '.stub.dart',
);