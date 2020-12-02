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