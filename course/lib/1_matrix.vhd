LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY std;
USE std.textio.ALL;
LIBRARY work;
USE work.utils_package.ALL;

PACKAGE matrix_package IS
    -- positive [1; n]
    -- matrix (y - row, x - column)
    TYPE matrix IS ARRAY (POSITIVE RANGE <>, POSITIVE RANGE <>) 
        OF STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0);
    TYPE result_matrix IS ARRAY (POSITIVE RANGE <>, POSITIVE RANGE <>) 
        OF STD_LOGIC_VECTOR(RESULT_SIZE DOWNTO 0);
    PROCEDURE matrix_to_String (m : MATRIX; rows : INTEGER; columns : INTEGER);
    PROCEDURE result_matrix_to_String (m : result_MATRIX; rows : INTEGER; columns : INTEGER);

END PACKAGE matrix_package;

PACKAGE BODY matrix_package IS

    PROCEDURE matrix_to_String (m : MATRIX; rows : INTEGER; columns : INTEGER) IS
        VARIABLE oline : line;
        VARIABLE str : STRING(1 TO columns * 4);
    BEGIN
        FOR i IN 1 TO rows LOOP -- rows
            FOR j IN 1 TO columns LOOP -- columns
                str((J - 1) * 4 + 1 TO (J - 1) * 4 + 4) := to_string(m(i, j));
            END LOOP;
            write(oline, str);
            writeline(OUTPUT, oline);
        END LOOP;
        writeline(OUTPUT, oline);
    END PROCEDURE matrix_to_String;

    PROCEDURE result_matrix_to_String (m : result_MATRIX; rows : INTEGER; columns : INTEGER) IS
        VARIABLE oline : line;
        VARIABLE str : STRING(1 TO columns * 4);
    BEGIN
        FOR i IN 1 TO rows LOOP -- rows
            FOR j IN 1 TO columns LOOP -- columns
                str((J - 1) * 4 + 1 TO (J - 1) * 4 + 4) := to_string(m(i, j));
            END LOOP;
            write(oline, str);
            writeline(OUTPUT, oline);
        END LOOP;
        writeline(OUTPUT, oline);
    END PROCEDURE result_matrix_to_String;

END PACKAGE BODY matrix_package;