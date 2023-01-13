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





//
//
//
//
//
//
// import 'dart:math';
//
// import 'laba_5.dart';
// import 'laba_7.dart';
//
// class Pair {
//   double first;
//   double second;
//
//   Pair(this.first, this.second);
// }
//
// Pair integrationLimits = Pair(0.1, 0.6);
//
// double epsilon = 0.001;
//
// ///Функция, вариант 18
// double funcTask(double x) {
//   return pow(x, 2) - (0.5 * pow(e, -x));
// }
//
// integrate(Function(double) func, Pair limits, double epsilon) {
//   ///стартовый шаг
//   int n = 10;
//   double oldResult = epsilon + 1;
//   double result = 0;
//   while ((result - oldResult).abs() > epsilon) {
//     oldResult = result;
//     result = 0;
//
//     ///шаг
//     final double h = (limits.second - limits.first) / n;
//     List<double> diagonalA = [];
//     List<double> diagonalB = [];
//     List<double> diagonalC = [];
//     List<double> vectorD = [];
//
//     for (int i = 0; i < n+1; i++) {
//       if (i == 0) {
//         diagonalA.add(0.0);
//         diagonalB.add(2.0);
//         diagonalC.add(1.0);
//         vectorD.add(2 *
//             (func(limits.first + ((i + 2) * h)) -
//                 func(limits.first + ((i + 1) * h))) /
//             (h) +
//             0.5 *
//                 ((func(limits.first + ((i + 1) * h))) -
//                     (func(limits.first + ((i) * h)))) /
//                 h);
//       } else if (i == n - 1) {
//         diagonalA.add(1);
//         diagonalB.add(2);
//         diagonalC.add(0);
//         vectorD.add((2.5 *
//             func(limits.first +
//                 ((i) * h) -
//                 func(limits.first + ((i - 2) * h)))) /
//             h);
//       } else {
//         diagonalA.add(0.5);
//         diagonalB.add(2);
//         diagonalC.add(0.5);
//         vectorD.add(1.5 *
//             ((func(limits.first + ((i + 1) * h)) -
//                 func(limits.first + ((i - 1) * h))) /
//                 (h)));
//       }
//     }
//
//     List<double> slopes =
//     tridiagonalMatrixAlgorithm(diagonalA, diagonalB, diagonalC, vectorD);
//
//     /// результат;
//     for (int i = 0; i < n; i++) {
//       double first =  h * (func(limits.first+((i+1)*h)) + func(limits.first+((i)*h)) / 2);
//       print("first: $first");
//       double second = (pow(h, 2) * (slopes[i] - slopes[i+1]) / 12);
//       print("second: $second");
//       result = result +
//           first+
//           second;
//     }
//     // while (xPosition <= limits.second) {
//     //   result = result +
//     //       h * (func(xPosition) + func(xPosition - h)) / 2 +
//     //       pow(h, 2) * (funcDer1(xPosition - h) - funcDer1(xPosition)) / 12;
//     //   xPosition += h;
//     // }
//
//     ///удваиваем количество разбиений
//     n *= 2;
//   }
//   print("finite number of partitions: $n");
//   return result;
// }
//
// void main() {
//   var integrationResult = integrate(funcTask, integrationLimits, epsilon);
//   print("epsilon: $epsilon");
//   print("Integration spline result: $integrationResult");
// }
//
