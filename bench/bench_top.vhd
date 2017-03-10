library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity bench_top is
end entity;  -- bench_top

library lib_VHDL;
--library lib_SYNTH;

architecture arch of bench_top is

    component top
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
    end component;

    signal CLK        : std_logic := '0';
    signal RESET      : std_logic;
    signal uC_Config  : std_logic_vector(15 downto 0);
    signal Filter_In  : std_logic_vector(7 downto 0);
    signal Filter_Out : std_logic_vector(7 downto 0);
    signal ADC_eoc    : std_logic;
    signal ADC_convst : std_logic;
    signal ADC_rd     : std_logic;
    signal ADC_cs     : std_logic;
    signal DAC_wr     : std_logic;
    signal DAC_cs     : std_logic;
    signal DAC_ldac   : std_logic;
    signal DAC_clr    : std_logic;

begin

    DUT : top
        port map (
            CLK        => CLK,
            RESET      => RESET,
            uC_Config  => uC_Config,
            Filter_In  => Filter_In,
            Filter_Out => Filter_Out,
            ADC_eoc    => ADC_eoc,
            ADC_convst => ADC_convst,
            ADC_rd     => ADC_rd,
            ADC_cs     => ADC_cs,
            DAC_wr     => DAC_wr,
            DAC_cs     => DAC_cs,
            DAC_ldac   => DAC_ldac,
            DAC_clr    => DAC_clr
            ) ;


    CLK   <= not(CLK) after 10 ns;
    RESET <= '1', '0' after 45 ns;


end architecture;  -- arch
