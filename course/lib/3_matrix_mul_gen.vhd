LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;
LIBRARY STD;
USE std.textio.ALL;
LIBRARY work;
USE work.utils_package.ALL;
USE work.matrix_package.ALL;
USE work.processors_package.ALL;

ENTITY MatrixMulGen IS
    GENERIC (N : POSITIVE := M_SIZE);
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN MATRIX(1 TO N, 1 TO N);
        b : IN MATRIX(1 TO N, 1 TO N);
        ready : INOUT STD_LOGIC;
        c : OUT RESULT_MATRIX(1 TO N, 1 TO N));
END MatrixMulGen;

ARCHITECTURE MatrixMulGenArch OF MatrixMulGen IS
    SIGNAL a_inner : MATRIX(1 TO N, 1 TO N);
    SIGNAL b_inner : MATRIX(1 TO N, 1 TO N);
    SIGNAL c_result : RESULT_MATRIX(1 TO N, 1 TO N);
    SIGNAL counter_expired : BOOLEAN := FALSE;
    SIGNAL counter : STD_LOGIC_VECTOR(INTEGER(ceil(log2(real(3 * N - 1)))) DOWNTO 0) := (OTHERS => '0');
BEGIN

    ready_observer : PROCESS (R, clk, counter)
    BEGIN
        IF (R = '1') THEN
            ready <= '1';
            counter_expired <= FALSE;
        ELSE
            counter_expired <= unsigned(counter) = 3 * N - 1;
            IF rising_edge(clk) THEN
                IF (counter_expired) THEN
                    ready <= '1';
                ELSE
                    --REPORT "count: " & INTEGER'image(counter);
                    counter <= STD_LOGIC_VECTOR(unsigned(counter) + 1);
                    --matrix_to_string(a_inner, M_SIZE, M_SIZE);
                    --matrix_to_string(b_inner, M_SIZE, M_SIZE);
                    ready <= '0';
                END IF;
            END IF;
        END IF;
    END PROCESS;

    GEN_SHIFT_FIRST : FOR I IN N DOWNTO 1 GENERATE
        PROCESS (counter)
            VARIABLE tmp : INTEGER;
        BEGIN
            tmp := to_integer(unsigned(counter)) - I + 1;
            IF (tmp > 0 AND tmp <= N) THEN
                A_inner(I, 1) <= A(I, tmp);
                B_inner(1, I) <= B(tmp, I);
            ELSE
                A_inner(I, 1) <= (OTHERS => '0');
                B_inner(1, I) <= (OTHERS => '0');
            END IF;
        END PROCESS;
    END GENERATE GEN_SHIFT_FIRST;

    GEN_RESULT_ROWS : FOR I IN N DOWNTO 1 GENERATE
        GEN_RESULT_COLUMNS : FOR J IN N DOWNTO 1 GENERATE
            PROCESS (counter_expired, c_result)
            BEGIN
                IF (counter_expired) THEN
                    c(I, J) <= c_result(I, J);
                ELSE
                    c(I, J) <= (OTHERS => '0');
                END IF;
            END PROCESS;
        END GENERATE GEN_RESULT_COLUMNS;
    END GENERATE GEN_RESULT_ROWS;

    GEN_PROC_ROWS : FOR I IN 1 TO N - 1 GENERATE -- row--
        GEN_PROC_COLUMNS : FOR J IN 1 TO N - 1 GENERATE -- column
            pI : MatrixProc PORT MAP(
                R => R,
                clk => clk,
                a => A_inner(I, J),
                b => B_inner(I, J),
                a_out => A_inner(I, J + 1),
                b_out => B_inner(I + 1, J),
                c => c_result(I, J));
        END GENERATE GEN_PROC_COLUMNS;

        pA : MatrixProc GENERIC MAP(use_a_out => FALSE)
        PORT MAP(
            R => R,
            clk => clk,
            a => A_inner(I, N),
            b => B_inner(I, N),
            b_out => B_inner(I + 1, N),
            c => c_result(I, N));

        pB : MatrixProc GENERIC MAP(use_B_out => FALSE)
        PORT MAP(
            R => R,
            clk => clk,
            a => A_inner(N, I),
            b => B_inner(N, I),
            a_out => A_inner(N, I + 1),
            c => c_result(N, I));
    END GENERATE GEN_PROC_ROWS;

    pL : MatrixProc GENERIC MAP(use_A_out => FALSE, use_B_out => FALSE)
    PORT MAP(
        R => R,
        clk => clk,
        a => A_inner(N, N),
        b => B_inner(N, N),
        c => c_result(N, N));
END ARCHITECTURE MatrixMulGenArch;