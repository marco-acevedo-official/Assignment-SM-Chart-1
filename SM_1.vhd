


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SM_1 is
Port (
	clock_in : in std_logic;
	inputX : in std_logic_vector(1 downto 0);
	outputZ : out std_logic_vector(1 downto 0);
	present, future : out integer range 0 to 3
);
end SM_1;
architecture Behavioral of SM_1 is
signal current_state : integer range 0 to 3 := 0;
signal next_state : integer range 0 to 3 := 0;
begin
algorithm : process(clock_in)
begin
	
	
	if rising_edge(clock_in) then
	
	if current_state = 0 then
		if inputX = "00" then
			next_state <= 3;
			outputZ <= "00";
			--
		elsif inputX = "01" then
			next_state <= 2;
			outputZ <= "10";
			--
		elsif inputX = "10" then
			next_state <= 1;
			outputZ <= "11";
			--
		elsif inputX = "11" then
			next_state <= 0;
			outputZ <= "01";
		end if;
	end if;
	--
	if current_state = 1 then
		if inputX = "00" then
			next_state <= 0;
			outputZ <= "10";
		elsif inputX = "01" then
			next_state <= 1;
			outputZ <= "10";
		elsif inputX = "10" then
			next_state <= 2;
			outputZ <= "11";
		elsif inputX = "11" then
			next_state <= 3;
			outputZ <= "11";
		end if;
	end if;
	--
	if current_state = 2 then
		if inputX = "00" then
			next_state <= 3;
			outputZ <= "10";
		elsif inputX = "01" then
			next_state <= 0;
			outputZ <= "10";
		elsif inputX = "10" then
			next_state <= 1;
			outputZ <= "11";
		elsif inputX = "11" then
			next_state <= 1;
			outputZ <= "11";
		end if;
	end if;
	--
	if current_state = 3 then
		if inputX = "00" then
			next_state <= 2;
			outputZ <= "00";
			--
		elsif inputX = "01" then
			next_state <= 2;
			outputZ <= "00";
			--
		elsif inputX = "10" then
			next_state <= 1;
			outputZ <= "01";
			--
		elsif inputX = "11" then
			next_state <= 0;
			outputZ <= "01";
		end if;
	end if;
	--
--	current_state <= next_state;
--	present <= current_state;
	end if;
	--future <= next_state;
	--current_state <= next_state;

--	if falling_edge(clock_in) then
--		current_state <= next_state;
--		present <= current_state;
--	end if;
		current_state <= next_state;
		present <= current_state;
end process;

end Behavioral;
