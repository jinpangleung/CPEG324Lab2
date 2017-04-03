library ieee;
use ieee.std_logic_1164.all;

entity fourBitShifter is
port(	i:		in std_logic_vector(3 downto 0);
	i_shift_in: 	in std_logic;
	sel:        	in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
	clock:		in std_logic; -- positive level triggering in problem 3
	enable:		in std_logic; -- 0: don't do anything; 1: shift left/right is enabled
	clear:		in std_logic; --0: don't do anything; 1: clear
	output:		out std_logic_vector(3 downto 0)
);
end fourBitShifter;

architecture behavioral of fourBitShifter is
begin
process(clock)
begin
	if (clear = '1' and rising_edge(clock)) then
		output <= "0000";
	elsif (enable='1' and rising_edge(clock)) then
		if sel = "00" then
			--output <= hold;
		elsif sel = "01" then --left shift
			output (3 downto 1) <= i (2 downto 0);
			output (0) <= i_shift_in;
		elsif sel = "10" then --right shift
			output (2 downto 0) <= i (3 downto 1);
			output(3) <= i_shift_in;
		else --load
			output <= i;
		end if;
	end if;	
end process;
end architecture behavioral;