library ieee;
use ieee.std_logic_1164.all;

entity fourBitAdderTest is
end fourBitAdderTest;

architecture behavioral of fourBitAdderTest is
component fourBitAdder
port(	operandOne: in std_logic_vector (3 downto 0);
	operandTwo: in std_logic_vector (3 downto 0);
	output: out std_logic_vector (3 downto 0);
	overflow: out std_logic;
	underflow: out std_logic
);
end component;

signal OperandOne, OperandTwo, Output : std_logic_vector(3 downto 0);
signal Overflow, Underflow: std_logic;

begin
fourBitAdder1: fourBitAdder port map (operandOne => OperandOne, operandTwo => OperandTwo, output => Output, overflow => Overflow, underflow => Underflow);
process
begin

OperandOne <= "0100";
OperandTwo <= "0011";
wait for 20 ns;
assert(Output = "0111" and Overflow = '0' and Underflow = '0') report "Test one failed!!!";

OperandOne <= "1001";
OperandTwo <= "0001";
wait for 20 ns;
assert(Output = "1010" and Overflow = '0' and Underflow = '0') report "Test two failed!!!";

OperandOne <= "0001";
OperandTwo <= "0001";
wait for 20 ns;
assert(Output = "0010" and Overflow = '0' and Underflow = '0') report "Test three failed!!!";

OperandOne <= "1110";
OperandTwo <= "0100";
wait for 20 ns;
assert(Output = "0010" and Overflow = '0' and Underflow = '0') report "Test four failed!!!";

OperandOne <= "0111";
OperandTwo <= "0111";
wait for 20 ns;
assert(Output = "0110" and Overflow = '1' and Underflow = '0') report "Test five failed!!!";

OperandOne <= "1000";
OperandTwo <= "1001";
wait for 20 ns;
assert(Output = "1001" and Overflow = '0' and Underflow = '1') report "Test six failed!!!";

wait;

end process;
end architecture;









