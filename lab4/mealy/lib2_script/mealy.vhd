ENTITY Mealy IS
    PORT (
        clk, rst, x0, x1 : IN BIT;
        y : OUT BIT_VECTOR(0 TO 2));
END Mealy;

ARCHITECTURE rtl OF Mealy IS
    TYPE T_state IS (a1, a2, a3, a4);
    SIGNAL state : T_state := a1;
    SIGNAL NEXT_state : T_state;
    SIGNAL stateBin : BIT_VECTOR(1 TO 2);
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

    manageCase : PROCESS (state, x0, x1)
    BEGIN
        IF ((x0 AND x1) = '0') THEN
            CASE state IS
                WHEN a1 =>
                    IF (x1 = '0') THEN -- '00' || '10'
                        NEXT_state <= a3;
                    ELSE
                        NEXT_state <= a4;
                    END IF;
                    y <= "000";
                WHEN a2 =>
                    IF (x0 = '0' AND x1 = '0') THEN
                        NEXT_state <= a2;
                        y <= "100";
                    ELSIF (x0 = '0' AND x1 = '1') THEN
                        NEXT_state <= a2;
                        y <= "000";
                    ELSIF (x0 = '1' AND x1 = '0') THEN
                        NEXT_state <= a1;
                        y <= "001";
                    ELSE
                        NEXT_state <= state;
                    END IF;
                WHEN a3 =>
                    IF (x0 = '0' AND x1 = '0') THEN
                        NEXT_state <= a2;
                        y <= "011";
                    ELSIF (x0 = '0' AND x1 = '1') THEN
                        NEXT_state <= a4;
                        y <= "010";
                    ELSIF (x0 = '1' AND x1 = '0') THEN
                        NEXT_state <= a1;
                        y <= "001";
                    ELSE
                        NEXT_state <= state;
                    END IF;
                WHEN a4 =>
                    IF (x1 = '0') THEN -- '00' || '10'
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