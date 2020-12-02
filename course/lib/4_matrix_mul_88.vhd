LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.matrix_package.ALL;

ENTITY MatrixMul88 IS
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
        b : IN MATRIX(1 TO M_SIZE, 1 TO M_SIZE);
        ready : OUT STD_LOGIC;
        c : OUT MATRIX(1 TO M_SIZE, 1 TO M_SIZE));
END MatrixMul88;

ARCHITECTURE MatrixMul88Arch OF MatrixMul88 IS

    COMPONENT MatrixMulGen IS
        GENERIC (N : POSITIVE := M_SIZE);
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN MATRIX(1 TO N, 1 TO N);
            b : IN MATRIX(1 TO N, 1 TO N);
            ready : OUT STD_LOGIC;
            c : OUT MATRIX(1 TO N, 1 TO N));
    END COMPONENT;

BEGIN
    portm : MatrixMulGen GENERIC MAP(N => M_SIZE) PORT MAP(R, clk, a, b, ready, c);
END ARCHITECTURE MatrixMul88Arch;