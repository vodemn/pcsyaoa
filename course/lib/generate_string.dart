import 'dart:io';

void main() async {
  int count = 512;
  int maxLength = count.toString().length + 1; //for infix space
  String result = '';

  result += 'FUNCTION to_string (element : INTEGER) RETURN STRING IS' + '\n';
  result += '        VARIABLE str : STRING(1 TO $maxLength);' + '\n';
  result += '      BEGIN' + '\n';
  result += '          CASE element IS' + '\n';
  for (int i = 1; i <= count; i++) {
    String iToString = i.toString();
    String prefix = '';
    for (int j = 0; j < maxLength - iToString.length; j++) {
      prefix += ' ';
    }
    result += '            WHEN $i => str := "$prefix$iToString";' + '\n';
  }
  result += 
      '            WHEN OTHERS => str := "${_makeUndefined(maxLength)}";' + '\n';
  result += '        END CASE;' + '\n';
  result += '        RETURN str;' + '\n';
  result += '    END FUNCTION to_string;' + '\n';

  final filename = 'to_string.txt';
  File(filename).writeAsString(result);
}

String _makeUndefined(int count) {
  String result = '';
  for (int i = 1; i <= count; i++) {
    result += '?';
  }
  return result;
}
