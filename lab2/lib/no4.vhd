LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NO4 IS
	PORT (
		a, b, c, d : IN std_logic;
		y : OUT std_logic);
END NO4;

ARCHITECTURE NO4_arch OF NO4 IS
BEGIN
	y <= NOT (a OR b OR c OR d) AFTER 5 ns;
END NO4_arch;