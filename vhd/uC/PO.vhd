library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PO is
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
end entity;

architecture arch of PO is

    component GeneCond is
        port (
            RegIn   : in  std_logic_vector(15 downto 0);
            SelCond : in  std_logic_vector(2 downto 0);
            CondOut : out std_logic);
    end component;

    component UAL is
        port (
            A    : in  std_logic_vector(15 downto 0);
            B    : in  std_logic_vector(15 downto 0);
            op   : in  std_logic_vector(5 downto 0);
            CIN  : in  std_logic;
            S    : out std_logic_vector(15 downto 0);
            COUT : out std_logic
            );
    end component;


    signal sUAL   : std_logic_vector(15 downto 0);
    signal sPC    : std_logic_vector(15 downto 0);
    signal InData : std_logic_vector(15 downto 0);
    signal sEnRd  : std_logic_vector(7 downto 0);

    type   type_GPR is array (0 to 7) of std_logic_vector(15 downto 0);
    signal GPR : type_GPR;

    signal sRegA, sRegB                 : std_logic_vector(15 downto 0);
    signal sA, sB                       : std_logic_vector(15 downto 0);
    signal sCIN, sCOUT                  : std_logic;
    signal sPC_UAL, sPC_next, sPC_plus1 : std_logic_vector(15 downto 0);
    signal sResetPC                     : std_logic;
    signal sIR                          : std_logic_vector(15 downto 0);
    signal sImmediat                    : std_logic_vector(15 downto 0);

begin


    -- ALU Bloc
    U_AL : UAL
        port map(
            A    => sA,
            B    => sB,
            op   => op,
            CIN  => sCIN,
            S    => sUAL,
            COUT => sCOUT
            );

    -- RC Register
    RC : process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if EnCarry = '1' then
                sCIN <= sCOUT;
            end if;
        end if;
    end process;  -- RC

    AddrData <= sUAL;

    -- Mux SelA
    sA <= sPC when SelA = '0' else sRegA;

    -- Mux SelB
    sB <= sImmediat when SelB = '0' else sRegB;

    sImmediat <= "0000000" & sIR(8 downto 0) when sIR(8) = '0'
                 else "1111111" & sIR(8 downto 0);

    -- Generate Condition bloc
    G_ENECOND : GENECOND
        port map(
            RegIn   => sRegA,
            SelCond => SelCond,
            CondOut => Cond
            );

    -- PC Register
    PC : process(CLK, sResetPC)
    begin
        if sResetPC = '1' then
            sPC <= (others => '0');
        elsif CLK = '1' and CLK'event then
            if EnPC = '1' then
                sPC <= sPC_next;
            end if;
        end if;
    end process;  -- PC

    sResetPC <= RESET or ResetPC;
    AddrProg <= sPC;

    -- +1
    sPC_plus1 <= std_logic_vector(unsigned(sPC)+1);
    -- Mux LoadPC              
    sPC_next  <= sPC_plus1 when LoadPC = '0' else sPC_UAL;
    -- Mux SelPC
    sPC_UAL   <= sUAL      when SelPC = '0'  else sRegB;

    -- Rout Register
    Rout : process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if EnOut = '1' then
                ExtOut <= sRegB;
            end if;
        end if;
    end process;  -- Rout

    -- Instruction Register
    RegIR : process(CLK)
    begin
        if CLK = '1' and CLK'event then
            if EnIR = '1' then
                sIR <= DataProg;
            end if;
        end if;
    end process;  -- RegIR

    IR <= sIR;

    -- Registres Reguliers
    process(CLK)
    begin
        if CLK = '1' and CLK'event then
            for i in 0 to 7 loop
                if sEnRd(i) = '1' then
                    GPR(i) <= InData;
                end if;
            end loop;
        end if;
    end process;


    -- Mux SelRin
    MuxSelRin : process(SelRin, sUAL, DataIn, sPC, ExtIn)
    begin
        case SelRin is

            when "00"   => InData <= sUAL;
            when "01"   => InData <= DataIn;
            when "10"   => InData <= sPC;
            when "11"   => InData <= ExtIn;
            when others => InData <= sUAL;

        end case;
    end process;  -- MuxSelRin

    -- Mux SelRd
    MuxSelRd : process(SelRd, EnRd)
    begin
        sEnRd <= "00000000";
        sEnRd(to_integer(unsigned(SelRd))) <= EnRd;
    end process;  -- MuxSelRd


    -- Mux SelRA
    sRegA <= GPR(to_integer(unsigned(SelRA)));

    -- Mux SelRB
    sRegB <= GPR(to_integer(unsigned(SelRB)));

    -- Mux DataOut
    DataOut <= GPR(to_integer(unsigned(SelRd)));
    
end architecture arch;
