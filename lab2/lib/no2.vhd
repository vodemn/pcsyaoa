LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NO2 IS
	PORT (
		a, b : IN std_logic;
		y : OUT std_logic);
END NO2;

ARCHITECTURE NO2_arch OF NO2 IS
BEGIN
	y <= NOT (a OR b) AFTER 3 ns;
END NO2_arch;