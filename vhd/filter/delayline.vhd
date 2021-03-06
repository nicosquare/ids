-----------------------------REGDEC.vhd----------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity DELAY_LINE is
    port(
        RESET                   : in  std_logic;
        CLK                     : in  std_logic;
        Delay_Line_in           : in  std_logic_vector(7 downto 0);
        Delay_Line_address      : in  std_logic_vector(4 downto 0);
        Delay_Line_sample_shift : in  std_logic;
        Delay_Line_out          : out std_logic_vector(7 downto 0)
        ) ;
end DELAY_LINE;

-- si Delay_Line_sample_shift == 1, Delay_Line_out devient la valeur qu'avait Delay_Line_in lors du Delay_Line_address iéme  Delay_Line_sample_shift==1 precedant
-- Cela insère ainsi un délai dans le signal

architecture A of DELAY_LINE is

    type   delay_line is array (0 to 31) of std_logic_vector(7 downto 0);
    signal x : delay_line;

begin
    P_DL : process(CLK)
    begin
        if (CLK'event and CLK = '1') then
            if (RESET = '1') then
                for i in x'range loop
                    x(i) <= (others => '0');
                end loop;
            elsif (Delay_Line_sample_shift = '1') then
                x(0) <= Delay_Line_in;
                for i in x'low to (x'high - 1) loop
                    x(i+1) <= x(i);
                end loop;
            end if;
        end if;
    end process P_DL;

    Delay_Line_out <= x(to_integer(unsigned(Delay_Line_address)));

-- Renvoie la valeur In avec <Delay_Line_adress> 
    
end A;
