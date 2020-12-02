LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.lib_package.ALL;

ENTITY SchemeModel IS
    PORT (
        x1 : IN STD_LOGIC_VECTOR(1 TO 4);
        x2 : IN STD_LOGIC_VECTOR(1 TO 4);
        x3 : IN STD_LOGIC_VECTOR(1 TO 4);
        x4 : IN STD_LOGIC_VECTOR(1 TO 4);
        y1 : OUT STD_LOGIC_VECTOR(1 TO 3);
        y2 : OUT STD_LOGIC_VECTOR(1 TO 3);
        y3 : OUT STD_LOGIC_VECTOR(1 TO 3);
        y4 : OUT STD_LOGIC_VECTOR(1 TO 3);
        p : OUT STD_LOGIC_VECTOR(0 TO 1));
END SchemeModel;

ARCHITECTURE SchemeArch OF SchemeModel IS

    SIGNAL adder1_1_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder1_2_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder1_3_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder1_4_out : STD_LOGIC_VECTOR(1 TO 3);

    SIGNAL adder2_1_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder2_2_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder2_3_out : STD_LOGIC_VECTOR(1 TO 3);
    SIGNAL adder2_4_out : STD_LOGIC_VECTOR(1 TO 3);

BEGIN
    adder1_1 : adder_2 PORT MAP(x1(1), '0', x1(2 TO 3), adder1_1_out);
    adder1_2 : adder_2 PORT MAP(x2(1), adder1_1_out(1), x2(2 TO 3), adder1_2_out);
    adder1_3 : adder_2 PORT MAP(x3(1), adder1_2_out(1), x3(2 TO 3), adder1_3_out);
    adder1_4 : adder_2 PORT MAP(x4(1), adder1_3_out(1), x4(2 TO 3), adder1_4_out);

    adder2_1 : adder_2s PORT MAP('0', x1(4), adder1_1_out(2), adder2_1_out);
    adder2_2 : adder_2s PORT MAP(adder2_1_out(1), x2(4), adder1_2_out(2), adder2_2_out);
    adder2_3 : adder_2s PORT MAP(adder2_2_out(1), x3(4), adder1_3_out(2), adder2_3_out);
    adder2_4 : adder_2s PORT MAP(adder2_3_out(1), x4(4), adder1_4_out(2), adder2_4_out);

    y1 <= (adder1_1_out(3), adder2_1_out(2), adder2_1_out(3));
    y2 <= (adder1_2_out(3), adder2_2_out(2), adder2_2_out(3));
    y3 <= (adder1_3_out(3), adder2_3_out(2), adder2_3_out(3));
    y4 <= (adder1_4_out(3), adder2_4_out(2), adder2_4_out(3));
    p <= (adder1_4_out(1), adder2_4_out(1));
END ARCHITECTURE SchemeArch;