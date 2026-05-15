-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;


ENTITY NBITADDER_TB IS
    GENERIC (N : INTEGER := 8);
END NBITADDER_TB;

ARCHITECTURE SIM OF NBITADDER_TB IS
    -- DUT component
    COMPONENT NBITADDER IS
        PORT (
            A : IN bit_vector (N - 1 DOWNTO 0); -- 1st addend
            B : IN bit_vector (N - 1 DOWNTO 0); -- 2nd addend
            C_IN : IN BIT; -- 1-bit carry in
            S : OUT bit_vector (N - 1 DOWNTO 0)); -- sum
    END COMPONENT;
    --signals
    CONSTANT CLK_PERIOD : TIME := 50 ns; -- clock period (20 MHz)
    SIGNAL A, B, S : bit_vector (N - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL C_IN : BIT := '0';
BEGIN
    --mapping port
    DUT : NBITADDER
    PORT MAP(A, B, C_IN, S);
    PROCESS
    BEGIN
        A <= "00000000",
         "00000000" after 1*CLK_PERIOD, -- normal
         "01000000" after 2*CLK_PERIOD, -- ripple
         "01111111" after 3*CLK_PERIOD, -- overflow
         "10000000" after 4*CLK_PERIOD, -- propagation delay
         "11000000" after 5*CLK_PERIOD,
         "00001111" after 6*CLK_PERIOD,
         "00000000" after 7*CLK_PERIOD,
         "11111111" after 8*CLK_PERIOD,
         "00000000" after 9*CLK_PERIOD;
         
       B <= "11111111",
         "00010001" after 1*CLK_PERIOD, --normal
         "01000001" after 2*CLK_PERIOD, -- ripple
         "00000001" after 3*CLK_PERIOD, -- overflow
         "01111111" after 4*CLK_PERIOD, -- propagation delay
         "11000000" after 5*CLK_PERIOD,
         "00001111" after 6*CLK_PERIOD,
         "00000000" after 7*CLK_PERIOD,
         "11111111" after 8*CLK_PERIOD, 
         "00000000" after 9*CLK_PERIOD;
        WAIT;
    END PROCESS;
END SIM;
