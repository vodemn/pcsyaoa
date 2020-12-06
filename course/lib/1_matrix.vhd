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
END PACKAGE matrix_package;
