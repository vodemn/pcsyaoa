LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE std.textio.ALL;
USE std.env.ALL;
USE work.lib_package.ALL;

ENTITY scheme_test IS
END scheme_test;

ARCHITECTURE MainBehavior OF scheme_test IS
    COMPONENT SchemeModel IS
        PORT (
            x1 : IN STD_LOGIC_VECTOR(0 TO 3);
            x2 : IN STD_LOGIC_VECTOR(0 TO 3);
            x3 : IN STD_LOGIC_VECTOR(0 TO 3);
            x4 : IN STD_LOGIC_VECTOR(0 TO 3);
            y1 : OUT STD_LOGIC_VECTOR(0 TO 2);
            y2 : OUT STD_LOGIC_VECTOR(0 TO 2);
            y3 : OUT STD_LOGIC_VECTOR(0 TO 2);
            y4 : OUT STD_LOGIC_VECTOR(0 TO 2);
            p : OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT SchemeModel;

    COMPONENT SchemeModelGen IS
        GENERIC (N : POSITIVE := 4);
        PORT (
            x : IN STD_LOGIC_VECTOR(1 TO 4 * N);
            y : OUT STD_LOGIC_VECTOR(1 TO 3 * N);
            p : OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT SchemeModelGen;

    CONSTANT COUNT : INTEGER := 4;

    SIGNAL x1 : STD_LOGIC_VECTOR(1 TO 4) := (OTHERS => '0');
    SIGNAL x2 : STD_LOGIC_VECTOR(1 TO 4) := (OTHERS => '0');
    SIGNAL x3 : STD_LOGIC_VECTOR(1 TO 4) := (OTHERS => '0');
    SIGNAL x4 : STD_LOGIC_VECTOR(1 TO 4) := (OTHERS => '0');
    SIGNAL y1 : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL y2 : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL y3 : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL y4 : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL p : STD_LOGIC_VECTOR(0 TO 1);

    SIGNAL x_gen : STD_LOGIC_VECTOR(1 TO COUNT * 4);
    SIGNAL y_gen : STD_LOGIC_VECTOR(1 TO COUNT * 3);
    SIGNAL p_gen : STD_LOGIC_VECTOR(0 TO 1);

    SIGNAL y1_gen_diag : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL y2_gen_diag : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL y3_gen_diag : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL y4_gen_diag : STD_LOGIC_VECTOR(1 TO 3);

BEGIN
    portm1 : SchemeModel PORT MAP(x1, x2, x3, x4, y1, y2, y3, y4, p);
    portm2 : SchemeModelGen GENERIC MAP(N => 4) PORT MAP(x_gen, y_gen, p_gen);

    x1 <= NOT x1 AFTER interval;
    x2 <= NOT x2 AFTER interval * 2;
    x3 <= NOT x3 AFTER interval * 4;
    x4 <= NOT x4 AFTER interval * 8;

    x_gen(1 to 4) <= x1;
    x_gen(5 to 8) <= x2;
    x_gen(9 to 12) <= x3;
    x_gen(13 to 16) <= x4;
    
    y1_gen_diag <= y_gen(1 to 3);
    y2_gen_diag <= y_gen(4 to 6);
    y3_gen_diag <= y_gen(7 to 9);
    y4_gen_diag <= y_gen(10 to 12);

    PROCESS IS
        VARIABLE count : INTEGER := 0;
    BEGIN
        IF count > 16 THEN
            stop;
        ELSE
            WAIT FOR interval;
            count := count + 1;
        END IF;
    END PROCESS;
END MainBehavior;