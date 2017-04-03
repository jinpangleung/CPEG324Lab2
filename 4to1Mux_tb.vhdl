library ieee;
use ieee.std_logic_1164.all;

entity fourToOneTest is
generic( N : integer := 8);
end fourToOneTest;

architecture behavioral of fourToOneTest is
component fourToOne
port(	wordOne: in std_logic_vector (N-1 downto 0);
	wordTwo: in std_logic_vector (N-1 downto 0);
	wordThree: in std_logic_vector (N-1 downto 0);
	wordFour: in std_logic_vector (N-1 downto 0);
	sel: in std_logic_vector (1 downto 0);
	output: out std_logic_vector (N-1 downto 0)
);
end component;

signal WordOne, WordTwo, WordThree, WordFour, Output : std_logic_vector (N-1 downto 0);
signal Sel : std_logic_vector (1 downto 0);
begin

muxOne: fourToOne port map (wordOne => WordOne, wordTwo => WordTwo, wordThree => WordThree, wordFour => WordFour, sel => Sel, output => Output);
process
begin


Sel <= "00"; 
WordOne <= "00000001"; 
WordTwo <= "00000010"; 
WordThree <= "00000011"; 
WordFour <= "00000100"; 
wait for 20 ns;
assert (Output /= WordOne) report "Output = WordOne";

Sel <= "01"; 
WordOne <= "00000001"; 
WordTwo <= "00000010";
WordThree <= "00000011"; 
WordFour <= "00000100"; 
wait for 20 ns;
assert (Output /= WordTwo) report "Output = WordTwo";

Sel <= "10"; 
WordOne <= "00000001"; 
WordTwo <= "00000010"; 
WordThree <= "00000011"; 
WordFour <= "00000100"; 
wait for 20 ns;
assert (Output /= WordThree) report "Output = WordThree";

Sel <= "11"; 
WordOne <= "00000001"; 
WordTwo <= "00000010"; 
WordThree <= "00000011"; 
WordFour <= "00000100"; 
wait for 20 ns;
assert (Output /= WordFour) report "Output = WordFour";

wait;
end process;
end behavioral;



