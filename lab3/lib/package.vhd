LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE lib_package IS

    CONSTANT interval : TIME := 50 ns;

    COMPONENT adder_2 IS
        PORT (
            a2, a1 : IN STD_LOGIC;
            b : IN STD_LOGIC_VECTOR(2 DOWNTO 1);
            p : OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
    END COMPONENT adder_2;

    COMPONENT adder_2s IS
        PORT (
            a2, a1 : IN STD_LOGIC;
            s : IN STD_LOGIC;
            p : OUT STD_LOGIC_VECTOR(3 DOWNTO 1));
    END COMPONENT adder_2s;

END PACKAGE lib_package;