LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
USE std.textio.ALL;
USE std.env.ALL;
USE work.lib_package.ALL;

ENTITY scheme_test IS
END scheme_test;

ARCHITECTURE MainBehavior OF scheme_test IS

  FUNCTION to_string (vec : std_logic_vector) RETURN STRING IS
    ALIAS v : std_logic_vector(vec'length - 1 DOWNTO 0) IS vec;
    VARIABLE str : STRING(v'RANGE);
  BEGIN -- function to_string
    FOR i IN v'RANGE LOOP
      IF v(i) = '1' THEN
        str(i) := '1';
      ELSE
        str(i) := '0';
      END IF;
    END LOOP;
    RETURN str;
  END FUNCTION to_string;

  COMPONENT SchemeModel IS
    PORT (
      x : IN std_logic_vector(0 TO 3);
      y : OUT std_logic_vector(0 TO 3));
  END COMPONENT SchemeModel;
  SIGNAL a : std_logic_vector(0 TO 3) := (OTHERS => '0');
  SIGNAL b : std_logic_vector(0 TO 3);
  SIGNAL a0, a1, a2, a3 : std_logic := '0';
  SIGNAL b0, b1, b2, b3 : std_logic := '0';
  SIGNAL strob : std_logic := '0';

BEGIN
  p1 : SchemeModel PORT MAP(x => a, y => b);

  a(3) <= NOT a(3) AFTER interval;
  a(2) <= NOT a(2) AFTER interval * 2;
  a(1) <= NOT a(1) AFTER interval * 4;
  a(0) <= NOT a(0) AFTER interval * 8;

  b3 <= b(3);
  b2 <= b(2);
  b1 <= b(1);
  b0 <= b(0);

  PROCESS IS
    VARIABLE count : INTEGER := 0;
  BEGIN
    IF count > 16 THEN
      stop;
    ELSE
      WAIT FOR interval;
      count := count + 1;
    END IF;
  END PROCESS;

  PROCESS IS
  BEGIN
    strob <= '0';
    WAIT FOR interval - 5 ns;
    strob <= '1';
    WAIT FOR 5 ns;
  END PROCESS;

  PROCESS (strob)
    VARIABLE oline : line;
  BEGIN
    IF strob'event AND strob = '1' THEN
      write(oline, " " & to_string(a) & " " & to_string(b));
      writeline(OUTPUT, oline);
    END IF;
  END PROCESS;

END MainBehavior;