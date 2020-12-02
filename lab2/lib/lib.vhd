library ieee;
use ieee.std_logic_1164.all;

package lib_package is

    constant interval: TIME := 50 ns;

    component N is
        port (a : in std_logic; y : out std_logic);
    end component N;

    component NA3 is
        port (a, b, c : in std_logic; y : out std_logic);
    end component NA3;

    component NA3O2 is
        port (a, b, c, d : in std_logic; y : out std_logic);
    end component NA3O2;

    component NAO3 is
        port (a, b, c, d : in std_logic; y : out std_logic);
    end component NAO3;

    component NAOA2 is
        port (a, b, c, d : in std_logic; y : out std_logic);
    end component NAOA2;

    component NOAO2 is
        port (a, b, c, d : in std_logic; y : out std_logic);
    end component NOAO2;

    component NEX2 is
        port (a, b : in std_logic; y : out std_logic);
    end component NEX2;

    component NO2 is
        port (a, b : in std_logic; y : out std_logic);
    end component NO2;

    component NO4 is
        port (a, b, c, d : in std_logic; y : out std_logic);
    end component NO4;

end package lib_package;
