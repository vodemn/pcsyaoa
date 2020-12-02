LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY add1 IS
    PORT (
        a1, b1 : IN STD_LOGIC;
        c1, p1 : OUT STD_LOGIC);
END add1;

ARCHITECTURE struct_1 OF add1 IS
BEGIN
    p1 <= ((a1 AND (NOT b1)) OR ((NOT a1) AND b1));
    c1 <= a1 AND b1;
END struct_1;