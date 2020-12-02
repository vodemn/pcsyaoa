LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.matrix_package.ALL;
USE work.utils_package.ALL;

ENTITY MatrixTest IS
END MatrixTest;

ARCHITECTURE MatrixTestArch OF MatrixTest IS

    COMPONENT MatrixMulGen IS
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
            b : IN MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
            ready : INOUT STD_LOGIC;
            c : OUT MATRIX(1 TO M_SIZE, 1 TO M_SIZE));
    END COMPONENT;
    SIGNAL R : STD_LOGIC;
    SIGNAL clk : STD_LOGIC;
    SIGNAL a : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ((6, 8, 3, 7), (9, 5, 9, 1), (4, 2, 6, 10), (1, 1, 4, 5));
    SIGNAL b : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ((6, 2, 2, 2), (4, 8, 3, 5), (10, 9, 5, 8), (10, 3, 2, 10));
    SIGNAL c : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := (OTHERS => (OTHERS => 0));
    SIGNAL ready : STD_LOGIC;

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
        FOR i IN 1 TO M_SIZE * M_SIZE LOOP
            clk <= '1';
            WAIT FOR clk_period/2;
            --matrix_to_string(c, M_SIZE, M_SIZE);
            clk <= '0';
            WAIT FOR clk_period/2;
        END LOOP;
        WAIT;
    END PROCESS;

END ARCHITECTURE MatrixTestArch;