library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Définition of INPUTS/OUTPUTS for entity coeff_ram
---> CLK Clock signal
---> RESET Reset signal
---> data_in 
---> data_out
---> address address to W/R 
---> wb write instruction (0 activated)
entity coeff_ram is
    port (
        CLK      : in  std_logic;
        RESET    : in  std_logic;
        data_in  : in  std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0);
        address  : in  std_logic_vector(4 downto 0);
        wb       : in  std_logic
        ) ;
end entity coeff_ram;

architecture arch of coeff_ram is
   -- Definition of type type_ram, array with 32 cases of 8 bits	
   type   type_ram is array(0 to 31) of std_logic_vector(7 downto 0);
   constant filter_rom : type_ram := -- Mapping of the coefficients of HLP filter
    (0   => "00000000" , 1 => "00000100" , 2 => "00000001" , 3 => "11111101" ,
      --  0x00               0x04               0x01               0xFD
      4  => "11111110" , 5 => "00000100", 6 => "00000101" , 7 => "11111100" ,
      --  0xFE               0x04               0x05               0xFC
      8  => "11111000" , 9 => "00000011" , 10 => "00001101" , 11 => "00000001" ,
      --  0xF8               0x03               0x0D               0x01
      12 => "11101010" , 13 => "11110100" , 14 => "00101110" , 15 => "01101010" ,
      --  0xEA               0xF4               0xE2E              0x6A
      16 => "01101010" , 17 => "00101110" , 18 => "11110100" , 19 => "11101010" ,
      --  0x6A               0x2E               0xF4               0xEA
      20 => "00000001" , 21 => "00001101" , 22 => "00000011" , 23 => "11111000" ,
      --  0x01               0x0D               0x03               0xF8
      24 => "11111100" , 25 => "00000101" , 26 => "00000100" , 27 => "11111110" ,
      --  0xFC               0x05               0x04               0xFE
      28 => "11111101" , 29 => "00000001" , 30 => "00000100" , 31 => "00000000") ;
      --  0xFD               0x01               0x04               0x00
 
    signal ram : type_ram ;

begin

    process_ram : process(CLK)
    begin

        if RESET = '1' then -- When resseting, set the coefficients back to the temporary signal "ram"
           for i in 0 to 31 loop
              ram(i) <= filter_rom(i);
           end loop;
        elsif CLK = '1' and CLK'event then

            --write coefficient to a speficic address in ram temp signal
            if wb = '0' then
                ram(to_integer(unsigned(address))) <= data_in;
            end if;

        end if;
    end process;  -- process_ram

    --read
    data_out <= ram(to_integer(unsigned(address)));

end architecture arch;
