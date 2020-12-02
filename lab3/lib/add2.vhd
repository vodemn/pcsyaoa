LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY add2 IS
    PORT (
        c1, a2, b2 : IN STD_LOGIC;
        p2, p3 : OUT STD_LOGIC);
END add2;
ARCHITECTURE struct_1 OF add2 IS
BEGIN
    p2 <= ((NOT c1) AND (NOT a2) AND b2) OR
        ((NOT c1) AND a2 AND (NOT b2)) OR
        (c1 AND (NOT a2) AND (NOT b2)) OR
        (a2 AND b2 AND c1);
    p3 <= (a2 AND c1) OR (b2 AND c1) OR (a2 AND b2);
END struct_1;