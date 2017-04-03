library ieee;
use ieee.std_logic_1164.all;

entity eightBitShifter is
port(	i_e:	in std_logic_vector (7 downto 0);
	i_shift_in_e:	in std_logic;
	sel_e:	in std_logic_vector (1 downto 0);
	clock_e:	in std_logic;
	enable_e: in std_logic;
	clear_e: in std_logic;
	output_e:	out std_logic_vector (7 downto 0)
);
end eightBitShifter;

architecture structural of eightBitShifter is
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

signal firstShift, secondShift : std_logic;
begin
process(clock_e)
begin

if (sel_e = "01") then
if (i_shift_in_e = '0') then
firstShift <= '1';
else
firstShift <= '0';
end if;
secondShift <= i_e(3);

elsif (sel_e = "10") then
if (i_shift_in_e = '0') then
secondShift <= '1';
else
secondShift <= '0';
end if;
firstShift <= i_e(4);

else
firstShift <= i_shift_in_e;
secondShift <= i_shift_in_e;
end if;

end process;

fourBitShifter1: fourBitShifter port map (i => i_e(3 downto 0), i_shift_in => firstShift, sel => sel_e, clock => clock_e, enable => enable_e, clear => clear_e, output => output_e(3 downto 0));
fourBitShifter2: fourBitShifter port map (i => i_e(7 downto 4), i_shift_in => secondShift, sel => sel_e, clock => clock_e, enable => enable_e, clear => clear_e, output => output_e(7 downto 4));

end architecture;