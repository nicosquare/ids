library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;



library modelsim_lib;
use modelsim_lib.util.all;

library lib_VHDL;
--library lib_SYNTH;

entity bench_filter is
end entity;  -- bench_filter

architecture arch of bench_filter is

    component filter
        port (
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
	);
    end component;

    signal CLK        : std_logic := '0';
    signal RESET      : std_logic;
    signal Filter_In  : std_logic_vector(7 downto 0):="00000000";
    signal Filter_Out : std_logic_vector(7 downto 0);
    signal ADC_eocb    : std_logic;
    signal ADC_convstb : std_logic;
    signal ADC_rdb     : std_logic;
    signal ADC_csb     : std_logic;
    signal DAC_wrb     : std_logic;
    signal DAC_csb     : std_logic;
    signal DAC_ldacb   : std_logic;
    signal DAC_clrb    : std_logic;
    signal Buff_OE    : std_logic;
    signal ADC_convstb_delayed,ADC_eocb_delayed        : std_logic;

    signal uC_address : std_logic_vector(4 downto 0);
    signal uC_data_in : std_logic_vector(7 downto 0);
    signal uC_wb      : std_logic;
    signal uC_enable  : std_logic;


    signal Accu_out   : std_logic_vector(20 downto 0);
    type     tab_rom is array (0 to 31) of std_logic_vector(7 downto 0);
  constant filter_rom : tab_rom :=
    (0   => "00000000" , 1 => "00000100" , 2 => "00000001" , 3 => "11111101" ,
      --  0x00               0x04               0x01               0xFD
      4  => "11111110" , 5 => "00000100", 6 => "00000101" , 7 => "11111100" ,
      --  0xFE               0x04               0x05               0xFC
      8  => "11111000" , 9 => "00000011" , 10 => "00001101" , 11 => "00000001" ,
      --  0xF8               0x03               0x0D               0x01
      12 => "11101010" , 13 => "11110100" , 14 => "00101110" , 15 => "01101010" ,
      --  0xEA               0xF4               0xE2E              0x6A
      16 => "01101010" , 17 => "00101110" , 18 => "11110100" , 19 => "11101010" ,
      --  0x6A               0x2E               0xF4               0xEA
      20 => "00000001" , 21 => "00001101" , 22 => "00000011" , 23 => "11111000" ,
      --  0x01               0x0D               0x03               0xF8
      24 => "11111100" , 25 => "00000101" , 26 => "00000100" , 27 => "11111110" ,
      --  0xFC               0x05               0x04               0xFE
      28 => "11111101" , 29 => "00000001" , 30 => "00000100" , 31 => "00000000") ;
      --  0xFD               0x01               0x04               0x00
  
begin

    DUT : filter
        port map (
            CLK        => CLK,
            RESET      => RESET,
            Filter_In  => Filter_In,
            Filter_Out => Filter_Out,
            ADC_eoc    => ADC_eocb,
            ADC_convst => ADC_convstb,
            ADC_rd     => ADC_rdb,
            ADC_cs     => ADC_csb,
            DAC_wr     => DAC_wrb,
            DAC_cs     => DAC_csb,
            DAC_ldac   => DAC_ldacb,
            DAC_clr    => DAC_clrb,
            uC_address =>uC_address,
            uC_data_in =>uC_data_in,
            uC_wb      =>uC_wb,
            uC_enable =>uC_enable
            ) ;


    CLK   <= not(CLK) after 10 ns;
    RESET <= '1', '0' after 45 ns;

uC_enable <= '1'; --uC pas utilise
uC_wb <= '1'; --uC pas utilise
      
ADC_convstb_delayed<= ADC_convstb'delayed(0 ns);
ADC_eocb_delayed<= ADC_eocb'delayed(0 ns);

   -- purpose: time constraints verification 
   -- type   : combinational
   -- inputs : ADC_convstb
   -- outputs: 
   verif_time: process 
     variable t : time;
   begin  -- process verif_time
      wait on ADC_convstb;
     if ADC_convstb'event and ADC_convstb='0' then
       t:= ADC_rdb'last_event;
       assert t>= (30 ns)  report "new conversion starts 30 ns after a read" severity warning;
      wait on ADC_convstb;
            t:= ADC_convstb_delayed'last_event;
       assert t>= (20 ns)  report "a conversion pulse is at least 20 ns" severity warning;
       wait on ADC_eocb;
       t:= ADC_convstb_delayed'last_event;
       assert (t<= (420 ns) and t>= (120 ns))  report "eoc is enabled between 120 ns and 420 ns after a start conversion" severity warning;
       wait on ADC_eocb;
       t:= ADC_eocb_delayed'last_event;
       assert (t<= (110 ns) and t>= (70 ns))  report "eoc pulse is at least 70 ns and at most 110 ns" severity warning;


   end if;
  
   end process verif_time;

    


--Note: ce process permet d'acceder a des signaux internes, ce qui normallement ne seraient pas accessibles
 --c'est une fonctionnalite propre a Modelsim

    spy_process: process
      begin  -- process spy_process
        init_signal_spy("/bench_filter/DUT/Accu_out", "accu_out",1,-1);
        init_signal_spy("/bench_filter/DUT/Buff_OE", "buff_OE",1,-1);
      
         wait;
      end process spy_process;
  

Filter_in_rep_impuls: process 
 variable j :natural range 0 to 31 ; 
begin  -- process Filter_in_rep_impuls
--wait until enable='1';

for i in 0 to 31 loop
  
  wait until ADC_eocb='0';
j:=i;
  if i=0  then
    Filter_in<="00000001";

    
  else
    Filter_in<=(others=>'0');
  end if;
  wait until buff_OE='1';
-- Completer le assert
--  assert (Accu_out(7 downto 0)= ?? )  report "error rep_impul" severity error;
end loop;  -- i
end process Filter_in_rep_impuls;




	-- Test le bon fonctionnement du CNA;
    process_ADC : process(ADC_Convstb)
    begin
        if ADC_Convstb'event and ADC_Convstb = '0' then
            ADC_eocb <= '1', '0' after 300 ns, '1' after 400 ns;
        end if;
    end process;  -- process_ADC


--NB: les deux process suivant sont donnes "en l'etat" comme reference
--    de l'access aux fichiers en lecture/ecriture
--    leur fonctionnement n'est pas garanti


--LECTURE: process
-- variable L: line;	-- le type LINE est un pointeur
-- file ENTREES: text open READ_MODE is "entrees.dat";	-- fichier spécifié
-- variable A: std_logic_vector(7 downto 0);	 -- variables à lire
--begin

-- wait on ADC_rdb='0' and ADC_csb='0';
-- readline(ENTREES, L);	-- lecture d'une nouvelle ligne dans le fichier
-- read(L, A);	-- lecture dans la ligne du 1er symbole => BIT
-- Filter_in <= A;	-- utilisation pour la simulation
--end process LECTURE;
----

      
--ECRITURE: process
-- variable L: line;
-- file SORTIES: text open WRITE_MODE is "sorties.dat";
--begin
--  wait on DAC_wrb='0' and DAC_csb='0';
--  if DAC_ldacb='0' and DAC_clrb='1' then
--    write(L, Filter_Out);	-- écriture de S dans la ligne
--    writeline(SORTIES, L); -- écriture de la ligne dans le fichier
-- else
--   write("00000000", Filter_Out);	-- écriture de S dans la ligne
--    writeline(SORTIES, L); -- écriture de la ligne dans le fichier
--  end if;
--end process ECRITURE;

      


end architecture;  -- arch
