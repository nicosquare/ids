library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
    port(
        CLK                     : in  std_logic;
        RESET                   : in  std_logic;
        ADC_eoc                 : in  std_logic;
        ADC_convst              : out std_logic;
        ADC_rd                  : out std_logic;
        ADC_cs                  : out std_logic;
        DAC_wr                  : out std_logic;
        DAC_cs                  : out std_logic;
        DAC_ldac                : out std_logic;
        DAC_clr                 : out std_logic;
        Ram_Address             : out std_logic_vector(4 downto 0);
        Delay_Line_Address      : out std_logic_vector(4 downto 0);
        Delay_Line_sample_shift : out std_logic;
        Accu_ctrl               : out std_logic;
        Buff_OE                 : out std_logic
        ) ;
end fsm;

architecture A of FSM is

    	type   STATE is (INIT, CONV, LOAD, SET, FILTER);
    	signal Current_State, Next_State   : STATE;
    	signal Tap_Number, Next_Tap_Number : unsigned(4 downto 0);
    
	signal sig_CLK                     : std_logic;
	signal sig_RESET                   : std_logic;
	signal sig_ADC_eoc                 : std_logic;
	signal sig_ADC_convst              : std_logic;
	signal sig_ADC_rd                  : std_logic;
	signal sig_ADC_cs                  : std_logic;
	signal sig_DAC_wr                  : std_logic;
	signal sig_DAC_cs                  : std_logic;
	signal sig_DAC_ldac                : std_logic;
	signal sig_DAC_clr                 : std_logic;
	signal sig_Ram_Address             : std_logic_vector(4 downto 0);
	signal sig_Delay_Line_Address      : std_logic_vector(4 downto 0);
	signal sig_Delay_Line_sample_shift : std_logic;
	signal sig_Accu_ctrl               : std_logic;
	signal sig_Buff_OE                 : std_logic;
	
begin

	Ram_Address <= std_logic_vector(Tap_Number);
        Delay_Line_Address <= std_logic_vector(Tap_Number);

	sig_Clk <= CLK;
	sig_RESET <= RESET;
	ADC_convst <= sig_ADC_convst;
	ADC_cs <= sig_ADC_cs;
	sig_ADC_eoc <= ADC_eoc;
	ADC_rd <= sig_ADC_rd;                                  	
	DAC_wr <= sig_DAC_wr;                                                          
	Delay_Line_sample_shift <= sig_Delay_Line_sample_shift;                  
	Buff_OE <= sig_Buff_OE;   
	Accu_ctrl <= sig_Accu_ctrl;

	DAC_ldac <= sig_DAC_ldac;
	DAC_cs <= sig_DAC_cs;
	DAC_clr <= sig_DAC_clr;

    --process

    	P_SEQ : process(CLK)
    	begin
		if rising_edge(CLK) then
      			if (RESET = '1') then
      				current_state <= INIT;
				Tap_Number <= (others =>'0');
      			else
      				Current_State <= Next_State;
				Tap_Number <= Next_Tap_Number;
     			end if;
		end if; 
	end process P_SEQ;

    	P_COMB : process(current_state, ADC_eoc, Tap_Number)
    	begin

		ADC_convst <= '1';
		ADC_cs <= '1';
		ADC_rd <= '1';                                  	
		DAC_wr <= '1'; --*                                                          
		Delay_Line_sample_shift <= '0';                  
		Buff_OE <= '0';   
		Accu_ctrl <= '0';
		Next_Tap_Number <= (others =>'0');
		next_state <= current_state;
		DAC_ldac <= '0';
		DAC_cs <= '1';
		DAC_clr <= '1';

		case (current_state) is

       		when INIT => 
			ADC_convst <= '0';
			DAC_wr <= '0';
			DAC_cs <= '0';
			
			next_state <= CONV;		

		when CONV => 
			if ADC_eoc = '0' then
				next_state <= LOAD;
			else
				next_state <= CONV;	
			end if;

		when LOAD => 
			Delay_Line_sample_shift <= '1';
			ADC_cs <= '0';
			ADC_rd <= '0'; 
		
			next_state <= SET;

		when SET => 
			Accu_ctrl <= '1';

			next_state <= FILTER;

		when FILTER => 

			if Tap_Number < 31 then
				next_state <= current_state;
				Next_Tap_Number <= Tap_Number + 1;
			elsif	Tap_Number = 31 then	
				sig_buff_OE <= '1';
				next_state <= INIT;
			end if;

		when others =>
			next_state <= current_state;

     		end case;

   	end process P_COMB;

end A;

