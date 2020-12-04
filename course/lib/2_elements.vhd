LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY work;
USE work.utils_package.ALL;

PACKAGE processors_package IS
    COMPONENT MatrixProc IS
        GENERIC (
            use_a_out : BOOLEAN := TRUE;
            use_b_out : BOOLEAN := TRUE);
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
            b : IN STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
            a_out : OUT STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
            b_out : OUT STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
            c : INOUT STD_LOGIC_VECTOR(RESULT_SIZE DOWNTO 0) := (OTHERS => '0'));
    END COMPONENT;

END PACKAGE processors_package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY work;
USE work.utils_package.ALL;

ENTITY MatrixProc IS
    GENERIC (
        use_a_out : BOOLEAN := TRUE;
        use_b_out : BOOLEAN := TRUE);
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
        b : IN STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
        a_out : OUT STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
        b_out : OUT STD_LOGIC_VECTOR(EL_SIZE DOWNTO 0) := (OTHERS => '0');
        c : INOUT STD_LOGIC_VECTOR(RESULT_SIZE DOWNTO 0) := (OTHERS => '0'));
END MatrixProc;

ARCHITECTURE MatrixProcArch OF MatrixProc IS
BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            c <= (OTHERS => '0');
        ELSE
            IF rising_edge(clk) THEN
                IF (use_A_out) THEN
                    a_out <= a;
                END IF;
                IF (use_b_out) THEN
                    b_out <= b;
                END IF;
                c <= STD_LOGIC_VECTOR(unsigned(C) + unsigned(A) * unsigned(B));
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcArch;

--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;
--LIBRARY work;
--USE work.utils_package.ALL;--

--ENTITY ProcMultiplier IS
--    GENERIC (
--        N : INTEGER := EL_SIZE);
--    PORT (
--        R, clk : IN STD_LOGIC;
--        mt : IN STD_LOGIC_VECTOR(N DOWNTO 1) := (OTHERS => '0'); --mt
--        mn : IN STD_LOGIC_VECTOR(N DOWNTO 1) := (OTHERS => '0'); --mn
--        ready : OUT STD_LOGIC;
--        c : OUT STD_LOGIC_VECTOR(N * 2 DOWNTO 1) := (OTHERS => '0'));
--END ProcMultiplier;--

--ARCHITECTURE ProcMultiplierArch OF ProcMultiplier IS
--    SIGNAL result : STD_LOGIC_VECTOR(N * 2 DOWNTO 1) := (OTHERS => '0');
--    SIGNAL counter : INTEGER := 0;
--BEGIN--

--    PROCESS (R, clk)
--    BEGIN
--        IF (R = '1') THEN
--            c <= (OTHERS => '0');
--        ELSE
--            IF rising_edge(clk) AND counter < N THEN
--                counter <= counter + 1;
--                result <= shift_left(signed(result), 1);
--                IF (mt(N) = '1') THEN
--                    result <= STD_LOGIC_VECTOR(unsigned(pr_in1) + unsigned(pr_in2)) AFTER clk_period;
--                END IF;
--                ready <= counter = N;
--            END IF;
--        END IF;
--    END PROCESS;--

--END ARCHITECTURE ProcMultiplierArch;