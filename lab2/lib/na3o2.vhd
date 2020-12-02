LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NA3O2 IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NA3O2;

ARCHITECTURE NA3O2_arch OF NA3O2 IS
BEGIN
	y <= NOT (a AND b AND (c OR d)) AFTER 4 ns;
END NA3O2_arch;