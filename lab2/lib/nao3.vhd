LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NAO3 IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NAO3;

ARCHITECTURE NAO3_arch OF NAO3 IS
BEGIN
	y <= NOT (a AND (b OR c OR d)) AFTER 5 ns;
END NAO3_arch;