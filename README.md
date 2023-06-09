*(Repository Deprecated: See [pilisp/pilisp-monorepo](https://github.com/pilisp/pilisp-monorepo))*

PiLisp—An interpreted Lisp inspired by Clojure.

Runs on all supported Dart targets.

> Alpha. Much works, much may change.

## Features

This package implements the core PiLisp language that works across Dart VM,
native compilation, Flutter, and web targets.

The core language supports:

* Clojure syntax
* Immutable data structures
* Macros
* Lexical closures
* Functions for many Dart Core classes and methods
* A growing subset of Clojure's functions/macros

By design and due to differences between the Java and Dart virtual machines,
there are many areas where PiLisp differs from Clojure. See [Comparison of
PiLisp & Clojure](doc/Comparison-PiLisp-Clojure.md) for more information.

## Usage

* [Download a release][releases] for standalone CLI usage.
* `dart pub add pilisp` to add as a library to your Dart project.

For CLI use, download the latest release for your platform and run the `pl`
executable.

```shell
$ pl
pl>
```

Run the `help` command for all options:

```shell
$ pl help
Run a PiLisp REPL, or try the subcommands for more options.

Usage: pl <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  eval   Evaluate PiLisp code passed as arguments.
  load   Load PiLisp code saved in files.
  repl   Start a PiLisp REPL.

Run "pl help <command>" for more information about a command.
```

For use in your Dart programs, `PiLisp.loadString` will read and evaluate
program source:

```dart
PiLisp.loadString('(+ 1 2 3 4)');
```

## Additional information

* [TODO PiLisp Language Tutorial][tutorial]
* [PiLisp Core Implementation][pilisp-core]
* [PiLisp Core Tests][pilisp-tests]
* [TODO Embedding PiLisp in Dart Programs][embedding]
* [pilisp-native] that takes advantage of host facilities (e.g., `dart:io`)
* [pilisp-web] that compiles to JavaScript targeting the Web

The name "PiLisp" was originally a shortened form of "Piped Lisp," because a
first prototype of this language was developed while building [a REPL
](https://github.com/semperos/shortcut-repl) for the Shortcut project management
SaaS product that included a rudimentary Lisp whose defining feature was use of
the pipe character `|` as an equivalent of Clojure's thread-first macro `->`.

## Build

1. Clone this repository
1. Run `dart pub get`
1. Run `./script/compile`

## Acknowledgements

Initial implementation of the reader was based on [ClojureDart's reader.cljd](https://github.com/Tensegritics/ClojureDart/blob/8a1b9ba5096bd88ae17a5960d9c3a20bebabfefd/clj/src/cljd/reader.cljd) licensed under the Eclipse Public License (EPL-1.0).

A rewrite of the reader was adapted from [dlox's scanner.dart](https://github.com/BertrandBev/dlox/blob/2879b46c1bda66c9e35291e0e42899ebeb01e54f/lib/scanner.dart) licensed under the MIT License.

Much of PiLisp's implementation (both Dart and PiLisp code) was copied and adapted directly from the Java and Clojure source code in the [Clojure project](https://github.com/clojure/clojure) licensed under the Eclipse Public License (EPL-1.0).

## License

Copyright © Daniel Gregoire 2022–2023

[Eclipse Public License - v 2.0](https://www.eclipse.org/org/documents/epl-2.0/EPL-2.0.txt)

    THE ACCOMPANYING PROGRAM IS PROVIDED UNDER THE TERMS OF THIS ECLIPSE
    PUBLIC LICENSE ("AGREEMENT"). ANY USE, REPRODUCTION OR DISTRIBUTION
    OF THE PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS AGREEMENT.


<!-- Links -->

[embedding]: https://github.com/pilisp/pilisp/blob/main/doc/Embedding.md
[pilisp-core]: https://github.com/pilisp/pilisp/blob/main/lib/src/pilisp_core_pilisp.dart
[pilisp-native]: https://github.com/pilisp/pilisp-native
[pilisp-org]: https://github.com/pilisp
[pilisp-tests]: https://github.com/pilisp/pilisp/blob/main/test/pilisp_test.dart
[pilisp-web]: https://github.com/pilisp/pilisp-web
[releases]: https://github.com/pilisp/pilisp/releases
[tutorial]: https://github.com/pilisp/pilisp/blob/main/doc/Tutorial.md
