LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NAOA2 IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NAOA2;

ARCHITECTURE NAOA2_arch OF NAOA2 IS
BEGIN
	y <= NOT (a AND (b OR (c AND d))) AFTER 4 ns;
END NAOA2_arch;