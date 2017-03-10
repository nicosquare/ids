library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
    port (
        CLK           : in  std_logic;
        RESET         : in  std_logic;
        SelRin        : out std_logic_vector(1 downto 0);
        EnRd          : out std_logic;
        SelRD         : out std_logic_vector(2 downto 0);
        SelRA         : out std_logic_vector(2 downto 0);
        SelRB         : out std_logic_vector(2 downto 0);
        SelCond       : out std_logic_vector(2 downto 0);
        Cond          : in  std_logic;
        SelA          : out std_logic;
        SelB          : out std_logic;
        op            : out std_logic_vector(5 downto 0);
        EnCarry       : out std_logic;
        SelPC         : out std_logic;
        LoadPC        : out std_logic;
        EnPC          : out std_logic;
        ResetPC       : out std_logic;
        IR            : in  std_logic_vector(15 downto 0);
        EnIR          : out std_logic;
        EnOut         : out std_logic;
        CommandEnable : out std_logic;
        WriteEnable   : out std_logic;
        ReadEnable    : out std_logic
        ) ;
end entity;

architecture arch of PC is

    type state is (FETCH_s, DECODE_s, ALU_C_s, ALU_s, BRcc_s, BAcc_s, BRIcc_s,
                   IN_OUT_s, LSW_s, LI_s, RESET_s, WAITROM_s, WAITRAM_s) ;
    signal curr_state, next_state : state;

begin

    process_seq : process(CLK, RESET)
    begin
        if RESET = '1' then
            curr_state <= FETCH_s;
        elsif CLK = '1' and CLK'event then
            curr_state <= next_state;
        end if;
    end process;  -- process_seq


    process_comb : process(curr_state, Cond, IR)
    begin

        -- default value
        SelRin        <= "00";
        EnRd          <= '0';
        SelRD         <= "000";
        SelRA         <= "000";
        SelRB         <= "000";
        SelCond       <= "000";
        SelA          <= '0';
        SelB          <= '0';
        op            <= "000000";
        EnCarry       <= '0';
        SelPC         <= '0';
        LoadPC        <= '0';
        EnPC          <= '0';
        ResetPC       <= '0';
        EnIR          <= '0';
        EnOut         <= '0';
        CommandEnable <= '0';
        WriteEnable   <= '0';
        ReadEnable    <= '0';



        case curr_state is
            
            when FETCH_s =>
                EnIR       <= '1';      -- read ROM
                LoadPC     <= '0';      -- PC <= PC+1;
                EnPC       <= '1';
                next_state <= DECODE_s;
                
            when DECODE_s =>
                case to_integer(unsigned(IR(15 downto 9))) is

                    when 0 to 5 =>  -- ALU with Carry --> (ADD, SUB, INC, DEC, ADDC, SUBC)
                        next_state <= ALU_C_s;
                    when 6 to 9 | 16 to 19 | 32 to 46 | 48 to 62 =>  -- ALU without Carry --> (MOVA, MOVB, NEGA, NEGB, AND, OR, XOR, NOT, SHR, SHL)
                        next_state <= ALU_s;
                    when 64 to 70 =>  -- Relative Conditionnal Branch --> (BRcc)
                        next_state <= BRcc_s;
                    when 72 to 78 =>  -- Absolute Conditionnal Branch --> (BAcc)
                        next_state <= BAcc_s;
                    when 80 to 86 =>    -- Immediat Conditionnal Branch (BRIcc)
                        next_state <= BRIcc_s;
                    when 88 | 89 =>  -- In and Out --> (IN, OUT)
                        next_state <= IN_OUT_s;
                    when 90 | 91 =>  -- Load and Store --> (LW, SW)
                        next_state <= LSW_s;
                    when 96 to 103 =>  -- Immediat Load --> (LI)  
                        next_state <= LI_s;
                    when 127 =>  -- RESET                                    
                        next_state <= RESET_s;

                    when others =>
                        next_state <= FETCH_s;

                end case;
                
                
            when ALU_C_s => -- ADD, SUB, ADDC, SUBC, INC, DEC
                SelRA      <= IR(5 downto 3);
                SelA       <= '1';      	
                SelRB      <= IR(2 downto 0);
                SelB       <= '1';      	
                SelRD      <= IR(8 downto 6);
                EnRD       <= '1';  		
                EnCarry    <= '1';      	
                op         <= IR(14 downto 9);
                next_state <= FETCH_s;
                
                
            when ALU_s =>  -- MOVA, MOVB, NEGA, NEGB, AND, OR, XOR, NOT, SHL, SHR
                SelRA      <= IR(5 downto 3);	
                SelA       <= '1';      		
                SelRB      <= IR(2 downto 0);   
                SelB       <= '1';      		
                SelRD      <= IR(8 downto 6);   
                EnRD       <= '1';  	
                op         <= IR(14 downto 9);  
                next_state <= FETCH_s;


            when BRcc_s => -- BRcc
                SelCond <= IR(11 downto 9);   	
                SelRA   <= IR(5 downto 3);    	
                SelA    <= '0';         		
                SelRB   <= IR(2 downto 0);    	
                SelB    <= '1';
                op      <= "000000";
                if Cond = '1' then  
                    LoadPC     <= '1';
                    EnPC       <= '1';
                    SelPC      <= '0';
                    next_state <= WAITROM_s;
                else
                    next_state <= FETCH_s;
                end if;

                
            when BAcc_s => -- BAcc
                SelCond <= IR(11 downto 9);
                SelRA   <= IR(5 downto 3);
                SelRB   <= IR(2 downto 0);
                if Cond = '1' then
                    LoadPC     <= '1';
                    EnPC       <= '1';
                    SelPC      <= '1';
                    next_state <= WAITROM_s;
                else
                    next_state <= FETCH_s;
                end if;


            when BRIcc_s => -- BRIcc
                SelCond <= IR(11 downto 9);
                SelRA   <= "000";
                SelA    <= '0';
                SelB    <= '0';
                op      <= "000000";
                if Cond = '1' then
                    LoadPC     <= '1';
                    EnPC       <= '1';
                    SelPC      <= '0';
                    next_state <= WAITROM_s;
                else
                    next_state <= FETCH_s;
                end if;



            when IN_OUT_s => -- IN, OUT
                if IR(9) = '0' then
                    SelRin <= "11";
                    SelRD  <= IR(8 downto 6);
                    EnRd   <= '1';           
                else                         
                    SelRB <= IR(8 downto 6); 
                    EnOut <= '1';            
                end if;
                next_state <= FETCH_s;


            when LSW_s => -- LW, SW
                SelRA <= IR(5 downto 3);
                SelRB <= IR(2 downto 0);
                SelA  <= '1';
                SelB  <= '1';
                op    <= "000000";
				SelRd         <= IR(8 downto 6);
                if IR(9) = '1' then                    
                    CommandEnable <= '1';
                    WriteEnable   <= '1';
                    next_state    <= FETCH_s;
                else                    
                    CommandEnable <= '1';
                    ReadEnable    <= '1';
                    next_state    <= WAITRAM_s;
                end if;
                
                
            when LI_s => -- LI
                SelRd      <= IR(11 downto 9);
                EnRd       <= '1';
                SelB       <= '0';
                op         <= "000111";       
                SelRin     <= "00";
                next_state <= FETCH_s;
                
                
            when RESET_s =>  
                ResetPC    <= '1';
                EnPC       <= '0';
                next_state <= FETCH_s;
                
            when WAITROM_s =>
                next_state <= FETCH_s;
                
            when WAITRAM_s =>
                SelRin     <= "01";
                SelRd      <= IR(8 downto 6);
                EnRd       <= '1';
                next_state <= FETCH_s;
                
            when others =>
                next_state <= FETCH_s;
                
        end case;
        
    end process;  -- process_comb



end architecture arch;
