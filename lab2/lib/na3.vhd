LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NA3 IS
	PORT (
		a, b, c : IN std_logic;
		y : OUT std_logic);
END NA3;

ARCHITECTURE NA3_arch OF NA3 IS
BEGIN
	y <= NOT (a AND b AND c) AFTER 3 ns;
END NA3_arch;