import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pilisp/pilisp.dart';
import 'package:pilisp/src/pilisp_expr.dart';

import 'package:test/test.dart';

final symbolQuote = PLSymbol('quote');

void main() {
  tearDownAll(() async {
    await piLispEnv.shutDown();
  });
  group('Language', () {
    group('/ Reading', () {
      test('/ Unreadable', () {
        expect(() async => PiLisp.readString('#<Some Object>'),
            throwsA(isA<UnreadableFormException>()));
      });
      test('/ Multiple forms returns first', () {
        expect(PiLisp.readString('1 2 3'), 1);
      });
      test('/ quote', () {
        expect(
            PiLisp.readString("'foo"), PLList([symbolQuote, PLSymbol('foo')]));
        expect(PiLisp.readString("'()"), PLList([symbolQuote, PLList([])]));
      });
      test('/ nil', () {
        expect(PiLisp.readString('nil'), PLNil());
      });
      test('/ Booleans', () {
        expect(PiLisp.readString('true'), true);
        expect(PiLisp.readString('false'), false);
      });
      group('/ Numbers', () {
        test('/ int', () {
          expect(PiLisp.readString('42'), 42);
          expect(PiLisp.readString('+42'), 42);
          expect(PiLisp.readString('0'), 0);
          expect(PiLisp.readString('-42'), -42);

          expect(PiLisp.readString('0x20'), 0x20);
          expect(PiLisp.readString('0x42e'), 0x42e);
          expect(PiLisp.readString('+0x42e'), 0x42e);
          expect(PiLisp.readString('-0x42e'), -0x42e);

          expect(PiLisp.readString('042'), 42);
          expect(PiLisp.readString('+042'), 42);
          expect(PiLisp.readString('-042'), -42);
        });
        test('/ double', () {
          expect(PiLisp.readString('42.2'), 42.2);
          expect(PiLisp.readString('+42.2'), 42.2);
          expect(PiLisp.readString('-42.2'), -42.2);

          expect(PiLisp.readString('42.2e0'), 42.2);
          expect(PiLisp.readString('422e-1'), 42.2);
          expect(PiLisp.readString('422e1'), 4220);
          expect(PiLisp.readString('422e+1'), 4220);
        });
      });
      group('/ Symbols', () {
        test('/ regular', () {
          expect(PiLisp.readString('ls'), PLSymbol('ls'));
          expect(PiLisp.readString('ls!'), PLSymbol('ls!'));
          expect(PiLisp.readString('ls1234567890!@#&*'),
              PLSymbol('ls1234567890!@#&*'));
          expect(() async => PiLisp.readString('1abc'),
              throwsA(isA<UnreadableFormException>()));
        });
        test('/ term (dot)', () {
          expect(PiLisp.readString('.id'), PLTerm('id'));
          expect(PiLisp.readString('.id!'), PLTerm('id!'));
          expect(PiLisp.readString('.id1234567890!@#&*'),
              PLTerm('id1234567890!@#&*'));
        });
        test('/ term (colon)', () {
          expect(PiLisp.readString(':id'), PLTerm('id'));
          expect(PiLisp.readString(':id!'), PLTerm('id!'));
          expect(PiLisp.readString(':id1234567890!@#&*'),
              PLTerm('id1234567890!@#&*'));
        });
        test('/ with punctuation chars', () {
          expect(PiLisp.readString('Date#now'), PLSymbol('Date#now'));
        });
      });
      group('/ Vectors', () {
        test('/ unclosed', () {
          expect(() async => PiLisp.readString('['),
              throwsA(isA<UnexpectedEndOfInput>()));
        });
        test('/ improperly closed', () {
          expect(() async => PiLisp.readString('[1 2 3 4}'),
              throwsA(isA<MismatchedDelimiter>()));
        });
        test('/ empty', () {
          expect(PiLisp.readString('[]'), PLVector([]));
        });
        test('/ flat', () {
          expect(PiLisp.readString('[1 2 3]'), PLVector([1, 2, 3]));
          expect(
              PiLisp.readString('[a b c]'),
              PLVector([
                PLSymbol('a'),
                PLSymbol('b'),
                PLSymbol('c'),
              ]));
        });
        test('/ nested', () {
          expect(
              PiLisp.readString('[1 [2 3] 4]'),
              PLVector([
                1,
                PLVector([2, 3]),
                4,
              ]));
          expect(
              PiLisp.readString('[ 1 [ 2 [3 4] ] 5 ]'),
              PLVector([
                1,
                PLVector([
                  2,
                  PLVector([3, 4])
                ]),
                5,
              ]));
          expect(
              PiLisp.readString('[1 [2 {3 4} ] 5 ]'),
              PLVector([
                1,
                PLVector([
                  2,
                  IMap<int, int>({3: 4})
                ]),
                5,
              ]));
        });
      });
      group('/ Maps', () {
        test('/ unclosed', () {
          expect(() async => PiLisp.readString('{'),
              throwsA(isA<UnexpectedEndOfInput>()));
        });
        test('/ empty', () {
          expect(PiLisp.readString('{}'), IMap<Object?, Object?>({}));
        });
        test('/ flat', () {
          expect(PiLisp.readString('{1 2 3 4}'), IMap<int, int>({1: 2, 3: 4}));
          expect(PiLisp.readString('{1 2, 3 4}'), IMap<int, int>({1: 2, 3: 4}));
        });
        group('/ nested', () {
          test('/ shallow', () {
            expect(
                PiLisp.readString('{ a { 2 3 }}'),
                IMap<PLSymbol, IMap<int, int>>({
                  PLSymbol('a'): IMap<int, int>({2: 3}),
                }));
          });
          test('/ deep', () {
            expect(
                PiLisp.readString('{ 1 { 2 {3 4}}}'),
                IMap<int, Object?>({
                  1: IMap<int, IMap<int, int>>({
                    2: IMap<int, int>({3: 4})
                  })
                }));
            expect(
                PiLisp.readString('{ 1 { 2 {3 4} } 5 {6 7}}'),
                IMap<int, Object?>({
                  1: IMap<int, IMap<int, int>>({
                    2: IMap<int, int>({3: 4})
                  }),
                  5: IMap<int, int>({6: 7}),
                }));
            expect(
                PiLisp.readString('{ 1 { 2 {3 {4 z}}}}'),
                IMap<int, Object?>({
                  1: IMap<int, Object?>({
                    2: IMap<int, IMap<int, PLSymbol>>({
                      3: IMap<int, PLSymbol>({4: PLSymbol('z')})
                    })
                  })
                }));
            expect(
                PiLisp.readString('{ 1 { 2 [{3 {4 5}} 6]}}'),
                IMap<int, Object?>({
                  1: IMap<int, Object?>({
                    2: PLVector([
                      IMap<int, IMap<int, int>>({
                        3: IMap<int, int>({4: 5})
                      }),
                      6,
                    ])
                  })
                }));
          });
        });
      });
      group('/ Sets', () {
        test('/ unclosed', () {
          expect(() async => PiLisp.readString('#{'),
              throwsA(isA<UnexpectedEndOfInput>()));
        });
        test('/ empty', () {
          expect(PiLisp.readString('#{}'), ISet<Object?>({}));
        });
        test('/ flat', () {
          expect(PiLisp.readString('#{1 2 3}'), ISet<int>({1, 2, 3}));
          expect(PiLisp.readString('#{1 2 3 1}'), ISet<int>({1, 2, 3}));
          expect(PiLisp.readString('#{a b c}'),
              ISet<PLSymbol>({PLSymbol('a'), PLSymbol('b'), PLSymbol('c')}));
        });
        group('/ nested', () {
          test('/ shallow', () {
            expect(
                PiLisp.readString('#{[1] [2] [3] [1]}'),
                ISet<Object?>({
                  PLVector([1]),
                  PLVector([2]),
                  PLVector([3]),
                }));
          });
        });
      });
      group('/ Strings', () {
        group('/ simple', () {
          test('/ empty', () {
            expect(PiLisp.readString('""'), '');
          });
          test('/ alphanumeric content', () {
            expect(PiLisp.readString('"abc123"'), 'abc123');
          });
        });
        group('/ escapes', () {
          test('/ single character', () {
            expect(PiLisp.readString(r'"x\\y"'), r'x\y');
            expect(() async => PiLisp.readString(r'"x\y"'),
                throwsA(isA<UnsupportedEscapeCharacter>()));
            expect(PiLisp.readString(r'"He said, \"What are you doing?\""'),
                'He said, "What are you doing?"');
            // expect(
            //     PiLisp.readString(r'"No man is an island,\nEntire of itself;"'),
            //     'No man is an island,\nEntire of itself;');
            // expect(PiLisp.readString(r'"Wow\fsuch\thidden\rescapes\nin\bhere"'),
            //     'Wow\fsuch\thidden\rescapes\nin\bhere');
          });
          test('/ hexadecimal char codes', () {
            expect(PiLisp.readString(r'"Hmm\x2c I see"'), 'Hmm, I see');
            expect(PiLisp.readString(r'"Hmm, I see"'), 'Hmm\x2c I see');
            expect(PiLisp.readString(r'"Hi \u2605"'), 'Hi ★');
            expect(PiLisp.readString(r'"Hi ★"'), 'Hi \u2605');
            expect(PiLisp.readString(r'"Music \u{1D11E}"'), 'Music 𝄞');
            expect(PiLisp.readString(r'"Music 𝄞"'), 'Music \u{1D11E}');
            expect(() async => PiLisp.readString(r'"Hi \u260"'),
                throwsA(isA<UnsupportedEscapeCharacter>()));
            expect(() async => PiLisp.readString(r'"Hi \uzzzz"'),
                throwsA(isA<UnsupportedEscapeCharacter>()));
          });
        });
      });
      group('/ Regular expressions', () {
        test('/ no escapes', () {
          expect(PiLisp.readString(r'#"[0-9]{3}-[0-9]{3}-[0-9]{4}"'),
              RegExp(r'[0-9]{3}-[0-9]{3}-[0-9]{4}'));
        });
        test('/ with escapes', () {
          expect(PiLisp.readString(r'#"[\r\n]+"'), RegExp(r'[\r\n]+'));
        });
      });
      group('/ Comments', () {
        test('/ single line, no newline', () {
          expect(PiLisp.readString('; Wow'), PLNil());
        });
        test('/ multiple lines', () {
          expect(PiLisp.readString('; Alpha\n; Beta'), PLNil());
        });
        test('/ preceded by values', () {
          expect(PiLisp.readString('42 ; Alpha\n; Beta\n42'), 42);
        });
        test('/ followed by values', () {
          expect(PiLisp.readString('; Alpha\n; Beta\n42'), 42);
        });
      });
      group('/ Shebang', () {
        test('/ like comment', () {
          expect(PiLisp.readString('#!/usr/bin/env pilisp'), PLNil());
          expect(PiLisp.readString('#!/usr/bin/env pilisp\n\n42'), 42);
        });
      });
      group('/ Ignored expression', () {
        test('/ atomic', () {
          expect(PiLisp.readString('#_1 2'), 2);
          expect(PiLisp.readString('#_a b'), PLSymbol('b'));
        });
        test('/ collection', () {
          expect(PiLisp.readString('#_[1 2 3] 4'), 4);
          expect(PiLisp.readString('#_#{1 2 3} 4'), 4);
          expect(PiLisp.readString('#_{1 2 3 4} 5'), 5);
          expect(PiLisp.readString('#_[1 2 3 4] 5'), 5);
          expect(PiLisp.readString('#_[1 2] [3 4]'), PLVector([3, 4]));
        });
      });
      group('/ Invocation', () {
        test('/ Empty', () {
          expect(PiLisp.readString('()'), PLList([]));
        });
        group('/ Special forms', () {
          group('/ fn*', () {
            test('/ minimal', () {
              expect(PiLisp.readString('(fn* [])'),
                  PLList([PLSymbol('fn*'), PLVector([])]));
            });
          });
          group('/ anonymous fn #()', () {
            test('/ improper anonymous arg', () {
              expect(() async => evalProgram('#(%bad)'),
                  throwsA(isA<MalformedAnonymousArgument>()));
              expect(evalProgram('#(%1-a-thing)'), isA<PLFunction>());
            });
            test('/ minimal anonymous fn', () {
              expect(evalProgram('(#((fn* foozle [x] x) %) 1)'), 1);
            });
            test('/ multiple args', () {
              expect(evalProgram('(#((fn* fizzle [x y] [x y]) %1 %2) 1 2)'),
                  PLVector([1, 2]));
            });
            test('/ named args', () {
              expect(
                  evalProgram(
                      '(#((fn* fizzle [x y] [x y]) %1-my-x %2-my-y) "alpha" "beta")'),
                  PLVector(['alpha', 'beta']));
            });
            test('/ skipped args', () {
              expect(
                  evalProgram(
                      '(#((fn* fizzle [x z] [x z]) %1-my-x %3-my-z) "alpha" "beta" "gamma")'),
                  PLVector(['alpha', 'gamma']));
            });
            test('/ variable arity', () {
              expect(
                  evalProgram(
                      '(#((fn* fizzle [coll] coll) %&) "alpha" "beta" "gamma")'),
                  PLVector(['alpha', 'beta', 'gamma']));
            });
          });
        });
      });
    });
    group('/ Equality', () {
      group('/ Collections', () {
        group('/ Vectors', () {
          test('/ vectors equal vectors', () {
            expect(PLVector([1]), PLVector([1]));
          });
          // test('/ vectors equal lists', () {
          // expect(PLVector<int>([1]) == PLList([1]), true);
          // expect(PLList([1]), PLVector<int>([1]));
          // });
        });
        group('/ Sets', () {
          group('/ membership', () {
            test('/ vector members', () {
              expect(
                  ISet<Object?>({
                    PLVector([1])
                  }),
                  contains(PLVector([1])));
            });
          });
        });
      });
    });
    group('/ Macro expansion', () {
      test('/ macroexpand-1', () {
        expect(evalProgram('''(macroexpand-1 (quote 'foo))'''),
            PLList([symbolQuote, PLSymbol('foo')]));
      });
      // test('/ macroexpand', () {
      //   expect(
      //       evalProgram('''(macroexpand '(def pipe? (partial = '|)))'''),
      //       PLList([
      //         symbolDef,
      //         PLSymbol('pipe?'),
      //         PLList([
      //           PLSymbol('partial'),
      //           PLSymbol('='),
      //           PLList([symbolQuote, PLSymbol('|')])
      //         ])
      //       ]));
      // });
      test('/ macroexpand before eval', () {
        evalProgram('''(def pipe? (fn* pipe?* [x] (= x '|)))''');
        expect(
            evalProgram('''(macroexpand '(pipe? '|))'''),
            PLList([
              PLSymbol('pipe?'),
              PLList([symbolQuote, PLSymbol('|')])
            ]));
        // EVIDENCE of double eval
        expect(evalProgram('''(pipe? '|)'''), true);
      });
    });
    group('/ Macro usage', () {
      test('/ invoke a macro', () {
        expect(evalProgram('''(or false nil 2)'''), 2);
      });
    });
    group('/ Evaluation', () {
      test('/ quote', () {
        expect(evalProgram("'a"), PLSymbol('a'));
        expect(evalProgram("'()"), PLList([]));
        expect(evalProgram("'(a b)"), PLList([PLSymbol('a'), PLSymbol('b')]));
      });
      test('/ nil', () {
        expect(evalProgram('nil'), null);
      });
      test('/ Booleans', () {
        expect(evalProgram('true'), true);
        expect(evalProgram('false'), false);
      });
      group('/ Numbers', () {
        group('/ Dart host', () {
          test('/ int', () {
            expect(evalProgram('42'), 42);
            expect(evalProgram('+42'), 42);
            expect(evalProgram('0'), 0);
            expect(evalProgram('-42'), -42);

            expect(evalProgram('0x20'), 0x20);
            expect(evalProgram('0x42e'), 0x42e);
            expect(evalProgram('+0x42e'), 0x42e);
            expect(evalProgram('-0x42e'), -0x42e);

            expect(evalProgram('042'), 042);
            expect(evalProgram('+042'), 042);
            expect(evalProgram('-042'), -042);
          });
          test('/ double', () {
            expect(evalProgram('42.2'), 42.2);
            expect(evalProgram('+42.2'), 42.2);
            expect(evalProgram('-42.2'), -42.2);

            expect(evalProgram('42.2e0'), 42.2);
            expect(evalProgram('422e-1'), 42.2);
            expect(evalProgram('422e1'), allOf(equals(4220), isA<double>()));
            expect(evalProgram('422e+1'), allOf(equals(4220), isA<double>()));
          });
        });
      });
      group('/ Terms', () {
        test('/ term identity', () {
          expect(evalProgram(':foo'), PLTerm('foo'));
        });
        test('/ term invocation', () {
          expect(evalProgram('(:foo {:foo 42})'), 42);
          evalProgram('(def a-map {:wow "yep"})');
          expect(evalProgram('(:wow a-map)'), 'yep',
              reason:
                  'Arguments to terms should be evaluated before the term is invoked.');
        });
      });
      group('/ Lists', () {
        test('/ empty', () {
          expect(evalProgram('[]'), PLVector([]));
        });
        test('/ flat', () {
          expect(evalProgram('[1 2 3]'), PLVector([1, 2, 3]));
        });
        test('/ nested', () {
          expect(
              evalProgram('[1 [2 3] 4]'),
              PLVector([
                1,
                PLVector([2, 3]),
                4,
              ]));
          expect(
              evalProgram('[1 [2 [3 4]] 5]'),
              PLVector([
                1,
                PLVector([
                  2,
                  PLVector([3, 4])
                ]),
                5,
              ]));
          expect(
              evalProgram('[1 [2 {3 4}] 5]'),
              PLVector([
                1,
                PLVector([
                  2,
                  IMap<int, int>({3: 4})
                ]),
                5,
              ]));
        });
      });
      group('/ Maps', () {
        test('/ empty', () {
          expect(evalProgram('{}'), IMap<Object?, Object?>({}));
        });
        test('/ flat', () {
          expect(evalProgram('{1 2 3 4}'), IMap<int, int>({1: 2, 3: 4}));
        });
        group('/ nested', () {
          test('/ shallow', () {
            expect(
                evalProgram('{1 { 2 3 }}'),
                IMap<int, IMap<int, int>>({
                  1: IMap<int, int>({2: 3}),
                }));
          });
          test('/ deep', () {
            expect(
                evalProgram('{1 {2 {3 4}}}'),
                IMap<int, Object?>({
                  1: IMap<int, IMap<int, int>>({
                    2: IMap<int, int>({3: 4})
                  })
                }));
            expect(
                evalProgram('{1 {2 {3 4}} 5 {6 7}}'),
                IMap<int, Object?>({
                  1: IMap<int, IMap<int, int>>({
                    2: IMap<int, int>({3: 4})
                  }),
                  5: IMap<int, int>({6: 7}),
                }));
            expect(
                evalProgram('{1 {2 {3 {4 5}}}}'),
                IMap<int, Object?>({
                  1: IMap<int, Object?>({
                    2: IMap<int, IMap<int, int>>({
                      3: IMap<int, int>({4: 5})
                    })
                  })
                }));
            expect(
                evalProgram('{1 {2 [{3 {4 5}} 6]}}'),
                IMap<int, Object?>({
                  1: IMap<int, Object?>({
                    2: PLVector([
                      IMap<int, IMap<int, int>>({
                        3: IMap<int, int>({4: 5})
                      }),
                      6,
                    ])
                  })
                }));
          });
        });
      });
      group('/ Sets', () {
        test('/ empty', () {
          expect(evalProgram('#{}'), ISet<Object?>({}));
        });
        test('/ flat', () {
          expect(evalProgram('#{1 2 3}'), ISet<int>({1, 2, 3}));
          expect(evalProgram('#{1 2 3 1}'), ISet<int>({1, 2, 3}));
          expect(evalProgram('#{"a" "b" "c"}'), ISet<String>({'a', 'b', 'c'}));
        });
        group('/ nested', () {
          test('/ shallow', () {
            expect(
                evalProgram('#{[1] [2] [3] [1]}'),
                ISet<Object?>({
                  PLVector([1]),
                  PLVector([2]),
                  PLVector([3]),
                }));
          });
        });
      });
      group('/ Strings', () {
        group('/ simple', () {
          test('/ empty', () {
            expect(evalProgram('""'), '');
          });
          test('/ alphanumeric content', () {
            expect(evalProgram('"abc123"'), 'abc123');
          });
        });
        group('/ Escapes', () {
          test('/ single character', () {
            expect(evalProgram(r'"x\\y"'), 'x\\y');
            expect(() async => evalProgram(r'"x\y"'),
                throwsA(isA<UnsupportedEscapeCharacter>()));
            expect(evalProgram(r'"He said, \"What are you doing?\""'),
                'He said, "What are you doing?"');
            expect(evalProgram(r'"No man is an island,\nEntire of itself;"'),
                'No man is an island,\nEntire of itself;');
            expect(evalProgram(r'"Wow\fsuch\thidden\rescapes\nin\bhere"'),
                'Wow\fsuch\thidden\rescapes\nin\bhere');
          });
          test('/ hexadecimal char codes', () {
            expect(evalProgram(r'"Hmm\x2c I see"'), 'Hmm, I see');
            expect(evalProgram(r'"Hmm, I see"'), 'Hmm\x2c I see');
            expect(evalProgram(r'"Hi \u2605"'), 'Hi ★');
            expect(evalProgram(r'"Hi ★"'), 'Hi \u2605');
            expect(evalProgram(r'"Music \u{1D11E}"'), 'Music 𝄞');
            expect(evalProgram(r'"Music 𝄞"'), 'Music \u{1D11E}');
            expect(() async => evalProgram(r'"Hi \u260"'),
                throwsA(isA<UnsupportedEscapeCharacter>()));
            expect(() async => evalProgram(r'"Hi \uzzzz"'),
                throwsA(isA<UnsupportedEscapeCharacter>()));
          });
        });
      });
      group('/ Regular expressions', () {
        test('/ no escapes', () {
          expect(evalProgram(r'#"[0-9]{3}-[0-9]{3}-[0-9]{4}"'),
              RegExp(r'[0-9]{3}-[0-9]{3}-[0-9]{4}'));
        });
        test('/ with escapes', () {
          expect(evalProgram(r'#"[\r\n]+"'), RegExp(r'[\r\n]+'));
        });
      });
      group('/ Special forms', () {
        group('/ def', () {
          test('/ malformed', () {
            expect(() async => evalProgram('(def)'),
                throwsA(isA<FormatException>()));
            expect(() async => evalProgram('(def alpha)'),
                throwsA(isA<FormatException>()));
            expect(() async => evalProgram('(def alpha 1 2)'),
                throwsA(isA<FormatException>()));
          });
          test('/ minimal', () {
            expect(evalProgram('(def alpha "abc")'), 'abc');
          });
          test('/ returns value set', () {
            expect(
                evalProgram(
                    '(let* [a (def beta "abc") b (def gamma "xyz")] [a b])'),
                evalProgram('["abc" "xyz"]'));
          });
          test('/ sets value in global scope', () {
            expect(
                evalProgram(
                    '(let* [a (def delta "abc") b (def epsilon "xyz")] [a b delta epsilon])'),
                evalProgram('["abc" "xyz" "abc" "xyz"]'));
            expect(evalProgram('epsilon'), 'xyz');
            expect(evalProgram('(def zeta "abc")'), 'abc');
            expect(evalProgram('zeta'), 'abc');
            expect(evalProgram('(do (def eta "xyz"))'), 'xyz');
            expect(evalProgram('eta'), 'xyz');
            expect(
                () async => evalProgram('theta'),
                throwsA(isA<UndefinedSymbol>().having(
                    (exception) => exception.symbol,
                    'Symbol should not be defined',
                    PLSymbol('theta'))));
          });
          test('/ of functions', () {
            expect(evalProgram('((def omega {.doc "wow"} (fn* [a] a)) 2)'), 2);
          });
          group('/ with metadata', () {
            group('/ literals', () {
              test('/ string as doc string', () {
                expect(evalProgram('(def theta "Doc string" 42)'), 42);
                expect(
                    piLispEnv.scopes.first[PLSymbol('theta')]?.meta
                        .get(PLTerm('doc')),
                    'Doc string');
              });
              test('/ map', () {
                expect(
                    evalProgram(
                        '(def iota {.doc "My doc" .added "1.0-dev"} 24)'),
                    24);
                expect(piLispEnv.scopes.first[PLSymbol('iota')]?.meta,
                    evalProgram('{.doc "My doc" .added "1.0-dev"}'));
              });
            });
            group('/ expressions', () {
              test('/ evals to string', () {
                expect(
                    evalProgram(
                        '(def kappa ((fn* [] "My calculated docstring")) 42)'),
                    42);
                expect(
                    piLispEnv.scopes.first[PLSymbol('kappa')]?.meta
                        .get(PLTerm('doc')),
                    'My calculated docstring');
              });
              test('/ evals to map', () {
                expect(
                    evalProgram(
                        '(def mu ((fn* [] {.doc "My map" .macro false})) 42)'),
                    42);
                expect(piLispEnv.scopes.first[PLSymbol('mu')]?.meta,
                    evalProgram('{.doc "My map", .macro false}'));
              });
            });
          });
        });
        group('/ fn*', () {
          group('/ malformed', () {
            test('/ no params', () {
              expect(
                  () => evalProgram('(fn*)'), throwsA(isA<FormatException>()));
              expect(() => evalProgram('(fn* foo)'),
                  throwsA(isA<FormatException>()));
            });
            test('/ duplicate params', () {
              expect(() => evalProgram('(fn* [a a])'),
                  throwsA(isA<FormatException>()));
            });
            test('/ unbound symbols', () {
              expect(() => evalProgram('(fn* [a] b)'),
                  throwsA(isA<UndefinedSymbol>()));
              expect(() => evalProgram('(fn* [a] (fn [b] #(+ c %)))'),
                  throwsA(isA<UndefinedSymbol>()));
              expect(
                  () =>
                      evalProgram('(fn* [a] (let [x (fn [b] #(+ c %))] :ok))'),
                  throwsA(isA<UndefinedSymbol>()));
            });
          });
          test('/ empty ', () {
            expect(evalProgram('(fn* [])'), isA<PLFunction>());
          });
          test('/ with name', () {
            expect(evalProgram('(fn* a-fn [])'), isA<PLFunction>());
          });
          test('/ invoke returning literal value', () {
            expect(evalProgram('((fn* []))'), null);
            expect(evalProgram('((fn* [] nil))'), null);
            expect(evalProgram('((fn* [] 42))'), 42);
            expect(evalProgram('((fn* [] 42.3))'), 42.3);
            expect(evalProgram('((fn* [] .id))'), PLTerm('id'));
            expect(evalProgram('((fn* [] "wow"))'), 'wow');
            expect(evalProgram('((fn* [] []))'), PLVector([]));
            expect(
                evalProgram('((fn* [] ["1" "2" 3]))'), PLVector(['1', '2', 3]));
            expect(evalProgram('((fn* [] {1 2 3 4}))'), IMap({1: 2, 3: 4}));
            expect(evalProgram('((fn* [] #{1 2 2 3}))'), ISet([1, 2, 3]));
          });
          test('/ nested fns', () {
            expect(evalProgram('((fn* [a] ((fn* [b] a) 3)) 2)'), 2);
            expect(evalProgram('((fn* [a] ((fn* [b] b) 3)) 2)'), 3);
          });
          group('/ variable arity', () {
            test('/ no required args', () {
              expect(evalProgram('((fn* [& args] args))'), PLVector([]));
              expect(evalProgram('((fn* [& args] args) 1 2 3)'),
                  PLVector([1, 2, 3]));
            });
            test('/ with required args', () {
              expect(() async => evalProgram('((fn* [a & args] a))'),
                  throwsA(isA<FormatException>()));
              expect(evalProgram('((fn* [a & args] a) 1)'), 1);
              expect(evalProgram('((fn* [a & args] args) 1)'), PLVector([]));
              expect(evalProgram('((fn* [a & args] args) 1 2 3)'),
                  PLVector([2, 3]));
              expect(evalProgram('((fn* [a b & args] b) 1 2 3)'), 2);
              expect(evalProgram('((fn* [a b & args] args) 1 2 3)'),
                  PLVector([3]));
            });
          });
          group('/ multiple arity', () {
            group('/ all required args', () {
              test('/ for defaults', () {
                evalProgram(r'''
(def maf (fn* maf
           ([a] (maf a 1))
           ([a b] [a b])))
                ''');
                expect(evalProgram('(maf 1)'), PLVector([1, 1]));
                expect(evalProgram('(maf 2)'), PLVector([2, 1]));
                expect(evalProgram('(maf 2 3)'), PLVector([2, 3]));
              });
            });
            group('/ with variable arity', () {
              test('/ too many variable arity signatures', () {
                expect(() async => evalProgram('(fn* ([a & bs]) ([a b & cs]))'),
                    throwsA(isA<FormatException>()));
              });
              test('/ ambiguous required vs variable arities', () {
                expect(() async => evalProgram('(fn* ([a & bs]) ([a b]))'),
                    throwsA(isA<FormatException>()));
                expect(() async => evalProgram('(fn* ([a & bs]) ([a b c]))'),
                    throwsA(isA<FormatException>()));
              });
              test('/ just variable arity', () {
                evalProgram(r'''
(def jva (fn* [& args] {.args args}))
''');
                expect(evalProgram('(jva ["a" "b"])'),
                    evalProgram('{.args [["a" "b"]]}'));
              });
              test('/ required and variable arguments', () {
                evalProgram(r'''
(def rva
  (fn* rva
    ([a] (rva a 1 2 3))
    ([a & xs]
      [a xs])))
''');
                expect(evalProgram('(rva {.a "beta"})'),
                    evalProgram('[{.a "beta"} [1 2 3]]'));
              });
            });
          });
          group('/ lexical closure', () {
            test('/ simple lexical closure', () {
              // expect(
              //     evalProgram('((let [a 42] (fn [b] (+ a b))) 3)'), 45);
              expect(evalProgram(r'''
              (let [counter-state (state 0)]
                (defn inc-counter {:doc "Stateful counter"} []
                 (write-state state (fn incrementer [num] (+ num 1)))))'''),
                  isA<PLFunction>());
            });
          });
        });
        group('/ do', () {
          test('/ empty', () {
            expect(evalProgram('(do)'), null);
          });
          test('/ single expression', () {
            expect(evalProgram('(do 1)'), 1);
            expect(evalProgram('(do ["a" "b"])'), PLVector(['a', 'b']));
          });
          test('/ multiple expressions', () {
            expect(evalProgram('(do 1 2 3)'), 3);
          });
        });
        group('/ quote', () {
          test('/ malformed', () {
            expect(() async => evalProgram('(quote)'),
                throwsA(isA<FormatException>()));
            expect(() async => evalProgram('(quote a b)'),
                throwsA(isA<FormatException>()));
          });
          test('/ minimal', () {
            expect(evalProgram('(quote foo)'), PLSymbol('foo'));
            expect(evalProgram("'foo"), PLSymbol('foo'));
            expect(evalProgram('(quote (+ 1 2 3))'),
                PLVector([PLSymbol('+'), 1, 2, 3]).toPLList());
          });
          test('/ nested', () {
            expect(evalProgram("[1 'a 2]"), PLVector([1, PLSymbol('a'), 2]));
            expect(
                evalProgram("'(a (b c (d e)))"),
                PLList([
                  PLSymbol('a'),
                  PLList([
                    PLSymbol('b'),
                    PLSymbol('c'),
                    PLList([PLSymbol('d'), PLSymbol('e')])
                  ])
                ]));
          });
        });
        group('/ let*', () {
          group('/ empty bindings', () {
            test('/ empty body', () {
              expect(evalProgram('(let* [])'), null);
            });
            test('/ has body', () {
              expect(evalProgram('(let* [] 42)'), 42);
            });
          });
          group('/ has bindings', () {
            test('/ empty body', () {
              expect(evalProgram('(let* [a 1])'), null);
            });
            test('/ has body', () {
              expect(evalProgram('(let* [a 1] a)'), 1);
            });
            group('/ has multiple bindings', () {
              test('/ no dependency', () {
                expect(evalProgram('(let* [a 1 b 2] a)'), 1);
                expect(evalProgram('(let* [a 1 b 2] b)'), 2);
                expect(evalProgram('(let* [a 1 b 2] [a b])'), PLVector([1, 2]));
              });
              test('/ dependency', () {
                expect(
                    evalProgram('(let* [a (fn* [x] [x x]) b (a [3 3])] b)'),
                    PLVector([
                      PLVector([3, 3]),
                      PLVector([3, 3])
                    ]));
                expect(evalProgram('(let* [a 1 b 2] b)'), 2);
              });
            });
          });
        });
        group('/ if', () {
          test('/ malformed', () {
            expect(() async => evalProgram('(if)'),
                throwsA(isA<FormatException>()));
            expect(() async => evalProgram('(if true)'),
                throwsA(isA<FormatException>()));
            expect(() async => evalProgram('(if true "true")'),
                throwsA(isA<FormatException>()));
            expect(() async => evalProgram('(if true "true" "false" "oops")'),
                throwsA(isA<FormatException>()));
          });
          test('/ literal condition', () {
            expect(evalProgram('(if true 1 2)'), 1);
            expect(evalProgram('(if "true" 1 2)'), 1);
            expect(evalProgram('(if false 1 2)'), 2);
            expect(evalProgram('(if nil 1 2)'), 2);
          });
          test('/ evaled condition', () {
            expect(evalProgram('(if ((fn* [] true)) 1 2)'), 1);
            expect(evalProgram('(if ((fn* [] "true")) 1 2)'), 1);
            expect(evalProgram('(if ((fn* [] false)) 1 2)'), 2);
            expect(evalProgram('(if ((fn* [])) 1 2)'), 2);
          });
        });
        group('/ try/catch/finally', () {
          test('/ try standalone', () {
            expect(() async => evalProgram('(try (throw (ex-info "wow" {})))'),
                throwsA(isA<Exception>()));
          });
          test('/ try + finally', () {
            evalProgram('(def finally-called? (state false))');
            expect(evalProgram('(deref finally-called?)'), false);
            try {
              evalProgram(
                  '(try (throw (ex-info "finally!" {})) (finally (write-state finally-called? true)))');
              expect(true, false,
                  reason:
                      'The previous expression should throw an exception, but obviously did not if you\'re reading this'); // Unreachable
            } catch (e) {
              expect(evalProgram('(deref finally-called?)'), true);
            }
          });
          test('/ try + catch', () {
            evalProgram('(def finally-called? (state false))');
            expect(evalProgram('(deref finally-called?)'), false);
            evalProgram(
                '(try (throw (ex-info "finally!" {})) (catch _ e (write-state finally-called? true)))');
            expect(evalProgram('(deref finally-called?)'), true);
          });
          test('/ try + catch + finally', () {
            evalProgram('(def what-called? (state #{}))');
            expect(evalProgram('(deref what-called?)'), ISet([]));
            evalProgram(
                '(try (throw (ex-info "finally!" {})) (catch _ e (write-state what-called? conj :catch)) (finally (write-state what-called? conj :finally)))');
            expect(evalProgram('(deref what-called?)'),
                evalProgram('#{:catch :finally}'));
          });
          test('/ try with throwing fn', () {
            evalProgram('(def calls (state []))');
            expect(evalProgram('(deref calls)'), PLVector([]));
            evalProgram('(defn throw-axe [] (throw (ex-info "Axe!" {})))');
            evalProgram(r'''
                  (try
                   (throw-axe)
                   (catch _ e (write-state calls conj :catch))
                   (finally (write-state calls conj :finally)))''');
            expect(
                evalProgram('(deref calls)'), evalProgram('[:catch :finally]'));
          });
          test('/ try with throwing fn that catches', () {
            evalProgram('(def calls (state []))');
            expect(evalProgram('(deref calls)'), PLVector([]));
            evalProgram('''
(defn throw-axe []
  (try
    (throw (ex-info "Axe!" {}))
    (catch _ e
      (write-state calls conj :catch-fn))))''');
            evalProgram(r'''
                  (try
                   (throw-axe)
                   (catch _ e (write-state calls conj :catch))
                   (finally (write-state calls conj :finally)))''');
            expect(evalProgram('(deref calls)'),
                evalProgram('[:catch-fn :finally]'));
          });
          test('/ try with throwing fn that catches and rethrows', () {
            evalProgram('(def calls (state []))');
            expect(evalProgram('(deref calls)'), PLVector([]));
            evalProgram(
                '(defn throw-axe [] (try (throw (ex-info "Axe!" {})) (catch _ e (write-state calls conj :catch-fn) (throw e))))');
            evalProgram(r'''
                  (try
                   (throw-axe)
                   (catch _ e (write-state calls conj :catch))
                   (finally (write-state calls conj :finally)))''');
            expect(evalProgram('(deref calls)'),
                evalProgram('[:catch-fn :catch :finally]'));
          });
          test('/ try nested with rethrow', () {
            evalProgram('(def calls (state []))');
            expect(evalProgram('(deref calls)'), PLVector([]));
            evalProgram(r'''
                (try
                  (try
                   (throw (ex-info "finally!" {}))
                   (catch _ e (write-state calls conj :catch-inner) (throw e))
                   (finally (write-state calls conj :finally-inner)))
                  (catch _ e (write-state calls conj :catch-outer))
                  (finally (write-state calls conj :finally-outer))))''');
            expect(
                evalProgram('(deref calls)'),
                evalProgram(
                    '[:catch-inner :finally-inner :catch-outer :finally-outer]'));
          });
        });
      });
    });
    group('/ Loading', () {
      test('/ Reads and evaluates all top-level forms', () {
        evalProgram('(def load-state (state :a))');
        expect(loadProgram('1 (write-state load-state :b) 2 3'), 3);
        expect(loadProgram('(deref load-state)'), PLTerm('b'));
      });
    });
    group('/ Printing', () {
      test('/ nil', () {
        expect(printProgram('nil'), 'nil');
      });
      test('/ Booleans', () {
        expect(printProgram('true'), 'true');
        expect(printProgram('false'), 'false');
      });
      group('/ Numbers', () {
        test('/ int', () {
          expect(printProgram('42'), '42');
          expect(printProgram('+42'), '42');
          expect(printProgram('0'), '0');
          expect(printProgram('-42'), '-42');

          expect(printProgram('0x20'), '32');
          expect(printProgram('0x42e'), '1070');
          expect(printProgram('+0x42e'), '1070');
          expect(printProgram('-0x42e'), '-1070');

          expect(printProgram('042'), '42');
          expect(printProgram('+042'), '42');
          expect(printProgram('-042'), '-42');
        });
        test('/ double', () {
          expect(printProgram('42.2'), '42.2');
          expect(printProgram('+42.2'), '42.2');
          expect(printProgram('-42.2'), '-42.2');

          expect(printProgram('42.2e0'), '42.2');
          expect(printProgram('422e-1'), '42.2');
          expect(printProgram('422e1'), '4220.0');
          expect(printProgram('422e+1'), '4220.0');
        });
      });
      group('/ Symbols', () {
        test('/ regular', () {
          expect(printProgram('*pilisp-version*'), isA<String>());
          expect(() async => printProgram('1abc'),
              throwsA(isA<UnreadableFormException>()));
        });
        test('/ term', () {
          expect(printProgram('.id'), ':id');
          expect(printProgram('.id!'), ':id!');
          expect(printProgram('.id1234567890!@#&*'), ':id1234567890!@#&*');
        });
      });
      group('/ Lists', () {
        test('/ empty', () {
          expect(printProgram('[]'), '[]');
        });
        test('/ flat', () {
          expect(printProgram('[1 2 3]'), '''[
  1
  2
  3
]''');
        });
      });
      group('/ Maps', () {
        test('/ empty', () {
          expect(printProgram('{}'), '{}');
        });
        test('/ flat', () {
          expect(printProgram('{1 2 3 4}'), '''{
  1 2,
  3 4,
}''');
        });
        test('/ nested', () {
          expect(printProgram('{1 {2 {3 4}}}'), '''{
  1 {
    2 {
      3 4,
    },
  },
}''');
        });
        test('/ mixed', () {
          expect(printProgram('{1 {2 [3 4 {5 6}]} 7 [8 9 10]}'), '''{
  1 {
    2 [
      3
      4
      {
        5 6,
      }
    ],
  },
  7 [
    8
    9
    10
  ],
}''');
        });
      });
      group('/ Sets', () {
        test('/ empty', () {
          expect(printProgram('#{}'), '#{}');
        });
        test('/ flat', () {
          expect(printProgram('#{1 2 3}'), '''#{
  1,
  2,
  3,
}''');
        });
        test('/ non-unique items', () {
          expect(printProgram('#{1 2 3 1}'), '''#{
  1,
  2,
  3,
}''');
        });
        test('/ nested', () {
          expect(printProgram('#{[1] [2] [3 4] {5 6}}'), '''#{
  [
    1
  ],
  [
    2
  ],
  [
    3
    4
  ],
  {
    5 6,
  },
}''');
        });
      });
    });
  });
  group('Library', () {
    // test('/ DEBUG', () {
    //   expect(evalProgram("(partition-by (fn pipe-splitter [form] (get #{'|} form nil)) '(a b | c d | e f))"), 42);
    // });
    group('/ Dart implementation', () {
      group('/ types', () {
        test('/ type', () {
          expect(evalProgram('(type [])'), PLSymbol('vector'));
          expect(evalProgram('(type \'())'), PLSymbol('list'));
          expect(evalProgram('(type {})'), PLSymbol('map'));
          expect(evalProgram('(type #{})'), PLSymbol('set'));
          expect(evalProgram('(type 42)'), PLSymbol('int'));
          expect(evalProgram('(type 42.3)'), PLSymbol('double'));
          expect(evalProgram('(type "wow")'), PLSymbol('String'));
          expect(evalProgram('(type #"wow")'), PLSymbol('RegExp'));
          expect(evalProgram('(type .a)'), PLSymbol('term'));
        });
      });
      group('/ collections', () {
        group('/ seq', () {
          test('/ seq basics', () {
            expect(() async => evalProgram('(seq)'),
                throwsA(isA<FormatException>()));
            expect(evalProgram('(seq [])'), null);
            expect(evalProgram("(seq '()))"), null);
          });
          test('/ seq string', () {
            expect(evalProgram('(seq "wow")'), PLVector('wow'.codeUnits));
          });
        });
        test('/ list', () {
          expect(evalProgram('(list)'), PLVector([]));
          expect(evalProgram('(list 1 2 3)'), PLVector([1, 2, 3]));
          expect(
              evalProgram('(list .a .b .c)'),
              PLVector([
                PLTerm('a'),
                PLTerm('b'),
                PLTerm('c'),
              ]));
          expect(
              evalProgram('(list "a" "b" "c")'), evalProgram('["a" "b" "c"]'));
        });
        test('/ conj', () {
          expect(evalProgram('(conj)'), allOf(isA<PLVector>(), PLVector([])));
          expect(() async => evalProgram('(conj 1)'),
              throwsA(isA<UnsupportedError>()));
          expect(evalProgram('(conj [] 1)'), evalProgram('[1]'));
          expect(evalProgram('(conj [] 1 2 3 "4" .five [6 7])'),
              evalProgram('[1 2 3 "4" .five [6 7]]'));
        });
        test('/ cons', () {
          expect(() async => evalProgram('(cons)'),
              throwsA(isA<UnsupportedError>()));
          expect(() async => evalProgram('(cons 1)'),
              throwsA(isA<UnsupportedError>()));
          expect(() async => evalProgram('(cons 1 2)'),
              throwsA(isA<UnsupportedError>()));
          expect(evalProgram("(cons 1 '(2 3))"), evalProgram("'(1 2 3)"));
          expect(evalProgram('(cons [.a .b] [.c .d])'),
              evalProgram('[[.a .b] .c .d]'));
        });
        test('/ count', () {
          expect(evalProgram('(count [])'), 0);
          expect(evalProgram('(count [1 2])'), 2);
          expect(evalProgram('(count [.a .b .c .d .e .f .g])'), 7);
          expect(evalProgram('(count "привет")'), 6);
        });
        test('/ nth*', () {
          expect(() async => evalProgram('(nth* [] 1 .default)'),
              throwsA(isA<FormatException>()));
        });
        test('/ next', () {
          expect(evalProgram('(next [])'), null);
          expect(evalProgram('(next [1])'), null);
          expect(evalProgram('(next [1 2])'), PLVector([2]));
          expect(evalProgram('(next (next [1 2 3 4 "five" .six]))'),
              PLVector([3, 4, 'five', PLTerm('six')]));
        });
      });
      group('/ arithmetic', () {
        test('/ +', () {
          expect(evalProgram('(+)'), 0);
          expect(evalProgram('(+ 1)'), 1);
          expect(evalProgram('(+ 1 2 3)'), 6);
          expect(evalProgram('(+ 1 -2 3)'), 2);
          expect(evalProgram('(+ 1 2.5 3)'), 6.5);
          expect(() async => evalProgram('(+ 1 nil 3)'),
              throwsA(isA<UnsupportedError>()));
        });
        test('/ -', () {
          expect(
              () async => evalProgram('(-)'), throwsA(isA<FormatException>()));
          expect(evalProgram('(- 1)'), -1);
          expect(evalProgram('(- 1 2 3)'), -4);
          expect(evalProgram('(- 1 -2 3)'), 0);
          expect(evalProgram('(- 1 2.5 3)'), -4.5);
          expect(() async => evalProgram('(- 1 nil 3)'),
              throwsA(isA<UnsupportedError>()));
        });
        test('/ *', () {
          expect(evalProgram('(*)'), 1);
          expect(evalProgram('(* 2)'), 2);
          expect(evalProgram('(* 1 2 4)'), 8);
          expect(evalProgram('(* 1 -2 3)'), -6);
          expect(evalProgram('(* 1 2.5 3)'), 7.5);
          expect(() async => evalProgram('(* 1 nil 3)'),
              throwsA(isA<UnsupportedError>()));
        });
        test('/ /', () {
          expect(
              () async => evalProgram('(/)'), throwsA(isA<FormatException>()));
          expect(evalProgram('(/ 2)'), 0.5);
          expect(evalProgram('(/ 6 3)'), 2);
          expect(evalProgram('(/ 6 3 2)'), 1);
          expect(evalProgram('(/ 6 1.5)'), 4);
          expect(() async => evalProgram('(/ 1 nil 3)'),
              throwsA(isA<UnsupportedError>()));
        });
      });
      group('/ comparisons', () {
        test('/ =', () {
          expect(evalProgram('(=)'), true);
          expect(evalProgram('(= 1)'), true);
          expect(evalProgram('(= 1 1)'), true);
          expect(evalProgram('(= 1 1 1)'), true);
          expect(evalProgram('(= 1 1 1 ((fn [] 1)))'), true);
          expect(evalProgram('(= 1 2)'), false);
          expect(evalProgram('(= 1 2 nil)'), false);
        });
        test('/ arithmetic comparisons', () {
          for (final fn in ['>', '<', '>=', '<=']) {
            expect(evalProgram('($fn)'), true);
            expect(evalProgram('($fn 1)'), true);
          }
          expect(evalProgram('(>= 1 1)'), true);
          expect(evalProgram('(<= 1 1)'), true);

          expect(evalProgram('(> 3 2 1)'), true);
          expect(evalProgram('(> 1 2 3)'), false);
          expect(evalProgram('(< 1 2 3)'), true);
          expect(evalProgram('(> 1 2 3)'), false);

          expect(evalProgram('(< 1 2 1)'), false);
          expect(evalProgram('(> 3 2 3)'), false);
        });
      });
      group('/ network', () {
        test('/ uri', () {
          expect(() async => evalProgram('(uri "::invalid::")'),
              throwsA(isA<FormatException>()));
          expect(evalProgram('(uri "file:///tmp/state.pil")'), isA<Uri>());
        });
      });
    });
    group('/ Core', () {
      group('/ macros for special forms', () {
        test('/ let rebound', () {
          expect(piLispEnv.getBinding(PLSymbol('let')), isNotNull);
          expect(piLispEnv.getBinding(PLSymbol('let'))?.isMacro, true);
          expect(piLispEnv.getBindingValue(PLSymbol('let')),
              isA<PLNamedInvocable>());

          expect(evalProgram('(let [a 1] a)'), 1);
        });
        test('/ fn rebound', () {
          expect(evalProgram('((fn [a] a) 42)'), 42);
        });
      });
      group('/ destructuring', () {
        group('/ map destructuring', () {
          test('/ via :keys', () {
            evalProgram('''(def dres (destructure '[{:keys [a]} {:a 42}]))''');
            expect(evalProgram('''(vector? dres)'''), true);
            expect(evalProgram('''(nth dres 1)'''), IMap({PLTerm('a'): 42}));
            expect(evalProgram('''(nth dres 4)'''), PLSymbol('a'));
          });
        });
      });
      group('/ conditional macros', () {
        test('/ or', () {
          expect(evalProgram('(or)'), null);
          expect(evalProgram('(or false)'), false);
          expect(evalProgram('(or nil)'), null);
          expect(evalProgram('(or nil false)'), false);
          expect(evalProgram('(or nil 1)'), 1);
          expect(evalProgram('(or nil false 2)'), 2);
          expect(evalProgram('(or nil false 2 false)'), 2);
        });
        test('/ and', () {
          expect(evalProgram('(and)'), true);
          expect(evalProgram('(and 1)'), 1);
          expect(evalProgram('(and 1 2)'), 2);
          expect(evalProgram('(and 1 2 :three)'), PLTerm('three'));
          evalProgram('(defn my-and [] (and 1 2 3))');
          expect(evalProgram('(my-and)'), 3);
        });
        test('/ when', () {
          expect(evalProgram('(when true 1)'), 1);
          expect(evalProgram('(when false 1)'), null);
        });
      });
      // group('/ piped macro', () {
      //   test('/ macroexpand-1 of piped', () {
      //     final prog =
      //         r'''(piped [0 1 2 3 4 5 6 7 8 9] | map (partial * 3) | filter even? | last | | / $ 6)''';
      //     expect(evalProgram("(macroexpand-1 '$prog)"), 42);
      //   });
      // });
      group('/ collections core', () {
        test('/ nth', () {
          expect(evalProgram('(nth [0 1 2] 0)'), 0);
          expect(evalProgram('(nth [0 1 2] 1)'), 1);
          expect(evalProgram('(nth [0 1 2] 2)'), 2);
          expect(() async => evalProgram('(nth [0 1 2] 3)'),
              throwsA(isA<RangeError>()));
          expect(evalProgram('(nth [0 1 2] 3 .default)'), PLTerm('default'));
        });
        test('/ take', () {
          expect(
              evalProgram('(count (take 115 (sort (keys (bindings)))))'), 115);
        });
      });
      group('/ types core', () {
        test('/ int?', () {
          expect(evalProgram('(int? 2)'), true);
          expect(evalProgram('(int? 2.0)'), false);
          expect(evalProgram('(int? nil)'), false);
          expect(evalProgram('(int? "wow")'), false);
        });
        test('/ double?', () {
          expect(evalProgram('(double? 2.0)'), true);
          expect(evalProgram('(double? 2)'), false);
          expect(evalProgram('(double? nil)'), false);
          expect(evalProgram('(double? "wow")'), false);
        });
        test('/ list?', () {
          expect(evalProgram("(list? '())"), true);
          expect(evalProgram('(list? (list))'), true);
          expect(evalProgram('(list? (list 1 2))'), true);
          expect(evalProgram('(list? 2)'), false);
          expect(evalProgram('(list? nil)'), false);
          expect(evalProgram('(list? [])'), false);
        });
        test('/ vector?', () {
          expect(evalProgram('(vector? [])'), true);
          expect(evalProgram('(vector? (vector))'), true);
          expect(evalProgram('(vector? (vector 1 2))'), true);
          expect(evalProgram('(vector? 2)'), false);
          expect(evalProgram('(vector? nil)'), false);
          expect(evalProgram('(vector? (list))'), false);
        });
        test('/ map?', () {
          expect(evalProgram('(map? {})'), true);
          // FEATURE Haven't implemented hash-map or similar
          expect(evalProgram('(map? {1 2 .three .four})'), true);
          expect(evalProgram('(map? 2)'), false);
          expect(evalProgram('(map? nil)'), false);
          expect(evalProgram('(map? #{})'), false);
        });
        test('/ set?', () {
          expect(evalProgram('(set? #{})'), true);
          // FEATURE Haven't implemented hash-set or similar
          expect(evalProgram('(set? #{1 2})'), true);
          expect(evalProgram('(set? 2)'), false);
          expect(evalProgram('(set? nil)'), false);
          expect(evalProgram('(set? {})'), false);
        });
        test('/ string?', () {
          expect(evalProgram('(string? "")'), true);
          expect(evalProgram('(string? "wow")'), true);
          expect(evalProgram('(string? 2)'), false);
          expect(evalProgram('(string? nil)'), false);
          expect(evalProgram('(string? #"[a-z]")'), false);
        });
        test('/ reg-exp?', () {
          expect(evalProgram('(reg-exp? #"")'), true);
          expect(evalProgram('(reg-exp? #"[a-zA-Z]")'), true);
          expect(evalProgram('(reg-exp? 2)'), false);
          expect(evalProgram('(reg-exp? nil)'), false);
          expect(evalProgram('(reg-exp? "[a-z]")'), false);
        });
      });
      test('/ identity', () {
        expect(() async => evalProgram('(identity)'),
            throwsA(isA<FormatException>()));
        expect(evalProgram('(identity 1)'), 1);
        expect(evalProgram('(identity nil)'), null);
        expect(evalProgram('(identity identity)'), isA<PLFunction>());
        expect(evalProgram('(vector? (identity [1 2 3]))'), true);
      });
      group('/ partial', () {
        test('/ invoking a partial', () {
          expect(evalProgram('''((partial * 27))'''), 27);
          expect(evalProgram('''((partial + 5))'''), 5);
        });
      });
    });
  });
}

Object? evalProgram(String s, {PLEnv? customEnv}) {
  if (customEnv != null) {
    return PiLisp.eval(PiLisp.readString(s), env: customEnv);
  } else {
    final beenRead = PiLisp.readString(s);
    return PiLisp.eval(beenRead);
  }
}

Object? loadProgram(String programSource) {
  return PiLisp.loadString(programSource);
}

String printProgram(String s) {
  return PiLisp.printToString(PiLisp.eval(PiLisp.readString(s)));
}
