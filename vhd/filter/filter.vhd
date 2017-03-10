-----------------------------FILTRE.vhd----------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FILTER is
    port(
        CLK        : in  std_logic;
        RESET      : in  std_logic;
        Filter_In  : in  std_logic_vector(7 downto 0);
        Filter_Out : out std_logic_vector(7 downto 0);
        ADC_eoc    : in  std_logic;
        ADC_convst : out std_logic;
        ADC_rd     : out std_logic;
        ADC_cs     : out std_logic;
        DAC_wr     : out std_logic;
        DAC_cs     : out std_logic;
        DAC_ldac   : out std_logic;
        DAC_clr    : out std_logic;
        uC_address : in  std_logic_vector(4 downto 0);
        uC_data_in : in  std_logic_vector(7 downto 0);
        uC_wb      : in  std_logic;
        uC_enable  : in  std_logic
        ) ;

end FILTER;

architecture A of FILTER is
    
    component DELAY_LINE
        port(
            RESET                   : in  std_logic;
            CLK                     : in  std_logic;
            Delay_Line_in           : in  std_logic_vector(7 downto 0);
            Delay_Line_address      : in  std_logic_vector(4 downto 0);
            Delay_Line_sample_shift : in  std_logic;
            Delay_Line_out          : out std_logic_vector(7 downto 0)
            ) ;
    end component;

    component COEFF_RAM
        port (
            CLK      : in  std_logic;
            RESET    : in  std_logic;
            data_in  : in  std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0);
            address  : in  std_logic_vector(4 downto 0);
            wb       : in  std_logic
            ) ;
    end component;

    component MULT
        port(Mult_in_A : in  std_logic_vector(7 downto 0);
             Mult_in_B : in  std_logic_vector(7 downto 0);
             Mult_out  : out std_logic_vector(15 downto 0)) ;
    end component;

    component ACCU
        port(
            CLK       : in  std_logic;
            RESET     : in  std_logic;
            Accu_in   : in  std_logic_vector(15 downto 0);
            Accu_ctrl : in  std_logic;
            Accu_out  : out std_logic_vector(20 downto 0)
            ) ;
    end component;

    component BUFF
        port(
            CLK      : in  std_logic;
            RESET    : in  std_logic;
            Buff_OE  : in  std_logic;
            Buff_in  : in  std_logic_vector(7 downto 0);
            Buff_Out : out std_logic_vector(7 downto 0)
            ) ;
    end component;

    component FSM
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
            Buff_OE                 : out std_logic) ;
    end component;


    signal Delay_Line_sample_shift : std_logic;
    signal Accu_ctrl               : std_logic;
    signal Buff_OE                 : std_logic;
    signal FSM_Buff_OE             : std_logic;
    signal Delay_Line_out          : std_logic_vector(7 downto 0);
    signal Mult_out                : std_logic_vector(15 downto 0);
    signal Accu_out                : std_logic_vector(20 downto 0);

    signal RAM_Address : std_logic_vector(4 downto 0);
    signal FSM_Address : std_logic_vector(4 downto 0);

    signal RAM_data_out       : std_logic_vector(7 downto 0);
    signal Delay_Line_Address : std_logic_vector(4 downto 0);


begin


    U1 : Delay_Line port map (
        CLK                     => CLK,
        RESET                   => RESET,
        Delay_Line_in           => Filter_In,
        Delay_Line_Address      => Delay_Line_Address,
        Delay_Line_sample_shift => Delay_Line_sample_shift,
        Delay_Line_out          => Delay_Line_out
        );

    Ram_Address <= uC_address when uC_enable = '0' else FSM_Address;
    
    U2 : coeff_ram port map(
        CLK      => CLK,
        RESET    => RESET,
        data_in  => uC_data_in,
        data_out => RAM_data_out,
        address  => RAM_Address,
        wb       => uC_wb
        );


    U3 : MULT port map (
        Mult_In_A => Delay_Line_out,
        Mult_In_B => RAM_data_out,
        Mult_out  => Mult_out
        );

    U4 : ACCU port map (
        CLK       => CLK,
        RESET     => RESET,
        Accu_In   => Mult_out,
        Accu_ctrl => Accu_ctrl,
        Accu_out  => Accu_out
        );

    U5 : BUFF port map (
        CLK      => CLK,
        RESET    => RESET,
        Buff_OE  => Buff_OE,
        Buff_In  => Accu_out(16 downto 9),
        Buff_out => Filter_Out
        );

    Buff_OE <= '0' when uC_enable = '0' else FSM_Buff_OE;

    U6 : FSM port map (
        CLK                     => CLK,
        RESET                   => RESET,
        ADC_eoc                 => ADC_eoc,
        ADC_convst              => ADC_convst,
        ADC_rd                  => ADC_rd,
        ADC_cs                  => ADC_cs,
        DAC_wr                  => DAC_wr,
        DAC_cs                  => DAC_cs,
        DAC_ldac                => DAC_ldac,
        DAC_clr                 => DAC_clr,
        Ram_Address             => FSM_Address,
        Delay_Line_Address      => Delay_Line_Address,
        Delay_Line_sample_shift => Delay_Line_sample_shift,
        Accu_ctrl               => Accu_ctrl,
        Buff_OE                 => FSM_Buff_OE
        );

end A;

