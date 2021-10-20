class MathOperation {
  double addition(double a1, double a2) {
    return a1 + a2;
  }

  double substraction(double a1, double a2) {
    return a1 - a2;
  }

  double multiplication(double a1, double a2) {
    return a1 * a2;
  }

  double division(double a1, double a2) {
    if (a2 == 0) {
      return 1010;
    }
    return a1 / a2;
  }

  double percent(double a1, double a2) {
    return a1 % a2;
  }
}
