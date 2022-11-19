import 'package:math_expressions/math_expressions.dart';

class Evaluate{
  static String str = '0';
  bool isOperator(String x) {
    if(x == '/' || x == 'x' || x == '-' || x == '+' || x == '=' ){
      return true;
    }
    return false;
  }
  static String userInput = '0';

  String equalPressed() {
    String finaluserinput = str;

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);
    return (result - result.truncate()) == 0 ? result.truncate().toString(): result.toString();
  }
  static void add(String val) {
    if (str.compareTo('0') == 0) {
      str = val;
    } else {
      str += val;
    }
  }

  static void clear() {
    str = '0';
  }

  static void delete() {
    if (str.compareTo('0') != 0) {
      String tmp = str.substring(0, str.length - 1);
      tmp == '' ? str = '0' : str = tmp;
    }
  }
}