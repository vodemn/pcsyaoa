LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.lib_package.ALL;

ENTITY SchemeModel IS
	PORT (
		x : IN std_logic_vector(0 TO 3);
		y : OUT std_logic_vector(0 TO 3));
END SchemeModel;

ARCHITECTURE SchemeArch OF SchemeModel IS

	SIGNAL Level_0 : std_logic;
	SIGNAL Level_1 : std_logic_vector(0 TO 2);
	SIGNAL Level_2 : std_logic_vector(0 TO 3);
	SIGNAL Level_3 : std_logic_vector(0 TO 5);
	SIGNAL Level_4 : std_logic_vector(0 TO 2);

BEGIN
	Nex : NEX2 PORT MAP(a => x(0), b => x(3), y => Level_0);

	Inv_11 		: N PORT MAP(a => Level_4(0), y => Level_1(0));
	Inv_12		: N PORT MAP(a => x(1), y => Level_1(1));
	Inv_13		: N PORT MAP(a => Level_0, y => Level_1(2));

	Inv_21		: N PORT MAP(a => Level_1(2), y => Level_2(0));
	Na3_21		: NA3 PORT MAP(a => Level_1(1), b => x(3), c => x(0), y => Level_2(1));
	Inv_22		: N PORT MAP(a => Level_1(0), y => Level_2(2));
	Inv_23		: N PORT MAP(a => x(2), y => Level_2(3));

	Inv_31		: N PORT MAP(a => Level_1(2), y => Level_3(0));
	Na3o2_31 	: NA3O2 PORT MAP(a => Level_2(3), b => Level_2(0), c => x(1), d => x(0), y => Level_3(1));
	Noao2_31 	: NOAO2 PORT MAP(a => Level_2(3), b => Level_2(1), c => x(0), d => Level_1(1), y => Level_3(2));
	No2_31 		: NO2 PORT MAP(a => x(0), b => x(3), y => Level_3(3));
	Inv_32 		: N PORT MAP(a => Level_1(0), y => Level_3(4));
	Naoa2_31 	: NAOA2 PORT MAP(a => x(1), b => Level_2(2), c => Level_2(3), d => x(3), y => Level_3(5));

	Nao3_41 	: NAO3 PORT MAP(a => Level_3(1), b => Level_3(0), c => Level_2(3), d => x(1), y => Level_4(0));
	Nao3_42 	: NAOA2 PORT MAP(a => Level_3(5), b => Level_3(2), c => Level_2(3), d => x(3), y => Level_4(1));
	No4_41 			: NO4 PORT MAP(a => x(2), b => x(1), c => Level_3(4), d => Level_3(3), y => Level_4(2));

	y(0) <= Level_4(0);
	y(1) <= Level_3(2);
	y(2) <= Level_4(2);
	y(3) <= Level_4(1);
END ARCHITECTURE SchemeArch;