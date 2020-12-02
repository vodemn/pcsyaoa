LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE matrix_package IS
    -- positive [1; n]
    -- matrix (y - row, x - column)
    TYPE matrix IS ARRAY (POSITIVE RANGE <>, POSITIVE RANGE <>) OF INTEGER;

    constant M_SIZE : INTEGER := 4;

END PACKAGE matrix_package;
