LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY N IS
	PORT (
		a : IN std_logic;
		y : OUT std_logic);
END N;

ARCHITECTURE N_arch OF N IS
BEGIN
	y <= NOT a AFTER 2 ns;
END N_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NAO IS
	PORT (
		a, b, c : IN std_logic;
		y : OUT std_logic);
END NAO;

ARCHITECTURE NAO_arch OF NAO IS
BEGIN
	y <= NOT ((a or b) and c) after 4 ns;
END NAO_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOAA IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NOAA;

ARCHITECTURE NOAA_arch OF NOAA IS
BEGIN
	y <= NOT ((a and b) or (c and d)) after 5 ns;
END NOAA_arch;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TriggerScheme IS
    PORT (
        R, S, C : IN STD_LOGIC;
        Q : INOUT STD_LOGIC);
END TriggerScheme;

ARCHITECTURE SchemeArch OF TriggerScheme IS

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

    SIGNAL x : STD_LOGIC_VECTOR(9 DOWNTO 1);

BEGIN
    X9 : NOAA PORT MAP(x(1), x(5), x(2), x(4), x(9));
    X8 : N PORT MAP(R, x(8));
    X6 : N PORT MAP(x(3), Q);
    X5 : N PORT MAP(x(4), x(5));
    X4 : N PORT MAP(C, x(4));
    X3 : NAO PORT MAP(S, x(2), x(8), x(3));
    X2 : NOAA PORT MAP(x(3), x(4), x(1), x(5), x(2));
    X1 : NAO PORT MAP(S, x(9), x(8), x(1));
END ARCHITECTURE SchemeArch;