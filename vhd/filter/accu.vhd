------------------------------ACCU.vhd-----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Definition d'entrées-sorties pour l'entité ACCU
entity ACCU is
    port(
        CLK       : in  std_logic;
        RESET     : in  std_logic;
        Accu_in   : in  std_logic_vector(15 downto 0);
        Accu_ctrl : in  std_logic;
        Accu_out  : out std_logic_vector(20 downto 0)
        ) ;
end ACCU;

architecture A of ACCU is
    signal ACCU : signed(20 downto 0);
begin

    P_ACCU : process (CLK)
    begin
        if RESET = '1' then
            ACCU <= (others => '0');
        elsif (CLK'event and CLK = '1') then
            if Accu_ctrl = '1' then
                if Accu_in(15) = '0' then
                    ACCU <= "00000" & signed(Accu_in);
                else
                    ACCU <= "11111" & signed(Accu_in);
                end if;
            else
                if Accu_in(15) = '0' then
                    ACCU <= ACCU + ("00000" & signed(Accu_in));
                else
                    ACCU <= ACCU + ("11111" & signed(Accu_in));
                end if;
            end if;
        end if;
    end process P_ACCU;

    Accu_out <= std_logic_vector(ACCU);

end A;
