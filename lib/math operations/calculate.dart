import 'my_math.dart';

class Calculate {
  double calculate(String text) {
    String myOperator = findOperator(text);
    int operatorIndex = text.indexOf(myOperator);

    String firstPiece = text.substring(0, operatorIndex);
    String secondPiece = text.substring(operatorIndex + 1, text.length);

    if (myOperator == '+') {
      return MathOperation()
          .addition(double.parse(firstPiece), double.parse(secondPiece));
    } else if (myOperator == '-') {
      return MathOperation()
          .substraction(double.parse(firstPiece), double.parse(secondPiece));
    } else if (myOperator == '÷') {
      return MathOperation()
          .division(double.parse(firstPiece), double.parse(secondPiece));
    } else if (myOperator == 'x') {
      return MathOperation()
          .multiplication(double.parse(firstPiece), double.parse(secondPiece));
    } else {
      return MathOperation()
          .percent(double.parse(firstPiece), double.parse(secondPiece));
    }
  }
}

String findOperator(String text) {
  if (text.contains('+')) {
    return '+';
  } else if (text.contains('-')) {
    return '-';
  } else if (text.contains('÷')) {
    return '÷';
  } else if (text.contains('x')) {
    return 'x';
  } else {
    return '%';
  }
}
