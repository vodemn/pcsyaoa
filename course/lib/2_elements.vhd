LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY work;
USE work.utils_package.ALL;

PACKAGE processors_package IS
    COMPONENT MatrixProc IS
        GENERIC (
            use_a_out : BOOLEAN := TRUE;
            use_b_out : BOOLEAN := TRUE);
        PORT (
            R, clk : IN STD_LOGIC;
            a : IN INTEGER := 0;
            b : IN INTEGER := 0;
            a_out : OUT INTEGER := 0;
            b_out : OUT INTEGER := 0;
            c : INOUT INTEGER := 0);
    END COMPONENT;

END PACKAGE processors_package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY work;
USE work.utils_package.ALL;

ENTITY MatrixProc IS
    GENERIC (
        use_a_out : BOOLEAN := TRUE;
        use_b_out : BOOLEAN := TRUE);
    PORT (
        R, clk : IN STD_LOGIC;
        a : IN INTEGER := 0;
        b : IN INTEGER := 0;
        a_out : OUT INTEGER := 0;
        b_out : OUT INTEGER := 0;
        c : INOUT INTEGER := 0);
END MatrixProc;

ARCHITECTURE MatrixProcArch OF MatrixProc IS
BEGIN

    PROCESS (R, clk)
    BEGIN
        IF (R = '1') THEN
            c <= 0;
        ELSE
            IF rising_edge(clk) THEN
                IF (use_A_out) THEN
                    a_out <= a;
                END IF;
                IF (use_b_out) THEN
                    b_out <= b;
                END IF;
                c <= c + a * b;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE MatrixProcArch;
