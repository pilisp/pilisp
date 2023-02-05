import 'package:pilisp/pilisp.dart';

void main() async {
  print(
      '# Function Definition and Invocation\n${PiLisp.eval(PiLisp.readString('((fn* [a & xs] [a xs]) {.a .b} 1 2 3)'))}');
}
