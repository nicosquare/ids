library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port (
        CLK     : in  std_logic;
        Address : in  std_logic_vector(15 downto 0);
        Data    : out std_logic_vector(15 downto 0)
        ) ;
end entity ROM;  -- ROM

architecture arch of ROM is

    constant low_address  : natural := 0;
    constant high_address : natural := 2**7-1;

    type type_rom is array (low_address to high_address-1) of std_logic_vector(15 downto 0);

    constant mem_rom : type_rom := (

	0 => "1111111" & "111111111",           -- RESET
	1 => "1100001" & "000000000",           -- LI R1, 0 -- Compteur
	2 => "1100010" & "010000000",         	-- LI R2, 128 -- Addresse
	3 => "1011000" & "011000000",		-- IN R3 -- Config

	4 => "0100100" & "100011000",		-- SHL R4,R3 (4)	
	5 => "0000000" & "001001100",		-- ADD R2,R2,R4

	6 => "1011010" & "100010001",		-- LW R4,R2,R1 -- Vecteur

	7 => "1100101" & "000000011",		-- LI R5,3
	8 => "0101101" & "101101000",		-- SHL R5,R5 (13)
	9 => "0001000" & "101101000",		-- NEGA R5,R5 -- Bits control
	10 => "0010000" & "100101100",		-- AND R4,R5,R4 -- Vecteur avec coeff

	11 => "0100111" & "101001000",		-- SHL R5,R1 (7)
	12 => "0010001" & "100101100",		-- OR R4,R5,R4

	13 => "1011001" & "100000000",		-- OUT R4

	14 => "1100100" & "000011111",		-- LI R4, 31
	15 => "0000001" & "100100001",		-- SUB R4,R4,R1 
	16 => "1100101" & "000010110",		-- LI R5, 22
	17 => "1001000" & "000100101",		-- BAEQ R4,R5

	18 => "0000010" & "001001000",		-- INC R1
	19 => "1100100" & "000000000",		-- LI R4, 0
	20 => "1100101" & "000000100",		-- LI R5, 4
	21 => "1001000" & "000100101",		-- BAEQ R4,R5

	22 => x"F0F0",				-- NOP
	
        others => x"F0F0"               -- NOP
        );

begin
    
    process(CLK)
    begin
        if (CLK'event and CLK = '1') then
            Data <= mem_rom(to_integer(unsigned(Address)));
        end if;
    end process;


end architecture;  -- arch
