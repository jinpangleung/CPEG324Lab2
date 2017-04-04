library ieee;
use ieee.std_logic_1164.all;

package arrayOfVectors is
	type twoDimensional is array (integer range <>, integer range <>) of std_logic;
end package;

library ieee;
use ieee.std_logic_1164.all;
use work.arrayOfVectors.all;
entity demux is 
generic ( X : integer := 8;
	   Y : integer := 3
);
port(	outputs : out twoDimensional(2**Y - 1 downto 0, X-1 downto 0);
	input : in std_logic_vector (X-1 downto 0);
	enable : in std_logic;
	sel : in std_logic_vector (Y-1 downto 0)
);
end entity demux;

architecture behavioral of demux is 
begin
process(input, sel)
variable selSum : integer := 0;
variable selValue : integer := 0;
begin
if (enable = '1') then
for k in Y-1 downto 0 loop
	if (sel(k) = '0') then
		selValue := 0;
	else
		selValue := 1;
	end if;
	selSum := selSum + selValue * (2**k);
end loop;

for i in 0 to 2**Y - 1 loop
	if (selSum = i) then
		for j in 0 to X-1 loop
			outputs(i,j) <= input(j);
		end loop;
	else
		for j in 0 to X-1 loop
			outputs(i,j) <= '0';
		end loop;
	end if;
end loop;

selSum := 0;
selValue := 0;
end if;
end process;
end behavioral;
		
	
