LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;
USE std.textio.ALL;
USE work.matrix_package.ALL;

ENTITY TEST_BENCH IS
END TEST_BENCH;

ARCHITECTURE MainBehavior OF TEST_BENCH IS
    FUNCTION to_string (element : INTEGER) RETURN STRING IS
        VARIABLE str : STRING(1 TO 4);
    BEGIN
        CASE element IS
            WHEN 0 => str := "   0";
            WHEN 1 => str := "   1";
            WHEN 2 => str := "   2";
            WHEN 3 => str := "   3";
            WHEN 4 => str := "   4";
            WHEN 5 => str := "   5";
            WHEN 6 => str := "   6";
            WHEN 7 => str := "   7";
            WHEN 8 => str := "   8";
            WHEN 9 => str := "   9";
            -- ... --
            WHEN 100 => str := " 100";
            WHEN OTHERS => str := "????";
        END CASE;
        RETURN str;
    END FUNCTION to_string;

    CONSTANT column : NATURAL := 5;
    SIGNAL test_array : MATRIX(0 TO 9, 0 TO 7);
    SIGNAL el_f, y_f : INTEGER := 0;
    SIGNAL el_p, y_p : INTEGER := 0;
    SIGNAL x : INTEGER := column;
BEGIN

    PROCESS
        VARIABLE arr : MATRIX(0 TO 9, 0 TO 7);
        VARIABLE r : real;
        VARIABLE seed1, seed2 : INTEGER := 999;
        VARIABLE oline : line;
    BEGIN
        FOR K IN 0 TO 4 LOOP
            FOR i IN 0 TO 9 LOOP
                FOR j IN 0 TO 7 LOOP
                    uniform(seed1, seed2, r);
                    arr(i, j) := INTEGER(round(r * real(100 + 1) + real(0) - 0.5));
                    write(oline, "i: " & to_string(i) & ", " & "j: " & to_string(j));
                    writeline(OUTPUT, oline);
                END LOOP;
            END LOOP;
            test_array <= arr;
            WAIT FOR interval;
        END LOOP;
        WAIT;
    END PROCESS;

    MONITOR :
    PROCESS (test_array)
        VARIABLE oline : line;
        VARIABLE element : MATRIX_ELEMENT;
        VARIABLE value_proc, x_proc, y_proc : NATURAL;
    BEGIN
        FOR i IN 0 TO 9 LOOP
            write(oline, to_string(test_array(i, 0)) & to_string(test_array(i, 1)) & to_string(test_array(i, 2)) & to_string(test_array(i, 3)) & to_string(test_array(i, 4)) & to_string(test_array(i, 5)) & to_string(test_array(i, 6)) & to_string(test_array(i, 7)));
            writeline(OUTPUT, oline);
        END LOOP;

        element := findElementFunc(test_array, 10, column);
        write(oline, "Max element: " & INTEGER'image(element(0)) & " at: (" & INTEGER'image(element(1)) & ", " & INTEGER'image(element(2)) & ")");
        writeline(OUTPUT, oline);
        writeline(OUTPUT, oline);
        el_f <= element(0);
        y_f <= element(1);

        findElementProc(test_array, value_proc, y_proc, 10, column);
        el_p <= value_proc;
        y_p <= y_proc;
    END PROCESS;
END MainBehavior;