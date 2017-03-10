library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity GENECOND is
    port (
        RegIn   : in  std_logic_vector(15 downto 0);
        SelCond : in  std_logic_vector(2 downto 0);
        CondOut : out std_logic
        ) ;
end entity GENECOND;

architecture arch of GENECOND is

begin

    process(RegIn, SelCond)
    begin
        case SelCond is

            when "000" =>               -- RegIn == 0?
                if signed(RegIn) = 0 then
                    CondOut <= '1';
                else
                    CondOut <= '0';
                end if;
                
            when "001" =>               --RegIn >= 0?
                if signed(RegIn) >= 0 then
                    CondOut <= '1';
                else
                    CondOut <= '0';
                end if;
                
            when "010" =>               --regIn <=0?
                if signed(RegIn) <= 0 then
                    CondOut <= '1';
                else
                    CondOut <= '0';
                end if;

            when "011" =>               --always true?
                CondOut <= '1';

            when "100" =>               --regIn != 0?
                if signed(RegIn) /= 0 then
                    CondOut <= '1';
                else
                    CondOut <= '0';
                end if;

            when "101" =>               --regIn > 0?
                if signed(RegIn) > 0 then
                    CondOut <= '1';
                else
                    CondOut <= '0';
                end if;

            when "110" =>               --regIn < 0?
                if signed(RegIn) < 0 then
                    CondOut <= '1';
                else
                    CondOut <= '0';
                end if;

            when others =>
                CondOut <= '0';
        end case;
        
    end process;  -- identifier

end architecture arch;
