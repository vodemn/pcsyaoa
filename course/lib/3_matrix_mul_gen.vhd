LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY STD;
USE std.textio.ALL;
LIBRARY work;
USE work.matrix_package.ALL;
USE work.processors_package.ALL;

ENTITY MatrixMulGen IS
    GENERIC (N : POSITIVE := 2);
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN MATRIX(1 TO N, 1 TO N);
        b : IN MATRIX(1 TO N, 1 TO N);
        ready : OUT STD_LOGIC;
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

    SIGNAL a_inner : MATRIX(1 TO N, 1 TO N);
    SIGNAL b_inner : MATRIX(1 TO N, 1 TO N);

    SIGNAL c_result : MATRIX(1 TO N, 1 TO N) := (OTHERS => (OTHERS => 0));
    SIGNAL counter : INTEGER := 1;
BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            ready <= '0';
            counter <= 0;
        ELSE
            IF (counter < N) THEN
                ready <= '0';
                IF rising_edge(clk) THEN
                    counter <= counter + 1;
--                    FOR I IN 1 TO N LOOP
--                        IF NOT (I > counter) THEN
--                            A_inner(I, 1) <= A(I, counter - I + 1);
--                            B_inner(1, I) <= B(counter - I + 1, I);
--                        END IF;
--                   END LOOP;
                END IF;
            ELSE
                ready <= '1';
                counter <= 0;
            END IF;
        END IF;
    END PROCESS;

    GEN_PROC_ROWS : FOR I IN 1 TO N - 1 GENERATE -- row

        PROCESS (counter)
        BEGIN
            IF NOT (I > counter) THEN
                A_inner(I, 1) <= A(I, counter - I + 1);
                B_inner(1, I) <= B(counter - I + 1, I);
            END IF;
        END PROCESS;

        GEN_PROC_COLUMNS : FOR J IN 1 TO N - 1 GENERATE -- column
            pI : MatrixProcInner PORT MAP(R, clk, A_inner(I, J), B_inner(I, J), A_inner(I, J + 1), B_inner(I + 1, J), c_result(I, J));
        END GENERATE GEN_PROC_COLUMNS;

        pA : MatrixProcVertEdge PORT MAP(R, clk, A_inner(I, N), B_inner(I, N), B_inner(I + 1, N), c_result(I, N));
        pB : MatrixProcHorEdge PORT MAP(R, clk, A_inner(N, I), B_inner(N, I), A_inner(N, I + 1), c_result(N, I));
    END GENERATE GEN_PROC_ROWS;

    pL : MatrixProcCorner PORT MAP(R, clk, A_inner(N, N), B_inner(N, N), c_result(N, N));

END ARCHITECTURE MatrixMulGenArch;