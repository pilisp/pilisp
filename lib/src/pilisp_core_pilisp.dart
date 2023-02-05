// ;; -*- mode: clojure -*-
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
  (apply print (conj xs "\n")))

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

(declare seq?)

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

(defn concat
  {:doc "Returns a lazy seq representing the concatenation of the elements in the supplied colls."}
  ([] nil)
  ([x] x)
  ([x y]
   (let [s (seq x)]
     (if s
       (cons (first s) (concat (next s) y))
       y)))
  ([x y & zs]
   (let [cat (fn cat [xys zs]
               (let [xys (seq xys)]
                 (if xys
                   (cons (first xys) (cat (next xys) zs))
                   (when zs
                     (cat (first zs) (next zs))))))]
     (cat (concat x y) zs))))

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
   (reduce comp (list f g fs))))

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

(defn nthrest
  {:doc "Returns the nth rest of coll, coll when n is 0."}
  [coll n]
  (loop [n n xs coll]
    (if-let [xs (and (pos? n) (seq xs))]
      (recur (dec n) (rest xs))
      xs)))

(defn drop
  [n coll]
  (let [step (fn [n coll]
               (let [s (seq coll)]
                 (if (and (pos? n) s)
                   (drop (dec n) (rest s))
                   s)))]
    (step n coll)))

(let [repeat*
      (fn repeat*
        [coll n x]
        (if (= n 0)
          coll
          (repeat* (conj coll x) (dec n) x)))]
  (defn repeat
    {:doc "Returns a sequence of xs of length n."}
    ([x] (repeat 1 x))
    ([n x]
     (repeat* [] n x))))

(let [iterate*
      (fn iterate*
        [coll n f x]
        (if (= n 0)
          coll
          (let [latest (f x)]
            (iterate* (conj coll latest) (dec n) f latest))))]
  (defn iterate
    {:doc "Returns a sequence of xs of length n."}
    ([f x] (iterate 1 x))
    ([n f x]
     (iterate* [x] (dec n) f x))))

(defn take
  {:doc "Returns a sequence of the first n items in coll, or all items if there are fewer than n.  Returns a stateful transducer when no collection is provided."}
  [n coll]
  (when (pos? n)
    (when-let [s (seq coll)]
      (cons (first s) (take (dec n) (rest s))))))

(defn take-while
  [pred coll]
  (when-let [s (seq coll)]
    (when (pred (first s))
      (cons (first s) (take-while pred (rest s))))))

(defn partition
  {:doc "Returns a lazy sequence of lists of n items each, at offsets step apart. If step is not supplied, defaults to n, i.e. the partitions do not overlap. If a pad collection is supplied, use its elements as necessary to complete last partition upto n items. In case there are not enough padding elements, return a partition with less than n items."}
  ([n coll]
   (partition n n coll))
  ([n step coll]
   (when-let [s (seq coll)]
     (let [p (take n s)]
       (when (= n (count p))
         (cons p (partition n step (nthrest s step)))))))
  ([n step pad coll]
   (when-let [s (seq coll)]
     (let [p (take n s)]
       (if (= n (count p))
         (cons p (partition n step pad (nthrest s step)))
         (list (take n (concat p pad))))))))

(defn partition-by
  [f coll]
  (when-let [s (seq coll)]
    (let [fst (first s)
          fv (f fst)
          run (cons fst (take-while (fn partition-taker [x] (= fv (f x))) (next s)))]
      (cons run (partition-by f (drop (count run) s))))))

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

(defn empty
  {:doc "Returns an empty collection of the same category as coll, or nil"}
  [coll]
  (cond
    (list? coll) '()
    (vector? coll) []
    (map? coll) {}
    (set? coll) #{}
    :else nil))

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

(defn map
  ([f coll]
   (when-let [s (seq coll)]
     (cons (f (first s)) (map f (rest s)))))
  ([f c1 c2]
   (let [s1 (seq c1) s2 (seq c2)]
     (when (and s1 s2)
       (cons (f (first s1) (first s2))
             (map f (rest s1) (rest s2))))))
  ([f c1 c2 c3]
   (let [s1 (seq c1) s2 (seq c2) s3 (seq c3)]
     (when (and  s1 s2 s3)
       (cons (f (first s1) (first s2) (first s3))
             (map f (rest s1) (rest s2) (rest s3))))))
  ([f c1 c2 c3 & colls]
   (let [step (fn step [cs]
                (let [ss (map seq cs)]
                  (when (every? identity ss)
                    (cons (map first ss) (step (map rest ss))))))]
     (map #(apply f %) (step (conj colls c3 c2 c1))))))

(def mapv (comp vec map))

(defn mapcat
  {:doc "Returns the result of applying concat to the result of applying map to f and colls.  Thus function f should return a collection."}
  [f & colls]
  (apply concat (apply map f colls)))

(defn filter
  [pred coll]
  (when-let [s (seq coll)]
    (let [f (first s) r (rest s)]
      (if (pred f)
        (cons f (filter pred r))
        (filter pred r)))))

(def filterv (comp vec filter))

(defn remove
  [pred coll]
  (filter (complement pred) coll))

;; TODO Support vector use-case
(defn assoc
  {:doc "assoc[iate]. When applied to a map, returns a new map of the
    same (hashed/sorted) type, that contains the mapping of key(s) to
    val(s). When applied to a vector, returns a new vector that
    contains val at index. Note - index must be <= (count vector)."}
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
    (reduce #(conj (or %1 {}) %2) maps)))

(defn interleave
  {:doc "Returns a sequence of the first item in each coll, then the second etc."}
  ([] ())
  ([c1] c1)
  ([c1 c2]
   (let [s1 (seq c1) s2 (seq c2)]
     (when (and s1 s2)
       (cons (first s1) (cons (first s2)
                              (interleave (rest s1) (rest s2)))))))
  ([c1 c2 & colls]
   (let [ss (map seq (conj colls c2 c1))]
     (when (every? identity ss)
       (concat (map first ss) (apply interleave (map rest ss)))))))

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
(defn invocable?
  [x]
  (or (list? x)
      (fn? x)
      (term? x)))

(def pipe-param '$)
(def pipe? (partial = '|))

(defn specifies-pipe-param?
  {:private true}
  [form]
  (let [result (state false)
        _ (postwalk (fn [x]
                      (when (= x pipe-param)
                        (write-state result true)))
                    form)]
    (deref result)))

(defmacro piped
  {:doc "The Piped Lisp macro."}
  [& forms]
  (let [delimited-forms (->> (partition-by pipe? forms)
                             ;; Remove | as pure syntax, and support
                             ;; empty expressions
                             (remove (fn [coll] (every? pipe? coll))))
        ;; The expr for as->
        first-clause (first delimited-forms)
        ;; partition-by wrapped every clause in a list; unwrap if non-invocable
        first-clause (if (= 1 (count first-clause))
                       (let [fst (first first-clause)]
                         (if (invocable? fst)
                           first-clause
                           fst))
                       first-clause)
        ;; Body of as->
        next-clauses (->> (next delimited-forms)
                          (map (fn [form]
                                 ;; NB: There are possible footguns here,
                                 ;;     but I think they're easily detected and
                                 ;;     avoided given intended scope of usage
                                 ;;     of this macro.
                                 (if (specifies-pipe-param? form)
                                   form
                                   (concat form [pipe-param])))))]
    ;; as-> does the heavy lifting
    (concat (list 'as-> first-clause pipe-param) next-clauses)))

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
  {:doc "binding => binding-form init-expr
  binding-form => name, or destructuring-form
  destructuring-form => map-destructure-form, or seq-destructure-form

  Evaluates the exprs in a lexical context in which the symbols in
  the binding-forms are bound to their respective init-exprs or parts
  therein.

  See https://clojure.org/reference/special_forms#binding-forms for
  more information about destructuring."}
  [bindings & body]
  ;; (assert-args
  ;;  (vector? bindings) "a vector for its binding"
  ;;  (even? (count bindings)) "an even number of forms in binding vector")
  (let [destructured-bindings (destructure bindings)]
    (list 'let* destructured-bindings (cons 'do body))))

;; Strings

(let [str/join*
      (fn str/join*
        [acc sep coll]
        (if (empty? acc)
          (str/join* (str (first coll)) sep (next coll))
          (if (empty? coll)
            acc
            (str/join* (str acc sep (first coll)) sep (next coll)))))]
  (defn str/join
    [sep coll]
    (if (empty? coll)
      ""
      (if (= 1 (count coll))
        (str (first coll))
        (str/join* "" sep coll)))))

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
   (if (< (count s2) (count s1))
     (recur s2 s1)
     (reduce (fn [result item]
               (if (contains? s2 item)
		 result
                 (disj result item)))
	     s1 s1)))
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

;; TODO Impl after select-keys
#_(defn project
  "Returns a rel of the elements of xrel with only the keys in ks"
  [xrel ks]
  (set (map #(select-keys % ks) xrel)) xrel)

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

;; TODO Impl after select-keys
#_(defn index
  "Returns a map of the distinct values of ks in the xrel mapped to a
  set of the maps in xrel with the corresponding values of ks."
  [xrel ks]
    (reduce
     (fn [m x]
       (let [ik (select-keys x ks)]
         (assoc m ik (conj (get m ik #{}) x))))
     {} xrel))

;; TODO Reimpl with reduce-kv
(defn set/map-invert
  "Returns the map with the vals mapped to the keys."
  [m]
  ;; persistent!
  (reduce (fn [m entry] (let [[k v] entry] (assoc m v k)))
          {}
             ;; (transient {})
          m))

;; TODO Impl after select-keys
#_(defn set/join
  "When passed 2 rels, returns the rel corresponding to the natural
  join. When passed an additional keymap, joins on the corresponding
  keys."
  ([xrel yrel] ;natural join
   (if (and (seq xrel) (seq yrel))
     (let [ks (intersection (set (keys (first xrel))) (set (keys (first yrel))))
           [r s] (if (<= (count xrel) (count yrel))
                   [xrel yrel]
                   [yrel xrel])
           idx (index r ks)]
       (reduce (fn [ret x]
                 (let [found (idx (select-keys x ks))]
                   (if found
                     (reduce #(conj %1 (merge %2 x)) ret found)
                     ret)))
               #{} s))
     #{}))
  ([xrel yrel km] ;arbitrary key mapping
   (let [[r s k] (if (<= (count xrel) (count yrel))
                   [xrel yrel (map-invert km)]
                   [yrel xrel km])
         idx (index r (vals k))]
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

;; Test Framework

(def test/suite
  {:doc "Central test suite state for default test framework reporting."}
  (state
   {:scopes [:test/suite]
    :pass []
    :fail []
    :error []}))

(defmacro test/group
  {:doc "Group tests under a string description. Saves to test/suite."}
  [description & body]
  (list 'do
        (list 'write-state test/suite 'update :scopes 'conj description)
        (list 'try
              (cons 'do body)
              (list 'finally
                    (list 'write-state test/suite 'update :scopes 'butlast)))))

(defmacro test/is
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
   (let [st    (deref suite-state)
         pass  (:pass st)
         fail  (:fail st)
         error (:error st)
         fail-count (count fail)
         error-count (count error)
         msg (str "PiLisp Test Results: "
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
  "Peruse (bindings) for available forms.")

''';
