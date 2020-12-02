LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TriggerAlgorithm IS
    PORT (
        R, S, C : IN STD_LOGIC;
        Q : INOUT STD_LOGIC);
END TriggerAlgorithm;

ARCHITECTURE AlgorithmArch OF TriggerAlgorithm IS
    FUNCTION rising_edge (SIGNAL s : STD_LOGIC)
        RETURN BOOLEAN IS
    BEGIN
        RETURN s = '1' AND s'event;
    END;

BEGIN
    PROCESS(R, S, C)
    BEGIN
        IF R = '1' THEN
            Q <= '0' after 8 ns;
        ELSIF S = '1' THEN
            Q <= '1' after 8 ns;
        ELSE
            IF rising_edge(C) THEN
                Q <= NOT Q after 13 ns;
            ELSE
                Q <= Q after 2 ns;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE AlgorithmArch;