LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY STD;
USE std.textio.ALL;
LIBRARY work;
USE work.matrix_package.ALL;
USE work.processors_package.ALL;

ENTITY MatrixMulGen IS
    GENERIC (N : POSITIVE := M_SIZE);
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN MATRIX(1 TO N, 1 TO N);
        b : IN MATRIX(1 TO N, 1 TO N);
        ready : INOUT STD_LOGIC;
        c : OUT MATRIX(1 TO N, 1 TO N));
END MatrixMulGen;

ARCHITECTURE MatrixMulGenArch OF MatrixMulGen IS
    -----------------------------------------------
    -- [a11][a12][a13] -> [ 0 ][ 0 ][a13][a12][a11]
    -- [a21][a22][a23] -> [ 0 ][a23][a22][a21][ 0 ]
    -- [a31][a32][a33] -> [a33][a32][a31][ 0 ][ 0 ]
    -----------------------------------------------
    --                    [ 0 ][ 0 ][b33]
    -- [b11][b12][b13] -> [ 0 ][b32][b23]
    -- [b21][b22][b23] -> [b31][b22][b13]
    -- [b31][b32][b33] -> [b21][b12][ 0 ]
    --                    [b11][ 0 ][ 0 ]
    -----------------------------------------------

    SIGNAL a_inner : MATRIX(1 TO N, 1 TO N) := (OTHERS => (OTHERS => 0));
    SIGNAL b_inner : MATRIX(1 TO N, 1 TO N) := (OTHERS => (OTHERS => 0));
    SIGNAL c_result : MATRIX(1 TO N, 1 TO N) := (OTHERS => (OTHERS => 0));
    SIGNAL counter : INTEGER := 0;
    SIGNAL canOperate : BOOLEAN := TRUE;
BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            counter <= 0;
            ready <= '1';
        END IF;

        canOperate <= R = '0' AND counter < 3 * N;

        IF (canOperate) THEN
            IF (counter < 3 * N) THEN
                IF rising_edge(clk) THEN
                    REPORT "count: " & INTEGER'image(counter);
                    counter <= counter + 1;
                    --matrix_to_string(a_inner, M_SIZE, M_SIZE);
                    matrix_to_string(b_inner, M_SIZE, M_SIZE);
                END IF;
            END IF;
            c <= c_result;
            ready <= '0';
        ELSE
            ready <= '1';
        END IF;
    END PROCESS;

    GEN_SHIFT_FIRST : FOR I IN N DOWNTO 1 GENERATE
        PROCESS (counter)
        BEGIN
            IF (counter >= 1) THEN
                IF ((counter - I) >= 0 AND (counter - I + 1) <= N) THEN
                    A_inner(I, 1) <= A(I, counter - I + 1);
                    B_inner(1, I) <= B(counter - I + 1, I);
                ELSE
                    A_inner(I, 1) <= 0;
                    B_inner(1, I) <= 0;
                END IF;
            END IF;
        END PROCESS;
    END GENERATE GEN_SHIFT_FIRST;

    GEN_PROC_ROWS : FOR I IN 1 TO N - 1 GENERATE -- row--
        GEN_PROC_COLUMNS : FOR J IN 1 TO N - 1 GENERATE -- column
            EDGE : IF J = 1 GENERATE
                pA : MatrixProc GENERIC MAP(use_a_out => FALSE) PORT MAP(R, clk, A_inner(I, N), B_inner(I, N), B_inner(I + 1, N), c_result(I, N));
                pB : MatrixProc GENERIC MAP(use_B_out => FALSE) PORT MAP(R, clk, A_inner(N, I), B_inner(N, I), A_inner(N, I + 1), c_result(N, I));
            END GENERATE EDGE;
            CORNER : IF I = N AND J = N GENERATE
                pL : MatrixProc GENERIC MAP(use_A_out => FALSE, use_B_out => FALSE) PORT MAP(R, clk, A_inner(N, N), B_inner(N, N), c_result(N, N));
            END GENERATE CORNER;
            INNER : IF I < N AND J < N GENERATE
                pI : MatrixProc PORT MAP(R, clk, A_inner(I, J), B_inner(I, J), A_inner(I, J + 1), B_inner(I + 1, J), c_result(I, J));
            END GENERATE INNER;
        END GENERATE GEN_PROC_COLUMNS;

        --pA : MatrixProc GENERIC MAP(use_a_out => FALSE) PORT MAP(R, clk, A_inner(I, N), B_inner(I, N), B_inner(I + 1, N), c_result(I, N));
        --pB : MatrixProc GENERIC MAP(use_B_out => FALSE) PORT MAP(R, clk, A_inner(N, I), B_inner(N, I), A_inner(N, I + 1), c_result(N, I));
    END GENERATE GEN_PROC_ROWS;

    --pL : MatrixProc GENERIC MAP(use_A_out => FALSE, use_B_out => FALSE) PORT MAP(R, clk, A_inner(N, N), B_inner(N, N), c_result(N, N));
END ARCHITECTURE MatrixMulGenArch;