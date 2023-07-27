

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
            PRE : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
            TC : OUT STD_LOGIC;
            CNT : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
    	);
    END COMPONENT;
    --signals
    constant ClockFrequency : integer := 25e6; -- 25 MHz
    CONSTANT CLK_PERIOD : TIME := 1000 ms / ClockFrequency; -- clock period (20 MHz)
    SIGNAL PRE, CNT : STD_LOGIC_VECTOR (N-1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ARESETN, LOAD, DIR, TCEN, CNTEN, TC : STD_LOGIC := '0';
    SIGNAL CLK : STD_LOGIC := '0';
BEGIN
	-- CLK <= not CLK after CLK_PERIOD;
    
    --mapping port
    DUT : CNT16
    PORT MAP(CLK, ARESETN,LOAD,DIR,TCEN,CNTEN,PRE,TC,CNT);
    PROCESS
    BEGIN
     
  		
       wait;
    END PROCESS;
END SIM;