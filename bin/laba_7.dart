import 'dart:math';
///  Искомая функция 0=ln(2x)-e^{2x} + 3
///  Найдем производную и точки перегиба:
///  y ln(2x)-e^{2x} + 3
///  y' = 1/x -2e^(2x)
///  y'' = 1/x^2 - 4e^(2x)
///  найдем нули первой производной
///  1/x -2e^2x = 0
///  x = 0.28357164520489193650...
///  соответственно отрезки:
/// (-inf, x) функция выпуклая и возрастает
/// и
/// (x, +inf) функция выпуклая и убывает
///
/// для удобства расчета и возмеем левую границу как 0.00001
///

const EPSILON = 0.001;


class Pair{
  double first;
  double second;

  Pair(this.first, this.second);
}
double func(double x){
  var result= log(2*x)-pow(e, 2*x) + 3;
  return result;
}
double funcDer1 (double x){
  var result= ( 1/x )- (2* pow(e,2*x));
  return result;
}
double funcDer2 (double x){
  var result =  -( 1/pow(x, 2) )- 4* pow(e,2*x);
  return result;
}
double tangentMethod (double x){
  var result =   x- (func(x)/funcDer1(x));
  return result;
}
double chordMethod (double x,double tangentX){
  var result = x - (func(x)*(tangentX-x))/(func(tangentX)-func(x));
  return result;
}

var firstSegment = Pair(0.0000000001,0.28357164520489193650);
var secondSegment = Pair(0.5,10);
var segments = List<Pair>.of([firstSegment,secondSegment]);

void main() {
  for(var segment in segments){
    if(funcDer1(segment.second) * funcDer2(segment.second) > 0){
      print("type A");
      while((segment.first-segment.second).abs()>EPSILON){
        var tangentResult =  tangentMethod(segment.second);
        var chordResult =  chordMethod(segment.first,tangentResult);
        segment.first =chordResult;
        segment.second = tangentResult;
      }

    }else{
      ///знаки производных НЕ cовпадают
      ///тогда для левой границы - метод хорд, для правой - метод касательных
      print("type B");
      while((segment.first-segment.second).abs()>EPSILON){
        var tangentResult =  tangentMethod(segment.first);
        var chordResult =  chordMethod(segment.second,tangentResult);
        segment.first =tangentResult;
        segment.second = chordResult;
      }
    }
    print("calculated root: ${segment.second}");
  }
}
