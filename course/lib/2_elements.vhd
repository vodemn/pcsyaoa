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
                ELSE
                    a_out <= (OTHERS => '0');
                END IF;
                IF (use_b_out) THEN
                    b_out <= b;
                ELSE
                    b_out <= (OTHERS => '0');
                END IF;
                c <= STD_LOGIC_VECTOR(unsigned(C) + unsigned(A) * unsigned(B));
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcArch;
