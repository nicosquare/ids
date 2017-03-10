library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
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
end entity RAM;

architecture Behavioral of RAM is

    -- RAM 128 x 2 Bytes.
    constant low_address  : natural := 0;
    constant high_address : natural := 2**8-1;

    type type_mem is array (low_address to high_address) of std_logic_vector(15 downto 0);

    signal mem_ram : type_mem;

begin
    process(CLK)
    begin
        if (CLK'event and CLK = '1') then
            if (CommandEnable = '1' and ReadEnable = '1') then
                DataOut <= mem_ram(to_integer(unsigned(Address)));
            else
                DataOut <= (others => '0');
            end if;
        end if;
    end process;

    process (CLK)
    begin
        if RESET = '1' then

            -- hlp
            mem_ram(128) <= X"0000";
            mem_ram(129) <= X"0004";
            mem_ram(130) <= X"0001";
            mem_ram(131) <= X"00FD";
            mem_ram(132) <= X"00FE";
            mem_ram(133) <= X"0004";
            mem_ram(134) <= X"0005";
            mem_ram(135) <= X"00FC";
            mem_ram(136) <= X"00F8";
            mem_ram(137) <= X"0003";
            mem_ram(138) <= X"000D";
            mem_ram(139) <= X"0001";
            mem_ram(140) <= X"00EA";
            mem_ram(141) <= X"00F4";
            mem_ram(142) <= X"002E";
            mem_ram(143) <= X"006A";
            mem_ram(144) <= X"006A";
            mem_ram(145) <= X"002E";
            mem_ram(146) <= X"00F4";
            mem_ram(147) <= X"00EA";
            mem_ram(148) <= X"0001";
            mem_ram(149) <= X"000D";
            mem_ram(150) <= X"0003";
            mem_ram(151) <= X"00F8";
            mem_ram(152) <= X"00FC";
            mem_ram(153) <= X"0005";
            mem_ram(154) <= X"0004";
            mem_ram(155) <= X"00FE";
            mem_ram(156) <= X"00FD";
            mem_ram(157) <= X"0001";
            mem_ram(158) <= X"0004";
            mem_ram(159) <= X"0000";


            -- hhp
            mem_ram(160) <= X"0000";
			mem_ram(161) <= X"00FC";
            mem_ram(162) <= X"0001";
            mem_ram(163) <= X"0003";
            mem_ram(164) <= X"00FE";
            mem_ram(165) <= X"00FC";
            mem_ram(166) <= X"0005";
            mem_ram(167) <= X"0004";
            mem_ram(168) <= X"00F8";
            mem_ram(169) <= X"00FD";
            mem_ram(170) <= X"000D";
            mem_ram(171) <= X"00FF";
            mem_ram(172) <= X"00EA";
            mem_ram(173) <= X"000C";
            mem_ram(174) <= X"002E";
            mem_ram(175) <= X"0096";
            mem_ram(176) <= X"006A";
            mem_ram(177) <= X"00D2";
            mem_ram(178) <= X"00F4";
            mem_ram(179) <= X"0016";
            mem_ram(180) <= X"0001";
            mem_ram(181) <= X"00F3";
            mem_ram(182) <= X"0003";
            mem_ram(183) <= X"0008";
            mem_ram(184) <= X"00FC";
            mem_ram(185) <= X"00FB";
            mem_ram(186) <= X"0004";
            mem_ram(187) <= X"0002";
            mem_ram(188) <= X"00FD";
            mem_ram(189) <= X"00FF";
            mem_ram(190) <= X"0004";
            mem_ram(191) <= X"0000";

			
			--hbp
			mem_ram(192) <= X"00FF";
			mem_ram(193) <= X"0003";
			mem_ram(194) <= X"0005";
			mem_ram(195) <= X"00FD";
			mem_ram(196) <= X"0002";
			mem_ram(197) <= X"00F9";
			mem_ram(198) <= X"00F8";
			mem_ram(199) <= X"0003";
			mem_ram(200) <= X"00FB";
			mem_ram(201) <= X"000E";
			mem_ram(202) <= X"0011";
			mem_ram(203) <= X"00F7";
			mem_ram(204) <= X"000C";
			mem_ram(205) <= X"00D6";
			mem_ram(206) <= X"00B9";
			mem_ram(207) <= X"0058";
			mem_ram(208) <= X"0058";
			mem_ram(209) <= X"00B9";
			mem_ram(210) <= X"00D6";
			mem_ram(211) <= X"000C";
			mem_ram(212) <= X"00F7";
			mem_ram(213) <= X"0011";
			mem_ram(214) <= X"000E";
			mem_ram(215) <= X"00FB";
			mem_ram(216) <= X"0003";
			mem_ram(217) <= X"00F8";
			mem_ram(218) <= X"00F9";
			mem_ram(219) <= X"0002";
			mem_ram(220) <= X"00FD";
			mem_ram(221) <= X"0005";
			mem_ram(222) <= X"0003";
			mem_ram(223) <= X"00FF";
			
			
			--ham
			mem_ram(224) <= X"00FF";
			mem_ram(225) <= X"00FC";
			mem_ram(226) <= X"0001";
			mem_ram(227) <= X"00FA";
			mem_ram(228) <= X"000D";
			mem_ram(229) <= X"000F";
			mem_ram(230) <= X"00F6";
			mem_ram(231) <= X"0000";
			mem_ram(232) <= X"00F9";
			mem_ram(233) <= X"00FB";
			mem_ram(234) <= X"00F7";
			mem_ram(235) <= X"00E1";
			mem_ram(236) <= X"0031";
			mem_ram(237) <= X"0031";
			mem_ram(238) <= X"00EE";
			mem_ram(239) <= X"005E";
			mem_ram(240) <= X"005E";
			mem_ram(241) <= X"00EE";
			mem_ram(242) <= X"0031";
			mem_ram(243) <= X"0031";
			mem_ram(244) <= X"00E1";
			mem_ram(245) <= X"00F7";
			mem_ram(246) <= X"00FB";
			mem_ram(247) <= X"00F9";
			mem_ram(248) <= X"0000";
			mem_ram(249) <= X"00F6";
			mem_ram(250) <= X"000F";
			mem_ram(251) <= X"000D";
			mem_ram(252) <= X"00FA";
			mem_ram(253) <= X"0001";
			mem_ram(254) <= X"00FC";
			mem_ram(255) <= X"00FF";

            

          elsif (CLK'event and CLK = '1') then
             if (CommandEnable = '1' and WriteEnable = '1') then
                mem_ram(to_integer(unsigned(Address))) <= DataIn;
            end if;
        end if;
    end process;
    
end Behavioral;

