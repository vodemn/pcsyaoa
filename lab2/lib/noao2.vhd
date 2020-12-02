LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOAO2 IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NOAO2;

ARCHITECTURE NOAO2_arch OF NOAO2 IS
BEGIN
	y <= NOT (a OR (b AND (c OR d))) AFTER 4 ns;
END NOAO2_arch;