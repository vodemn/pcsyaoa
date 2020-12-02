LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.matrix_package.ALL;

ENTITY MatrixTest IS
END MatrixTest;

ARCHITECTURE MatrixTestArch OF MatrixTest IS

    COMPONENT MatrixMul88 IS
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
            b : IN MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
            ready : OUT STD_LOGIC;
            c : OUT MATRIX(1 TO M_SIZE, 1 TO M_SIZE));
    END COMPONENT;

    CONSTANT clk_period : TIME := 20 ns;

    SIGNAL clk : STD_LOGIC;
    SIGNAL a : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ((37, 43, 51, 41), (33, 11, 69, 9), (64, 0, 24, 26), (19, 90, 39, 76));
    SIGNAL b : MATRIX(1 TO M_SIZE, 1 TO M_SIZE) := ((15, 25, 25, 26), (6, 39, 26, 0), (37, 82, 87, 79), (43, 36, 54, 39));
    SIGNAL c : MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
    SIGNAL ready : STD_LOGIC;

BEGIN
    portm : MatrixMul88 PORT MAP('0', clk, a, b, ready, c);

    clk_process : PROCESS
    BEGIN
        FOR i IN 1 TO 56 LOOP
            clk <= '1';
            WAIT FOR clk_period/2;
            clk <= '0';
            WAIT FOR clk_period/2;
        END LOOP;
        WAIT;
    END PROCESS;

END ARCHITECTURE MatrixTestArch;