library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uP is
    port (
        CLK           : in  std_logic;
        RESET         : in  std_logic;
        ExtIn         : in  std_logic_vector(15 downto 0);
        ExtOut        : out std_logic_vector(15 downto 0);
        AddrProg      : out std_logic_vector(15 downto 0);
        DataProg      : in  std_logic_vector(15 downto 0);
        AddrData      : out std_logic_vector(15 downto 0);
        DataOut       : out std_logic_vector(15 downto 0);
        DataIn        : in  std_logic_vector(15 downto 0);
        CommandEnable : out std_logic;
        WriteEnable   : out std_logic;
        ReadEnable    : out std_logic
        ) ;
end entity uP;

architecture arch of uP is

    component PO
        port (
            CLK      : in  std_logic;
            RESET    : in  std_logic;
            DataIn   : in  std_logic_vector(15 downto 0);
            ExtIn    : in  std_logic_vector(15 downto 0);
            SelRin   : in  std_logic_vector(1 downto 0);
            EnRd     : in  std_logic;
            SelRD    : in  std_logic_vector(2 downto 0);
            SelRA    : in  std_logic_vector(2 downto 0);
            SelRB    : in  std_logic_vector(2 downto 0);
            SelCond  : in  std_logic_vector(2 downto 0);
            Cond     : out std_logic;
            SelA     : in  std_logic;
            SelB     : in  std_logic;
            op       : in  std_logic_vector(5 downto 0);
            EnCarry  : in  std_logic;
            AddrData : out std_logic_vector(15 downto 0);
            DataOut  : out std_logic_vector(15 downto 0);
            SelPC    : in  std_logic;
            LoadPC   : in  std_logic;
            EnPC     : in  std_logic;
            ResetPC  : in  std_logic;
            AddrProg : out std_logic_vector(15 downto 0);
            DataProg : in  std_logic_vector(15 downto 0);
            IR       : out std_logic_vector(15 downto 0);
            EnIR     : in  std_logic;
            EnOut    : in  std_logic;
            ExtOut   : out std_logic_vector(15 downto 0)
            ) ;
    end component;

    component PC
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
    end component;


    signal SelRin   : std_logic_vector(1 downto 0);
    signal EnRd     : std_logic;
    signal SelRD    : std_logic_vector(2 downto 0);
    signal SelRA    : std_logic_vector(2 downto 0);
    signal SelRB    : std_logic_vector(2 downto 0);
    signal SelCond  : std_logic_vector(2 downto 0);
    signal Cond     : std_logic;
    signal SelA     : std_logic;
    signal SelB     : std_logic;
    signal op       : std_logic_vector(5 downto 0);
    signal EnCarry  : std_logic;
    signal SelPC    : std_logic;
    signal LoadPC   : std_logic;
    signal EnPC     : std_logic;
    signal ResetPC  : std_logic;
    signal IR       : std_logic_vector(15 downto 0);
    signal EnIR     : std_logic;
    signal EnOut    : std_logic;
    


begin
	
	
	P_O : PO
    port map (
        CLK      => CLK,
        RESET    => RESET,
        DataIn   => DataIn,
        ExtIn    => ExtIn,
        SelRin   => SelRin,
        EnRd     => EnRd,
        SelRD    => SelRD,
        SelRA    => SelRA,
        SelRB    => SelRB,
        SelCond  => SelCond,
        Cond     => Cond,
        SelA     => SelA,
        SelB     => SelB,
        op       => op,
        EnCarry  => EnCarry,
        AddrData => AddrData,
        DataOut  => DataOut,
        SelPC    => SelPC,
        LoadPC   => LoadPC,
        EnPC     => EnPC,
        ResetPC  => ResetPC,
        AddrProg => AddrProg,
        DataProg => DataProg,
        IR       => IR,
        EnIR     => EnIR,
        EnOut    => EnOut,
        ExtOut   => ExtOut
        ) ;


	P_C : PC
    port map (
        CLK           => CLK,
        RESET         => RESET,
        SelRin        => SelRin,
        EnRd          => EnRd,
        SelRD         => SelRD,
        SelRA         => SelRA,
        SelRB         => SelRB,
        SelCond       => SelCond,
        Cond          => Cond,
        SelA          => SelA,
        SelB          => SelB,
        op            => op,
        EnCarry       => EnCarry,
        SelPC         => SelPC,
        LoadPC        => LoadPC,
        EnPC          => EnPC,
        ResetPC       => ResetPC,
        IR            => IR,
        EnIR          => EnIR,
        EnOut         => EnOut,
        CommandEnable => CommandEnable,
        WriteEnable   => WriteEnable,
        ReadEnable    => ReadEnable
        ) ;

	

end architecture arch;
