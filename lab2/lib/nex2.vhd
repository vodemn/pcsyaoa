LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NEX2 IS
	PORT (
		a, b : IN std_logic;
		y : OUT std_logic);
END NEX2;

ARCHITECTURE NEX2_arch OF NEX2 IS
BEGIN
	y <= (a AND b) OR ((NOT a) AND (NOT b)) AFTER 5 ns;
END NEX2_arch;