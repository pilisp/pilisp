# Comparison of PiLisp and Clojure

PiLisp is interpreted. Clojure is compiled.

PiLisp has been designed for use in smaller programs and systems.

PiLisp does not implement namespaces. As a convention, PiLisp uses a slash to
denote conceptual namespaces, e.g., `str/join` or `set/intersection`.

PiLisp's immutable data structures are backed by the
[fast_immutable_collections] library, not Clojure's implementations.

The Dart VM does not support multiple threads of execution. For this reason,
PiLisp does not have any of Clojure's concurrency features. Use `volatile!` or
the state-related functions.

The [dart:mirrors] library can only be used when running Dart programs via the
Dart VM. For this reason, the core PiLisp language does not integrate it, and
thus cannot provide ad hoc Dart reflection. The core PiLisp implementation does,
however, generate PiLisp stubs for many Dart Core classes and methods. See
PiLisp forms that start with `dart/`.

Destructuring is a powerful tool of thought. PiLisp supports destructuring in
`let` bindings. By design, it does not support them in function signatures.

PiLisp metadata is supported only on top-level bindings. Use `bindings` to get a
map of all available bindings.


<!-- Links -->
[dart:mirrors]: https://api.dart.dev/stable/2.19.1/dart-mirrors/dart-mirrors-library.html
[fast_immutable_collections]: https://pub.dev/documentation/fast_immutable_collections/latest/fast_immutable_collections/fast_immutable_collections-library.html