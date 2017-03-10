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
    type   STATE is (IDLE, START);
    signal Current_State, Next_State   : STATE;
    signal Tap_Number, Next_Tap_Number : std_logic_vector(4 downto 0);

begin

    --concurrent
  
    --process

    P_SEQ : process(clk)
    begin
     if rising_edge(clk) then
      if (RESET = '1') then
      current_state <= IDLE;
      else
      Current_State <= Next_State;
     end if;
    end if; 
     -- A completer
   end process P_SEQ;

    P_COMB : process(current_state)
    begin
     case (current_state) is
       when IDLE => Next_State <=IDLE;
       when others => Next_State <=IDLE;
     end case;
      -- A completer
   end process P_COMB;

end A;

