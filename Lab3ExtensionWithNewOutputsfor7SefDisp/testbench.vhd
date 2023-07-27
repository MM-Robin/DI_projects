-- Code your testbench here
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY CNT16_TB IS
    GENERIC (N : INTEGER := 4);
END CNT16_TB;

ARCHITECTURE SIM OF CNT16_TB IS
    -- DUT component
    COMPONENT CNT16 IS
         PORT (
            CLK, ARESETN : IN STD_LOGIC;
            LOAD : IN STD_LOGIC;
            DIR : IN STD_LOGIC;
            TCEN : IN STD_LOGIC;
            CNTEN : IN STD_LOGIC;
            PRE : IN STD_LOGIC_VECTOR (N - 1 DOWNTO 0);
            TC : OUT STD_LOGIC;
            LCDB_DATA_IN_LED : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            CNT : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
            RHS : OUT STD_LOGIC
    	);
    END COMPONENT;
    --signals
    CONSTANT CLK_PERIOD : TIME := 5 ns; -- clock period (20 MHz)
    SIGNAL PRE, CNT : STD_LOGIC_VECTOR (N-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL LCDB_DATA_IN_LED : STD_LOGIC_VECTOR (15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ARESETN, LOAD, DIR, TCEN, CNTEN, TC, RHS : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '1';
BEGIN
	CLK <= not CLK after CLK_PERIOD;
    
    --mapping port
    DUT : CNT16
    PORT MAP(CLK, ARESETN,LOAD,DIR,TCEN,CNTEN,PRE,TC,LCDB_DATA_IN_LED,CNT,RHS);
    PROCESS
    BEGIN
       -- test case 1 (reset)
       	ARESETN <= '1';
        CNTEN <= '0';
        DIR <= '1';
 		--wait for 20 ns;
        
--         -- test case 4 (load)
--        	ARESETN <= '1';
--         LOAD <= '1';
--         PRE <= "1111";
--  		wait for 20 ns;
        
--         -- test case 4 (load)
--        	ARESETN <= '1';
--         LOAD <= '1';
--         PRE <= "1111";
--  		wait for 20 ns;
        
--         -- test case 5 (count + load)
--        	ARESETN <= '1';
--         LOAD <= '1';
--         CNTEN <= '0';
--  		wait for 20 ns;

wait;
     
    END PROCESS;
END SIM;