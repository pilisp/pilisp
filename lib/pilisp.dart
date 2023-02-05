/// PiLisp Language
///
/// PiLisp stands for "Piped Lisp." PiLisp is an embedded pseudo-Lisp for Dart.
/// Distinguishing features include:
///
///  * Invocation—rather than simple evaluation—is the language default
///  * The pipe `|` character is used to thread results from expression to expression
///  * Parentheses are necessary only for non-top-level expressions
///  * Metadata can be stored on bindings in the environment
///  * Things that many Lisps have that PiLisp does not:
///     * There is no macro facility
///     * There are no cons cells
library pilisp;

export 'src/pilisp_public.dart';
