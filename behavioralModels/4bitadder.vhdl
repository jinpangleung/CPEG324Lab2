library ieee;
use ieee.std_logic_1164.all;

entity fourBitAdder is
port(	operandOne: in std_logic_vector (3 downto 0);
	operandTwo: in std_logic_vector (3 downto 0);
	output: out std_logic_vector (3 downto 0);
	overflow: out std_logic;
	underflow: out std_logic
);
end entity fourBitAdder;

architecture behavioral of fourBitAdder is
begin
process(operandOne, operandTwo)
variable carry : boolean := false;
begin
	if (operandOne(0) = '1') and (operandTwo(0) = '1') then
		output(0) <= '0';
		carry := true;
	elsif (operandOne(0) = '1') and (operandTwo(0) = '0') then
		output(0) <= '1';
		carry := false;
	elsif (operandOne(0) = '0') and (operandTwo(0) = '1') then
		output(0) <= '1';
		carry := false;
	else
		output(0) <= '0';
		carry := false;
	end if;

	if (operandOne(1) = '1') and (operandTwo(1) = '1') and (carry = true) then
		output(1) <= '1';
		carry := true;
	elsif (operandOne(1) = '1') and (operandTwo(1) = '0') and (carry = true) then
		output(1) <= '0';
		carry := true;
	elsif (operandOne(1) = '0') and (operandTwo(1) = '1') and (carry = true) then
		output(1) <= '0';
		carry := true;
	elsif (operandOne(1) = '0') and (operandTwo(1) = '0') and (carry = true) then
		output(1) <= '1';
		carry := false;
	elsif (operandOne(1) = '1') and (operandTwo(1) = '1') and (carry = false) then
		output(1) <= '0';
		carry := true;
	elsif (operandOne(1) = '1') and (operandTwo(1) = '0') and (carry = false) then
		output(1) <= '1';
		carry := false;
	elsif (operandOne(1) = '0') and (operandTwo(1) = '1') and (carry = false) then
		output(1) <= '1';
		carry := false;
	else
		output(1) <= '0';
		carry := false;
	end if;
	
	if (operandOne(2) = '1') and (operandTwo(2) = '1') and (carry = true) then
		output(2) <= '1';
		overflow <= '1';
		carry := true;
		underflow <= '0';
	elsif (operandOne(2) = '1') and (operandTwo(2) = '0') and (carry = true) then
		output(2) <= '0';
		overflow <= '1';
		carry := true;
		underflow <= '0';
	elsif (operandOne(2) = '0') and (operandTwo(2) = '1') and (carry = true) then
		output(2) <= '0';
		overflow <= '1';
		carry := true;
		underflow <= '0';
	elsif (operandOne(2) = '0') and (operandTwo(2) = '0') and (carry = true) then
		output(2) <= '1';
		overflow <= '0';
		carry := false;
		underflow <= '0';
	elsif (operandOne(2) = '1') and (operandTwo(2) = '1') and (carry = false) then
		output(2) <= '0';
		overflow <= '1';
		carry := true;
		underflow <= '0';
	elsif (operandOne(2) = '1') and (operandTwo(2) = '0') and (carry = false) then
		output(2) <= '1';
		overflow <= '0';
		carry := false;
		underflow <= '0';
	elsif (operandOne(2) = '0') and (operandTwo(2) = '1') and (carry = false) then
		output(2) <= '1';
		overflow <= '0';
		carry := false;
		underflow <= '0';
	else
		output(2) <= '0';
		overflow <= '0';
		carry := false;
		underflow <= '0';
	end if;
	
	if (operandOne(3) = '1') or (operandTwo(3) = '1') then
		if (operandOne(3) = '1') and (operandTwo(3) = '1') and (carry = true) then
			output(3) <= '1';
			overflow <= '0';
			underflow <= '1';
		elsif (operandOne(3) = '1') and (operandTwo(3) = '0') and (carry = true) then
			output(3) <= '0';
			overflow <= '0';
			underflow <= '0';
		elsif (operandOne(3) = '0') and (operandTwo(3) = '1') and (carry = true) then
			output(3) <= '0';
			overflow <= '0';
			underflow <= '0';
		elsif (operandOne(3) = '0') and (operandTwo(3) = '0') and (carry = true) then
			output(3) <= '1';
			overflow <= '0';
			underflow <= '0';
		elsif (operandOne(3) = '1') and (operandTwo(3) = '1') and (carry = false) then
			output(3) <= '1';
			overflow <= '0';
			underflow <= '1';
		elsif (operandOne(3) = '1') and (operandTwo(3) = '0') and (carry = false) then
			output(3) <= '1';
			overflow <= '0';
			underflow <= '0';
		elsif (operandOne(2) = '0') and (operandTwo(2) = '1') and (carry = false) then
			output(3) <= '1';
			overflow <= '0';
			underflow <= '0';
		else
			output(3) <= '0';
			overflow <= '0';
			underflow <= '0';
		end if;
	else
		output(3) <= '0';
end if;
end process;
end behavioral;
