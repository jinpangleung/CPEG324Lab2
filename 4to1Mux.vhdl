library ieee;
use ieee.std_logic_1164.all;

entity fourToOne is
generic ( N : integer := 8);
port(	wordOne: in std_logic_vector (N-1 downto 0);
	wordTwo: in std_logic_vector (N-1 downto 0);
	wordThree: in std_logic_vector (N-1 downto 0);
	wordFour: in std_logic_vector (N-1 downto 0);
	sel: in std_logic_vector (1 downto 0);
	output: out std_logic_vector (N-1 downto 0)
);
end entity fourToOne;

architecture behavioral of fourToOne is
begin
output <= wordOne after 5 ns when sel = "00" else
wordTwo after 5 ns when sel = "01" else
wordThree after 5 ns when sel = "10" else
wordFour after 5 ns;
end architecture behavioral;
