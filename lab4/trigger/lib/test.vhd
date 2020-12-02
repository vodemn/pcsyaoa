LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE std.env.ALL;
USE work.lib_package.ALL;

ENTITY TEST_BENCH IS
END TEST_BENCH;

ARCHITECTURE MainBehavior OF TEST_BENCH IS

    COMPONENT TriggerScheme IS
        PORT (
            R, S, C : IN STD_LOGIC;
            Q : INOUT STD_LOGIC);
    END COMPONENT TriggerScheme;

    COMPONENT TriggerAlgorithm IS
        PORT (
            R, S, C : IN STD_LOGIC;
            Q : INOUT STD_LOGIC);
    END COMPONENT TriggerAlgorithm;

    SIGNAL r_test : STD_LOGIC;
    SIGNAL S_test : STD_LOGIC;
    SIGNAL c_test : STD_LOGIC;
    SIGNAL q_scheme : STD_LOGIC;
    SIGNAL q_alg : STD_LOGIC;

BEGIN
    p1 : TriggerScheme PORT MAP(r_test, S_test, c_test, q_scheme);
    p2 : TriggerAlgorithm PORT MAP(r_test, S_test, c_test, q_alg);

    PROCESS IS
    BEGIN
        r_test <= '1';
        WAIT FOR interval * 2;
        r_test <= '0';
        WAIT;
    END PROCESS;

    PROCESS IS
    BEGIN
        S_test <= '0';
        WAIT FOR interval;
        S_test <= '1';
        WAIT FOR interval * 4;
        S_test <= '0';
        WAIT;
    END PROCESS;

    PROCESS IS
    BEGIN
        c_test <= '0';
        WAIT FOR interval;
        c_test <= '1';
        WAIT FOR interval;
    END PROCESS;

    PROCESS IS
        VARIABLE count : INTEGER := 8;
    BEGIN
        IF count < 1 THEN
            stop;
        ELSE
            count := count - 1;
            report integer'image(count);
            WAIT FOR interval;
        END IF;
    END PROCESS;

END MainBehavior;