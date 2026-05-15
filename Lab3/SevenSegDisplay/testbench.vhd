
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- test bench CNT16_TB

entity CNT16_TB is
 generic (N : integer := 4);
end CNT16_TB;

architecture PROC_2_TB of CNT16_TB is

component CNT16 is
port(
CLK, ARESETN : in std_logic;
LOAD : in std_logic;
DIR : in std_logic;
TCEN : in std_logic;
CNTEN : in std_logic;
PRE : in std_logic_vector (N-1 downto 0);
TC : out std_logic;
--RHS : out std_logic;
LCDB_DATA_IN_LED : out std_logic_vector (15 downto 0)
--CNT : out std_logic_vector(N-1 downto 0)
);
end component CNT16;

constant clock_period: time := 30 ns;

signal Q,Q_NEXT : std_logic_vector(N-1 downto 0);
signal ARESETN_tb,LOAD_tb,DIR_tb,TCEN_tb,TC_tb,CNTEN_tb : std_logic:= '0';
signal CLK_tb : std_logic:= '0';
signal PRE_tb: std_logic_vector(N-1 downto 0) :=(others => '0');
signal LCDB_DATA_IN_LED_tb : std_logic_vector(15 downto 0); 

begin
-- stimuli: test case 8 count upwards when TCEN_tb = 1
CLK_tb <= not CLK_tb after clock_period/2;
ARESETN_tb <= '1';
LOAD_tb <= '0' after 0*clock_period; -- We want to load the PRE value
DIR_tb <= '1' after 0*clock_period;
TCEN_tb <= '1' after 0*clock_period;
CNTEN_tb <= '0' after 0*clock_period;  -- Stop counting when value 1
PRE_tb <= "0001" after 0*clock_period; -- irrelavant PRE has value of 0

-- Instantiate and Map DUT
DUT : CNT16
 port map(
 LCDB_DATA_IN_LED => LCDB_DATA_IN_LED_tb,
 CLK => CLK_tb,
 ARESETN => ARESETN_tb,
 LOAD => LOAD_tb,
 DIR => DIR_tb,
 TCEN => TCEN_tb,
 CNTEN => CNTEN_tb,
 PRE => PRE_tb,
 TC => TC_tb
 );
 
end PROC_2_TB;
