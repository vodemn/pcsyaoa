LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE lib_package IS

    CONSTANT interval : TIME := 50 ns;

    COMPONENT N IS
        PORT (
            a : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT N;

    COMPONENT NAO IS
        PORT (
            a, b, c : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NAO;

    COMPONENT NOAA IS
        PORT (
            a, b, c, d : IN STD_LOGIC;
            y : OUT STD_LOGIC);
    END COMPONENT NOAA;

END PACKAGE lib_package;