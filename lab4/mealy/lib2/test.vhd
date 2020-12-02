LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE std.env.ALL;
ENTITY SCHEME_TEST IS
END SCHEME_TEST;

ARCHITECTURE MainBehavior OF SCHEME_TEST IS

    COMPONENT Mealy IS
        PORT (
            clk, rst : IN STD_LOGIC;
            X : IN STD_LOGIC_VECTOR(1 TO 2);
            y : OUT STD_LOGIC_VECTOR(1 TO 3));
    END COMPONENT Mealy;

    SIGNAL clk : STD_LOGIC;
    SIGNAL rst : STD_LOGIC;
    SIGNAL X : STD_LOGIC_VECTOR(1 TO 2) := (OTHERS => '0');
    SIGNAL y : STD_LOGIC_VECTOR(1 TO 3);

    CONSTANT clk_period : TIME := 20 ns;

BEGIN
    p1 : Mealy PORT MAP(clk, rst, x, y);

    clk_process : PROCESS
    BEGIN
        clk <= '1';
        WAIT FOR clk_period/2;
        clk <= '0';
        WAIT FOR clk_period/2;
    END PROCESS;

    rst_process : PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR clk_period;
        rst <= '0';
        WAIT;
    END PROCESS;

    PROCESS IS
        VARIABLE count : INTEGER := 8;
        VARIABLE tmp : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        IF count < 0 THEN
            stop;
        ELSE
            tmp := STD_LOGIC_VECTOR(to_unsigned(count, 4));
            x <= tmp(1 DOWNTO 0);
            WAIT FOR clk_period;
            count := count - 1;
        END IF;
    END PROCESS;

END MainBehavior;