/// The PiLisp Language
///
/// The core PiLisp language can run on any target that Dart supports. In order
/// to leverage each platform more fully, there are separate projects with
/// extensions to PiLisp for better compatibility with Dart VM, native, Flutter,
/// and Web targets:
///
///  * [pilisp-native](https://github.com/pilisp/pilisp-native)
///  * [pilisp-dart-vm](https://github.com/pilisp/pilisp-dart-vm)
///  * [pilisp-flutter](https://github.com/pilisp/pilisp-flutter)
///  * [pilisp-web](https://github.com/pilisp/pilisp-web)
///
/// If you need to read a file, make an HTTP request, embed PiLisp in a Flutter
/// application, or want to try out PiLisp in the browser, you should use one of
/// the projects listed above.
///
///
/// ## Dart API
///
/// The static methods of the [PiLisp] class are the primary interface to PiLisp
/// from Dart:
///
/// ```dart
/// PiLisp.loadString('(println (map inc [1 2 3 4 5]))');
/// ```
///
/// ## Language
///
/// PiLisp is a variant of Clojure. Due to some intentional design choices as
/// well as differences between the Dart and Java virtual machines, there are
/// also many differences.
///
/// PiLisp has a Read Eval Print Loop (REPL) that you can start by running the
/// `pl` program without any arguments. It is recommended you play along at the
/// REPL while you read this documentation.
///
/// ### Expressions
///
/// Everthing in PiLisp is an expression. Review the following REPL session and
/// experiment with the forms yourself to learn about the fundamental value
/// types in the language:
///
/// ```clojure
/// 1
/// ;; 1
///
/// (type 1)
/// ;; int
///
/// int
/// ;; Symbol int is undefined.
///
/// 'int
/// ;; int
///
/// (type int)
/// ;; symbol
///
/// '(type int)
/// ;; (
/// ;;   type
/// ;;   int
/// ;; )
///
/// (type '(type int))
/// ;; list
///
/// (list 1 2 3)
/// (
///   1
///   2
///   3
/// )
///
/// (+ 1 2 3)
/// ;; 6
///
/// (fn? +)
/// ;; true
///
/// (type +)
/// ;; (PLEnv, PLVector) => num
///
/// +
/// ;; #<(PLEnv, PLVector) => num: Closure: (PLEnv, PLVector) => num from Function 'addFn': static.>
///
/// ```
///
library pilisp;

export 'src/pilisp_public.dart';
