import 'dart:math';

void main() {
  String output = '';
  int size = 4;
  Random rand = new Random();
  output += '(';
  for (int i = 1; i <= size; i++) {
    output += '(';
    for (int j = 1; j <= size; j++) {
      output += rand.nextInt(100).toString();
      if (j < size) output += ', ';
    }
    output += ')';
    if (i < size) output += ', ';
  }
  output += ')';
  print(output);
}
