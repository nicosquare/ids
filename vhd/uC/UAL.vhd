library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UAL is
    port (
        A    : in  std_logic_vector(15 downto 0);
        B    : in  std_logic_vector(15 downto 0);
        op   : in  std_logic_vector(5 downto 0);
        CIN  : in  std_logic;
        S    : out std_logic_vector(15 downto 0);
        COUT : out std_logic
        ) ;
end entity UAL;

architecture arch of UAL is

    signal Sinterne : signed(16 downto 0);

begin


    S    <= std_logic_vector(Sinterne(15 downto 0));
    COUT <= Sinterne(16);


    process(A, B, CIN, op)
    begin
        case op is
            when "000000" => Sinterne <= signed('0' & A) + signed('0' & B);  -- ADD
            when "000001" => Sinterne <= signed('0' & A) - signed('0' & B);  -- SUB                
            when "000010" => Sinterne <= signed('0' & A) + 1;  -- INC
            when "000011" => Sinterne <= signed('0' & A) - 1;  -- DEC
            when "000100" => Sinterne <= signed('0' & A) + signed('0' & B) + (x"0000" & CIN);  -- ADDC
            when "000101" => Sinterne <= signed('0' & A) - signed('0' & B) - (x"0000" & CIN);  -- SUBC

            when "000110" => Sinterne <= signed('0' & A);        -- MOVA
            when "000111" => Sinterne <= signed('0' & B);        -- MOVB
            when "001000" => Sinterne <= 0 - signed(A(15) & A);  -- NEGA
            when "001001" => Sinterne <= 0 - signed(B(15) & B);  -- NEGB

            when "010000" => Sinterne <= signed(('0' & A) and ('0' & B));  -- AND
            when "010001" => Sinterne <= signed(('0' & A) or ('0' & B));  -- OR
            when "010010" => Sinterne <= signed(('0' & A) xor ('0' & B));  -- XOR
            when "010011" => Sinterne <= signed(not ('0' & A));  -- NOT

            when "100000" => Sinterne <= signed(A(15 downto 0) & "0");  --SHL
            when "100001" => Sinterne <= signed(A(14 downto 0) & "00");
            when "100010" => Sinterne <= signed(A(13 downto 0) & "000");
            when "100011" => Sinterne <= signed(A(12 downto 0) & "0000");
            when "100100" => Sinterne <= signed(A(11 downto 0) & "00000");
            when "100101" => Sinterne <= signed(A(10 downto 0) & "000000");
            when "100110" => Sinterne <= signed(A(9 downto 0) & "0000000");
            when "100111" => Sinterne <= signed(A(8 downto 0) & "00000000");
            when "101000" => Sinterne <= signed(A(7 downto 0) & "000000000");
            when "101001" => Sinterne <= signed(A(6 downto 0) & "0000000000");
            when "101010" => Sinterne <= signed(A(5 downto 0) & "00000000000");
            when "101011" => Sinterne <= signed(A(4 downto 0) & "000000000000");
            when "101100" => Sinterne <= signed(A(3 downto 0) & "0000000000000");
            when "101101" => Sinterne <= signed(A(2 downto 0) & "00000000000000");
            when "101110" => Sinterne <= signed(A(1 downto 0) & "000000000000000");


            when "110000" => Sinterne <= signed("00" & A(15 downto 1));  --SHR
            when "110001" => Sinterne <= signed("000" & A(15 downto 2));
            when "110010" => Sinterne <= signed("0000" & A(15 downto 3));
            when "110011" => Sinterne <= signed("00000" & A(15 downto 4));
            when "110100" => Sinterne <= signed("000000" & A(15 downto 5));
            when "110101" => Sinterne <= signed("0000000" & A(15 downto 6));
            when "110110" => Sinterne <= signed("00000000" & A(15 downto 7));
            when "110111" => Sinterne <= signed("000000000" & A(15 downto 8));
            when "111000" => Sinterne <= signed("0000000000" & A(15 downto 9));
            when "111001" => Sinterne <= signed("00000000000" & A(15 downto 10));
            when "111010" => Sinterne <= signed("000000000000" & A(15 downto 11));
            when "111011" => Sinterne <= signed("0000000000000" & A(15 downto 12));
            when "111100" => Sinterne <= signed("00000000000000" & A(15 downto 13));
            when "111101" => Sinterne <= signed("000000000000000" & A(15 downto 14));
            when "111110" => Sinterne <= "0000000000000000" & A(15);

            when others => Sinterne <= "00000000000000000";
        end case;
        
        
    end process;  -- identifier



end architecture arch;
