library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity top is
    port (
        CLK        : in  std_logic;
        RESET      : in  std_logic;
        uC_Config  : in  std_logic_vector(15 downto 0);
        Filter_In  : in  std_logic_vector(7 downto 0);
        Filter_Out : out std_logic_vector(7 downto 0);
        ADC_eoc    : in  std_logic;
        ADC_convst : out std_logic;
        ADC_rd     : out std_logic;
        ADC_cs     : out std_logic;
        DAC_wr     : out std_logic;
        DAC_cs     : out std_logic;
        DAC_ldac   : out std_logic;
        DAC_clr    : out std_logic
        ) ;
end entity top;

architecture RTL of top is
    
    component uC
        port (
            CLK    : in  std_logic;
            RESET  : in  std_logic;
            ExtIn  : in  std_logic_vector(15 downto 0);
            ExtOut : out std_logic_vector(15 downto 0)
            ) ;
    end component;


    component FILTER
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
    end component;

	signal uC_to_Filter : std_logic_vector(15 downto 0);

begin

    u_uC : uC
        port map (
            CLK    => CLK,
            RESET  => RESET,
            ExtIn  => uC_Config,
            ExtOut => uC_to_Filter
            ) ;



    u_Filter : FILTER
        port map(
            CLK        => CLK,
            RESET      => RESET,
            Filter_in  => Filter_in,
            ADC_eoc    => ADC_eoc,
            ADC_convst => ADC_Convst,
            ADC_rd     => ADC_rd,
            ADC_cs     => ADC_cs,
            DAC_wr     => DAC_wr,
            DAC_cs     => DAC_cs,
            DAC_ldac   => DAC_ldac,
            DAC_clr    => DAC_clr,
            Filter_out => Filter_out,
            uC_address => uC_to_Filter(12 downto 8),
            uC_data_in => uC_to_Filter(7 downto 0),
            uC_wb      => uC_to_Filter(14),
            uC_enable  => uC_to_Filter(15)
            ); 


end architecture RTL;
