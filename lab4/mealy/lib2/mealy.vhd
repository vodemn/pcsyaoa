LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Mealy IS
    PORT (
        clk, rst : IN STD_LOGIC;
        X : IN STD_LOGIC_VECTOR(1 TO 2);
        y : OUT STD_LOGIC_VECTOR(1 TO 3));
END Mealy;

ARCHITECTURE rtl OF Mealy IS
    TYPE T_state IS (a1, a2, a3, a4);
    SIGNAL state : T_state := a1;
    SIGNAL NEXT_state : T_state;
    SIGNAL stateBin : STD_LOGIC_VECTOR(1 TO 2);
BEGIN
    listenState : PROCESS (state)
    BEGIN
        CASE state IS
            WHEN a1 => stateBin <= "00";
            WHEN a2 => stateBin <= "01";
            WHEN a3 => stateBin <= "10";
            WHEN a4 => stateBin <= "11";
        END CASE;
    END PROCESS listenState;

    manageCase : PROCESS (state, x)
    BEGIN
        IF ((x(1) AND x(2)) = '0') THEN
            CASE state IS
                WHEN a1 =>
                    IF (x(2) = '0') THEN -- '00' || '10'
                        NEXT_state <= a3;
                    ELSE
                        NEXT_state <= a4;
                    END IF;
                    y <= "000";
                WHEN a2 =>
                    CASE x IS
                        WHEN "00" => NEXT_state <= a2;
                            y <= "100";
                        WHEN "01" => NEXT_state <= a2;
                            y <= "000";
                        WHEN "10" => NEXT_state <= a1;
                            y <= "001";
                        WHEN OTHERS => NEXT_state <= state;
                    END CASE;
                WHEN a3 =>
                    CASE x IS
                        WHEN "00" => NEXT_state <= a2;
                            y <= "011";
                        WHEN "01" => NEXT_state <= a4;
                            y <= "010";
                        WHEN "10" => NEXT_state <= a1;
                            y <= "001";
                        WHEN OTHERS => NEXT_state <= state;
                    END CASE;
                WHEN a4 =>
                    IF (x(2) = '0') THEN -- '00' || '10'
                        NEXT_state <= a1;
                        y <= "000";
                    ELSE
                        NEXT_state <= a4;
                        y <= "010";
                    END IF;
            END CASE;
        END IF;
    END PROCESS manageCase;
    state <= a1 WHEN rst = '1' ELSE
        NEXT_state WHEN clk'event AND clk = '1' ELSE
        state;
END rtl;