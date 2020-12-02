import 'dart:io';
import 'dart:math';

void main() async {
  String result = '';
  result += _name('a') + _fillString() + ';';
  result += '\n';
  result += _name('b') + _fillString() + ';';
  final filename = 'matrix.txt';
  File(filename).writeAsString(result);
}

String _name(String name) {
  return 'SIGNAL $name : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ';
}

String _fillString() {
  String output = '';
  int size = 4;
  Random rand = new Random();
  output += '(';
  for (int i = 1; i <= size; i++) {
    output += '(';
    for (int j = 1; j <= size; j++) {
      output += (rand.nextInt(10) + 1).toString();
      if (j < size) output += ', ';
    }
    output += ')';
    if (i < size) output += ', ';
  }
  output += ')';
  return output;
}

//    SIGNAL a : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ((6, 7, 1, 7), (10, 1, 2, 2), (10, 9, 9, 7), (1, 2, 7, 2));
//    SIGNAL b : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ((6, 2, 1, 5), (4, 7, 1, 8), (4, 6, 7, 1), (7, 4, 1, 8));
