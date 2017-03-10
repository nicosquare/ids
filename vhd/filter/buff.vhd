------------------------------BUFF.vhd-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Définition of INPUTS/OUTPUTS for entity BUFF
---> CLK Clock signal
---> RESET Reset signal
---> Buff_OE Output enable
---> Buff_in Input[8]
---> Buff_out Output[8]
entity BUFF is
    port(
        CLK      : in  std_logic;
        RESET    : in  std_logic;
        Buff_OE  : in  std_logic;
        Buff_in  : in  std_logic_vector(7 downto 0);
        Buff_out : out std_logic_vector(7 downto 0)) ;
end BUFF;

architecture A of BUFF is
begin
    P_BUFF : process (CLK)
    begin
        if RESET = '1' then -- If RESET signal is enabled, output goes to 0x00
            Buff_out <= (others => '0');
        elsif (CLK'event and CLK = '1') then -- When a clock changes to value 1
            if (Buff_OE = '1') then -- And if OE is activated, transmit de input to the output
                Buff_out <= Buff_in;
            end if;
        end if;
    end process P_BUFF;
end A;
