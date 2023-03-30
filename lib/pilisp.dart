/// The PiLisp Language
///
/// The core PiLisp language can run on any target that Dart supports. In order
/// to leverage each platform more fully, there are separate projects with
/// extensions to PiLisp for better compatibility with Dart VM, native, Flutter,
/// and Web targets:
///
///  * [pilisp-native](https://github.com/pilisp/pilisp-native)
///  * [pilisp-web](https://github.com/pilisp/pilisp-web)
///  * Others TBD
///
/// If you need to read a file, make an HTTP request, application, or want to
/// try out PiLisp in the browser, you should use one of the projects listed
/// above.
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
/// pl> 1
/// 1
///
/// pl> (type 1)
/// int
///
/// pl> int
/// Symbol int is undefined.
///
/// pl> 'int
/// int
///
/// pl> (type int)
/// symbol
///
/// pl> '(type int)
/// (
///   type
///   int
/// )
///
/// pl> (type '(type int))
/// list
///
/// pl> (list 1 2 3)
/// (
///   1
///   2
///   3
/// )
///
/// pl> (+ 1 2 3)
/// 6
///
/// pl> (fn? +)
/// true
///
/// pl> (type +)
/// (PLEnv, PLVector) => num
///
/// pl> +
/// #<(PLEnv, PLVector) => num: Closure: (PLEnv, PLVector) => num from Function 'addFn': static.>
///
/// ```
///
library pilisp;

export 'src/pilisp_public.dart';
