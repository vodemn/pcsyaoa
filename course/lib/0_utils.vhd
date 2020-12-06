LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
LIBRARY std;
USE std.textio.ALL;

PACKAGE utils_package IS
    CONSTANT clk_period : TIME := 20 ns;
    CONSTANT EL_BITS : INTEGER := 4;
    CONSTANT EL_SIZE : INTEGER := EL_BITS - 1;
    CONSTANT RESULT_SIZE : INTEGER := EL_BITS * 2 - 1;
    CONSTANT M_SIZE : INTEGER := 4;
END PACKAGE utils_package;
