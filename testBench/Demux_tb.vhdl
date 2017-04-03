library ieee;
use ieee.std_logic_1164.all;
use work.arrayOfVectors.all;

entity demuxTest is
generic ( X : integer := 8;
	   Y : integer := 3
);
end demuxTest;

architecture behavioral of demuxTest is
component demux
port(	outputs : out twoDimensional(2**Y - 1 downto 0, X-1 downto 0);
	input : in std_logic_vector(X-1 downto 0);
	enable : in std_logic;
	sel : in std_logic_vector(Y-1 downto 0)
);
end component;

signal Outputs : twoDimensional(2**Y - 1 downto 0, X-1 downto 0);
signal Input : std_logic_vector(X-1 downto 0);
signal Enable : std_logic;
signal Sel : std_logic_vector(Y-1 downto 0);

begin
demux1: demux port map (outputs => Outputs, input => Input, enable => Enable, sel => Sel);
process
begin

Input <= "10101010";
Sel <= "000";
Enable <= '1';
wait for 20 ns;
assert(Outputs(0,7) = '1' and Outputs(0,6) = '0' and Outputs(0,5) = '1' and Outputs(0,4) = '0' and Outputs(0,3) = '1' and Outputs(0,2) = '0' and Outputs(0,1) = '1' and Outputs(0,0) = '0') report "Test one failed!!!!";

Input <= "10101010";
Sel <= "001";
Enable <= '0';
wait for 20 ns;
assert(Outputs(1,7) = '1' and Outputs(1,6) = '0' and Outputs(1,5) = '1' and Outputs(1,4) = '0' and Outputs(1,3) = '1' and Outputs(1,2) = '0' and Outputs(1,1) = '1' and Outputs(1,0) = '0') report "Test two failed!!!!";

Input <= "10101010";
Sel <= "010";
Enable <= '1';
wait for 20 ns;
assert(Outputs(2,7) = '1' and Outputs(2,6) = '0' and Outputs(2,5) = '1' and Outputs(2,4) = '0' and Outputs(2,3) = '1' and Outputs(2,2) = '0' and Outputs(2,1) = '1' and Outputs(2,0) = '0') report "Test three failed!!!!";

Input <= "10101010";
Sel <= "011";
Enable <= '0';
wait for 20 ns;
assert(Outputs(3,7) = '1' and Outputs(3,6) = '0' and Outputs(3,5) = '1' and Outputs(3,4) = '0' and Outputs(3,3) = '1' and Outputs(3,2) = '0' and Outputs(3,1) = '1' and Outputs(3,0) = '0') report "Test four failed!!!!";

Input <= "10101010";
Sel <= "100";
Enable <= '1';
wait for 20 ns;
assert(Outputs(4,7) = '1' and Outputs(4,6) = '0' and Outputs(4,5) = '1' and Outputs(4,4) = '0' and Outputs(4,3) = '1' and Outputs(4,2) = '0' and Outputs(4,1) = '1' and Outputs(4,0) = '0') report "Test five failed!!!!";

Input <= "10101010";
Sel <= "101";
Enable <= '0';
wait for 20 ns;
assert(Outputs(5,7) = '1' and Outputs(5,6) = '0' and Outputs(5,5) = '1' and Outputs(5,4) = '0' and Outputs(5,3) = '1' and Outputs(5,2) = '0' and Outputs(5,1) = '1' and Outputs(5,0) = '0') report "Test six failed!!!!";

Input <= "10101010";
Sel <= "110";
Enable <= '1';
wait for 20 ns;
assert(Outputs(6,7) = '1' and Outputs(6,6) = '0' and Outputs(6,5) = '1' and Outputs(6,4) = '0' and Outputs(6,3) = '1' and Outputs(6,2) = '0' and Outputs(6,1) = '1' and Outputs(6,0) = '0') report "Test seven failed!!!!";

Input <= "10101010";
Sel <= "111";
Enable <= '0';
wait for 20 ns;
assert(Outputs(7,7) = '1' and Outputs(7,6) = '0' and Outputs(7,5) = '1' and Outputs(7,4) = '0' and Outputs(7,3) = '1' and Outputs(7,2) = '0' and Outputs(7,1) = '1' and Outputs(7,0) = '0') report "Test eight failed!!!!";
wait;

end process;
end architecture;
