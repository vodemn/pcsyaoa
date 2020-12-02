LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.lib_package.ALL;

ENTITY SchemeModelGen IS
    GENERIC (N : POSITIVE := 4);
    PORT (
        x : IN STD_LOGIC_VECTOR(1 TO 4 * N);
        y : OUT STD_LOGIC_VECTOR(1 TO 3 * N);
        p : OUT STD_LOGIC_VECTOR(0 TO 1));
END SchemeModelGen;

ARCHITECTURE SchemeArch OF SchemeModelGen IS
    SIGNAL adder1_out : STD_LOGIC_VECTOR(1 TO 3 * N);
    SIGNAL adder2_out : STD_LOGIC_VECTOR(1 TO 3 * N);
BEGIN

    GEN_ADD : FOR I IN 0 TO N - 1 GENERATE

        LOWER_BIT : IF I = 0 GENERATE
            U11 : adder_2 PORT MAP(x(1), '0', x(2 TO 3), adder1_out(1 to 3));
            U12 : adder_2s PORT MAP('0', x(4), adder1_out(2), adder2_out(1 to 3));
        END GENERATE LOWER_BIT;

        UPPER_BITS : IF I > 0 GENERATE
            U11 : adder_2 PORT MAP(x(I * 4 + 1), adder1_out((I - 1) * 3 + 1), x(I * 4 + 2 TO I * 4 + 3), adder1_out(I * 3 + 1 to I * 3 + 3));
            U12 : adder_2s PORT MAP(adder2_out((I - 1) * 3 + 1), x(I * 4 + 4), adder1_out(I * 3 + 2), adder2_out(I * 3 + 1 to I * 3 + 3));
        END GENERATE UPPER_BITS;

        y(I * 3 + 1 TO I * 3 + 3) <= (adder1_out(I * 3 + 3), adder2_out(I * 3 + 2), adder2_out(I * 3 + 3));

    END GENERATE GEN_ADD;

    p <= (adder1_out((N - 1) * 3 + 1), adder2_out((N - 1) * 3 + 1));

END ARCHITECTURE SchemeArch;