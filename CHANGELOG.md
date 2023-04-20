## v1.0.0-alpha.10

* Adds not=, distinct?, private fns for case macro
* Adds repl/completions (used by inf-pilisp to provide auto-complete)
* Adds bitwise operations as functions: `bit-and` `bit-and-not` `bit-clear` `bit-flip` `bit-not` `bit-or` `bit-set` `bit-shift-left` `bit-shift-right` `bit-test` `bit-unsigned-bit-shift-right` `bit-xor`
* Adds WIP `transient` and `persistent!`
* Adds Three-letter names for functions that take a collection and produce another (rather than taking the _items_ to produce it): `lst` `map` `set` `vec`
   * For `map`, if you pass a single argument that is not a function, it will try to `to-map` it.
* Upgraded REPL experience by default (line editing, auto-complete). Use `pl -r` for the older, simpler REPL.
* Upgraded [fast_immutable_collections](https://github.com/marcglasberg/fast_immutable_collections) to latest stable (^9.0.0)

## v1.0.0-alpha.9

* Bump dependency on `pilisp_cli` so that minimum Dart SDK version is acceptable for analysis on pub.dev

## v1.0.0-alpha.8

* Adds initial multimethod support via `defmulti` and `defmethod`, for dispatch by `type` only
   * Does not yet support arbitrary dispatch functions
   * Does support `:default`
* Adds `boolean`, `current-time-millis`
* Supports setters in generated Dart code
* More Dart code documentation of public forms
* Adds [http](https://pub.dev/packages/http) package and includes in code gen
   * This package is multi-platform, hence its inclusion in the core language.
* Makes `ibool` convert by truthy-ness, not just strict `true` or `false`
* Adds `PLEnv.completionsFor` to provide completions based on all bindings in scope

## v1.0.0-alpha.7

* Adds `PLAwait` value that signals to Dart code evaluating PiLisp programs that the final value should be `await`ed.
   * This will be leveraged in [pilisp-cli](https://github.com/pilisp/pilisp-cli) for both `repl` and `loadFile` use-cases.

## v1.0.0-alpha.6

* Renames `corePiLisp` to `piLispCore`
* Documentation updates

## v1.0.0-alpha.5 (GitHub Pre-Release Only)

* Extended `cd` to allow traversing nested structures
* Nascent `Future` support (see pilisp-native for more)
* Makes `defmacro` accept metadata like `defn`
* Adds `apropos-full` which searches by full symbol name
* Fixes bugs where `reduce` could return a `PLReduced`
* Reimplements `butlast` using `reduce`

## v1.0.0-alpha.4 (GitHub Pre-Release Only)

* Exposed functions for `read-string`, `load-string`, and `eval`
* Ported `clojure.string` forms
* Implemented `zipmap`, `min`, `max`
* Corrected `map`, `partition` behavior for lists vs. vectors
* Improved exception handling and stack trace printing
* `assoc` now accepts vectors
* Implemented `test/throws` to test functions that throw an exception
* Bindings for mathematical constants available via `dart:math`, namely:  `math/e` `math/ln10` `math/ln2` `math/log10e` `math/log2e` `math/pi` `math/sqrt1-2` `math/sqrt2`
* Removed `uri` function. That was hand-written before Dart code gen for core classes was introduced, and is now available directly via `dart/Uri.parse` and `dart/Uri.parse-full`
* Ported `clojure.template` forms
* `cd` with no args now works in first position of `pl>` (and hence, at the REPL)
* Varargs are now bound as a list, rather than a vector

## v1.0.0-alpha.3 (GitHub Pre-Release Only)

* Impl. resolve in Dart for performance
* Support `def` in `pl>`
* Support -l/--load for PiLisp CLI, bind `*command-line-args*`
* In `pl>`, support passing `(.)` to initial form if fn with no args provided
* Rename `bindings` -> `bindings*` for rebinding in core
* Impl. partition-by w/reduce
* Impl. partition w/reduce
* Correct `(conj nil ,,,)`
* Add fnil
* Impl. interleave w/reduce, add ibool
* Impl. str/join using reduce w/StringBuffer
* Impl. take-while via reduce
* Impl. reduced for short-circuiting reduce
* Impl. take-while with while
* Impl. take with while
* Impl. iterate with while
* Impl. repeat using while
* Impl. time macro for timing execution
* Alias ! for write-state
* Impl. while special form
* Support @ for deref
* Impl. drop with nthrest
* Impl. nthrest with range and reduce
* Implement range
* Impl. concat with reduce
* Implement map via reduce to avoid stack consumption
* Correct comp implementation for >2 args
* Fix stateful bug for nested, closed-over bindings
* Implement filter via reduce to avoid stack overflow
* Port rest of clojure.walk


## v1.0.0-alpha.2 (GitHub Pre-Release Only)

* **⚡️ Features**
   * This release is the first compatible with the under-development [inf-pilisp](https://github.com/pilisp/emacs-inf-pilisp) Emacs package, for developing in PiLisp using Emacs' "Inferior Lisp" facilities.
   * `conj` now works with maps, e.g., `(conj {.a 1} {.b 2})` and is more `nil`-tolerant
   * `get` more tolerant (to match Clojure)
   * `get-in` ported from Clojure
   * Implementations from `clojure.set` now ported: `set/union` `set/intersection` `set/difference` `set/select` `set/project` `set/rename-keys` (also bound to `rename-keys`) `set/rename` `set/index` `set/join` `set/subset?` `set/superset?`
   * `reverse` ported, but vectors return vectors (not seq)
   * `resolve`, `doc` implemented
   * `arglists` function returns arglists of functions, terms/keywords, vectors, maps
   * `repl/load-file` which is available only at the REPL, since the core PiLisp package does not support `dart:io` usage.
* **💔 Notable Breaking Changes**
   * `piped` renamed to `pl>`, but also fixed behavior.
   * `values` renamed to `vals` to match Clojure name
   * Empty invocations now return the empty list, rather than `nil`

## v1.0.0-alpha.1 (GitHub Pre-Release Only)

* Initial version.
