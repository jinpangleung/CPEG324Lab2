library ieee;
use ieee.std_logic_1164.all;

entity fourBitShifter_tb is
end fourBitShifter_tb;

architecture behav of fourBitShifter_tb is
component fourBitShifter
port (		i:	in std_logic_vector (3 downto 0);
		i_shift_in: in std_logic;
		sel:        in std_logic_vector(1 downto 0); -- 00:hold; 01: shift left; 10: shift right; 11: load
		clock:		in std_logic; 
		enable:		in std_logic;
		clear:		in std_logic;
		output: 	out std_logic_vector(3 downto 0)
);
end component;


signal I, Output : std_logic_vector(3 downto 0);
signal I_SHIFT_IN, Clock, Enable, Clear : std_logic;
signal Sel : std_logic_vector(1 downto 0);

begin
fourBitShifter1: fourBitShifter port map (i => I, i_shift_in => I_SHIFT_IN, sel => Sel, clock => Clock, enable => Enable, clear => Clear, output => Output);

process
type pattern_type is record
I: std_logic_vector (3 downto 0);
I_SHIFT_IN, Clock, Enable, Clear: std_logic;
Sel: std_logic_vector(1 downto 0);
Output: std_logic_vector (3 downto 0);
end record;

type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array :=
(("0000", '0', '0', '1', '1', "11", "UUUU"), --initialization
("0001", '1', '1', '1', '1', "11", "0000"),
("0001", '0', '0', '0', '0', "11", "0000"),
("0001", '1', '0', '0', '0', "11", "0000"),
("0001", '0', '1', '0', '0', "11", "0000"),
("0001", '0', '0', '1', '0', "11", "0000"),
("0001", '0', '0', '0', '1', "11", "0000"),
("0001", '1', '1', '0', '0', "11", "0000"),
("0001", '1', '0', '1', '0', "11", "0000"),
("0001", '1', '0', '0', '1', "11", "0000"),
("0001", '0', '1', '1', '0', "11", "0001"),
("0001", '0', '1', '0', '1', "11", "0001"),
("0001", '0', '0', '1', '1', "11", "0001"),
("0001", '1', '1', '1', '0', "11", "0001"),
("0001", '1', '1', '0', '1', "11", "0001"),
("0001", '1', '0', '1', '1', "11", "0001"),
("0001", '0', '1', '1', '1', "11", "0000"),
("0001", '1', '1', '1', '1', "10", "0000"),
("0001", '0', '0', '0', '0', "10", "0000"),
("0001", '1', '0', '0', '0', "10", "0000"),
("0001", '0', '1', '0', '0', "10", "0000"),
("0001", '0', '0', '1', '0', "10", "0000"),
("0001", '0', '0', '0', '1', "10", "0000"),
("0001", '1', '1', '0', '0', "10", "0000"),
("0001", '1', '0', '1', '0', "10", "0000"),
("0001", '1', '0', '0', '1', "10", "0000"),
("0001", '0', '1', '1', '0', "10", "0000"),
("0001", '0', '1', '0', '1', "10", "0000"),
("0001", '0', '0', '1', '1', "10", "0000"),
("0001", '1', '1', '1', '0', "10", "1000"),
("0001", '1', '1', '0', '1', "10", "1000"),
("0001", '1', '0', '1', '1', "10", "1000"),
("0001", '0', '1', '1', '1', "10", "0000"),

("0001", '1', '1', '1', '1', "01", "0000"),
("0001", '0', '0', '0', '0', "01", "0000"),
("0001", '1', '0', '0', '0', "01", "0000"),
("0001", '0', '1', '0', '0', "01", "0000"),
("0001", '0', '0', '1', '0', "01", "0000"),
("0001", '0', '0', '0', '1', "01", "0000"),
("0001", '1', '1', '0', '0', "01", "0000"),
("0001", '1', '0', '1', '0', "01", "0000"),
("0001", '1', '0', '0', '1', "01", "0000"),
("0001", '0', '1', '1', '0', "01", "0001"),
("0001", '0', '1', '0', '1', "01", "0001"),
("0001", '0', '0', '1', '1', "01", "0001"),
("0001", '1', '1', '1', '0', "01", "0001"),
("0001", '1', '1', '0', '1', "01", "0001"),
("0001", '1', '0', '1', '1', "01", "0001"),
("0001", '0', '1', '1', '1', "01", "0000"));
begin

for n in patterns'range loop
I <= patterns(n).I;
I_SHIFT_IN <= patterns(n).I_SHIFT_IN;
Sel <= patterns(n).Sel;
Clock <= patterns(n).Clock;
Enable <= patterns(n).Enable;
Clear <= patterns(n).Clear;
wait for 1 ns;
assert Output = patterns(n).Output report (integer'image(n)) severity error;
end loop;
assert false report "end of test" severity note;
wait;
end process;
end behav;
