import 'dart:math';

import 'laba_7.dart';

class Pair {
  double first;
  double second;

  Pair(this.first, this.second);
}

Pair integrationLimits = Pair(0.1, 0.6);

double epsilon = 0.001;

///Функция, вариант 18
double funcTask(double x) {
  return pow(x, 2) - (0.5 * pow(e, -x));
}

integrate(Function(double) func, Pair limits, double epsilon) {
  ///стартовый шаг
  int n = 10;
  double oldResult = epsilon + 1;
  double result = 0;
  while ((result - oldResult).abs() > epsilon) {
    oldResult = result;
    result = 0;

    ///шаг
    final double h = (limits.second - limits.first) / n;

    ///позиция
    double xPosition = limits.first + h;

    /// результат;
    while (xPosition <= limits.second) {
      result = result +
          h * (func(xPosition) + func(xPosition - h)) / 2 +
          pow(h, 2) * (funcDer1(xPosition - h) - funcDer1(xPosition)) / 12;
      xPosition += h;
    }

    ///удваиваем количество разбиений
    n *= 2;
  }
  print("finite number of partitions: $n");
  return result;
}

void main() {
  var integrationResult = integrate(funcTask, integrationLimits, epsilon);
  print("epsilon: $epsilon");
  print("Integration spline result: $integrationResult");
}
