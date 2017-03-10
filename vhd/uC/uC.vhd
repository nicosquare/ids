library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uC is
    port (
        CLK    : in  std_logic;
        RESET  : in  std_logic;
        ExtIn  : in  std_logic_vector(15 downto 0);
        ExtOut : out std_logic_vector(15 downto 0)
        ) ;
end entity uC;

architecture arch of uC is

    component uP
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
    end component;

    component ROM
        port (
            CLK     : in  std_logic;
            Address : in  std_logic_vector(15 downto 0);
            Data    : out std_logic_vector(15 downto 0)
            ) ;
    end component;  -- ROM

    component RAM
        port (
            Address       : in  std_logic_vector (15 downto 0);
            DataIn        : in  std_logic_vector (15 downto 0);
            DataOut       : out std_logic_vector (15 downto 0);
            WriteEnable   : in  std_logic;
            ReadEnable    : in  std_logic;
            CommandEnable : in  std_logic;
            RESET         : in  std_logic;
            CLK           : in  std_logic
            );
    end component;


    signal Address_ROM, Data_ROM : std_logic_vector(15 downto 0);

    signal Address_RAM, Data_uC2RAM, Data_RAM2uC  : std_logic_vector(15 downto 0);
    signal WriteEnable, ReadEnable, CommandEnable : std_logic;

begin
    
    U_P : uP
        port map (
            CLK           => CLK,
            RESET         => RESET,
            ExtIn         => ExtIn,
            ExtOut        => ExtOut,
            AddrProg      => Address_ROM,
            DataProg      => Data_ROM,
            AddrData      => Address_RAM,
            DataOut       => Data_uC2RAM,
            DataIn        => Data_RAM2uC,
            CommandEnable => CommandEnable,
            WriteEnable   => WriteEnable,
            ReadEnable    => ReadEnable
            ) ;

    
    R_OM : ROM
        port map (
            CLK     => CLK,
            Address => Address_ROM,
            Data    => Data_ROM
            ) ;

    R_AM : RAM
        port map (
            Address       => Address_RAM,
            DataIn        => Data_uC2RAM,
            DataOut       => Data_RAM2uC,
            WriteEnable   => WriteEnable,
            ReadEnable    => ReadEnable,
            CommandEnable => CommandEnable,
            RESET         => RESET,
            CLK           => CLK
            );




end architecture arch;
