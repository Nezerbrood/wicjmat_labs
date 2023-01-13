
import 'dart:math';


List<double> diagonalA = List<double>.from([0.0, 1.0, 1.0,2.0]);
List<double> diagonalB = List<double>.from([3.0, 3.0, 3.0,5.0]);
List<double> diagonalC = List<double>.from([1.0, 1.0,2.0,0.0]);

List<double> tridiagonalMatrixAlgorithm(List<double> diagonalA,
    List<double> diagonalB, List<double> diagonalC, List<double> vectorD) {
  int matrixSize =  vectorD.length;
  List<double> xVector = List<double>.filled(matrixSize, 0);
  for (var i = 1; i < matrixSize; i++) {
    double w = diagonalA[i]/diagonalB[i-1];
    diagonalB[i]= diagonalB[i]-w*diagonalC[i-1];
    vectorD[i]=vectorD[i]-w*vectorD[i-1];
  }
  for(int i = matrixSize-1;i>=0;i--){
    if(i==matrixSize-1){
      xVector[i] = vectorD[i]/diagonalB[i];
    }else{
      xVector[i]= (vectorD[i]-(diagonalC[i]*xVector[i+1]))/(diagonalB[i]);
    }
  }
  return xVector;
}

void main() {
  var result =
      tridiagonalMatrixAlgorithm(diagonalA, diagonalB, diagonalC, List<double>.from([1.0, 1.0, 1.0,1.0]));
  for (var element in result) {
    print(element);
  }
}
