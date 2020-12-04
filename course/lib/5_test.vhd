LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.matrix_package.ALL;
USE work.utils_package.ALL;

ENTITY MatrixTest IS
END MatrixTest;

ARCHITECTURE MatrixTestArch OF MatrixTest IS

    COMPONENT MatrixMulGen IS
        GENERIC (N : POSITIVE := M_SIZE);
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN MATRIX(1 TO N, 1 TO N);
            b : IN MATRIX(1 TO N, 1 TO N);
            ready : INOUT STD_LOGIC;
            c : OUT RESULT_MATRIX(1 TO N, 1 TO N));
    END COMPONENT;
    SIGNAL R : STD_LOGIC := '1';
    SIGNAL clk : STD_LOGIC := '1';
    SIGNAL a : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := (
        ("0110", "1000", "0011", "0111"),
        ("1001", "0101", "1001", "0001"),
        ("0100", "0010", "0110", "1010"),
        ("0001", "0001", "0100", "0101")
    );
    SIGNAL b : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := (
        ("0110", "0010", "0010", "0010"),
        ("0100", "1000", "0011", "0101"),
        ("1010", "1001", "0101", "1000"),
        ("1010", "0011", "0010", "1010")
    );
    SIGNAL c : RESULT_MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := (
        ((OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0')),
        ((OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0')),
        ((OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0')),
        ((OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0'))
    );
    SIGNAL ready : STD_LOGIC := '0';

BEGIN
    portm : MatrixMulGen PORT MAP(R, clk, a, b, ready, c);

    R_process : PROCESS
    BEGIN
        R <= '1';
        WAIT FOR clk_period;
        R <= '0';
        WAIT;
    END PROCESS;

    clk_process : PROCESS
    BEGIN
        clk <= not clk after clk_period / 2;
    END PROCESS;

END ARCHITECTURE MatrixTestArch;