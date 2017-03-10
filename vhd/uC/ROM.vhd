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

        0 => "1100010" & "010000000",            -- LI R2, 128
-- To be completed
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
