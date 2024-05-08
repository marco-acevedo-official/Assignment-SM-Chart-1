----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2024 11:13:24 PM
-- Design Name: 
-- Module Name: SM_1_Tb - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SM_1_Tb is
--  Port ( );
end SM_1_Tb;

architecture Simulation of SM_1_Tb is
constant period : time := 10 ns;
signal clock : std_logic := '0';
signal input, output : std_logic_vector(1 downto 0) := (others => '0');
signal p_state, f_state : integer range 0 to 3 := 0;
begin

UUT: entity work.SM_1
Port map(
	clock_in => clock,
	inputX  => input,
	outputZ  => output,
	present  => p_state,
	future => f_state
);

clock_process : process
begin
        while true loop
            clock <= '0';                            
            wait for period / 2;                
            clock <= '1';                            
            wait for period / 2;                
        end loop;
end process;

stim : process
begin
		input <= "00";
	wait for period /1;
		input <= "01";
	wait for period /1;
		input <= "10";
	wait for period /1;
		input <= "11";
	wait for period /1;
		input <= "10";
	wait for period /1;
		input <= "11";
	wait for period /1;
	wait;
end process;

end Simulation;
