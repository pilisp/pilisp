// ;; -*- mode: pilisp -*-
final corePiLisp = r'''
(def fn
  {:macro true
   :doc "Define functions."}
  (fn* fn [& args] (cons 'fn* args)))

(def let
  {:macro true
   :doc "Create local bindings."}
  (fn* let [& args] (cons 'let* args)))

(declare map)

(def prn
  {:doc "Print to STDOUT in a way that can be read by PiLisp, and append a newline."}
  (fn* [& xs]
   ;; NB: print is Dart's cross-platform print() and always appends a newline.
   (apply print (map pr-str xs))))

(def gensym
  {:doc "Returns a new symbol with a unique name. If a prefix string is supplied, the name is prefix# where # is some unique number. If prefix is not supplied, the prefix is 'PL__'."}
  (fn* gensym
   ([] (gensym "PL__"))
   ([prefix-string] (symbol (str prefix-string (next-symbol-id))))))

;; defmacro <- defn <- or
(def or
  {:macro true
   :doc "Return first truthy value or last value if all are falsey."}
  (fn* or
       ([] nil)
       ([x] x)
       ([x & next]
        (let [or_ (gensym "or")]
          (list 'let [or_ x]
                (list 'if or_
                      or_
                      (cons 'or next)))))))

;; defmacro <- defn <- string?
(def string?
  {:doc "Returns true if the argument is a string."}
  (fn string?
    [x]
    (= 'String (type x))))

;; defmacro <- defn <- map?
(def map?
  {:doc "Returns true if the argument is a map."}
  (fn map?
    [x]
    (= 'map (type x))))

(def defn
  {.macro true}
  (fn defn [name metadata & arity-definitions]
    (let [explicit-metadata? (or (string? metadata) (map? metadata))
          arity-definitions (if explicit-metadata?
                              arity-definitions
                              (cons metadata arity-definitions))]
      (list 'def name (if explicit-metadata?
                        metadata
                        {})
            (cons 'fn* (cons name arity-definitions))))))

(defn when-not
  {:doc "Execute the body when the test is falsey. Returns nil otherwise."
   :macro true}
  [test & body]
  (list 'if test nil (cons 'do body)))

(defn assert
  {:macro true
   :doc "Evaluates expr and throws an exception if it does not evaluate to logical true."}
  ([x]
   (list 'when-not x
         (list 'throw (list 'ex-info (list 'str "Assert failed: " (list 'quote x)) {}))))
  ([x message]
   (list 'when-not x
         (list 'throw (list 'ex-info (list 'str "Assert failed: " message "\n" (list 'quote x)) {})))))

(defn not
  {:doc "Returns true if falsey, else false."}
  [x]
  (if x false true))

(defn println
  {:doc "Print to STDOUT and append a newline."}
  [& xs]
  ;; NB. For core PiLisp, Dart's print is used, which appends a new line.
  (apply print xs #_(conj xs "\n")))

(def ! write-state)

;; Math

(defn inc [n] (+ n 1))
(defn dec [n] (- n 1))
(defn zero? [n] (= 0 n))
(defn pos? [n] (> n 0))
(defn neg? [n] (< n 0))
(defn nat-int? [n] (>= n 0))

(defn mod
  {:doc "Modulus of num and div."}
  [num div]
  (let [m (rem num div)]
    (if (or (zero? m) (= (pos? num) (pos? div)))
      m
      (+ m div))))

(defn even? [n] (zero? (mod n 2)))
(defn odd? [n] (not (even? n)))

;; Collections

(def rest next)
(defn nnext [coll] (next (next coll)))

(defn nth
  {:doc "Return nth item from collection, or default if not present."}
  ([coll idx] (nth* coll idx))
  ([coll idx default]
   (assert (= 'int (type idx)))
   (if (>= idx (count coll))
     default
     (nth* coll idx))))

(defn first   [coll] (nth coll 0))
(defn second  [coll] (nth coll 1))
(defn third   [coll] (nth coll 2))
(defn fourth  [coll] (nth coll 3))
(defn fifth   [coll] (nth coll 4))
(defn sixth   [coll] (nth coll 5))
(defn seventh [coll] (nth coll 6))
(defn eighth  [coll] (nth coll 7))
(defn ninth   [coll] (nth coll 8))
(defn tenth   [coll] (nth coll 9))

(defn last [coll] (nth coll (dec (count coll))))

(defn defmacro
  {.macro true}
  [name metadata & arity-definitions]
  (cons 'defn
        (cons name
              (cons (assoc* metadata :macro true)
                    arity-definitions))))

(defmacro comment
  {:doc "Ignores body, yields nil"}
  [& body])

(defn into
  {:doc "Returns a new coll consisting of to-coll with all of the items of from-coll conjoined. A transducer may be supplied."}
  ([] [])
  ([to] to)
  ([to from]
   (reduce conj to from)))

(defmacro when
  {:doc "Executes the body when the test is truthy. Returns nil otherwise."}
  [test & body]
  (list 'if test (cons 'do body) nil))

(defn set?
  {:doc "Returns true if the argument is a set."}
  [x]
  (= 'set (type x)))

(defn get
  {:doc "Return the item found at the key or index provided. Different from nth in that it returns `nil` and never throws, even if index is out of range."}
  ([coll key] (get coll key nil))
  ([coll key default]
   (if (or (map? coll)
           (set? coll))
     (get* coll key default)
     (nth coll key default))))

(defn int?
  {:doc "Returns true if the argument is an int."}
  [x]
  (= 'int (type x)))

(defn double?
  {:doc "Returns true if the argument is a double."}
  [x]
  (= 'double (type x)))

(defn symbol?
  {:doc "Returns true if the argument is a symbol."}
  [x]
  (= 'symbol (type x)))

(defn keyword?
  {:doc "Returns true if the argument is a term (keyword equivalent). For compatibility with Clojure expectations."}
  [x]
  (= 'term (type x)))

(defn term?
  {:doc "Returns true if the argument is a term (keyword equivalent)."}
  [x]
  (= 'term (type x)))

(defn ident?
  {:doc "Returns true if x is a symbol or term (keyword)"}
  [x] (or (term? x) (symbol? x)))

(defn list?
  {:doc "Returns true if the argument is a list."}
  [x]
  (= 'list (type x)))

(defn vector?
  {:doc "Returns true if the argument is a vector."}
  [x]
  (= 'vector (type x)))

(defn seq?
  {:doc "Returns true if the argument is a seq-able collection."}
  [x]
  (or (list? x)
      (vector? x)))

(defn coll?
  {:doc "Returns true if the argument is an immutable collection."}
  [x]
  (or (list? x)
      (vector? x)
      (map? x)
      (set? x)))

(defn reg-exp?
  {:doc "Returns true if the argument is a regular expression."}
  [x]
  (= 'RegExp (type x)))

(defn named?
  {:doc "Returns true if the argument is a string, symbol, or term."}
  [x]
  (let [t (type x)]
    (or (= 'String t)
        (= 'symbol t)
        (= 'term t))))

(defmacro cond
  {:doc "Takes a set of test/expr pairs. It evaluates each test one at a time. If a test returns logical true, cond evaluates and returns the value of the corresponding expr and doesn't evaluate any of the other tests or exprs. (cond) returns nil."}
  [& clauses]
  (when (seq clauses)
    (list 'if (first clauses)
          (if (next clauses)
            (second clauses)
            (throw
             (ex-info "cond requires an even number of forms"
                      {:num-forms (count clauses)
                       :clauses (quote clauses)})))
          (cons 'cond (next (next clauses))))))

(defn empty
  {:doc "Returns an empty collection of the same category as coll, or nil"}
  [coll]
  (cond
    (list? coll) '()
    (vector? coll) []
    (map? coll) {}
    (set? coll) #{}
    :else nil))

(defmacro ->
  {:doc "Threads the expr through the forms. Inserts x as the second item in the first form, making a list of it if it is not a list already. If there are more forms, inserts the first form as the second item in second form, etc."}
  [x & forms]
  (loop [x x
         forms forms]
    (if forms
      (let [form (first forms)
            threaded (if (seq? form)
                       (cons (first form) (cons x (next form)))
                       (list form x))]
        (recur threaded (next forms)))
      x)))

(defn reverse
  {:doc "Returns items of coll in reverse order. Vectors returned as vectors."}
  [coll]
  (if (vector? coll)
    (into [] (reduce conj () coll))
    (reduce conj () coll)))

(defn concat
  {:doc "Returns a lazy seq representing the concatenation of the elements in the supplied colls."}
  ([] nil)
  ([x] x)
  ([x y]
   (let [s (seq x)]
     (if s
       (reduce
        (fn concat-reduce-2 [acc s-item]
          (cons s-item acc))
        y
        (reverse s))
       y)))
  ([x y & zs]
   (let [all (cons x (cons y zs))]
     (reduce
      (fn concat-reduce-3 [acc coll]
        (let [s (seq coll)]
          (if s
            (reduce
             (fn concat-reduce-3-inner [acc-inner s-item]
               (cons s-item acc-inner))
             acc
             (reverse s))
            acc)))
      ()
      (reverse all)))))

(defmacro and
  {:doc "Evaluates exprs one at a time, from left to right. If a form returns logical false (nil or false), and returns that value and doesn't evaluate any of the other expressions, otherwise it returns the value of the last expr. (and) returns true."}
  ([] true)
  ([x] x)
  ([x & next]
   (let [and_ (gensym "and")]
     (list 'let* [and_ x]
           (list 'if and_ (concat (list 'and) next) and_)))))

(defn partial
  {:doc "Partially apply the given function with the given arguments."}
  ([f] f)
  ([f arg1]
   (fn
     ([] (f arg1))
     ([x] (f arg1 x))
     ([x y] (f arg1 x y))
     ([x y z] (f arg1 x y z))
     ([x y z & args] (apply f arg1 x y z args))))
  ([f arg1 arg2]
   (fn
     ([] (f arg1 arg2))
     ([x] (f arg1 arg2 x))
     ([x y] (f arg1 arg2 x y))
     ([x y z] (f arg1 arg2 x y z))
     ([x y z & args] (apply f arg1 arg2 x y z args))))
  ([f arg1 arg2 arg3]
   (fn
     ([] (f arg1 arg2 arg3))
     ([x] (f arg1 arg2 arg3 x))
     ([x y] (f arg1 arg2 arg3 x y))
     ([x y z] (f arg1 arg2 arg3 x y z))
     ([x y z & args] (apply f arg1 arg2 arg3 x y z args))))
  ([f arg1 arg2 arg3 & more]
   (fn [& args] (apply f arg1 arg2 arg3 (concat more args)))))

(defn complement
  {:doc "Takes a fn f and returns a fn that takes the same arguments as f, has the same effects, if any, and returns the opposite truth value."}
  [f]
  (fn
    ([] (not (f)))
    ([x] (not (f x)))
    ([x y] (not (f x y)))
    ([x y & zs] (not (apply f x y zs)))))

(defn identity
  {:doc "Return the argument provided."}
  [x] x)

(defn comp
  {:doc "Returns the composition of the given functions."}
  ([] identity)
  ([f] f)
  ([f g]
   (fn
     ([] (f (g)))
     ([x] (f (g x)))
     ([x y] (f (g x y)))
     ([x y z] (f (g x y z)))
     ([x y z & args] (f (apply g x y z args)))))
  ([f g & fs]
   (reduce comp (cons f (cons g fs)))))

(defmacro when-let
  {:doc "When test is true, evaluates body with binding-form bound to the value of test"}
  [bindings & body]
  ;; (assert-args
  ;;  (vector? bindings) "a vector for its binding"
  ;;  (= 2 (count bindings)) "exactly 2 forms in binding vector")
  (let [form (nth bindings 0)
        tst (nth bindings 1)
        temp_ (gensym "temp")]
    (list 'let
          [temp_ tst]
          (list 'when temp_
                (list 'let [form temp_]
                      (cons 'do body))))))

(defmacro if-let
  {:doc "bindings => binding-form test

  If test is true, evaluates then with binding-form bound to the value of
  test, if not, yields else"}
  ([bindings then]
   (list 'if-let bindings then nil))
  ([bindings then else & oldform]
   ;; (assert-args
   ;;  (vector? bindings) "a vector for its binding"
   ;;  (nil? oldform) "1 or 2 forms after binding vector"
   ;;  (= 2 (count bindings)) "exactly 2 forms in binding vector")
   (let [form (bindings 0)
         tst (bindings 1)
         temp (gensym)]
     (list 'let [temp tst]
           (list 'if temp
                 (list 'let [form temp]
                       then)
                 else)))))

(defmacro time
  {:doc "Evaluates expr and prints the time it took. Returns the value of expr."}
  [expr]
  (let [sw-g (gensym 'stopwatch)
        ret-g (gensym 'return)]
    (list 'let
          [sw-g (list 'dart/Stopwatch.)
           '_ (list 'dart/Stopwatch.start sw-g)
           ret-g expr
           '_ (list 'dart/Stopwatch.stop sw-g)]
          (list 'println (list 'str "Elapsed time: " (list '/ (list 'dart/Stopwatch.elapsedMicroseconds sw-g) 1000) " milliseconds"))
          ret-g)))

(defn nthrest
  {:doc "Returns the nth rest of coll, coll when n is 0."}
  [coll n]
  (cond
    (neg? n) coll
    (> n (count coll)) (empty coll)
    :else
    (reduce
     (fn [acc _]
       (next acc))
     coll
     (range n))))

(defn drop
  [n coll]
  (nthrest coll n))

(defn repeat
  {:doc "Returns a sequence of xs of length n."}
  ([x] (repeat 1 x))
  ([n x]
   (let [c (state 0)
         r (state [])]
     (while (< @c n)
       (! c inc)
       (! r conj x))
     @r)))

(defn iterate
  {:doc "Returns a sequence of x, (f x), (f (f x)) etc."}
  ([f x] (iterate 1 x))
  ([n f x]
   (let [c    (state 1)
         prev (state x)
         ret  (state [x])]
     (while (< @c n)
       (! c inc)
       (let [next-value (f @prev)]
         (! prev next-value)
         (! ret conj next-value))))))

(declare update)

(defn take
  {:doc "Returns a sequence of the first n items in coll, or all items if there are fewer than n.  Returns a stateful transducer when no collection is provided."}
  [n coll]
  (cond
    (<= n 0) ()
    (> n (count coll)) coll
    :else
    ;; CONSIDER: reduce + reduced
    (let [c (state 0)
          coll (state coll)
          ret (state [])]
      (while (< @c n)
        (! c inc)
        (! ret conj (first @coll))
        (! coll (next @coll)))
      @ret)))

(defn take-while
  {:doc "Returns a sequence of successive items from coll while (pred item) returns logical true."}
  [pred coll]
  (reduce
   (fn take-while-reduce [acc item]
     (if (pred item)
       (conj acc item)
       (reduced acc)))
   []
   coll))

(defn partition-reduction
  {:doc "Returns map of parts, whole, and step-n for partitioning the giving collection with n-sized buckets at step intervals."
   :private true}
  [n step coll]
  (reduce
            (fn [acc item]
              ;; NB. Destructuring not available yet, see below
              (let [parts (:parts acc) whole (:whole acc) step-n (:step-n acc)
                    ;; Handle completed partition
                    v (if (= n (count (first parts)))
                        [(next parts) (conj whole (first parts))]
                        [parts whole])
                    parts (first v) whole (second v)
                    ;; Add new partition if step
                    v (if (> step-n 0)
                        [(dec step-n) parts]
                        ;; Start next step, include this step as 1st
                        [(dec step) (conj parts [])])
                    step-n (first v) parts (second v)
                    ;; Fill in partitions with current item
                    parts (map #(conj % item) parts)]
                {:parts parts
                 :step-n step-n
                 :whole whole}))
            {:parts [[]]
             :step-n step
             :whole []}
            coll))

(declare empty?)

(defn partition
  {:doc "Returns a sequence of lists of n items each, at offsets step apart. If step is not supplied, defaults to n, i.e. the partitions do not overlap. If a pad collection is supplied, use its elements as necessary to complete last partition upto n items. In case there are not enough padding elements, return a partition with less than n items."}
  ([n coll]
   (partition n n coll))
  ([n step coll]
   (let [m (partition-reduction n step coll)
         parts (:parts m) whole (:whole m)
         remnant (first parts)]
     (if (= n (count remnant))
       (conj whole remnant)
       whole)))
  ([n step pad coll]
   (let [m (partition-reduction n step coll)
         parts (:parts m) whole (:whole m)
         remnant (first parts)]
     (if (empty? remnant)
       whole
       (conj whole
             (apply conj
                    remnant
                    (take (- n (count remnant)) pad)))))))

(defn partition-by*
  [f coll]
  (when-let [s (seq coll)]
    (let [fst (first s)
          fv (f fst)
          run (cons fst (take-while (fn partition-by-take-while [x] (= fv (f x))) (next s)))]
      (cons run (partition-by* f (drop (count run) s))))))

(defn partition-by
  [f coll]
  (let [s (seq coll)
        m (reduce
           (fn [acc item]
             (let [prev (:prev acc) part (:part acc) whole (:whole acc)
                   check (f item)]
               (if (= check prev)
                 {:prev prev
                  :part (conj part item)
                  :whole whole}
                 {:prev check
                  :part [item]
                  :whole (conj whole part)})))
           {:prev (f (first s))
            :part [(first s)]
            :whole []}
           (next s))
        whole (:whole m) part (:part m)]
    (conj whole part)))

(defn true?
  {:doc "Returns true if identical to the boolean value true. Prefer truthy/falsey semantics where possible."}
  [x]
  (= x true))

(defn false?
  {:doc "Returns false if identical to the boolean value false. Prefer truthy/falsey semantics where possible."}
  [x]
  (= x false))

(defn boolean?
  {:doc "Returns true if the argument is either the boolean value true or false."}
  [x]
  (or (true? x) (false? x)))

(defn nil?
  {:doc "Returns true if the argument is identical to nil. Prefer truthy/falsey semantics where possible."}
  [x]
  (= x nil))

(defn some?
  {:doc "Returns true if the argument is not nil. Returns false otherwise."}
  [x]
  (not (nil? x)))

(defn some
  {:doc "Returns the first logical true value of (pred x) for any x in coll, else nil.  One common idiom is to use a set as pred, for example this will return :fred if :fred is in the sequence, otherwise nil: (some #{:fred} coll)"}
  [pred coll]
  (when-let [s (seq coll)]
    (or (pred (first s)) (some pred (next s)))))

(defn any?
  {:doc "Returns true regardless of argument."}
  [_x]
  true)

(defn fnil
  {:doc "Takes a function f, and returns a function that calls f, replacing a nil first argument to f with the supplied value x. Higher arity versions can replace arguments in the second and third positions (y, z). Note that the function f can take any number of arguments, not just the one(s) being nil-patched."}
  ([f x]
   (fn
     ([a] (f (if (nil? a) x a)))
     ([a b] (f (if (nil? a) x a) b))
     ([a b c] (f (if (nil? a) x a) b c))
     ([a b c & ds] (apply f (if (nil? a) x a) b c ds))))
  ([f x y]
   (fn
     ([a b] (f (if (nil? a) x a) (if (nil? b) y b)))
     ([a b c] (f (if (nil? a) x a) (if (nil? b) y b) c))
     ([a b c & ds] (apply f (if (nil? a) x a) (if (nil? b) y b) c ds))))
  ([f x y z]
   (fn
     ([a b] (f (if (nil? a) x a) (if (nil? b) y b)))
     ([a b c] (f (if (nil? a) x a) (if (nil? b) y b) (if (nil? c) z c)))
     ([a b c & ds] (apply f (if (nil? a) x a) (if (nil? b) y b) (if (nil? c) z c) ds)))))

(defn full-name
  [x]
  (name* x))

(defn name
  [x]
  (cond
    (string? x) x

    (or (term? x)
        (symbol? x))
    (let [s (full-name x)]
      (if (dart/String.contains s "/")
        (second (dart/String.split (name* x) "/"))
        s))))

(defn namespace
  {:doc "PiLisp does not currently support namespaces. This returns anything before the first / in a symbol or term's name, since that is useful as a visual cue and makes destructuring useful for more concise bindings."}
  [x]
  (if (or (term? x)
          (symbol? x))
    (let [s (full-name x)]
      (when (dart/String.contains s "/")
        (first (dart/String.split s "/"))))
    (throw (ex-info (str "Cannot get the namespace of a " (type x) " value." {})))))

(defn ->>*
  {:doc "Helper for ->>"
   :private true}
  [x forms]
  (if forms
    (let [form (first forms)
          threaded (if (list? form)
                     (let [fst (first form)
                           nxt (next form)]
                       (concat (cons fst nxt) [x]))
                     (list form x))]
      (->>* threaded (next forms)))
    x))

(defmacro ->>
  {:doc "Threads the expr through the forms. Inserts x as the last item in the first form, making a list of it if it is not a list already. If there are more forms, inserts the first form as the last item in second form, etc."}
  [x & forms]
  (->>* x (seq forms)))

(defn set [coll]
  (if (set? coll)
    coll
    (into #{} coll)))

(defn vec [coll]
  (if (vector? coll)
    coll
    (apply vector (seq coll))))

(defn every?
  "Returns true if (pred x) is logical true for every x in coll, else false."
  [pred coll]
  (cond
    (nil? (seq coll)) true
    (pred (first coll)) (every? pred (next coll))
    :else false))

(defn empty? [coll] (not (seq coll)))

(defn contains-key?
  [coll x]
  (cond
    (nil? coll)
    false

    (map? coll)
    (dart/Map.containsKey (to-dart-map coll) x)

    (or (vector? coll)
        (list? coll))
    (> (count coll) x 0)

    (set? coll)
    (dart/Iterable.contains coll x)

    :else
    (throw (ex-info (str "Don't know how to check whether a value of type " (type coll) " contains keys.") {}))))

(defn contains-value?
  [coll x]
  (cond
    (nil? coll)
    false

    (map? coll)
    (dart/Map.containsValue (to-dart-map coll) x)

    (or (vector? coll)
        (list? coll))
    (dart/Iterable.contains (to-dart-list coll) x)

    (set? coll)
    (dart/Iterable.contains coll x)

    (string? coll)
    (dart/String.contains coll x)

    :else
    (throw (ex-info (str "Don't know how to check whether a value of type " (type coll) " contains values.") {}))))

(def contains? contains-key?)

(def disj dissoc)

(let [butlast*
      (fn butlast*
        [ret coll]
        (if (next coll)
          (butlast* (conj ret (first coll)) (next coll))
          ret))]
  (defn butlast [coll]
    (butlast* [] coll)))

(declare interleave)

(defn map
  ([f coll]
   (when-let [s (seq coll)]
     (reduce
      (fn map-reduce-1 [acc item]
        (conj acc (f item)))
      (empty s)
      s)))
  ([f c1 c2]
   (let [s1 (seq c1) s2 (seq c2)]
     (when (and s1 s2)
       (reduce
        (fn map-reduce-2 [acc item]
          (let [item-a (first item) item-b (second item)]
            (conj acc (f item-a item-b))))
        (empty s1)
        (partition 2 (interleave s1 s2))))))
  ([f c1 c2 c3]
   (let [s1 (seq c1) s2 (seq c2) s3 (seq c3)]
     (when (and s1 s2 s3)
       (reduce
        (fn map-reduce-3 [acc item]
          (let [item-a (first item) item-b (second item) item-c (third item)]
            (conj acc (f item-a item-b item-c))))
        (empty s1)
        (partition 3 (interleave s1 s2 s3))))))
  ([f c1 c2 c3 c4]
   (let [s1 (seq c1) s2 (seq c2) s3 (seq c3) s4 (seq c4)]
     (when (and s1 s2 s3 s4)
       (reduce
        (fn map-reduce-3 [acc item]
          (let [item-a (first item) item-b (second item) item-c (third item) item-d (fourth item)]
            (conj acc (f item-a item-b item-c item-d))))
        (empty s1)
        (partition 4 (interleave s1 s2 s3 s4))))))
  ;; NB. Submit a pull request if you want more.
  )

(def mapv (comp vec map))

(defn mapcat
  {:doc "Returns the result of applying concat to the result of applying map to f and colls.  Thus function f should return a collection."}
  [f & colls]
  (apply concat (apply map f colls)))

;; NB. Implemented with reduce to prevent stack consumption.
(defn filter
  [pred coll]
  (reduce
   (fn filter-reduce [acc item]
     (if (pred item)
       (conj acc item)
       acc))
   []
   coll))

(def filterv (comp vec filter))

(defn remove
  [pred coll]
  (filter (complement pred) coll))

;; TODO Support vector use-case
(defn assoc
  {:doc "assoc[iate]. When applied to a map, returns a new map of the same (hashed/sorted) type, that contains the mapping of key(s) to val(s). When applied to a vector, returns a new vector that contains val at index. Note - index must be <= (count vector)."}
  ([map key val] (assoc* map key val))
  ([map key val & kvs]
   (let [ret (assoc* map key val)]
     (if kvs
       (if (next kvs)
         (apply assoc ret (first kvs) (second kvs) (nnext kvs))
         (throw (ex-info
                 "assoc expects even number of arguments after map/vector, found odd number"
                 {})))
       ret))))

(defn update
  {:doc "Given a map, a key, and a function, pass the value in the map at that key to the function, using the return value as the entry's new value."}
  ([m k f]
   (assoc m k (f (get m k))))
  ([m k f x]
   (assoc m k (f (get m k) x)))
  ([m k f x y]
   (assoc m k (f (get m k) x y)))
  ([m k f x y z]
   (assoc m k (f (get m k) x y z)))
  ([m k f x y z & more]
   (assoc m k (apply f (get m k) x y z more))))

(defn merge
  {:doc "Returns a map that consists of the rest of the maps conj-ed onto the first.  If a key occurs in more than one map, the mapping from the latter (left-to-right) will be the mapping in the result."}
  [& maps]
  (when (some identity maps)
    (reduce (fn merge-reduce [acc m] (conj (or acc {}) m)) maps)))

;; NB: For now. Consider whether we need full MapEntry support.
(def key first)
(def val second)

(defn walk
  {:doc "Traverses form, an arbitrary data structure.  inner and outer are functions.  Applies inner to each element of form, building up a data structure of the same type, then applies outer to the result. Recognizes all Clojure data structures. Consumes seqs as with doall."}
  [inner outer form]
  (cond
   (list? form) (outer (apply list (map inner form)))
   (map-entry? form)
   (outer [(inner (key form)) (inner (val form))])
   ;; (instance? clojure.lang.IRecord form)
   ;;   (outer (reduce (fn [r x] (conj r (inner x))) form form))
   (coll? form) (outer (into (empty form) (map inner form)))
   :else (outer form)))

(defn postwalk
  {:doc  "Performs a depth-first, post-order traversal of form.  Calls f on each sub-form, uses f's return value in place of the original. Recognizes all Clojure data structures. Consumes seqs as with doall."}
  [f form]
  (walk (partial postwalk f) f form))

(defn prewalk
  {:doc "Like postwalk, but does pre-order traversal."}
  [f form]
  (walk (partial prewalk f) identity (f form)))

(defmacro as->
  {:doc "Binds name to expr, evaluates the first form in the lexical context of that binding, then binds name to that result, repeating for each successive form, returning the result of the last form."}
  [expr name & forms]
  (let [forms-sym (gensym)]
    (list 'let
          (vec
           (concat
            [name expr]
            (mapcat (fn [form] [name form]) (butlast forms))))
          (if (empty? forms)
            name
            (last forms)))))

;; NB: Extend with vectors, sets, and maps, then use different
;;     predicate for pl macro.
(defn invocable-form?
  {:private true}
  [x]
  (or (fn? x)     ;; invocable
      (symbol? x) ;; may resolve to invocable
      (term? x)   ;; invocable
      (and (list? x)
           (or (= 'fn (first x))
               (= 'fn* (first x))))   ;; fn literal
      ))

(def pipe-param '$)
(def pipe-sep (partial = '|))

(defn specifies-pipe-param?
  {:private true}
  [form]
  (let [result (state false)
        _ (postwalk (fn pipe-param-walk [x]
                      (when (= x pipe-param)
                        (write-state result true)))
                    form)]
    (deref result)))

(defmacro pl>
  {:doc "The Piped Lisp macro, extended to understanding the global parent value."}
  [& forms]
  (let [delimited-forms (->> (partition-by pipe-sep forms)
                             ;; Remove | as pure syntax, and support
                             ;; empty expressions
                             (remove (fn is-pipe [coll] (every? pipe-sep coll)))
                             (map #(into () (reverse %))))
        ;; The expr for as->
        first-clause-form (first delimited-forms)
        car (first first-clause-form)
        car-g (gensym 'car)
        ;; partition-by wrapped every clause in a list
        first-clause (if (invocable-form? car)
                       (list 'let [car-g car]
                             (list 'if (list 'fn? car-g) ;; TODO Decide on term auto-invocation
                                   (if (> (count first-clause-form) 1)
                                     first-clause-form
                                     (reverse (cons (list '.) (reverse first-clause-form))))
                                   (list 'do car-g)))
                       (cons 'do first-clause-form))
        ;; Body of as->
        next-clauses (->> (next delimited-forms)
                          (map (fn format-next-clause [form]
                                 ;; NB: There are possible footguns here,
                                 ;;     but I think they're easily detected and
                                 ;;     avoided given intended scope of usage
                                 ;;     of this macro.
                                 (if (specifies-pipe-param? form)
                                   form
                                   (concat form [pipe-param])))))]
    ;; as-> does the heavy lifting
    (if (empty? next-clauses)
      first-clause
      (concat (list 'as-> first-clause pipe-param) next-clauses))))

(defn destructure [bindings]
  (let [bents (partition 2 bindings)
        pb (fn pb [bvec b v]
             (let [pvec
                   (fn [bvec b val]
                     (let [gvec (gensym "vec__")
                           gseq (gensym "seq__")
                           gfirst (gensym "first__")
                           has-rest (some #{'&} b)]
                       (loop [ret (let [ret (conj bvec gvec val)]
                                    (if has-rest
                                      (conj ret gseq (list 'seq gvec))
                                      ret))
                              n 0
                              bs b
                              seen-rest? false]
                         (if (seq bs)
                           (let [firstb (first bs)]
                             (cond
                               (= firstb '&) (recur (pb ret (second bs) gseq)
                                                    n
                                                    (nnext bs)
                                                    true)
                               (= firstb :as) (pb ret (second bs) gvec)
                               :else (if seen-rest?
                                       (throw (ex-info "Unsupported binding form, only :as can follow & parameter" {}))
                                       (recur (pb (if has-rest
                                                    (conj ret
                                                          gfirst (list 'first gseq)
                                                          gseq (list 'next gseq))
                                                    ret)
                                                  firstb
                                                  (if has-rest
                                                    gfirst
                                                    (list 'nth gvec n nil)))
                                              (inc n)
                                              (next bs)
                                              seen-rest?))))
                           ret))))
                   pmap
                   (fn [bvec b v]
                     (let [gmap (gensym "map__")
                           gmapseq gmap ;; (with-meta gmap {:tag 'clojure.lang.ISeq})
                           defaults (:or b)]
                       (loop [ret (-> bvec
                                      (conj gmap)
                                      (conj v)
                                      (conj (if (seq? gmap)
                                              (if (next gmapseq)
                                                (apply hash-map gmapseq)
                                                (if (seq gmapseq)
                                                  (first gmapseq)
                                                  {}))
                                              gmap))
                                      (conj gmap)
                                      ((fn [ret]
                                         (if (:as b)
                                           (conj ret (:as b) gmap)
                                           ret))))
                              bes (let [transforms
                                        (reduce
                                         (fn reduce-transforms-mk [transforms mk]
                                           (if (keyword? mk)
                                             (let [mkns (namespace mk)
                                                   mkn (name mk)]
                                               (cond (= mkn "keys") (assoc transforms mk (fn transform-keys [sym] (keyword (or mkns (namespace sym)) (name sym))))
                                                     (= mkn "syms") (assoc transforms mk (fn transform-syms [sym] (list 'quote (symbol (or mkns (namespace sym)) (name sym)))))
                                                     (= mkn "strs") (assoc transforms mk str)
                                                     :else transforms))
                                             transforms))
                                         {}
                                         (keys b))]
                                    (reduce
                                     (fn reduce-be-entry [bes entry]
                                       (reduce (fn reduce-val-entry [a b] (assoc a b ((val entry) b)))
                                               (dissoc bes (key entry))
                                               ((key entry) bes)))
                                     (dissoc b :as :or)
                                     transforms))]
                         (if (seq bes)
                           (let [bb (key (first bes))
                                 bk (val (first bes))
                                 local (if (named? bb) (symbol (name bb)) bb)
                                 bv (if (contains-key? defaults local)
                                      (list 'get gmap bk (defaults local))
                                      (list 'get gmap bk))]
                             (recur (if (ident? bb)
                                      (-> ret (conj local bv))
                                      (pb ret bb bv))
                                    (next bes)))
                           ret))))]
               (cond
                 (symbol? b) (-> bvec (conj b) (conj v))
                 (vector? b) (pvec bvec b v)
                 (map? b) (pmap bvec b v)
                 :else (throw (ex-info (str "Unsupported binding form: " b) {})))))
        process-entry (fn process-entry [bvec b] (pb bvec (first b) (second b)))]
    (if (every? symbol? (map first bents))
      bindings
      (reduce process-entry [] bents))))

(defmacro let
  {:doc "binding => binding-form init-expr binding-form => name, or destructuring-form destructuring-form => map-destructure-form, or seq-destructure-form

  Evaluates the exprs in a lexical context in which the symbols in the binding-forms are bound to their respective init-exprs or parts therein.

  See https://clojure.org/reference/special_forms#binding-forms for more information about destructuring."}
  [bindings & body]
  ;; (assert-args
  ;;  (vector? bindings) "a vector for its binding"
  ;;  (even? (count bindings)) "an even number of forms in binding vector")
  (let [destructured-bindings (destructure bindings)]
    (list 'let* destructured-bindings (cons 'do body))))

;; Destructured let now available.

(defn bindings []
  (into {} (remove (comp :private :meta val) (bindings*))))

(defn get-in
  {:doc "Returns the value in a nested associative structure, where ks is a sequence of keys. Returns nil if the key is not present, or the not-found value if supplied."}
  ([m ks]
   (reduce get m ks))
  ([m ks not-found]
   (loop [sentinel (dart/Object.)
          m m
          ks (seq ks)]
     (if ks
       (let [m (get m (first ks) sentinel)]
         (if (identical? sentinel m)
           not-found
           (recur sentinel m (next ks))))
       m))))

(def ibool
  {:doc "Iverson boolean"}
  {true 1 false 0})

(defn interleave
  {:doc "Returns a sequence of the first item in each coll, then the second etc."}
  ([] ())
  ([c1] c1)
  ([c1 c2]
   (let [s1 (seq c1) s2 (seq c2)]
     (:ret
      (reduce
       (fn interleave-reduce [acc item]
         (let [{:keys [s2 ret]} acc]
           (if (empty? s2)
             (reduced {:ret ret})
             {:s2 (next s2)
              :ret (conj ret item (first s2))})))
       {:s2 s2
        :ret []}
       s1))))
  ([c1 c2 & colls]
   ;; TODO Consider varargs as lists to match Clojure
   (let [ss (map seq (vec (cons c1 (cons c2 colls))))]
     (reduce
      (fn interleave-reduce-var [acc item]
        (let [{:keys [others ret]} acc
              some-empty? (= 1 (reduce * (map (comp ibool empty?) others)))]
          (if some-empty?
            (reduced {:ret ret})
            {:others (map next others)
             :ret (apply conj ret item (map first others))})))
      {:others (next ss)
       :ret []}
      (first ss)))))

(defn resolve
  {:doc "Resolve a symbol to an entry in the PiLisp bindings map."}
  [sym]
  (get (bindings) sym))

(defmacro doc
  {:doc "Print doc string for the binding for `sym`, if it exists."}
  [sym]
  (let [binding-g (gensym 'binding)]
    (list 'let [binding-g (list 'resolve (list 'quote sym))]
          (list 'if (list 'nil? binding-g)
                (list 'println (list 'str "<No binding for " sym " >"))
                (list 'println (list 'or
                                     (list 'get-in binding-g [:meta :doc])
                                     "<No documentation>"))))))

;; PiLisp Environment

(defn parent-to-string
  {:doc "How should the parent value of the environment be rendered as a string, for example in the REPL prompt?"}
  [x]
  (cond
    (symbol? x) x
    (vector? x) (str "[#"(count x) "]")
    (list? x) (str "(#"(count x) ")")
    (map? x) (str "{#"(count x) "}")
    (set? x) (str "#{#"(count x) "}")
    (string? x) (str "\"#"(count x) "\"")
    :else (type x)))

(defmacro cd
  {:doc "Change the current parent value in the PiLisp environment. Macro so as to support symbols for names and binding resolution."}
  ([] '(pl/set-parent))
  ([new-parent]
   (list 'pl/set-parent
         (if (symbol? new-parent)
           (list 'quote new-parent)
           new-parent))))

(defn .
  {:doc "Current parent value. Resolves symbols using bindings at invocation time."}
  [& _]
  (let [value (pl/get-parent)]
    (if (symbol? value)
      (let [bs (bindings)]
        (if (contains-key? bs value)
          (.value (get (bindings) value))
          (println "Warning: No such symbol" value)))
      value)))

(defn ls
  ([] (ls (.)))
  ([x]
   (cond
     (or (vector? x)
         (list? x)
         (set? x))
     x

     (or (string? x)
         (map? x))
     (seq x)

     :else nil)))

(defn apropos [search]
  (let [search (dart/String.toLowerCase (name search))]
    (map key
         (filter
          (fn [binding]
            (let [[sym {:keys [value meta]}] binding
                  doc (dart/String.toLowerCase (or (:doc meta) ""))
                  sym (-> sym name dart/String.toLowerCase)]
              (or (dart/String.contains sym search)
                  (dart/String.contains doc search))))
          (bindings)))))

;; Strings

(defn str/join
  [sep coll]
  (let [sb (dart/StringBuffer.)]
    (cond
      (empty? coll) ""
      (= 1 (count coll)) (str (first coll))
      :else
      (do
        (dart/StringBuffer.write sb (first coll))
        (dart/StringBuffer.toString
         (reduce
          (fn [sb item]
            (dart/StringBuffer.write sb sep)
            (dart/StringBuffer.write sb item)
            sb)
          sb
          (next coll)))))))

;; Maps

(defn select-keys
  {:doc "Returns a map containing only those entries in map whose key is in keys"}
  [map keyseq]
  (loop [ret {} keys (seq keyseq)]
    (if keys
      (let [k (first keys)]
        (if (contains-key? map k)
          (recur (assoc ret k (get map k))
                 (next keys))
          (recur ret
                 (next keys))))
      ret)))

;; Sets

(defn max-key
  {:doc "Returns the x for which (k x), a number, is greatest. If there are multiple such xs, the last one is returned."}
  ([k x] x)
  ([k x y] (if (> (k x) (k y)) x y))
  ([k x y & more]
   (let [kx (k x) ky (k y)
         [v kv] (if (> kx ky) [x kx] [y ky])]
     (loop [v v kv kv more more]
       (if more
         (let [w (first more)
               kw (k w)]
           (if (>= kw kv)
             (recur w kw (next more))
             (recur v kv (next more))))
         v)))))

(defn bubble-max-key
  {:doc "Move a maximal element of coll according to fn k (which returns a number) to the front of coll."}
  [k coll]
  (let [max (apply max-key k coll)]
    (cons max (remove #(identical? max %) coll))))

(defn set/union
  {:doc "Return a set that is the union of the input sets"}
  ([] #{})
  ([s1] s1)
  ([s1 s2]
   (if (< (count s1) (count s2))
     (reduce conj s2 s1)
     (reduce conj s1 s2)))
  ([s1 s2 & sets]
   (let [bubbled-sets (bubble-max-key count (conj sets s2 s1))]
     (reduce into (first bubbled-sets) (rest bubbled-sets)))))

(defn set/intersection
  {:doc "Return a set that is the intersection of the input sets"}
  ([s1] s1)
  ([s1 s2]
   (loop [s1 s1 s2 s2]
     (if (< (count s2) (count s1))
       (recur s2 s1)
       (reduce (fn [result item]
                 (if (contains? s2 item)
                   result
                   (disj result item)))
               s1 s1))))
  ([s1 s2 & sets]
   (let [bubbled-sets (bubble-max-key #(- (count %)) (conj sets s2 s1))]
     (reduce set/intersection (first bubbled-sets) (rest bubbled-sets)))))

(defn set/difference
  {:doc "Return a set that is the first set without elements of the remaining sets"}
  ([s1] s1)
  ([s1 s2]
   (if (< (count s1) (count s2))
     (reduce (fn [result item]
               (if (contains? s2 item)
                 (disj result item)
                 result))
             s1 s1)
     (reduce disj s1 s2)))
  ([s1 s2 & sets]
   (reduce set/difference s1 (conj sets s2))))

(defn set/select
  "Returns a set of the elements for which pred is true"
  [pred xset]
    (reduce (fn [s k] (if (pred k) s (disj s k)))
            xset xset))

(defn set/project
  {:doc "Returns a rel of the elements of xrel with only the keys in ks"}
  [xrel ks]
  (set (map (fn [m] (select-keys m ks)) xrel)))

(defn rename-keys
  "Returns the map with the keys in kmap renamed to the vals in kmap"
  [map kmap]
    (reduce
     (fn [m entry]
       (let [[old new] entry]
         (if (contains? map old)
           (assoc m new (get map old))
           m)))
     (apply dissoc map (keys kmap)) kmap))

(def set/rename-keys rename-keys)

(defn set/rename
  "Returns a rel of the maps in xrel with the keys in kmap renamed to the vals in kmap"
  [xrel kmap]
  (set (map #(rename-keys % kmap) xrel)) xrel)

(defn set/index
  "Returns a map of the distinct values of ks in the xrel mapped to a
  set of the maps in xrel with the corresponding values of ks."
  [xrel ks]
    (reduce
     (fn [m x]
       (let [ik (select-keys x ks)]
         (assoc m ik (conj (get m ik #{}) x))))
     {} xrel))

(defn invert-map
  {:doc "Returns the map with the vals mapped to the keys."}
  [m]
  ;; persistent!
  (reduce
   (fn [m entry]
     (let [[k v] entry]
       (assoc m v k)))
   {}
   m))

(defn set/join
  "When passed 2 rels, returns the rel corresponding to the natural
  join. When passed an additional keymap, joins on the corresponding
  keys."
  ([xrel yrel] ;natural join
   (if (and (seq xrel) (seq yrel))
     (let [ks (set/intersection (set (keys (first xrel))) (set (keys (first yrel))))
           [r s] (if (<= (count xrel) (count yrel))
                   [xrel yrel]
                   [yrel xrel])
           idx (set/index r ks)]
       (reduce (fn set-join-reduce [ret x]
                 (let [found (idx (select-keys x ks))]
                   (if found
                     (reduce (fn reduce-found [a b] (conj a (merge b x))) ret found)
                     ret)))
               #{} s))
     #{}))
  ([xrel yrel km] ;arbitrary key mapping
   (let [[r s k] (if (<= (count xrel) (count yrel))
                   [xrel yrel (invert-map km)]
                   [yrel xrel km])
         idx (set/index r (vals k))]
     (reduce (fn [ret x]
               (let [found (idx (rename-keys (select-keys x (keys k)) k))]
                 (if found
                   (reduce #(conj %1 (merge %2 x)) ret found)
                   ret)))
             #{} s))))

(defn set/subset?
  "Is set1 a subset of set2?"
  [set1 set2]
  (and (<= (count set1) (count set2))
       (every? #(contains? set2 %) set1)))

(defn set/superset?
  "Is set1 a superset of set2?"
  [set1 set2]
  (and (>= (count set1) (count set2))
       (every? #(contains? set1 %) set2)))

;; Walk

;; walk, prewalk, and postwalk implemented above

(defn keywordize-keys
  {:doc "Recursively transforms all map keys from strings to keywords."}
  [m]
  (let [f (fn [entry] (let [[k v] entry] (if (string? k) [(keyword k) v] [k v])))]
    ;; only apply to maps
    (postwalk (fn [x] (if (map? x) (into {} (map f x)) x)) m)))

(defn stringify-keys
  {:doc "Recursively transforms all map keys from keywords to strings."}
  [m]
  (let [f (fn [entry] (let [[k v] entry] (if (keyword? k) [(name k) v] [k v])))]
    ;; only apply to maps
    (postwalk (fn [x] (if (map? x) (into {} (map f x)) x)) m)))

(defn prewalk-replace
  {:doc "Recursively transforms form by replacing keys in smap with their values.  Like clojure/replace but works on any data structure.  Does replacement at the root of the tree first."}
  [smap form]
  (prewalk (fn [x] (if (contains? smap x) (smap x) x)) form))

(defn postwalk-replace
  {:doc "Recursively transforms form by replacing keys in smap with their values.  Like clojure/replace but works on any data structure.  Does replacement at the leaves of the tree first."}
  [smap form]
  (postwalk (fn [x] (if (contains? smap x) (smap x) x)) form))

(defn macroexpand-all
  {:doc "Recursively performs all possible macroexpansions in form."}
  [form]
  (prewalk (fn [x] (if (seq? x) (macroexpand x) x)) form))

(comment
  (defn postwalk-demo
    {:doc "Demonstrates the behavior of postwalk by printing each form as it is
  walked.  Returns form."}
    [form]
    (postwalk (fn [x] (print "Walked: ") (prn x) x) form))

  (defn prewalk-demo
    {:doc "Demonstrates the behavior of prewalk by printing each form as it is
  walked.  Returns form."}
    [form]
    (prewalk (fn [x] (print "Walked: ") (prn x) x) form))
  )

;; Test Framework

(def test/suite-empty
  {:scopes [:test/suite]
   :pass []
   :fail []
   :error []})

(def test/suite
  {:doc "Central test suite state for default test framework reporting."}
  (state test/suite-empty))

(defn test/suite-reset []
  (write-state test/suite test/suite-empty))

(defmacro test/group
  {:doc "Group tests under a string description. Saves to test/suite."}
  [description & body]
  (list 'do
        (list 'write-state test/suite 'update :scopes 'conj description)
        (list 'try
              (cons 'do body)
              (list 'finally
                    (list 'write-state test/suite 'update :scopes 'butlast)))))

;; TODO Refactor to accept single form with truthy semantics, rather than expected actual
(defmacro test/is=
  {:doc "Specify a test condition that should hold true. Saves to test/suite."}
  [expected actual & message]
  (let [result_ (gensym "result")
        e_ (gensym "error")
        msg_ (gensym "msg")]
    (list 'try
          (list 'let [result_ (list '= expected actual)]
                (list 'write-state
                      'test/suite
                      'update
                      (list 'if result_ :pass :fail)
                      'conj
                      [(list :scopes (list 'deref 'test/suite))
                       (list 'when (list 'not result_)
                             {:expected expected
                              :actual actual
                              :expected-code (list 'quote expected)
                              :actual-code (list 'quote actual)})
                       (list 'let [msg_ (list 'first message)]
                             (list 'when (list 'seq msg_)
                                   msg_))]))
          (list 'catch '_ e_
                (list 'write-state
                      'test/suite
                      'update
                      :error
                      'conj
                      [(list :scopes (list 'deref 'test/suite))
                       {:expected expected
                        :expected-code (list 'quote expected)
                        :actual-code (list 'quote actual)
                        :error    (list 'type e_)
                        :explanation (list 'str e_)
                        :stacktrace (list 'stacktrace/current)}])))))

(defmacro test/is
  {:doc "Specify a test condition that should hold true. Saves to test/suite."}
  [test & message]
  (let [result_ (gensym "result")
        e_ (gensym "error")
        msg_ (gensym "msg")]
    (list 'try
          (list 'let [result_ test]
                (list 'write-state
                      'test/suite
                      'update
                      (list 'if result_ :pass :fail)
                      'conj
                      [(list :scopes (list 'deref 'test/suite))
                       (list 'when (list 'not result_)
                             {:actual result_
                              :test-code (list 'quote test)})
                       (list 'let [msg_ (list 'first message)]
                             (list 'when (list 'seq msg_)
                                   msg_))]))
          (list 'catch '_ e_
                (list 'write-state
                      'test/suite
                      'update
                      :error
                      'conj
                      [(list :scopes (list 'deref 'test/suite))
                       {:test-code (list 'quote test)
                        :error    (list 'type e_)
                        :explanation (list 'str e_)
                        :stacktrace (list 'stacktrace/current)}])))))

(defn test/format-fail
  {:private true}
  [fail]
  (let [test-group (first fail)

        data (second fail)
        expected (:expected data)
        actual (:actual data)
        expected-code (:expected-code data)
        actual-code (:actual-code data)

        msg (third fail)]
    (str "   In " (str/join " » " test-group)
         "\n"
         "   Expected:\n"
         expected-code
         "\n   which when evaluated returns:\n"
         expected
         "\n"
         "   Actual:\n"
         actual-code
         "\n   which when evaluated returns:\n"
         actual)))

(defn test/format-error
  {:private true}
  [error]
  (let [test-group (first error)

        data (second error)
        expected (:expected data)
        expected-code (:expected-code data)
        actual-code (:actual-code data)
        error (:error data)
        explanation (:explanation data)
        stacktrace (:stacktrace data)]
    (str "   In " (str/join " » " test-group)
         "\n"
         "   Expected:\n"
         expected-code
         "\n   which when evaluated returns:\n"
         expected
         "\n"
         "   Actual:\n"
         actual-code
         "\n   which threw " error ":\n"
         explanation
         "\n   Stacktrace:\n  "
         (str/join "\n" stacktrace))))

(defn test/suite-report
  ([] (test/suite-report test/suite))
  ([suite-state]
   (let [{:keys [pass fail error]} (deref suite-state)
         fail-count (count fail)
         error-count (count error)
         msg (str "Test Results: "
                  (count pass)  " pass, "
                  fail-count  " fail, "
                  error-count " error.")]
     (str msg
          (when (> fail-count 0)
            (str "\n\n## Failures ##\n" (str/join "\n" (map test/format-fail fail))))
          (when (> error-count 0)
            (str "\n\n## Errors ##\n\n" (str/join "\n" (map test/format-error error))))))))

;; REPL

(defn help []
  "Peruse the map returned from (bindings) for available forms and their metadata.")

''';
