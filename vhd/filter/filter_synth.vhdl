
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_FILTER is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_FILTER;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity MULT_DW01_add_0 is

   port( A, B : in std_logic_vector (13 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (13 downto 0);  CO : out std_logic);

end MULT_DW01_add_0;

architecture SYN_cla of MULT_DW01_add_0 is

   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component IMAJ30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI210
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI210
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI220
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI2110
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component IMUX20
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   signal SUM_13_port, SUM_12_port, SUM_11_port, SUM_10_port, SUM_9_port, 
      SUM_8_port, SUM_7_port, SUM_6_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, 
      n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24
      , n25, n26, n27, n28, n29, n30, n31, n32, n33, n34 : std_logic;

begin
   SUM <= ( SUM_13_port, SUM_12_port, SUM_11_port, SUM_10_port, SUM_9_port, 
      SUM_8_port, SUM_7_port, SUM_6_port, A(5), A(4), A(3), A(2), A(1), A(0) );
   
   U2 : INV3 port map( A => n26, Q => n4);
   U3 : INV3 port map( A => n13, Q => n5);
   U4 : INV3 port map( A => n14, Q => n8);
   U5 : INV3 port map( A => n30, Q => n6);
   U6 : INV3 port map( A => n25, Q => n7);
   U7 : INV3 port map( A => n22, Q => n2);
   U8 : INV3 port map( A => n28, Q => n3);
   U9 : INV3 port map( A => n21, Q => n1);
   U10 : INV3 port map( A => A(6), Q => n9);
   U11 : INV3 port map( A => B(6), Q => n10);
   U12 : XNR20 port map( A => n11, B => n12, Q => SUM_9_port);
   U13 : NAND20 port map( A => n7, B => n13, Q => n12);
   U14 : OAI210 port map( A => n14, B => n15, C => n16, Q => SUM_8_port);
   U15 : IMUX20 port map( A => n17, B => n18, S => B(8), Q => n16);
   U16 : NOR20 port map( A => A(8), B => n8, Q => n18);
   U17 : XNR20 port map( A => A(8), B => n14, Q => n17);
   U18 : XOR30 port map( A => A(7), B => B(7), C => n19, Q => SUM_7_port);
   U19 : AOI210 port map( A => n10, B => n9, C => n19, Q => SUM_6_port);
   U20 : XNR30 port map( A => B(13), B => A(13), C => n20, Q => SUM_13_port);
   U21 : AOI210 port map( A => n2, B => A(12), C => n1, Q => n20);
   U22 : OAI210 port map( A => A(12), B => n2, C => B(12), Q => n21);
   U23 : XOR30 port map( A => B(12), B => A(12), C => n2, Q => SUM_12_port);
   U24 : AOI2110 port map( A => n23, B => A(11), C => n3, D => n24, Q => n22);
   U25 : NOR40 port map( A => n25, B => n14, C => n26, D => n27, Q => n24);
   U26 : OAI220 port map( A => A(11), B => B(11), C => A(8), D => B(8), Q => 
                           n27);
   U27 : OAI210 port map( A => A(11), B => n23, C => B(11), Q => n28);
   U28 : OAI210 port map( A => n26, B => n6, C => n29, Q => n23);
   U29 : OAI210 port map( A => n15, B => n25, C => n13, Q => n30);
   U30 : XOR30 port map( A => B(11), B => A(11), C => n31, Q => SUM_11_port);
   U31 : OAI210 port map( A => n26, B => n32, C => n29, Q => n31);
   U32 : XOR20 port map( A => n32, B => n33, Q => SUM_10_port);
   U33 : NAND20 port map( A => n4, B => n29, Q => n33);
   U34 : NAND20 port map( A => B(10), B => A(10), Q => n29);
   U35 : NOR20 port map( A => B(10), B => A(10), Q => n26);
   U36 : AOI210 port map( A => n11, B => n7, C => n5, Q => n32);
   U37 : NAND20 port map( A => B(9), B => A(9), Q => n13);
   U38 : NOR20 port map( A => B(9), B => A(9), Q => n25);
   U39 : OAI210 port map( A => n14, B => n34, C => n15, Q => n11);
   U40 : NAND20 port map( A => B(8), B => A(8), Q => n15);
   U41 : NOR20 port map( A => A(8), B => B(8), Q => n34);
   U42 : IMAJ30 port map( A => B(7), B => n19, C => A(7), Q => n14);
   U43 : NOR20 port map( A => n10, B => n9, Q => n19);

end SYN_cla;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity MULT_DW02_mult_0 is

   port( A, B : in std_logic_vector (7 downto 0);  TC : in std_logic;  PRODUCT 
         : out std_logic_vector (15 downto 0));

end MULT_DW02_mult_0;

architecture SYN_csa of MULT_DW02_mult_0 is

   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component LOGIC0
      port( Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component MULT_DW01_add_0
      port( A, B : in std_logic_vector (13 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (13 downto 0);  CO : out std_logic);
   end component;
   
   component ADD32
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal X_Logic0_port, ab_7_7_port, ab_7_6_port, ab_7_5_port, ab_7_4_port, 
      ab_7_3_port, ab_7_2_port, ab_7_1_port, ab_7_0_port, ab_6_7_port, 
      ab_6_6_port, ab_6_5_port, ab_6_4_port, ab_6_3_port, ab_6_2_port, 
      ab_6_1_port, ab_6_0_port, ab_5_7_port, ab_5_6_port, ab_5_5_port, 
      ab_5_4_port, ab_5_3_port, ab_5_2_port, ab_5_1_port, ab_5_0_port, 
      ab_4_7_port, ab_4_6_port, ab_4_5_port, ab_4_4_port, ab_4_3_port, 
      ab_4_2_port, ab_4_1_port, ab_4_0_port, ab_3_7_port, ab_3_6_port, 
      ab_3_5_port, ab_3_4_port, ab_3_3_port, ab_3_2_port, ab_3_1_port, 
      ab_3_0_port, ab_2_7_port, ab_2_6_port, ab_2_5_port, ab_2_4_port, 
      ab_2_3_port, ab_2_2_port, ab_2_1_port, ab_2_0_port, ab_1_7_port, 
      ab_1_6_port, ab_1_5_port, ab_1_4_port, ab_1_3_port, ab_1_2_port, 
      ab_1_1_port, ab_1_0_port, ab_0_7_port, ab_0_6_port, ab_0_5_port, 
      ab_0_4_port, ab_0_3_port, ab_0_2_port, ab_0_1_port, CARRYB_7_7_port, 
      CARRYB_7_6_port, CARRYB_7_5_port, CARRYB_7_4_port, CARRYB_7_3_port, 
      CARRYB_7_2_port, CARRYB_7_1_port, CARRYB_7_0_port, CARRYB_6_6_port, 
      CARRYB_6_5_port, CARRYB_6_4_port, CARRYB_6_3_port, CARRYB_6_2_port, 
      CARRYB_6_1_port, CARRYB_6_0_port, CARRYB_5_6_port, CARRYB_5_5_port, 
      CARRYB_5_4_port, CARRYB_5_3_port, CARRYB_5_2_port, CARRYB_5_1_port, 
      CARRYB_5_0_port, CARRYB_4_6_port, CARRYB_4_5_port, CARRYB_4_4_port, 
      CARRYB_4_3_port, CARRYB_4_2_port, CARRYB_4_1_port, CARRYB_4_0_port, 
      CARRYB_3_6_port, CARRYB_3_5_port, CARRYB_3_4_port, CARRYB_3_3_port, 
      CARRYB_3_2_port, CARRYB_3_1_port, CARRYB_3_0_port, CARRYB_2_6_port, 
      CARRYB_2_5_port, CARRYB_2_4_port, CARRYB_2_3_port, CARRYB_2_2_port, 
      CARRYB_2_1_port, CARRYB_2_0_port, CARRYB_1_6_port, CARRYB_1_5_port, 
      CARRYB_1_4_port, CARRYB_1_3_port, CARRYB_1_2_port, CARRYB_1_1_port, 
      CARRYB_1_0_port, SUMB_7_7_port, SUMB_7_6_port, SUMB_7_5_port, 
      SUMB_7_4_port, SUMB_7_3_port, SUMB_7_2_port, SUMB_7_1_port, SUMB_7_0_port
      , SUMB_6_6_port, SUMB_6_5_port, SUMB_6_4_port, SUMB_6_3_port, 
      SUMB_6_2_port, SUMB_6_1_port, SUMB_5_6_port, SUMB_5_5_port, SUMB_5_4_port
      , SUMB_5_3_port, SUMB_5_2_port, SUMB_5_1_port, SUMB_4_6_port, 
      SUMB_4_5_port, SUMB_4_4_port, SUMB_4_3_port, SUMB_4_2_port, SUMB_4_1_port
      , SUMB_3_6_port, SUMB_3_5_port, SUMB_3_4_port, SUMB_3_3_port, 
      SUMB_3_2_port, SUMB_3_1_port, SUMB_2_6_port, SUMB_2_5_port, SUMB_2_4_port
      , SUMB_2_3_port, SUMB_2_2_port, SUMB_2_1_port, SUMB_1_6_port, 
      SUMB_1_5_port, SUMB_1_4_port, SUMB_1_3_port, SUMB_1_2_port, SUMB_1_1_port
      , A1_12_port, A1_11_port, A1_10_port, A1_9_port, A1_8_port, A1_7_port, 
      A1_6_port, A1_5_port, A1_4_port, A1_3_port, A1_2_port, A1_1_port, 
      A1_0_port, A2_13_port, A2_12_port, A2_11_port, A2_10_port, A2_9_port, 
      A2_8_port, A2_7_port, A2_6_port, n3, n4, n5, n6, n7, n8, n9, n10, n11, 
      n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26
      , n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, 
      n41, n42, n43, n44, n45, n46, n47, n_1009 : std_logic;

begin
   
   S14_7_0 : ADD32 port map( A => A(7), B => B(7), CI => SUMB_7_0_port, CO => 
                           A2_6_port, S => A1_5_port);
   S4_0 : ADD32 port map( A => ab_7_0_port, B => CARRYB_6_0_port, CI => 
                           SUMB_6_1_port, CO => CARRYB_7_0_port, S => 
                           SUMB_7_0_port);
   S4_1 : ADD32 port map( A => ab_7_1_port, B => CARRYB_6_1_port, CI => 
                           SUMB_6_2_port, CO => CARRYB_7_1_port, S => 
                           SUMB_7_1_port);
   S4_2 : ADD32 port map( A => ab_7_2_port, B => CARRYB_6_2_port, CI => 
                           SUMB_6_3_port, CO => CARRYB_7_2_port, S => 
                           SUMB_7_2_port);
   S4_3 : ADD32 port map( A => ab_7_3_port, B => CARRYB_6_3_port, CI => 
                           SUMB_6_4_port, CO => CARRYB_7_3_port, S => 
                           SUMB_7_3_port);
   S4_4 : ADD32 port map( A => ab_7_4_port, B => CARRYB_6_4_port, CI => 
                           SUMB_6_5_port, CO => CARRYB_7_4_port, S => 
                           SUMB_7_4_port);
   S4_5 : ADD32 port map( A => ab_7_5_port, B => CARRYB_6_5_port, CI => 
                           SUMB_6_6_port, CO => CARRYB_7_5_port, S => 
                           SUMB_7_5_port);
   S5_6 : ADD32 port map( A => ab_7_6_port, B => CARRYB_6_6_port, CI => 
                           ab_6_7_port, CO => CARRYB_7_6_port, S => 
                           SUMB_7_6_port);
   S14_7 : ADD32 port map( A => n40, B => n32, CI => ab_7_7_port, CO => 
                           CARRYB_7_7_port, S => SUMB_7_7_port);
   S1_6_0 : ADD32 port map( A => ab_6_0_port, B => CARRYB_5_0_port, CI => 
                           SUMB_5_1_port, CO => CARRYB_6_0_port, S => A1_4_port
                           );
   S2_6_1 : ADD32 port map( A => ab_6_1_port, B => CARRYB_5_1_port, CI => 
                           SUMB_5_2_port, CO => CARRYB_6_1_port, S => 
                           SUMB_6_1_port);
   S2_6_2 : ADD32 port map( A => ab_6_2_port, B => CARRYB_5_2_port, CI => 
                           SUMB_5_3_port, CO => CARRYB_6_2_port, S => 
                           SUMB_6_2_port);
   S2_6_3 : ADD32 port map( A => ab_6_3_port, B => CARRYB_5_3_port, CI => 
                           SUMB_5_4_port, CO => CARRYB_6_3_port, S => 
                           SUMB_6_3_port);
   S2_6_4 : ADD32 port map( A => ab_6_4_port, B => CARRYB_5_4_port, CI => 
                           SUMB_5_5_port, CO => CARRYB_6_4_port, S => 
                           SUMB_6_4_port);
   S2_6_5 : ADD32 port map( A => ab_6_5_port, B => CARRYB_5_5_port, CI => 
                           SUMB_5_6_port, CO => CARRYB_6_5_port, S => 
                           SUMB_6_5_port);
   S3_6_6 : ADD32 port map( A => ab_6_6_port, B => CARRYB_5_6_port, CI => 
                           ab_5_7_port, CO => CARRYB_6_6_port, S => 
                           SUMB_6_6_port);
   S1_5_0 : ADD32 port map( A => ab_5_0_port, B => CARRYB_4_0_port, CI => 
                           SUMB_4_1_port, CO => CARRYB_5_0_port, S => A1_3_port
                           );
   S2_5_1 : ADD32 port map( A => ab_5_1_port, B => CARRYB_4_1_port, CI => 
                           SUMB_4_2_port, CO => CARRYB_5_1_port, S => 
                           SUMB_5_1_port);
   S2_5_2 : ADD32 port map( A => ab_5_2_port, B => CARRYB_4_2_port, CI => 
                           SUMB_4_3_port, CO => CARRYB_5_2_port, S => 
                           SUMB_5_2_port);
   S2_5_3 : ADD32 port map( A => ab_5_3_port, B => CARRYB_4_3_port, CI => 
                           SUMB_4_4_port, CO => CARRYB_5_3_port, S => 
                           SUMB_5_3_port);
   S2_5_4 : ADD32 port map( A => ab_5_4_port, B => CARRYB_4_4_port, CI => 
                           SUMB_4_5_port, CO => CARRYB_5_4_port, S => 
                           SUMB_5_4_port);
   S2_5_5 : ADD32 port map( A => ab_5_5_port, B => CARRYB_4_5_port, CI => 
                           SUMB_4_6_port, CO => CARRYB_5_5_port, S => 
                           SUMB_5_5_port);
   S3_5_6 : ADD32 port map( A => ab_5_6_port, B => CARRYB_4_6_port, CI => 
                           ab_4_7_port, CO => CARRYB_5_6_port, S => 
                           SUMB_5_6_port);
   S1_4_0 : ADD32 port map( A => ab_4_0_port, B => CARRYB_3_0_port, CI => 
                           SUMB_3_1_port, CO => CARRYB_4_0_port, S => A1_2_port
                           );
   S2_4_1 : ADD32 port map( A => ab_4_1_port, B => CARRYB_3_1_port, CI => 
                           SUMB_3_2_port, CO => CARRYB_4_1_port, S => 
                           SUMB_4_1_port);
   S2_4_2 : ADD32 port map( A => ab_4_2_port, B => CARRYB_3_2_port, CI => 
                           SUMB_3_3_port, CO => CARRYB_4_2_port, S => 
                           SUMB_4_2_port);
   S2_4_3 : ADD32 port map( A => ab_4_3_port, B => CARRYB_3_3_port, CI => 
                           SUMB_3_4_port, CO => CARRYB_4_3_port, S => 
                           SUMB_4_3_port);
   S2_4_4 : ADD32 port map( A => ab_4_4_port, B => CARRYB_3_4_port, CI => 
                           SUMB_3_5_port, CO => CARRYB_4_4_port, S => 
                           SUMB_4_4_port);
   S2_4_5 : ADD32 port map( A => ab_4_5_port, B => CARRYB_3_5_port, CI => 
                           SUMB_3_6_port, CO => CARRYB_4_5_port, S => 
                           SUMB_4_5_port);
   S3_4_6 : ADD32 port map( A => ab_4_6_port, B => CARRYB_3_6_port, CI => 
                           ab_3_7_port, CO => CARRYB_4_6_port, S => 
                           SUMB_4_6_port);
   S1_3_0 : ADD32 port map( A => ab_3_0_port, B => CARRYB_2_0_port, CI => 
                           SUMB_2_1_port, CO => CARRYB_3_0_port, S => A1_1_port
                           );
   S2_3_1 : ADD32 port map( A => ab_3_1_port, B => CARRYB_2_1_port, CI => 
                           SUMB_2_2_port, CO => CARRYB_3_1_port, S => 
                           SUMB_3_1_port);
   S2_3_2 : ADD32 port map( A => ab_3_2_port, B => CARRYB_2_2_port, CI => 
                           SUMB_2_3_port, CO => CARRYB_3_2_port, S => 
                           SUMB_3_2_port);
   S2_3_3 : ADD32 port map( A => ab_3_3_port, B => CARRYB_2_3_port, CI => 
                           SUMB_2_4_port, CO => CARRYB_3_3_port, S => 
                           SUMB_3_3_port);
   S2_3_4 : ADD32 port map( A => ab_3_4_port, B => CARRYB_2_4_port, CI => 
                           SUMB_2_5_port, CO => CARRYB_3_4_port, S => 
                           SUMB_3_4_port);
   S2_3_5 : ADD32 port map( A => ab_3_5_port, B => CARRYB_2_5_port, CI => 
                           SUMB_2_6_port, CO => CARRYB_3_5_port, S => 
                           SUMB_3_5_port);
   S3_3_6 : ADD32 port map( A => ab_3_6_port, B => CARRYB_2_6_port, CI => 
                           ab_2_7_port, CO => CARRYB_3_6_port, S => 
                           SUMB_3_6_port);
   S1_2_0 : ADD32 port map( A => ab_2_0_port, B => CARRYB_1_0_port, CI => 
                           SUMB_1_1_port, CO => CARRYB_2_0_port, S => A1_0_port
                           );
   S2_2_1 : ADD32 port map( A => ab_2_1_port, B => CARRYB_1_1_port, CI => 
                           SUMB_1_2_port, CO => CARRYB_2_1_port, S => 
                           SUMB_2_1_port);
   S2_2_2 : ADD32 port map( A => ab_2_2_port, B => CARRYB_1_2_port, CI => 
                           SUMB_1_3_port, CO => CARRYB_2_2_port, S => 
                           SUMB_2_2_port);
   S2_2_3 : ADD32 port map( A => ab_2_3_port, B => CARRYB_1_3_port, CI => 
                           SUMB_1_4_port, CO => CARRYB_2_3_port, S => 
                           SUMB_2_3_port);
   S2_2_4 : ADD32 port map( A => ab_2_4_port, B => CARRYB_1_4_port, CI => 
                           SUMB_1_5_port, CO => CARRYB_2_4_port, S => 
                           SUMB_2_4_port);
   S2_2_5 : ADD32 port map( A => ab_2_5_port, B => CARRYB_1_5_port, CI => 
                           SUMB_1_6_port, CO => CARRYB_2_5_port, S => 
                           SUMB_2_5_port);
   S3_2_6 : ADD32 port map( A => ab_2_6_port, B => CARRYB_1_6_port, CI => 
                           ab_1_7_port, CO => CARRYB_2_6_port, S => 
                           SUMB_2_6_port);
   FS_1 : MULT_DW01_add_0 port map( A(13) => n31, A(12) => A1_12_port, A(11) =>
                           A1_11_port, A(10) => A1_10_port, A(9) => A1_9_port, 
                           A(8) => A1_8_port, A(7) => A1_7_port, A(6) => 
                           A1_6_port, A(5) => A1_5_port, A(4) => A1_4_port, 
                           A(3) => A1_3_port, A(2) => A1_2_port, A(1) => 
                           A1_1_port, A(0) => A1_0_port, B(13) => A2_13_port, 
                           B(12) => A2_12_port, B(11) => A2_11_port, B(10) => 
                           A2_10_port, B(9) => A2_9_port, B(8) => A2_8_port, 
                           B(7) => A2_7_port, B(6) => A2_6_port, B(5) => 
                           X_Logic0_port, B(4) => X_Logic0_port, B(3) => 
                           X_Logic0_port, B(2) => X_Logic0_port, B(1) => 
                           X_Logic0_port, B(0) => X_Logic0_port, CI => 
                           X_Logic0_port, SUM(13) => PRODUCT(15), SUM(12) => 
                           PRODUCT(14), SUM(11) => PRODUCT(13), SUM(10) => 
                           PRODUCT(12), SUM(9) => PRODUCT(11), SUM(8) => 
                           PRODUCT(10), SUM(7) => PRODUCT(9), SUM(6) => 
                           PRODUCT(8), SUM(5) => PRODUCT(7), SUM(4) => 
                           PRODUCT(6), SUM(3) => PRODUCT(5), SUM(2) => 
                           PRODUCT(4), SUM(1) => PRODUCT(3), SUM(0) => 
                           PRODUCT(2), CO => n_1009);
   U2 : INV3 port map( A => ab_0_6_port, Q => n27);
   U3 : INV3 port map( A => ab_0_5_port, Q => n25);
   U4 : INV3 port map( A => ab_0_4_port, Q => n23);
   U5 : INV3 port map( A => ab_0_3_port, Q => n21);
   U6 : INV3 port map( A => ab_0_2_port, Q => n19);
   U7 : INV3 port map( A => ab_1_5_port, Q => n28);
   U8 : INV3 port map( A => ab_1_4_port, Q => n26);
   U9 : INV3 port map( A => ab_1_3_port, Q => n24);
   U10 : INV3 port map( A => ab_1_2_port, Q => n22);
   U11 : INV3 port map( A => ab_1_1_port, Q => n20);
   U12 : INV3 port map( A => ab_1_6_port, Q => n30);
   U13 : INV3 port map( A => CARRYB_7_7_port, Q => n31);
   U14 : NOR21 port map( A => n15, B => n16, Q => A2_13_port);
   U15 : INV3 port map( A => ab_0_1_port, Q => n17);
   U16 : INV3 port map( A => ab_1_0_port, Q => n18);
   U17 : XOR21 port map( A => ab_0_1_port, B => ab_1_0_port, Q => PRODUCT(1));
   U18 : INV3 port map( A => SUMB_7_7_port, Q => n16);
   U19 : NOR21 port map( A => n27, B => n28, Q => CARRYB_1_5_port);
   U20 : XOR21 port map( A => ab_0_7_port, B => ab_1_6_port, Q => SUMB_1_6_port
                           );
   U21 : XOR21 port map( A => SUMB_7_1_port, B => CARRYB_7_0_port, Q => 
                           A1_6_port);
   U22 : NOR21 port map( A => n25, B => n26, Q => CARRYB_1_4_port);
   U23 : XOR21 port map( A => ab_0_6_port, B => ab_1_5_port, Q => SUMB_1_5_port
                           );
   U24 : NOR21 port map( A => n23, B => n24, Q => CARRYB_1_3_port);
   U25 : XOR21 port map( A => ab_0_5_port, B => ab_1_4_port, Q => SUMB_1_4_port
                           );
   U26 : NOR21 port map( A => n21, B => n22, Q => CARRYB_1_2_port);
   U27 : XOR21 port map( A => ab_0_4_port, B => ab_1_3_port, Q => SUMB_1_3_port
                           );
   U28 : NOR21 port map( A => n19, B => n20, Q => CARRYB_1_1_port);
   U29 : XOR21 port map( A => ab_0_3_port, B => ab_1_2_port, Q => SUMB_1_2_port
                           );
   U30 : NOR21 port map( A => n17, B => n18, Q => CARRYB_1_0_port);
   U31 : XOR21 port map( A => ab_0_2_port, B => ab_1_1_port, Q => SUMB_1_1_port
                           );
   U32 : INV3 port map( A => ab_0_7_port, Q => n29);
   U33 : XOR21 port map( A => SUMB_7_2_port, B => CARRYB_7_1_port, Q => 
                           A1_7_port);
   U34 : NOR21 port map( A => n3, B => n4, Q => A2_7_port);
   U35 : INV3 port map( A => CARRYB_7_0_port, Q => n3);
   U36 : INV3 port map( A => SUMB_7_1_port, Q => n4);
   U37 : XOR21 port map( A => SUMB_7_3_port, B => CARRYB_7_2_port, Q => 
                           A1_8_port);
   U38 : XOR21 port map( A => SUMB_7_4_port, B => CARRYB_7_3_port, Q => 
                           A1_9_port);
   U39 : XOR21 port map( A => SUMB_7_5_port, B => CARRYB_7_4_port, Q => 
                           A1_10_port);
   U40 : NOR21 port map( A => n5, B => n6, Q => A2_8_port);
   U41 : INV3 port map( A => CARRYB_7_1_port, Q => n5);
   U42 : INV3 port map( A => SUMB_7_2_port, Q => n6);
   U43 : NOR21 port map( A => n7, B => n8, Q => A2_9_port);
   U44 : INV3 port map( A => CARRYB_7_2_port, Q => n7);
   U45 : INV3 port map( A => SUMB_7_3_port, Q => n8);
   U46 : NOR21 port map( A => n9, B => n10, Q => A2_10_port);
   U47 : INV3 port map( A => CARRYB_7_3_port, Q => n9);
   U48 : INV3 port map( A => SUMB_7_4_port, Q => n10);
   U49 : XOR21 port map( A => SUMB_7_6_port, B => CARRYB_7_5_port, Q => 
                           A1_11_port);
   U50 : NOR21 port map( A => n11, B => n12, Q => A2_11_port);
   U51 : INV3 port map( A => SUMB_7_5_port, Q => n12);
   U52 : INV3 port map( A => CARRYB_7_4_port, Q => n11);
   U53 : XOR21 port map( A => SUMB_7_7_port, B => CARRYB_7_6_port, Q => 
                           A1_12_port);
   U54 : NOR21 port map( A => n13, B => n14, Q => A2_12_port);
   U55 : INV3 port map( A => SUMB_7_6_port, Q => n14);
   U56 : INV3 port map( A => CARRYB_7_5_port, Q => n13);
   U57 : INV3 port map( A => CARRYB_7_6_port, Q => n15);
   U58 : INV3 port map( A => A(1), Q => n46);
   U59 : NOR21 port map( A => n29, B => n30, Q => CARRYB_1_6_port);
   U60 : INV3 port map( A => B(5), Q => n34);
   U61 : INV3 port map( A => B(3), Q => n36);
   U62 : INV3 port map( A => B(6), Q => n33);
   U63 : INV3 port map( A => B(4), Q => n35);
   U64 : INV3 port map( A => A(0), Q => n47);
   U65 : INV3 port map( A => A(2), Q => n45);
   U66 : INV3 port map( A => A(3), Q => n44);
   U67 : INV3 port map( A => B(7), Q => n32);
   U68 : INV3 port map( A => B(2), Q => n37);
   U69 : INV3 port map( A => B(0), Q => n39);
   U70 : INV3 port map( A => B(1), Q => n38);
   U71 : INV3 port map( A => A(4), Q => n43);
   U72 : INV3 port map( A => A(5), Q => n42);
   U73 : INV3 port map( A => A(6), Q => n41);
   U74 : INV3 port map( A => A(7), Q => n40);
   U75 : LOGIC0 port map( Q => X_Logic0_port);
   U76 : NOR20 port map( A => n32, B => n40, Q => ab_7_7_port);
   U77 : NOR20 port map( A => B(6), B => n40, Q => ab_7_6_port);
   U78 : NOR20 port map( A => B(5), B => n40, Q => ab_7_5_port);
   U79 : NOR20 port map( A => B(4), B => n40, Q => ab_7_4_port);
   U80 : NOR20 port map( A => B(3), B => n40, Q => ab_7_3_port);
   U81 : NOR20 port map( A => B(2), B => n40, Q => ab_7_2_port);
   U82 : NOR20 port map( A => B(1), B => n40, Q => ab_7_1_port);
   U83 : NOR20 port map( A => B(0), B => n40, Q => ab_7_0_port);
   U84 : NOR20 port map( A => A(6), B => n32, Q => ab_6_7_port);
   U85 : NOR20 port map( A => n41, B => n33, Q => ab_6_6_port);
   U86 : NOR20 port map( A => n41, B => n34, Q => ab_6_5_port);
   U87 : NOR20 port map( A => n41, B => n35, Q => ab_6_4_port);
   U88 : NOR20 port map( A => n41, B => n36, Q => ab_6_3_port);
   U89 : NOR20 port map( A => n41, B => n37, Q => ab_6_2_port);
   U90 : NOR20 port map( A => n41, B => n38, Q => ab_6_1_port);
   U91 : NOR20 port map( A => n41, B => n39, Q => ab_6_0_port);
   U92 : NOR20 port map( A => A(5), B => n32, Q => ab_5_7_port);
   U93 : NOR20 port map( A => n33, B => n42, Q => ab_5_6_port);
   U94 : NOR20 port map( A => n34, B => n42, Q => ab_5_5_port);
   U95 : NOR20 port map( A => n35, B => n42, Q => ab_5_4_port);
   U96 : NOR20 port map( A => n36, B => n42, Q => ab_5_3_port);
   U97 : NOR20 port map( A => n37, B => n42, Q => ab_5_2_port);
   U98 : NOR20 port map( A => n38, B => n42, Q => ab_5_1_port);
   U99 : NOR20 port map( A => n39, B => n42, Q => ab_5_0_port);
   U100 : NOR20 port map( A => A(4), B => n32, Q => ab_4_7_port);
   U101 : NOR20 port map( A => n33, B => n43, Q => ab_4_6_port);
   U102 : NOR20 port map( A => n34, B => n43, Q => ab_4_5_port);
   U103 : NOR20 port map( A => n35, B => n43, Q => ab_4_4_port);
   U104 : NOR20 port map( A => n36, B => n43, Q => ab_4_3_port);
   U105 : NOR20 port map( A => n37, B => n43, Q => ab_4_2_port);
   U106 : NOR20 port map( A => n38, B => n43, Q => ab_4_1_port);
   U107 : NOR20 port map( A => n39, B => n43, Q => ab_4_0_port);
   U108 : NOR20 port map( A => A(3), B => n32, Q => ab_3_7_port);
   U109 : NOR20 port map( A => n33, B => n44, Q => ab_3_6_port);
   U110 : NOR20 port map( A => n34, B => n44, Q => ab_3_5_port);
   U111 : NOR20 port map( A => n35, B => n44, Q => ab_3_4_port);
   U112 : NOR20 port map( A => n36, B => n44, Q => ab_3_3_port);
   U113 : NOR20 port map( A => n37, B => n44, Q => ab_3_2_port);
   U114 : NOR20 port map( A => n38, B => n44, Q => ab_3_1_port);
   U115 : NOR20 port map( A => n39, B => n44, Q => ab_3_0_port);
   U116 : NOR20 port map( A => A(2), B => n32, Q => ab_2_7_port);
   U117 : NOR20 port map( A => n33, B => n45, Q => ab_2_6_port);
   U118 : NOR20 port map( A => n34, B => n45, Q => ab_2_5_port);
   U119 : NOR20 port map( A => n35, B => n45, Q => ab_2_4_port);
   U120 : NOR20 port map( A => n36, B => n45, Q => ab_2_3_port);
   U121 : NOR20 port map( A => n37, B => n45, Q => ab_2_2_port);
   U122 : NOR20 port map( A => n38, B => n45, Q => ab_2_1_port);
   U123 : NOR20 port map( A => n39, B => n45, Q => ab_2_0_port);
   U124 : NOR20 port map( A => A(1), B => n32, Q => ab_1_7_port);
   U125 : NOR20 port map( A => n33, B => n46, Q => ab_1_6_port);
   U126 : NOR20 port map( A => n34, B => n46, Q => ab_1_5_port);
   U127 : NOR20 port map( A => n35, B => n46, Q => ab_1_4_port);
   U128 : NOR20 port map( A => n36, B => n46, Q => ab_1_3_port);
   U129 : NOR20 port map( A => n37, B => n46, Q => ab_1_2_port);
   U130 : NOR20 port map( A => n38, B => n46, Q => ab_1_1_port);
   U131 : NOR20 port map( A => n39, B => n46, Q => ab_1_0_port);
   U132 : NOR20 port map( A => A(0), B => n32, Q => ab_0_7_port);
   U133 : NOR20 port map( A => n33, B => n47, Q => ab_0_6_port);
   U134 : NOR20 port map( A => n34, B => n47, Q => ab_0_5_port);
   U135 : NOR20 port map( A => n35, B => n47, Q => ab_0_4_port);
   U136 : NOR20 port map( A => n36, B => n47, Q => ab_0_3_port);
   U137 : NOR20 port map( A => n37, B => n47, Q => ab_0_2_port);
   U138 : NOR20 port map( A => n38, B => n47, Q => ab_0_1_port);
   U139 : NOR20 port map( A => n39, B => n47, Q => PRODUCT(0));

end SYN_csa;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity ACCU_DW01_add_1 is

   port( A, B : in std_logic_vector (20 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (20 downto 0);  CO : out std_logic);

end ACCU_DW01_add_1;

architecture SYN_rpl of ACCU_DW01_add_1 is

   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component ADD32
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_20_port, carry_19_port, carry_18_port, carry_17_port, 
      carry_16_port, carry_15_port, carry_14_port, carry_13_port, carry_12_port
      , carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port,
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, 
      carry_1_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10 : std_logic;

begin
   
   U1_15 : ADD32 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           carry_16_port, S => SUM(15));
   U1_14 : ADD32 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : ADD32 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_12 : ADD32 port map( A => A(12), B => B(12), CI => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_11 : ADD32 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : ADD32 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : ADD32 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : ADD32 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : ADD32 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : ADD32 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : ADD32 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : ADD32 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : ADD32 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : ADD32 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : ADD32 port map( A => A(1), B => B(1), CI => carry_1_port, CO => 
                           carry_2_port, S => SUM(1));
   U1 : NOR21 port map( A => n7, B => n8, Q => carry_17_port);
   U2 : INV3 port map( A => A(16), Q => n8);
   U3 : INV3 port map( A => carry_16_port, Q => n7);
   U4 : NOR21 port map( A => n3, B => n4, Q => carry_19_port);
   U5 : INV3 port map( A => A(18), Q => n4);
   U6 : INV3 port map( A => carry_18_port, Q => n3);
   U7 : NOR21 port map( A => n5, B => n6, Q => carry_18_port);
   U8 : INV3 port map( A => A(17), Q => n6);
   U9 : INV3 port map( A => carry_17_port, Q => n5);
   U10 : XOR21 port map( A => carry_20_port, B => A(20), Q => SUM(20));
   U11 : NOR21 port map( A => n1, B => n2, Q => carry_20_port);
   U12 : INV3 port map( A => A(19), Q => n2);
   U13 : INV3 port map( A => carry_19_port, Q => n1);
   U14 : XOR21 port map( A => A(19), B => carry_19_port, Q => SUM(19));
   U15 : XOR21 port map( A => A(18), B => carry_18_port, Q => SUM(18));
   U16 : XOR21 port map( A => A(17), B => carry_17_port, Q => SUM(17));
   U17 : XOR21 port map( A => A(16), B => carry_16_port, Q => SUM(16));
   U18 : XOR21 port map( A => A(0), B => B(0), Q => SUM(0));
   U19 : NOR21 port map( A => n9, B => n10, Q => carry_1_port);
   U20 : INV3 port map( A => A(0), Q => n10);
   U21 : INV3 port map( A => B(0), Q => n9);

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity ACCU_DW01_add_0 is

   port( A, B : in std_logic_vector (20 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (20 downto 0);  CO : out std_logic);

end ACCU_DW01_add_0;

architecture SYN_rpl of ACCU_DW01_add_0 is

   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XNR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component ADD32
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_19_port, carry_18_port, carry_17_port, carry_16_port, 
      carry_15_port, carry_14_port, carry_13_port, carry_12_port, carry_11_port
      , carry_10_port, carry_9_port, carry_8_port, carry_7_port, carry_6_port, 
      carry_5_port, carry_4_port, carry_3_port, carry_2_port, carry_1_port, n1,
      n2, n3, n4, n5, n6 : std_logic;

begin
   
   U1_15 : ADD32 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           carry_16_port, S => SUM(15));
   U1_14 : ADD32 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : ADD32 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_12 : ADD32 port map( A => A(12), B => B(12), CI => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_11 : ADD32 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : ADD32 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : ADD32 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : ADD32 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : ADD32 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : ADD32 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : ADD32 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : ADD32 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : ADD32 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : ADD32 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : ADD32 port map( A => A(1), B => B(1), CI => carry_1_port, CO => 
                           carry_2_port, S => SUM(1));
   U1 : INV3 port map( A => n4, Q => carry_17_port);
   U2 : NOR21 port map( A => carry_16_port, B => A(16), Q => n4);
   U3 : INV3 port map( A => n3, Q => carry_18_port);
   U4 : NOR21 port map( A => carry_17_port, B => A(17), Q => n3);
   U5 : INV3 port map( A => n2, Q => carry_19_port);
   U6 : NOR21 port map( A => carry_18_port, B => A(18), Q => n2);
   U7 : XOR21 port map( A => n1, B => A(20), Q => SUM(20));
   U8 : NOR21 port map( A => carry_19_port, B => A(19), Q => n1);
   U9 : XNR21 port map( A => A(16), B => carry_16_port, Q => SUM(16));
   U10 : XNR21 port map( A => A(17), B => carry_17_port, Q => SUM(17));
   U11 : XNR21 port map( A => A(19), B => carry_19_port, Q => SUM(19));
   U12 : XNR21 port map( A => A(18), B => carry_18_port, Q => SUM(18));
   U13 : NOR21 port map( A => n5, B => n6, Q => carry_1_port);
   U14 : INV3 port map( A => A(0), Q => n6);
   U15 : INV3 port map( A => B(0), Q => n5);
   U16 : XOR20 port map( A => A(0), B => B(0), Q => SUM(0));

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity fsm is

   port( CLK, RESET, ADC_eoc : in std_logic;  ADC_convst, ADC_rd, ADC_cs, 
         DAC_wr, DAC_cs, DAC_ldac, DAC_clr : out std_logic;  Ram_Address, 
         Delay_Line_Address : out std_logic_vector (4 downto 0);  
         Delay_Line_sample_shift, Accu_ctrl, Buff_OE : out std_logic);

end fsm;

architecture SYN_A of fsm is

   component NAND30
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR20
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component LOGIC1
      port( Q : out std_logic);
   end component;
   
   component LOGIC0
      port( Q : out std_logic);
   end component;
   
   component NOR31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI211
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI2111
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND41
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI311
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR40
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component ADD22
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component DF3
      port( D, C : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component OAI222
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal ADC_rd_port, ADC_convst_port, Ram_Address_4_port, Ram_Address_3_port,
      Ram_Address_2_port, Ram_Address_1_port, Delay_Line_sample_shift_port, 
      Accu_ctrl_port, Current_State_2_port, Current_State_1_port, 
      Current_State_0_port, N40, N43, N44, N45, N46, n10, n13, n15, n16, n18, 
      n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33
      , n34, n35, n36, n37, add_103_carry_2_port, add_103_carry_3_port, 
      add_103_carry_4_port, Delay_Line_Address_0_port, n2, n3, n4, n5, n6, n7, 
      n8, n9, n11, n12, n14, n17, n38, n39, n_1024, n_1025, n_1026 : std_logic;

begin
   ADC_convst <= ADC_convst_port;
   ADC_rd <= ADC_rd_port;
   ADC_cs <= ADC_rd_port;
   DAC_wr <= ADC_convst_port;
   DAC_cs <= ADC_convst_port;
   Ram_Address <= ( Ram_Address_4_port, Ram_Address_3_port, Ram_Address_2_port,
      Ram_Address_1_port, Delay_Line_Address_0_port );
   Delay_Line_Address <= ( Ram_Address_4_port, Ram_Address_3_port, 
      Ram_Address_2_port, Ram_Address_1_port, Delay_Line_Address_0_port );
   Delay_Line_sample_shift <= Delay_Line_sample_shift_port;
   Accu_ctrl <= Accu_ctrl_port;
   
   U3 : OAI222 port map( A => n15, B => n17, C => RESET, D => n18, Q => n35);
   U6 : OAI212 port map( A => RESET, B => n5, C => n17, Q => n36);
   U7 : OAI212 port map( A => n15, B => n16, C => n21, Q => n20);
   U9 : OAI222 port map( A => n16, B => n17, C => RESET, D => n23, Q => n37);
   Current_State_reg_0_inst : DF3 port map( D => n37, C => CLK, Q => 
                           Current_State_0_port, QN => n16);
   Current_State_reg_1_inst : DF3 port map( D => n35, C => CLK, Q => 
                           Current_State_1_port, QN => n15);
   Tap_Number_reg_0_inst : DF3 port map( D => n8, C => CLK, Q => 
                           Delay_Line_Address_0_port, QN => n2);
   Tap_Number_reg_1_inst : DF3 port map( D => n9, C => CLK, Q => 
                           Ram_Address_1_port, QN => n_1024);
   Tap_Number_reg_2_inst : DF3 port map( D => n11, C => CLK, Q => 
                           Ram_Address_2_port, QN => n10);
   Tap_Number_reg_3_inst : DF3 port map( D => n12, C => CLK, Q => 
                           Ram_Address_3_port, QN => n_1025);
   Tap_Number_reg_4_inst : DF3 port map( D => n14, C => CLK, Q => 
                           Ram_Address_4_port, QN => n_1026);
   Current_State_reg_2_inst : DF3 port map( D => n36, C => CLK, Q => 
                           Current_State_2_port, QN => n13);
   add_103_U1_1_1 : ADD22 port map( A => Ram_Address_1_port, B => 
                           Delay_Line_Address_0_port, CO => 
                           add_103_carry_2_port, S => N43);
   add_103_U1_1_2 : ADD22 port map( A => Ram_Address_2_port, B => 
                           add_103_carry_2_port, CO => add_103_carry_3_port, S 
                           => N44);
   add_103_U1_1_3 : ADD22 port map( A => Ram_Address_3_port, B => 
                           add_103_carry_3_port, CO => add_103_carry_4_port, S 
                           => N45);
   U4 : INV3 port map( A => n29, Q => n12);
   U5 : NAND22 port map( A => N45, B => n28, Q => n29);
   U8 : INV3 port map( A => n30, Q => n11);
   U10 : NAND22 port map( A => N44, B => n28, Q => n30);
   U11 : INV3 port map( A => n31, Q => n9);
   U12 : NAND22 port map( A => N43, B => n28, Q => n31);
   U13 : INV3 port map( A => n32, Q => n8);
   U14 : NAND22 port map( A => n2, B => n28, Q => n32);
   U15 : NAND22 port map( A => n34, B => n6, Q => ADC_convst_port);
   U16 : INV3 port map( A => Delay_Line_sample_shift_port, Q => n6);
   U17 : NAND22 port map( A => n34, B => n24, Q => ADC_rd_port);
   U18 : NOR40 port map( A => N40, B => n10, C => n22, D => n33, Q => Buff_OE);
   U19 : NOR31 port map( A => Current_State_0_port, B => Current_State_2_port, 
                           C => n15, Q => Delay_Line_sample_shift_port);
   U20 : NOR31 port map( A => n33, B => RESET, C => n38, Q => n28);
   U21 : INV3 port map( A => N40, Q => n38);
   U22 : INV3 port map( A => n20, Q => n5);
   U23 : OAI311 port map( A => n10, B => N40, C => n22, D => 
                           Current_State_2_port, Q => n21);
   U24 : INV3 port map( A => n27, Q => n14);
   U25 : NAND22 port map( A => N46, B => n28, Q => n27);
   U26 : NAND41 port map( A => Ram_Address_4_port, B => Ram_Address_3_port, C 
                           => Ram_Address_1_port, D => 
                           Delay_Line_Address_0_port, Q => n22);
   U27 : NOR31 port map( A => n16, B => Current_State_2_port, C => n15, Q => 
                           Accu_ctrl_port);
   U28 : NOR21 port map( A => Current_State_1_port, B => Current_State_0_port, 
                           Q => n26);
   U29 : NAND22 port map( A => n26, B => Current_State_2_port, Q => n33);
   U30 : NOR31 port map( A => Current_State_1_port, B => Current_State_2_port, 
                           C => n16, Q => n19);
   U31 : AOI2111 port map( A => ADC_eoc, B => n19, C => n7, D => 
                           Delay_Line_sample_shift_port, Q => n23);
   U32 : INV3 port map( A => n24, Q => n7);
   U33 : NAND22 port map( A => n26, B => n13, Q => n24);
   U34 : AOI211 port map( A => n19, B => n39, C => Delay_Line_sample_shift_port
                           , Q => n18);
   U35 : INV3 port map( A => ADC_eoc, Q => n39);
   U36 : INV3 port map( A => n25, Q => n17);
   U37 : NOR31 port map( A => n26, B => RESET, C => n13, Q => n25);
   U38 : NOR31 port map( A => n19, B => Current_State_2_port, C => 
                           Accu_ctrl_port, Q => n34);
   U39 : LOGIC0 port map( Q => DAC_ldac);
   U40 : LOGIC1 port map( Q => DAC_clr);
   U41 : XOR20 port map( A => add_103_carry_4_port, B => Ram_Address_4_port, Q 
                           => N46);
   U42 : NAND20 port map( A => Ram_Address_4_port, B => Ram_Address_3_port, Q 
                           => n3);
   U43 : NOR20 port map( A => n2, B => n3, Q => n4);
   U44 : NAND30 port map( A => Ram_Address_2_port, B => Ram_Address_1_port, C 
                           => n4, Q => N40);

end SYN_A;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity BUFF is

   port( CLK, RESET, Buff_OE : in std_logic;  Buff_in : in std_logic_vector (7 
         downto 0);  Buff_out : out std_logic_vector (7 downto 0));

end BUFF;

architecture SYN_A of BUFF is

   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component DFEC1
      port( D, E, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n1, n_1027, n_1028, n_1029, n_1030, n_1031, n_1032, n_1033, n_1034 : 
      std_logic;

begin
   
   Buff_out_reg_7_inst : DFEC1 port map( D => Buff_in(7), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(7), QN => n_1027);
   Buff_out_reg_6_inst : DFEC1 port map( D => Buff_in(6), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(6), QN => n_1028);
   Buff_out_reg_5_inst : DFEC1 port map( D => Buff_in(5), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(5), QN => n_1029);
   Buff_out_reg_4_inst : DFEC1 port map( D => Buff_in(4), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(4), QN => n_1030);
   Buff_out_reg_3_inst : DFEC1 port map( D => Buff_in(3), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(3), QN => n_1031);
   Buff_out_reg_2_inst : DFEC1 port map( D => Buff_in(2), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(2), QN => n_1032);
   Buff_out_reg_1_inst : DFEC1 port map( D => Buff_in(1), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(1), QN => n_1033);
   Buff_out_reg_0_inst : DFEC1 port map( D => Buff_in(0), E => Buff_OE, C => 
                           CLK, RN => n1, Q => Buff_out(0), QN => n_1034);
   U2 : INV3 port map( A => RESET, Q => n1);

end SYN_A;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity ACCU is

   port( CLK, RESET : in std_logic;  Accu_in : in std_logic_vector (15 downto 
         0);  Accu_ctrl : in std_logic;  Accu_out : out std_logic_vector (20 
         downto 0));

end ACCU;

architecture SYN_A of ACCU is

   component LOGIC1
      port( Q : out std_logic);
   end component;
   
   component LOGIC0
      port( Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF2
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component ACCU_DW01_add_1
      port( A, B : in std_logic_vector (20 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (20 downto 0);  CO : out std_logic);
   end component;
   
   component ACCU_DW01_add_0
      port( A, B : in std_logic_vector (20 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (20 downto 0);  CO : out std_logic);
   end component;
   
   component DFC3
      port( D, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal X_Logic1_port, X_Logic0_port, Accu_out_20_port, Accu_out_19_port, 
      Accu_out_18_port, Accu_out_17_port, Accu_out_16_port, Accu_out_15_port, 
      Accu_out_14_port, Accu_out_13_port, Accu_out_12_port, Accu_out_11_port, 
      Accu_out_10_port, Accu_out_9_port, Accu_out_8_port, Accu_out_7_port, 
      Accu_out_6_port, Accu_out_5_port, Accu_out_4_port, Accu_out_3_port, 
      Accu_out_2_port, Accu_out_1_port, Accu_out_0_port, N8, N9, N10, N11, N12,
      N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27
      , N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, 
      N42, N43, N44, N45, N46, N47, N48, N49, N71, N72, N73, N74, N75, N76, N77
      , N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, 
      n7, n8_port, n9_port, n10_port, n11_port, n12_port, n13_port, n14_port, 
      n15_port, n16_port, n17_port, n18_port, n19_port, n20_port, n21_port, 
      n22_port, n23_port, n24_port, n25_port, n26_port, n27_port, n28_port, 
      n29_port, n30_port, n31_port, n32_port, n33_port, n34_port, n35_port, 
      n36_port, n37_port, n38_port, n39_port, n40_port, n41_port, n42_port, 
      n43_port, n44_port, n45_port, n46_port, n47_port, n48_port, n49_port, n50
      , n51, n1, n2, n3, n4, n5, n6, n_1035, n_1036, n_1037, n_1038, n_1039, 
      n_1040, n_1041, n_1042, n_1043, n_1044, n_1045, n_1046, n_1047, n_1048, 
      n_1049, n_1050, n_1051, n_1052, n_1053, n_1054, n_1055, n_1056, n_1057 : 
      std_logic;

begin
   Accu_out <= ( Accu_out_20_port, Accu_out_19_port, Accu_out_18_port, 
      Accu_out_17_port, Accu_out_16_port, Accu_out_15_port, Accu_out_14_port, 
      Accu_out_13_port, Accu_out_12_port, Accu_out_11_port, Accu_out_10_port, 
      Accu_out_9_port, Accu_out_8_port, Accu_out_7_port, Accu_out_6_port, 
      Accu_out_5_port, Accu_out_4_port, Accu_out_3_port, Accu_out_2_port, 
      Accu_out_1_port, Accu_out_0_port );
   
   ACCU_reg_0_inst : DFC3 port map( D => N71, C => CLK, RN => n6, Q => 
                           Accu_out_0_port, QN => n_1035);
   ACCU_reg_20_inst : DFC3 port map( D => N91, C => CLK, RN => n6, Q => 
                           Accu_out_20_port, QN => n_1036);
   ACCU_reg_1_inst : DFC3 port map( D => N72, C => CLK, RN => n6, Q => 
                           Accu_out_1_port, QN => n_1037);
   ACCU_reg_2_inst : DFC3 port map( D => N73, C => CLK, RN => n6, Q => 
                           Accu_out_2_port, QN => n_1038);
   ACCU_reg_3_inst : DFC3 port map( D => N74, C => CLK, RN => n6, Q => 
                           Accu_out_3_port, QN => n_1039);
   ACCU_reg_4_inst : DFC3 port map( D => N75, C => CLK, RN => n6, Q => 
                           Accu_out_4_port, QN => n_1040);
   ACCU_reg_5_inst : DFC3 port map( D => N76, C => CLK, RN => n6, Q => 
                           Accu_out_5_port, QN => n_1041);
   ACCU_reg_6_inst : DFC3 port map( D => N77, C => CLK, RN => n6, Q => 
                           Accu_out_6_port, QN => n_1042);
   ACCU_reg_7_inst : DFC3 port map( D => N78, C => CLK, RN => n6, Q => 
                           Accu_out_7_port, QN => n_1043);
   ACCU_reg_8_inst : DFC3 port map( D => N79, C => CLK, RN => n6, Q => 
                           Accu_out_8_port, QN => n_1044);
   ACCU_reg_9_inst : DFC3 port map( D => N80, C => CLK, RN => n6, Q => 
                           Accu_out_9_port, QN => n_1045);
   ACCU_reg_10_inst : DFC3 port map( D => N81, C => CLK, RN => n6, Q => 
                           Accu_out_10_port, QN => n_1046);
   ACCU_reg_11_inst : DFC3 port map( D => N82, C => CLK, RN => n6, Q => 
                           Accu_out_11_port, QN => n_1047);
   ACCU_reg_12_inst : DFC3 port map( D => N83, C => CLK, RN => n6, Q => 
                           Accu_out_12_port, QN => n_1048);
   ACCU_reg_13_inst : DFC3 port map( D => N84, C => CLK, RN => n6, Q => 
                           Accu_out_13_port, QN => n_1049);
   ACCU_reg_14_inst : DFC3 port map( D => N85, C => CLK, RN => n6, Q => 
                           Accu_out_14_port, QN => n_1050);
   ACCU_reg_15_inst : DFC3 port map( D => N86, C => CLK, RN => n6, Q => 
                           Accu_out_15_port, QN => n_1051);
   ACCU_reg_16_inst : DFC3 port map( D => N87, C => CLK, RN => n6, Q => 
                           Accu_out_16_port, QN => n_1052);
   ACCU_reg_17_inst : DFC3 port map( D => N88, C => CLK, RN => n6, Q => 
                           Accu_out_17_port, QN => n_1053);
   ACCU_reg_18_inst : DFC3 port map( D => N89, C => CLK, RN => n6, Q => 
                           Accu_out_18_port, QN => n_1054);
   ACCU_reg_19_inst : DFC3 port map( D => N90, C => CLK, RN => n6, Q => 
                           Accu_out_19_port, QN => n_1055);
   add_36 : ACCU_DW01_add_0 port map( A(20) => Accu_out_20_port, A(19) => 
                           Accu_out_19_port, A(18) => Accu_out_18_port, A(17) 
                           => Accu_out_17_port, A(16) => Accu_out_16_port, 
                           A(15) => Accu_out_15_port, A(14) => Accu_out_14_port
                           , A(13) => Accu_out_13_port, A(12) => 
                           Accu_out_12_port, A(11) => Accu_out_11_port, A(10) 
                           => Accu_out_10_port, A(9) => Accu_out_9_port, A(8) 
                           => Accu_out_8_port, A(7) => Accu_out_7_port, A(6) =>
                           Accu_out_6_port, A(5) => Accu_out_5_port, A(4) => 
                           Accu_out_4_port, A(3) => Accu_out_3_port, A(2) => 
                           Accu_out_2_port, A(1) => Accu_out_1_port, A(0) => 
                           Accu_out_0_port, B(20) => X_Logic1_port, B(19) => 
                           X_Logic1_port, B(18) => X_Logic1_port, B(17) => 
                           X_Logic1_port, B(16) => X_Logic1_port, B(15) => n3, 
                           B(14) => Accu_in(14), B(13) => Accu_in(13), B(12) =>
                           Accu_in(12), B(11) => Accu_in(11), B(10) => 
                           Accu_in(10), B(9) => Accu_in(9), B(8) => Accu_in(8),
                           B(7) => Accu_in(7), B(6) => Accu_in(6), B(5) => 
                           Accu_in(5), B(4) => Accu_in(4), B(3) => Accu_in(3), 
                           B(2) => Accu_in(2), B(1) => Accu_in(1), B(0) => 
                           Accu_in(0), CI => X_Logic0_port, SUM(20) => N49, 
                           SUM(19) => N48, SUM(18) => N47, SUM(17) => N46, 
                           SUM(16) => N45, SUM(15) => N44, SUM(14) => N43, 
                           SUM(13) => N42, SUM(12) => N41, SUM(11) => N40, 
                           SUM(10) => N39, SUM(9) => N38, SUM(8) => N37, SUM(7)
                           => N36, SUM(6) => N35, SUM(5) => N34, SUM(4) => N33,
                           SUM(3) => N32, SUM(2) => N31, SUM(1) => N30, SUM(0) 
                           => N29, CO => n_1056);
   add_34 : ACCU_DW01_add_1 port map( A(20) => Accu_out_20_port, A(19) => 
                           Accu_out_19_port, A(18) => Accu_out_18_port, A(17) 
                           => Accu_out_17_port, A(16) => Accu_out_16_port, 
                           A(15) => Accu_out_15_port, A(14) => Accu_out_14_port
                           , A(13) => Accu_out_13_port, A(12) => 
                           Accu_out_12_port, A(11) => Accu_out_11_port, A(10) 
                           => Accu_out_10_port, A(9) => Accu_out_9_port, A(8) 
                           => Accu_out_8_port, A(7) => Accu_out_7_port, A(6) =>
                           Accu_out_6_port, A(5) => Accu_out_5_port, A(4) => 
                           Accu_out_4_port, A(3) => Accu_out_3_port, A(2) => 
                           Accu_out_2_port, A(1) => Accu_out_1_port, A(0) => 
                           Accu_out_0_port, B(20) => X_Logic0_port, B(19) => 
                           X_Logic0_port, B(18) => X_Logic0_port, B(17) => 
                           X_Logic0_port, B(16) => X_Logic0_port, B(15) => n3, 
                           B(14) => Accu_in(14), B(13) => Accu_in(13), B(12) =>
                           Accu_in(12), B(11) => Accu_in(11), B(10) => 
                           Accu_in(10), B(9) => Accu_in(9), B(8) => Accu_in(8),
                           B(7) => Accu_in(7), B(6) => Accu_in(6), B(5) => 
                           Accu_in(5), B(4) => Accu_in(4), B(3) => Accu_in(3), 
                           B(2) => Accu_in(2), B(1) => Accu_in(1), B(0) => 
                           Accu_in(0), CI => X_Logic0_port, SUM(20) => N28, 
                           SUM(19) => N27, SUM(18) => N26, SUM(17) => N25, 
                           SUM(16) => N24, SUM(15) => N23, SUM(14) => N22, 
                           SUM(13) => N21, SUM(12) => N20, SUM(11) => N19, 
                           SUM(10) => N18, SUM(9) => N17, SUM(8) => N16, SUM(7)
                           => N15, SUM(6) => N14, SUM(5) => N13, SUM(4) => N12,
                           SUM(3) => N11, SUM(2) => N10, SUM(1) => N9, SUM(0) 
                           => N8, CO => n_1057);
   U3 : BUF2 port map( A => Accu_in(15), Q => n3);
   U4 : NAND22 port map( A => n3, B => n2, Q => n8_port);
   U5 : BUF2 port map( A => n10_port, Q => n4);
   U6 : NOR21 port map( A => n2, B => n3, Q => n10_port);
   U7 : NOR21 port map( A => n5, B => n2, Q => n23_port);
   U8 : INV3 port map( A => n3, Q => n5);
   U9 : INV3 port map( A => n1, Q => n2);
   U10 : NAND31 port map( A => n19_port, B => n8_port, C => n20_port, Q => N86)
                           ;
   U11 : NAND22 port map( A => N23, B => n4, Q => n19_port);
   U12 : NAND22 port map( A => N44, B => n3, Q => n20_port);
   U13 : NAND22 port map( A => n21_port, B => n22_port, Q => N85);
   U14 : NAND22 port map( A => Accu_in(14), B => n2, Q => n22_port);
   U15 : AOI221 port map( A => N43, B => n23_port, C => N22, D => n4, Q => 
                           n21_port);
   U16 : NAND22 port map( A => n24_port, B => n25_port, Q => N84);
   U17 : NAND22 port map( A => Accu_in(13), B => n2, Q => n25_port);
   U18 : AOI221 port map( A => N42, B => n23_port, C => N21, D => n4, Q => 
                           n24_port);
   U19 : NAND22 port map( A => n26_port, B => n27_port, Q => N83);
   U20 : NAND22 port map( A => Accu_in(12), B => n2, Q => n27_port);
   U21 : AOI221 port map( A => N41, B => n23_port, C => N20, D => n4, Q => 
                           n26_port);
   U22 : NAND22 port map( A => n28_port, B => n29_port, Q => N82);
   U23 : NAND22 port map( A => Accu_in(11), B => n2, Q => n29_port);
   U24 : AOI221 port map( A => N40, B => n23_port, C => N19, D => n4, Q => 
                           n28_port);
   U25 : NAND22 port map( A => n30_port, B => n31_port, Q => N81);
   U26 : NAND22 port map( A => Accu_in(10), B => n2, Q => n31_port);
   U27 : AOI221 port map( A => N39, B => n23_port, C => N18, D => n4, Q => 
                           n30_port);
   U28 : NAND22 port map( A => n32_port, B => n33_port, Q => N80);
   U29 : NAND22 port map( A => Accu_in(9), B => n2, Q => n33_port);
   U30 : AOI221 port map( A => N38, B => n23_port, C => N17, D => n4, Q => 
                           n32_port);
   U31 : NAND22 port map( A => n34_port, B => n35_port, Q => N79);
   U32 : NAND22 port map( A => Accu_in(8), B => n2, Q => n35_port);
   U33 : AOI221 port map( A => N37, B => n23_port, C => N16, D => n4, Q => 
                           n34_port);
   U34 : NAND22 port map( A => n36_port, B => n37_port, Q => N78);
   U35 : NAND22 port map( A => Accu_in(7), B => Accu_ctrl, Q => n37_port);
   U36 : AOI221 port map( A => N36, B => n23_port, C => N15, D => n4, Q => 
                           n36_port);
   U37 : NAND22 port map( A => n38_port, B => n39_port, Q => N77);
   U38 : NAND22 port map( A => Accu_in(6), B => n2, Q => n39_port);
   U39 : AOI221 port map( A => N35, B => n23_port, C => N14, D => n4, Q => 
                           n38_port);
   U40 : NAND22 port map( A => n40_port, B => n41_port, Q => N76);
   U41 : NAND22 port map( A => Accu_in(5), B => n2, Q => n41_port);
   U42 : AOI221 port map( A => N34, B => n23_port, C => N13, D => n4, Q => 
                           n40_port);
   U43 : NAND22 port map( A => n42_port, B => n43_port, Q => N75);
   U44 : NAND22 port map( A => Accu_in(4), B => Accu_ctrl, Q => n43_port);
   U45 : AOI221 port map( A => N33, B => n23_port, C => N12, D => n4, Q => 
                           n42_port);
   U46 : NAND22 port map( A => n44_port, B => n45_port, Q => N74);
   U47 : NAND22 port map( A => Accu_in(3), B => n2, Q => n45_port);
   U48 : AOI221 port map( A => N32, B => n23_port, C => N11, D => n4, Q => 
                           n44_port);
   U49 : NAND22 port map( A => n46_port, B => n47_port, Q => N73);
   U50 : NAND22 port map( A => Accu_in(2), B => n2, Q => n47_port);
   U51 : AOI221 port map( A => N31, B => n23_port, C => N10, D => n4, Q => 
                           n46_port);
   U52 : NAND22 port map( A => n48_port, B => n49_port, Q => N72);
   U53 : NAND22 port map( A => Accu_in(1), B => Accu_ctrl, Q => n49_port);
   U54 : AOI221 port map( A => N30, B => n23_port, C => N9, D => n4, Q => 
                           n48_port);
   U55 : INV3 port map( A => Accu_ctrl, Q => n1);
   U56 : NAND31 port map( A => n7, B => n8_port, C => n9_port, Q => N91);
   U57 : NAND22 port map( A => N28, B => n4, Q => n7);
   U58 : NAND22 port map( A => N49, B => n3, Q => n9_port);
   U59 : NAND31 port map( A => n11_port, B => n8_port, C => n12_port, Q => N90)
                           ;
   U60 : NAND22 port map( A => N27, B => n4, Q => n11_port);
   U61 : NAND22 port map( A => N48, B => n3, Q => n12_port);
   U62 : NAND31 port map( A => n13_port, B => n8_port, C => n14_port, Q => N89)
                           ;
   U63 : NAND22 port map( A => N26, B => n4, Q => n13_port);
   U64 : NAND22 port map( A => N47, B => n3, Q => n14_port);
   U65 : NAND31 port map( A => n15_port, B => n8_port, C => n16_port, Q => N88)
                           ;
   U66 : NAND22 port map( A => N25, B => n4, Q => n15_port);
   U67 : NAND22 port map( A => N46, B => n3, Q => n16_port);
   U68 : NAND31 port map( A => n17_port, B => n8_port, C => n18_port, Q => N87)
                           ;
   U69 : NAND22 port map( A => N24, B => n4, Q => n17_port);
   U70 : NAND22 port map( A => N45, B => n3, Q => n18_port);
   U71 : NAND22 port map( A => n50, B => n51, Q => N71);
   U72 : NAND22 port map( A => Accu_in(0), B => n2, Q => n51);
   U73 : AOI221 port map( A => N29, B => n23_port, C => N8, D => n4, Q => n50);
   U74 : INV3 port map( A => RESET, Q => n6);
   U75 : LOGIC0 port map( Q => X_Logic0_port);
   U76 : LOGIC1 port map( Q => X_Logic1_port);

end SYN_A;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity MULT is

   port( Mult_in_A, Mult_in_B : in std_logic_vector (7 downto 0);  Mult_out : 
         out std_logic_vector (15 downto 0));

end MULT;

architecture SYN_A of MULT is

   component LOGIC1
      port( Q : out std_logic);
   end component;
   
   component MULT_DW02_mult_0
      port( A, B : in std_logic_vector (7 downto 0);  TC : in std_logic;  
            PRODUCT : out std_logic_vector (15 downto 0));
   end component;
   
   signal n1 : std_logic;

begin
   
   mult_21 : MULT_DW02_mult_0 port map( A(7) => Mult_in_B(7), A(6) => 
                           Mult_in_B(6), A(5) => Mult_in_B(5), A(4) => 
                           Mult_in_B(4), A(3) => Mult_in_B(3), A(2) => 
                           Mult_in_B(2), A(1) => Mult_in_B(1), A(0) => 
                           Mult_in_B(0), B(7) => Mult_in_A(7), B(6) => 
                           Mult_in_A(6), B(5) => Mult_in_A(5), B(4) => 
                           Mult_in_A(4), B(3) => Mult_in_A(3), B(2) => 
                           Mult_in_A(2), B(1) => Mult_in_A(1), B(0) => 
                           Mult_in_A(0), TC => n1, PRODUCT(15) => Mult_out(15),
                           PRODUCT(14) => Mult_out(14), PRODUCT(13) => 
                           Mult_out(13), PRODUCT(12) => Mult_out(12), 
                           PRODUCT(11) => Mult_out(11), PRODUCT(10) => 
                           Mult_out(10), PRODUCT(9) => Mult_out(9), PRODUCT(8) 
                           => Mult_out(8), PRODUCT(7) => Mult_out(7), 
                           PRODUCT(6) => Mult_out(6), PRODUCT(5) => Mult_out(5)
                           , PRODUCT(4) => Mult_out(4), PRODUCT(3) => 
                           Mult_out(3), PRODUCT(2) => Mult_out(2), PRODUCT(1) 
                           => Mult_out(1), PRODUCT(0) => Mult_out(0));
   U1 : LOGIC1 port map( Q => n1);

end SYN_A;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity coeff_ram is

   port( CLK, RESET : in std_logic;  data_in : in std_logic_vector (7 downto 0)
         ;  data_out : out std_logic_vector (7 downto 0);  address : in 
         std_logic_vector (4 downto 0);  wb : in std_logic);

end coeff_ram;

architecture SYN_arch of coeff_ram is

   component BUF2
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR31
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   component IMUX40
      port( A, B, C, D, S0, S1 : in std_logic;  Q : out std_logic);
   end component;
   
   component MUX22
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component DFEP1
      port( D, E, C, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFEC1
      port( D, E, C, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal ram_0_7_port, ram_0_6_port, ram_0_5_port, ram_0_4_port, ram_0_3_port,
      ram_0_2_port, ram_0_1_port, ram_0_0_port, ram_1_7_port, ram_1_6_port, 
      ram_1_5_port, ram_1_4_port, ram_1_3_port, ram_1_2_port, ram_1_1_port, 
      ram_1_0_port, ram_2_7_port, ram_2_6_port, ram_2_5_port, ram_2_4_port, 
      ram_2_3_port, ram_2_2_port, ram_2_1_port, ram_2_0_port, ram_3_7_port, 
      ram_3_6_port, ram_3_5_port, ram_3_4_port, ram_3_3_port, ram_3_2_port, 
      ram_3_1_port, ram_3_0_port, ram_4_7_port, ram_4_6_port, ram_4_5_port, 
      ram_4_4_port, ram_4_3_port, ram_4_2_port, ram_4_1_port, ram_4_0_port, 
      ram_5_7_port, ram_5_6_port, ram_5_5_port, ram_5_4_port, ram_5_3_port, 
      ram_5_2_port, ram_5_1_port, ram_5_0_port, ram_6_7_port, ram_6_6_port, 
      ram_6_5_port, ram_6_4_port, ram_6_3_port, ram_6_2_port, ram_6_1_port, 
      ram_6_0_port, ram_7_7_port, ram_7_6_port, ram_7_5_port, ram_7_4_port, 
      ram_7_3_port, ram_7_2_port, ram_7_1_port, ram_7_0_port, ram_8_7_port, 
      ram_8_6_port, ram_8_5_port, ram_8_4_port, ram_8_3_port, ram_8_2_port, 
      ram_8_1_port, ram_8_0_port, ram_9_7_port, ram_9_6_port, ram_9_5_port, 
      ram_9_4_port, ram_9_3_port, ram_9_2_port, ram_9_1_port, ram_9_0_port, 
      ram_10_7_port, ram_10_6_port, ram_10_5_port, ram_10_4_port, ram_10_3_port
      , ram_10_2_port, ram_10_1_port, ram_10_0_port, ram_11_7_port, 
      ram_11_6_port, ram_11_5_port, ram_11_4_port, ram_11_3_port, ram_11_2_port
      , ram_11_1_port, ram_11_0_port, ram_12_7_port, ram_12_6_port, 
      ram_12_5_port, ram_12_4_port, ram_12_3_port, ram_12_2_port, ram_12_1_port
      , ram_12_0_port, ram_13_7_port, ram_13_6_port, ram_13_5_port, 
      ram_13_4_port, ram_13_3_port, ram_13_2_port, ram_13_1_port, ram_13_0_port
      , ram_14_7_port, ram_14_6_port, ram_14_5_port, ram_14_4_port, 
      ram_14_3_port, ram_14_2_port, ram_14_1_port, ram_14_0_port, ram_15_7_port
      , ram_15_6_port, ram_15_5_port, ram_15_4_port, ram_15_3_port, 
      ram_15_2_port, ram_15_1_port, ram_15_0_port, ram_16_7_port, ram_16_6_port
      , ram_16_5_port, ram_16_4_port, ram_16_3_port, ram_16_2_port, 
      ram_16_1_port, ram_16_0_port, ram_17_7_port, ram_17_6_port, ram_17_5_port
      , ram_17_4_port, ram_17_3_port, ram_17_2_port, ram_17_1_port, 
      ram_17_0_port, ram_18_7_port, ram_18_6_port, ram_18_5_port, ram_18_4_port
      , ram_18_3_port, ram_18_2_port, ram_18_1_port, ram_18_0_port, 
      ram_19_7_port, ram_19_6_port, ram_19_5_port, ram_19_4_port, ram_19_3_port
      , ram_19_2_port, ram_19_1_port, ram_19_0_port, ram_20_7_port, 
      ram_20_6_port, ram_20_5_port, ram_20_4_port, ram_20_3_port, ram_20_2_port
      , ram_20_1_port, ram_20_0_port, ram_21_7_port, ram_21_6_port, 
      ram_21_5_port, ram_21_4_port, ram_21_3_port, ram_21_2_port, ram_21_1_port
      , ram_21_0_port, ram_22_7_port, ram_22_6_port, ram_22_5_port, 
      ram_22_4_port, ram_22_3_port, ram_22_2_port, ram_22_1_port, ram_22_0_port
      , ram_23_7_port, ram_23_6_port, ram_23_5_port, ram_23_4_port, 
      ram_23_3_port, ram_23_2_port, ram_23_1_port, ram_23_0_port, ram_24_7_port
      , ram_24_6_port, ram_24_5_port, ram_24_4_port, ram_24_3_port, 
      ram_24_2_port, ram_24_1_port, ram_24_0_port, ram_25_7_port, ram_25_6_port
      , ram_25_5_port, ram_25_4_port, ram_25_3_port, ram_25_2_port, 
      ram_25_1_port, ram_25_0_port, ram_26_7_port, ram_26_6_port, ram_26_5_port
      , ram_26_4_port, ram_26_3_port, ram_26_2_port, ram_26_1_port, 
      ram_26_0_port, ram_27_7_port, ram_27_6_port, ram_27_5_port, ram_27_4_port
      , ram_27_3_port, ram_27_2_port, ram_27_1_port, ram_27_0_port, 
      ram_28_7_port, ram_28_6_port, ram_28_5_port, ram_28_4_port, ram_28_3_port
      , ram_28_2_port, ram_28_1_port, ram_28_0_port, ram_29_7_port, 
      ram_29_6_port, ram_29_5_port, ram_29_4_port, ram_29_3_port, ram_29_2_port
      , ram_29_1_port, ram_29_0_port, ram_30_7_port, ram_30_6_port, 
      ram_30_5_port, ram_30_4_port, ram_30_3_port, ram_30_2_port, ram_30_1_port
      , ram_30_0_port, ram_31_7_port, ram_31_6_port, ram_31_5_port, 
      ram_31_4_port, ram_31_3_port, ram_31_2_port, ram_31_1_port, ram_31_0_port
      , n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, 
      n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67
      , n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, 
      n82, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
      n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30
      , n31, n32, n33, n34, n35, n36, n37, n38, n83, n84, n85, n86, n87, n88, 
      n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, 
      n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, 
      n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, 
      n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, 
      n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, 
      n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, 
      n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, 
      n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, 
      n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, 
      n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, 
      n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, 
      n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, 
      n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, 
      n247, n248, n249, n250, n251, n_1058, n_1059, n_1060, n_1061, n_1062, 
      n_1063, n_1064, n_1065, n_1066, n_1067, n_1068, n_1069, n_1070, n_1071, 
      n_1072, n_1073, n_1074, n_1075, n_1076, n_1077, n_1078, n_1079, n_1080, 
      n_1081, n_1082, n_1083, n_1084, n_1085, n_1086, n_1087, n_1088, n_1089, 
      n_1090, n_1091, n_1092, n_1093, n_1094, n_1095, n_1096, n_1097, n_1098, 
      n_1099, n_1100, n_1101, n_1102, n_1103, n_1104, n_1105, n_1106, n_1107, 
      n_1108, n_1109, n_1110, n_1111, n_1112, n_1113, n_1114, n_1115, n_1116, 
      n_1117, n_1118, n_1119, n_1120, n_1121, n_1122, n_1123, n_1124, n_1125, 
      n_1126, n_1127, n_1128, n_1129, n_1130, n_1131, n_1132, n_1133, n_1134, 
      n_1135, n_1136, n_1137, n_1138, n_1139, n_1140, n_1141, n_1142, n_1143, 
      n_1144, n_1145, n_1146, n_1147, n_1148, n_1149, n_1150, n_1151, n_1152, 
      n_1153, n_1154, n_1155, n_1156, n_1157, n_1158, n_1159, n_1160, n_1161, 
      n_1162, n_1163, n_1164, n_1165, n_1166, n_1167, n_1168, n_1169, n_1170, 
      n_1171, n_1172, n_1173, n_1174, n_1175, n_1176, n_1177, n_1178, n_1179, 
      n_1180, n_1181, n_1182, n_1183, n_1184, n_1185, n_1186, n_1187, n_1188, 
      n_1189, n_1190, n_1191, n_1192, n_1193, n_1194, n_1195, n_1196, n_1197, 
      n_1198, n_1199, n_1200, n_1201, n_1202, n_1203, n_1204, n_1205, n_1206, 
      n_1207, n_1208, n_1209, n_1210, n_1211, n_1212, n_1213, n_1214, n_1215, 
      n_1216, n_1217, n_1218, n_1219, n_1220, n_1221, n_1222, n_1223, n_1224, 
      n_1225, n_1226, n_1227, n_1228, n_1229, n_1230, n_1231, n_1232, n_1233, 
      n_1234, n_1235, n_1236, n_1237, n_1238, n_1239, n_1240, n_1241, n_1242, 
      n_1243, n_1244, n_1245, n_1246, n_1247, n_1248, n_1249, n_1250, n_1251, 
      n_1252, n_1253, n_1254, n_1255, n_1256, n_1257, n_1258, n_1259, n_1260, 
      n_1261, n_1262, n_1263, n_1264, n_1265, n_1266, n_1267, n_1268, n_1269, 
      n_1270, n_1271, n_1272, n_1273, n_1274, n_1275, n_1276, n_1277, n_1278, 
      n_1279, n_1280, n_1281, n_1282, n_1283, n_1284, n_1285, n_1286, n_1287, 
      n_1288, n_1289, n_1290, n_1291, n_1292, n_1293, n_1294, n_1295, n_1296, 
      n_1297, n_1298, n_1299, n_1300, n_1301, n_1302, n_1303, n_1304, n_1305, 
      n_1306, n_1307, n_1308, n_1309, n_1310, n_1311, n_1312, n_1313 : 
      std_logic;

begin
   
   ram_reg_2_7_inst : DFEC1 port map( D => n216, E => n237, C => CLK, RN => 
                           n165, Q => ram_2_7_port, QN => n_1058);
   ram_reg_2_6_inst : DFEC1 port map( D => n212, E => n237, C => CLK, RN => 
                           n165, Q => ram_2_6_port, QN => n_1059);
   ram_reg_6_7_inst : DFEC1 port map( D => n216, E => n245, C => CLK, RN => 
                           n167, Q => ram_6_7_port, QN => n_1060);
   ram_reg_6_6_inst : DFEC1 port map( D => n212, E => n245, C => CLK, RN => 
                           n167, Q => ram_6_6_port, QN => n_1061);
   ram_reg_10_7_inst : DFEC1 port map( D => n215, E => n238, C => CLK, RN => 
                           n169, Q => ram_10_7_port, QN => n_1062);
   ram_reg_10_6_inst : DFEC1 port map( D => n211, E => n238, C => CLK, RN => 
                           n169, Q => ram_10_6_port, QN => n_1063);
   ram_reg_14_7_inst : DFEC1 port map( D => n215, E => n246, C => CLK, RN => 
                           n163, Q => ram_14_7_port, QN => n_1064);
   ram_reg_14_6_inst : DFEC1 port map( D => n211, E => n246, C => CLK, RN => 
                           n162, Q => ram_14_6_port, QN => n_1065);
   ram_reg_22_7_inst : DFEC1 port map( D => n214, E => n247, C => CLK, RN => 
                           n159, Q => ram_22_7_port, QN => n_1066);
   ram_reg_22_6_inst : DFEC1 port map( D => n210, E => n247, C => CLK, RN => 
                           n159, Q => ram_22_6_port, QN => n_1067);
   ram_reg_26_7_inst : DFEC1 port map( D => n213, E => n240, C => CLK, RN => 
                           n157, Q => ram_26_7_port, QN => n_1068);
   ram_reg_26_6_inst : DFEC1 port map( D => n209, E => n240, C => CLK, RN => 
                           n157, Q => ram_26_6_port, QN => n_1069);
   ram_reg_30_7_inst : DFEC1 port map( D => n213, E => n248, C => CLK, RN => 
                           n155, Q => ram_30_7_port, QN => n_1070);
   ram_reg_30_6_inst : DFEC1 port map( D => n209, E => n248, C => CLK, RN => 
                           n155, Q => ram_30_6_port, QN => n_1071);
   ram_reg_18_7_inst : DFEP1 port map( D => n214, E => n239, C => CLK, SN => 
                           n180, Q => ram_18_7_port, QN => n_1072);
   ram_reg_18_6_inst : DFEP1 port map( D => n210, E => n239, C => CLK, SN => 
                           n180, Q => ram_18_6_port, QN => n_1073);
   ram_reg_0_7_inst : DFEC1 port map( D => n216, E => n233, C => CLK, RN => 
                           n154, Q => ram_0_7_port, QN => n_1074);
   ram_reg_0_6_inst : DFEC1 port map( D => n212, E => n233, C => CLK, RN => 
                           n166, Q => ram_0_6_port, QN => n_1075);
   ram_reg_1_7_inst : DFEC1 port map( D => n216, E => n229, C => CLK, RN => 
                           n164, Q => ram_1_7_port, QN => n_1076);
   ram_reg_1_6_inst : DFEC1 port map( D => n212, E => n229, C => CLK, RN => 
                           n165, Q => ram_1_6_port, QN => n_1077);
   ram_reg_5_7_inst : DFEC1 port map( D => n216, E => n221, C => CLK, RN => 
                           n166, Q => ram_5_7_port, QN => n_1078);
   ram_reg_5_6_inst : DFEC1 port map( D => n212, E => n221, C => CLK, RN => 
                           n166, Q => ram_5_6_port, QN => n_1079);
   ram_reg_9_7_inst : DFEC1 port map( D => n215, E => n230, C => CLK, RN => 
                           n168, Q => ram_9_7_port, QN => n_1080);
   ram_reg_9_6_inst : DFEC1 port map( D => n211, E => n230, C => CLK, RN => 
                           n169, Q => ram_9_6_port, QN => n_1081);
   ram_reg_11_7_inst : DFEC1 port map( D => n215, E => n226, C => CLK, RN => 
                           n169, Q => ram_11_7_port, QN => n_1082);
   ram_reg_11_6_inst : DFEC1 port map( D => n211, E => n226, C => CLK, RN => 
                           n169, Q => ram_11_6_port, QN => n_1083);
   ram_reg_15_7_inst : DFEC1 port map( D => n215, E => n218, C => CLK, RN => 
                           n162, Q => ram_15_7_port, QN => n_1084);
   ram_reg_16_7_inst : DFEC1 port map( D => n214, E => n235, C => CLK, RN => 
                           n162, Q => ram_16_7_port, QN => n_1085);
   ram_reg_17_7_inst : DFEC1 port map( D => n214, E => n231, C => CLK, RN => 
                           n161, Q => ram_17_7_port, QN => n_1086);
   ram_reg_17_6_inst : DFEC1 port map( D => n210, E => n231, C => CLK, RN => 
                           n161, Q => ram_17_6_port, QN => n_1087);
   ram_reg_20_7_inst : DFEC1 port map( D => n214, E => n243, C => CLK, RN => 
                           n160, Q => ram_20_7_port, QN => n_1088);
   ram_reg_20_6_inst : DFEC1 port map( D => n210, E => n243, C => CLK, RN => 
                           n160, Q => ram_20_6_port, QN => n_1089);
   ram_reg_21_7_inst : DFEC1 port map( D => n214, E => n223, C => CLK, RN => 
                           n159, Q => ram_21_7_port, QN => n_1090);
   ram_reg_21_6_inst : DFEC1 port map( D => n210, E => n223, C => CLK, RN => 
                           n159, Q => ram_21_6_port, QN => n_1091);
   ram_reg_25_7_inst : DFEC1 port map( D => n213, E => n232, C => CLK, RN => 
                           n158, Q => ram_25_7_port, QN => n_1092);
   ram_reg_25_6_inst : DFEC1 port map( D => n209, E => n232, C => CLK, RN => 
                           n157, Q => ram_25_6_port, QN => n_1093);
   ram_reg_29_7_inst : DFEC1 port map( D => n213, E => n224, C => CLK, RN => 
                           n156, Q => ram_29_7_port, QN => n_1094);
   ram_reg_29_6_inst : DFEC1 port map( D => n209, E => n224, C => CLK, RN => 
                           n156, Q => ram_29_6_port, QN => n_1095);
   ram_reg_31_7_inst : DFEC1 port map( D => n213, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_7_port, QN => n_1096);
   ram_reg_31_6_inst : DFEC1 port map( D => n209, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_6_port, QN => n_1097);
   ram_reg_3_7_inst : DFEP1 port map( D => n216, E => n225, C => CLK, SN => 
                           n173, Q => ram_3_7_port, QN => n_1098);
   ram_reg_3_6_inst : DFEP1 port map( D => n212, E => n225, C => CLK, SN => 
                           n173, Q => ram_3_6_port, QN => n_1099);
   ram_reg_4_7_inst : DFEP1 port map( D => n216, E => n241, C => CLK, SN => 
                           n174, Q => ram_4_7_port, QN => n_1100);
   ram_reg_4_6_inst : DFEP1 port map( D => n212, E => n241, C => CLK, SN => 
                           n174, Q => ram_4_6_port, QN => n_1101);
   ram_reg_7_7_inst : DFEP1 port map( D => n216, E => n217, C => CLK, SN => 
                           n178, Q => ram_7_7_port, QN => n_1102);
   ram_reg_7_6_inst : DFEP1 port map( D => n212, E => n217, C => CLK, SN => 
                           n178, Q => ram_7_6_port, QN => n_1103);
   ram_reg_8_7_inst : DFEP1 port map( D => n215, E => n234, C => CLK, SN => 
                           n179, Q => ram_8_7_port, QN => n_1104);
   ram_reg_8_6_inst : DFEP1 port map( D => n211, E => n234, C => CLK, SN => 
                           n179, Q => ram_8_6_port, QN => n_1105);
   ram_reg_12_7_inst : DFEP1 port map( D => n215, E => n242, C => CLK, SN => 
                           n171, Q => ram_12_7_port, QN => n_1106);
   ram_reg_12_6_inst : DFEP1 port map( D => n211, E => n242, C => CLK, SN => 
                           n170, Q => ram_12_6_port, QN => n_1107);
   ram_reg_13_7_inst : DFEP1 port map( D => n215, E => n222, C => CLK, SN => 
                           n171, Q => ram_13_7_port, QN => n_1108);
   ram_reg_13_6_inst : DFEP1 port map( D => n211, E => n222, C => CLK, SN => 
                           n171, Q => ram_13_6_port, QN => n_1109);
   ram_reg_15_6_inst : DFEP1 port map( D => n211, E => n218, C => CLK, SN => 
                           n177, Q => ram_15_6_port, QN => n_1110);
   ram_reg_16_6_inst : DFEP1 port map( D => n210, E => n235, C => CLK, SN => 
                           n179, Q => ram_16_6_port, QN => n_1111);
   ram_reg_19_7_inst : DFEP1 port map( D => n214, E => n227, C => CLK, SN => 
                           n179, Q => ram_19_7_port, QN => n_1112);
   ram_reg_19_6_inst : DFEP1 port map( D => n210, E => n227, C => CLK, SN => 
                           n179, Q => ram_19_6_port, QN => n_1113);
   ram_reg_23_7_inst : DFEP1 port map( D => n214, E => n219, C => CLK, SN => 
                           n176, Q => ram_23_7_port, QN => n_1114);
   ram_reg_23_6_inst : DFEP1 port map( D => n210, E => n219, C => CLK, SN => 
                           n176, Q => ram_23_6_port, QN => n_1115);
   ram_reg_24_7_inst : DFEP1 port map( D => n213, E => n236, C => CLK, SN => 
                           n176, Q => ram_24_7_port, QN => n_1116);
   ram_reg_24_6_inst : DFEP1 port map( D => n209, E => n236, C => CLK, SN => 
                           n175, Q => ram_24_6_port, QN => n_1117);
   ram_reg_27_7_inst : DFEP1 port map( D => n213, E => n228, C => CLK, SN => 
                           n173, Q => ram_27_7_port, QN => n_1118);
   ram_reg_27_6_inst : DFEP1 port map( D => n209, E => n228, C => CLK, SN => 
                           n173, Q => ram_27_6_port, QN => n_1119);
   ram_reg_28_7_inst : DFEP1 port map( D => n213, E => n244, C => CLK, SN => 
                           n172, Q => ram_28_7_port, QN => n_1120);
   ram_reg_28_6_inst : DFEP1 port map( D => n209, E => n244, C => CLK, SN => 
                           n175, Q => ram_28_6_port, QN => n_1121);
   ram_reg_2_5_inst : DFEC1 port map( D => n208, E => n237, C => CLK, RN => 
                           n165, Q => ram_2_5_port, QN => n_1122);
   ram_reg_2_4_inst : DFEC1 port map( D => n204, E => n237, C => CLK, RN => 
                           n168, Q => ram_2_4_port, QN => n_1123);
   ram_reg_6_5_inst : DFEC1 port map( D => n208, E => n245, C => CLK, RN => 
                           n167, Q => ram_6_5_port, QN => n_1124);
   ram_reg_6_4_inst : DFEC1 port map( D => n204, E => n245, C => CLK, RN => 
                           n167, Q => ram_6_4_port, QN => n_1125);
   ram_reg_10_5_inst : DFEC1 port map( D => n207, E => n238, C => CLK, RN => 
                           n169, Q => ram_10_5_port, QN => n_1126);
   ram_reg_10_4_inst : DFEC1 port map( D => n203, E => n238, C => CLK, RN => 
                           n169, Q => ram_10_4_port, QN => n_1127);
   ram_reg_14_4_inst : DFEC1 port map( D => n203, E => n246, C => CLK, RN => 
                           n162, Q => ram_14_4_port, QN => n_1128);
   ram_reg_22_5_inst : DFEC1 port map( D => n206, E => n247, C => CLK, RN => 
                           n159, Q => ram_22_5_port, QN => n_1129);
   ram_reg_22_4_inst : DFEC1 port map( D => n202, E => n247, C => CLK, RN => 
                           n158, Q => ram_22_4_port, QN => n_1130);
   ram_reg_26_5_inst : DFEC1 port map( D => n205, E => n240, C => CLK, RN => 
                           n157, Q => ram_26_5_port, QN => n_1131);
   ram_reg_26_4_inst : DFEC1 port map( D => n201, E => n240, C => CLK, RN => 
                           n157, Q => ram_26_4_port, QN => n_1132);
   ram_reg_30_5_inst : DFEC1 port map( D => n205, E => n248, C => CLK, RN => 
                           n155, Q => ram_30_5_port, QN => n_1133);
   ram_reg_30_4_inst : DFEC1 port map( D => n201, E => n248, C => CLK, RN => 
                           n155, Q => ram_30_4_port, QN => n_1134);
   ram_reg_14_5_inst : DFEP1 port map( D => n207, E => n246, C => CLK, SN => 
                           n175, Q => ram_14_5_port, QN => n_1135);
   ram_reg_18_5_inst : DFEP1 port map( D => n206, E => n239, C => CLK, SN => 
                           n180, Q => ram_18_5_port, QN => n_1136);
   ram_reg_18_4_inst : DFEP1 port map( D => n202, E => n239, C => CLK, SN => 
                           n180, Q => ram_18_4_port, QN => n_1137);
   ram_reg_0_5_inst : DFEC1 port map( D => n208, E => n233, C => CLK, RN => 
                           n164, Q => ram_0_5_port, QN => n_1138);
   ram_reg_0_4_inst : DFEC1 port map( D => n204, E => n233, C => CLK, RN => 
                           n164, Q => ram_0_4_port, QN => n_1139);
   ram_reg_1_5_inst : DFEC1 port map( D => n208, E => n229, C => CLK, RN => 
                           n165, Q => ram_1_5_port, QN => n_1140);
   ram_reg_1_4_inst : DFEC1 port map( D => n204, E => n229, C => CLK, RN => 
                           n165, Q => ram_1_4_port, QN => n_1141);
   ram_reg_5_5_inst : DFEC1 port map( D => n208, E => n221, C => CLK, RN => 
                           n166, Q => ram_5_5_port, QN => n_1142);
   ram_reg_5_4_inst : DFEC1 port map( D => n204, E => n221, C => CLK, RN => 
                           n167, Q => ram_5_4_port, QN => n_1143);
   ram_reg_9_5_inst : DFEC1 port map( D => n207, E => n230, C => CLK, RN => 
                           n170, Q => ram_9_5_port, QN => n_1144);
   ram_reg_9_4_inst : DFEC1 port map( D => n203, E => n230, C => CLK, RN => 
                           n170, Q => ram_9_4_port, QN => n_1145);
   ram_reg_11_5_inst : DFEC1 port map( D => n207, E => n226, C => CLK, RN => 
                           n168, Q => ram_11_5_port, QN => n_1146);
   ram_reg_11_4_inst : DFEC1 port map( D => n203, E => n226, C => CLK, RN => 
                           n169, Q => ram_11_4_port, QN => n_1147);
   ram_reg_12_4_inst : DFEC1 port map( D => n203, E => n242, C => CLK, RN => 
                           n163, Q => ram_12_4_port, QN => n_1148);
   ram_reg_15_4_inst : DFEC1 port map( D => n203, E => n218, C => CLK, RN => 
                           n162, Q => ram_15_4_port, QN => n_1149);
   ram_reg_16_4_inst : DFEC1 port map( D => n202, E => n235, C => CLK, RN => 
                           n162, Q => ram_16_4_port, QN => n_1150);
   ram_reg_17_4_inst : DFEC1 port map( D => n202, E => n231, C => CLK, RN => 
                           n161, Q => ram_17_4_port, QN => n_1151);
   ram_reg_19_4_inst : DFEC1 port map( D => n202, E => n227, C => CLK, RN => 
                           n160, Q => ram_19_4_port, QN => n_1152);
   ram_reg_20_5_inst : DFEC1 port map( D => n206, E => n243, C => CLK, RN => 
                           n160, Q => ram_20_5_port, QN => n_1153);
   ram_reg_20_4_inst : DFEC1 port map( D => n202, E => n243, C => CLK, RN => 
                           n160, Q => ram_20_4_port, QN => n_1154);
   ram_reg_21_5_inst : DFEC1 port map( D => n206, E => n223, C => CLK, RN => 
                           n159, Q => ram_21_5_port, QN => n_1155);
   ram_reg_21_4_inst : DFEC1 port map( D => n202, E => n223, C => CLK, RN => 
                           n159, Q => ram_21_4_port, QN => n_1156);
   ram_reg_25_5_inst : DFEC1 port map( D => n205, E => n232, C => CLK, RN => 
                           n157, Q => ram_25_5_port, QN => n_1157);
   ram_reg_25_4_inst : DFEC1 port map( D => n201, E => n232, C => CLK, RN => 
                           n157, Q => ram_25_4_port, QN => n_1158);
   ram_reg_29_5_inst : DFEC1 port map( D => n205, E => n224, C => CLK, RN => 
                           n156, Q => ram_29_5_port, QN => n_1159);
   ram_reg_29_4_inst : DFEC1 port map( D => n201, E => n224, C => CLK, RN => 
                           n156, Q => ram_29_4_port, QN => n_1160);
   ram_reg_31_5_inst : DFEC1 port map( D => n205, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_5_port, QN => n_1161);
   ram_reg_31_4_inst : DFEC1 port map( D => n201, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_4_port, QN => n_1162);
   ram_reg_3_5_inst : DFEP1 port map( D => n208, E => n225, C => CLK, SN => 
                           n173, Q => ram_3_5_port, QN => n_1163);
   ram_reg_3_4_inst : DFEP1 port map( D => n204, E => n225, C => CLK, SN => 
                           n173, Q => ram_3_4_port, QN => n_1164);
   ram_reg_4_5_inst : DFEP1 port map( D => n208, E => n241, C => CLK, SN => 
                           n174, Q => ram_4_5_port, QN => n_1165);
   ram_reg_4_4_inst : DFEP1 port map( D => n204, E => n241, C => CLK, SN => 
                           n174, Q => ram_4_4_port, QN => n_1166);
   ram_reg_7_5_inst : DFEP1 port map( D => n208, E => n217, C => CLK, SN => 
                           n178, Q => ram_7_5_port, QN => n_1167);
   ram_reg_7_4_inst : DFEP1 port map( D => n204, E => n217, C => CLK, SN => 
                           n178, Q => ram_7_4_port, QN => n_1168);
   ram_reg_8_5_inst : DFEP1 port map( D => n207, E => n234, C => CLK, SN => 
                           n179, Q => ram_8_5_port, QN => n_1169);
   ram_reg_8_4_inst : DFEP1 port map( D => n203, E => n234, C => CLK, SN => 
                           n180, Q => ram_8_4_port, QN => n_1170);
   ram_reg_12_5_inst : DFEP1 port map( D => n207, E => n242, C => CLK, SN => 
                           n171, Q => ram_12_5_port, QN => n_1171);
   ram_reg_13_5_inst : DFEP1 port map( D => n207, E => n222, C => CLK, SN => 
                           n172, Q => ram_13_5_port, QN => n_1172);
   ram_reg_13_4_inst : DFEP1 port map( D => n203, E => n222, C => CLK, SN => 
                           n172, Q => ram_13_4_port, QN => n_1173);
   ram_reg_15_5_inst : DFEP1 port map( D => n207, E => n218, C => CLK, SN => 
                           n177, Q => ram_15_5_port, QN => n_1174);
   ram_reg_16_5_inst : DFEP1 port map( D => n206, E => n235, C => CLK, SN => 
                           n181, Q => ram_16_5_port, QN => n_1175);
   ram_reg_17_5_inst : DFEP1 port map( D => n206, E => n231, C => CLK, SN => 
                           n180, Q => ram_17_5_port, QN => n_1176);
   ram_reg_19_5_inst : DFEP1 port map( D => n206, E => n227, C => CLK, SN => 
                           n179, Q => ram_19_5_port, QN => n_1177);
   ram_reg_23_5_inst : DFEP1 port map( D => n206, E => n219, C => CLK, SN => 
                           n176, Q => ram_23_5_port, QN => n_1178);
   ram_reg_23_4_inst : DFEP1 port map( D => n202, E => n219, C => CLK, SN => 
                           n176, Q => ram_23_4_port, QN => n_1179);
   ram_reg_24_5_inst : DFEP1 port map( D => n205, E => n236, C => CLK, SN => 
                           n175, Q => ram_24_5_port, QN => n_1180);
   ram_reg_24_4_inst : DFEP1 port map( D => n201, E => n236, C => CLK, SN => 
                           n175, Q => ram_24_4_port, QN => n_1181);
   ram_reg_27_5_inst : DFEP1 port map( D => n205, E => n228, C => CLK, SN => 
                           n173, Q => ram_27_5_port, QN => n_1182);
   ram_reg_27_4_inst : DFEP1 port map( D => n201, E => n228, C => CLK, SN => 
                           n173, Q => ram_27_4_port, QN => n_1183);
   ram_reg_28_5_inst : DFEP1 port map( D => n205, E => n244, C => CLK, SN => 
                           n172, Q => ram_28_5_port, QN => n_1184);
   ram_reg_28_4_inst : DFEP1 port map( D => n201, E => n244, C => CLK, SN => 
                           n172, Q => ram_28_4_port, QN => n_1185);
   ram_reg_2_3_inst : DFEC1 port map( D => n200, E => n237, C => CLK, RN => 
                           n166, Q => ram_2_3_port, QN => n_1186);
   ram_reg_6_3_inst : DFEC1 port map( D => n200, E => n245, C => CLK, RN => 
                           n167, Q => ram_6_3_port, QN => n_1187);
   ram_reg_18_3_inst : DFEC1 port map( D => n198, E => n239, C => CLK, RN => 
                           n161, Q => ram_18_3_port, QN => n_1188);
   ram_reg_22_3_inst : DFEC1 port map( D => n198, E => n247, C => CLK, RN => 
                           n158, Q => ram_22_3_port, QN => n_1189);
   ram_reg_26_3_inst : DFEC1 port map( D => n197, E => n240, C => CLK, RN => 
                           n156, Q => ram_26_3_port, QN => n_1190);
   ram_reg_30_3_inst : DFEC1 port map( D => n197, E => n248, C => CLK, RN => 
                           n155, Q => ram_30_3_port, QN => n_1191);
   ram_reg_10_3_inst : DFEP1 port map( D => n199, E => n238, C => CLK, SN => 
                           n171, Q => ram_10_3_port, QN => n_1192);
   ram_reg_14_3_inst : DFEP1 port map( D => n199, E => n246, C => CLK, SN => 
                           n176, Q => ram_14_3_port, QN => n_1193);
   ram_reg_0_3_inst : DFEC1 port map( D => n200, E => n233, C => CLK, RN => 
                           n164, Q => ram_0_3_port, QN => n_1194);
   ram_reg_1_3_inst : DFEC1 port map( D => n200, E => n229, C => CLK, RN => 
                           n165, Q => ram_1_3_port, QN => n_1195);
   ram_reg_5_3_inst : DFEC1 port map( D => n200, E => n221, C => CLK, RN => 
                           n167, Q => ram_5_3_port, QN => n_1196);
   ram_reg_9_3_inst : DFEC1 port map( D => n199, E => n230, C => CLK, RN => 
                           n170, Q => ram_9_3_port, QN => n_1197);
   ram_reg_11_3_inst : DFEC1 port map( D => n199, E => n226, C => CLK, RN => 
                           n164, Q => ram_11_3_port, QN => n_1198);
   ram_reg_13_3_inst : DFEC1 port map( D => n199, E => n222, C => CLK, RN => 
                           n163, Q => ram_13_3_port, QN => n_1199);
   ram_reg_20_3_inst : DFEC1 port map( D => n198, E => n243, C => CLK, RN => 
                           n160, Q => ram_20_3_port, QN => n_1200);
   ram_reg_25_3_inst : DFEC1 port map( D => n197, E => n232, C => CLK, RN => 
                           n157, Q => ram_25_3_port, QN => n_1201);
   ram_reg_29_3_inst : DFEC1 port map( D => n197, E => n224, C => CLK, RN => 
                           n155, Q => ram_29_3_port, QN => n_1202);
   ram_reg_31_3_inst : DFEC1 port map( D => n197, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_3_port, QN => n_1203);
   ram_reg_3_3_inst : DFEP1 port map( D => n200, E => n225, C => CLK, SN => 
                           n174, Q => ram_3_3_port, QN => n_1204);
   ram_reg_4_3_inst : DFEP1 port map( D => n200, E => n241, C => CLK, SN => 
                           n175, Q => ram_4_3_port, QN => n_1205);
   ram_reg_7_3_inst : DFEP1 port map( D => n200, E => n217, C => CLK, SN => 
                           n178, Q => ram_7_3_port, QN => n_1206);
   ram_reg_8_3_inst : DFEP1 port map( D => n199, E => n234, C => CLK, SN => 
                           n180, Q => ram_8_3_port, QN => n_1207);
   ram_reg_12_3_inst : DFEP1 port map( D => n199, E => n242, C => CLK, SN => 
                           n171, Q => ram_12_3_port, QN => n_1208);
   ram_reg_15_3_inst : DFEP1 port map( D => n199, E => n218, C => CLK, SN => 
                           n177, Q => ram_15_3_port, QN => n_1209);
   ram_reg_16_3_inst : DFEP1 port map( D => n198, E => n235, C => CLK, SN => 
                           n181, Q => ram_16_3_port, QN => n_1210);
   ram_reg_17_3_inst : DFEP1 port map( D => n198, E => n231, C => CLK, SN => 
                           n180, Q => ram_17_3_port, QN => n_1211);
   ram_reg_19_3_inst : DFEP1 port map( D => n198, E => n227, C => CLK, SN => 
                           n179, Q => ram_19_3_port, QN => n_1212);
   ram_reg_21_3_inst : DFEP1 port map( D => n198, E => n223, C => CLK, SN => 
                           n177, Q => ram_21_3_port, QN => n_1213);
   ram_reg_23_3_inst : DFEP1 port map( D => n198, E => n219, C => CLK, SN => 
                           n176, Q => ram_23_3_port, QN => n_1214);
   ram_reg_24_3_inst : DFEP1 port map( D => n197, E => n236, C => CLK, SN => 
                           n175, Q => ram_24_3_port, QN => n_1215);
   ram_reg_27_3_inst : DFEP1 port map( D => n197, E => n228, C => CLK, SN => 
                           n173, Q => ram_27_3_port, QN => n_1216);
   ram_reg_28_3_inst : DFEP1 port map( D => n197, E => n244, C => CLK, SN => 
                           n172, Q => ram_28_3_port, QN => n_1217);
   ram_reg_2_2_inst : DFEC1 port map( D => n196, E => n237, C => CLK, RN => 
                           n166, Q => ram_2_2_port, QN => n_1218);
   ram_reg_2_1_inst : DFEC1 port map( D => n192, E => n237, C => CLK, RN => 
                           n166, Q => ram_2_1_port, QN => n_1219);
   ram_reg_6_1_inst : DFEC1 port map( D => n192, E => n245, C => CLK, RN => 
                           n168, Q => ram_6_1_port, QN => n_1220);
   ram_reg_10_1_inst : DFEC1 port map( D => n191, E => n238, C => CLK, RN => 
                           n169, Q => ram_10_1_port, QN => n_1221);
   ram_reg_14_0_inst : DFEC1 port map( D => n187, E => n246, C => CLK, RN => 
                           n162, Q => ram_14_0_port, QN => n_1222);
   ram_reg_18_1_inst : DFEC1 port map( D => n190, E => n239, C => CLK, RN => 
                           n161, Q => ram_18_1_port, QN => n_1223);
   ram_reg_18_0_inst : DFEC1 port map( D => n186, E => n239, C => CLK, RN => 
                           n161, Q => ram_18_0_port, QN => n_1224);
   ram_reg_22_2_inst : DFEC1 port map( D => n194, E => n247, C => CLK, RN => 
                           n158, Q => ram_22_2_port, QN => n_1225);
   ram_reg_26_1_inst : DFEC1 port map( D => n189, E => n240, C => CLK, RN => 
                           n156, Q => ram_26_1_port, QN => n_1226);
   ram_reg_26_0_inst : DFEC1 port map( D => n185, E => n240, C => CLK, RN => 
                           n156, Q => ram_26_0_port, QN => n_1227);
   ram_reg_30_1_inst : DFEC1 port map( D => n189, E => n248, C => CLK, RN => 
                           n155, Q => ram_30_1_port, QN => n_1228);
   ram_reg_30_0_inst : DFEC1 port map( D => n185, E => n248, C => CLK, RN => 
                           n154, Q => ram_30_0_port, QN => n_1229);
   ram_reg_2_0_inst : DFEP1 port map( D => n188, E => n237, C => CLK, SN => 
                           n172, Q => ram_2_0_port, QN => n_1230);
   ram_reg_6_2_inst : DFEP1 port map( D => n196, E => n245, C => CLK, SN => 
                           n178, Q => ram_6_2_port, QN => n_1231);
   ram_reg_6_0_inst : DFEP1 port map( D => n188, E => n245, C => CLK, SN => 
                           n178, Q => ram_6_0_port, QN => n_1232);
   ram_reg_10_2_inst : DFEP1 port map( D => n195, E => n238, C => CLK, SN => 
                           n171, Q => ram_10_2_port, QN => n_1233);
   ram_reg_10_0_inst : DFEP1 port map( D => n187, E => n238, C => CLK, SN => 
                           n170, Q => ram_10_0_port, QN => n_1234);
   ram_reg_14_2_inst : DFEP1 port map( D => n195, E => n246, C => CLK, SN => 
                           n176, Q => ram_14_2_port, QN => n_1235);
   ram_reg_14_1_inst : DFEP1 port map( D => n191, E => n246, C => CLK, SN => 
                           n177, Q => ram_14_1_port, QN => n_1236);
   ram_reg_18_2_inst : DFEP1 port map( D => n194, E => n239, C => CLK, SN => 
                           n179, Q => ram_18_2_port, QN => n_1237);
   ram_reg_22_1_inst : DFEP1 port map( D => n190, E => n247, C => CLK, SN => 
                           n176, Q => ram_22_1_port, QN => n_1238);
   ram_reg_22_0_inst : DFEP1 port map( D => n186, E => n247, C => CLK, SN => 
                           n176, Q => ram_22_0_port, QN => n_1239);
   ram_reg_26_2_inst : DFEP1 port map( D => n193, E => n240, C => CLK, SN => 
                           n174, Q => ram_26_2_port, QN => n_1240);
   ram_reg_30_2_inst : DFEP1 port map( D => n193, E => n248, C => CLK, SN => 
                           n171, Q => ram_30_2_port, QN => n_1241);
   ram_reg_0_2_inst : DFEC1 port map( D => n196, E => n233, C => CLK, RN => 
                           n164, Q => ram_0_2_port, QN => n_1242);
   ram_reg_0_1_inst : DFEC1 port map( D => n192, E => n233, C => CLK, RN => 
                           n164, Q => ram_0_1_port, QN => n_1243);
   ram_reg_0_0_inst : DFEC1 port map( D => n188, E => n233, C => CLK, RN => 
                           n164, Q => ram_0_0_port, QN => n_1244);
   ram_reg_1_1_inst : DFEC1 port map( D => n192, E => n229, C => CLK, RN => 
                           n165, Q => ram_1_1_port, QN => n_1245);
   ram_reg_1_0_inst : DFEC1 port map( D => n188, E => n229, C => CLK, RN => 
                           n165, Q => ram_1_0_port, QN => n_1246);
   ram_reg_3_1_inst : DFEC1 port map( D => n192, E => n225, C => CLK, RN => 
                           n166, Q => ram_3_1_port, QN => n_1247);
   ram_reg_4_0_inst : DFEC1 port map( D => n188, E => n241, C => CLK, RN => 
                           n166, Q => ram_4_0_port, QN => n_1248);
   ram_reg_5_1_inst : DFEC1 port map( D => n192, E => n221, C => CLK, RN => 
                           n167, Q => ram_5_1_port, QN => n_1249);
   ram_reg_5_0_inst : DFEC1 port map( D => n188, E => n221, C => CLK, RN => 
                           n167, Q => ram_5_0_port, QN => n_1250);
   ram_reg_7_1_inst : DFEC1 port map( D => n192, E => n217, C => CLK, RN => 
                           n168, Q => ram_7_1_port, QN => n_1251);
   ram_reg_7_0_inst : DFEC1 port map( D => n188, E => n217, C => CLK, RN => 
                           n168, Q => ram_7_0_port, QN => n_1252);
   ram_reg_8_2_inst : DFEC1 port map( D => n195, E => n234, C => CLK, RN => 
                           n168, Q => ram_8_2_port, QN => n_1253);
   ram_reg_8_1_inst : DFEC1 port map( D => n191, E => n234, C => CLK, RN => 
                           n168, Q => ram_8_1_port, QN => n_1254);
   ram_reg_8_0_inst : DFEC1 port map( D => n187, E => n234, C => CLK, RN => 
                           n168, Q => ram_8_0_port, QN => n_1255);
   ram_reg_9_2_inst : DFEC1 port map( D => n195, E => n230, C => CLK, RN => 
                           n170, Q => ram_9_2_port, QN => n_1256);
   ram_reg_11_2_inst : DFEC1 port map( D => n195, E => n226, C => CLK, RN => 
                           n163, Q => ram_11_2_port, QN => n_1257);
   ram_reg_11_1_inst : DFEC1 port map( D => n191, E => n226, C => CLK, RN => 
                           n163, Q => ram_11_1_port, QN => n_1258);
   ram_reg_12_2_inst : DFEC1 port map( D => n195, E => n242, C => CLK, RN => 
                           n163, Q => ram_12_2_port, QN => n_1259);
   ram_reg_12_0_inst : DFEC1 port map( D => n187, E => n242, C => CLK, RN => 
                           n163, Q => ram_12_0_port, QN => n_1260);
   ram_reg_13_1_inst : DFEC1 port map( D => n191, E => n222, C => CLK, RN => 
                           n163, Q => ram_13_1_port, QN => n_1261);
   ram_reg_13_0_inst : DFEC1 port map( D => n187, E => n222, C => CLK, RN => 
                           n163, Q => ram_13_0_port, QN => n_1262);
   ram_reg_15_2_inst : DFEC1 port map( D => n195, E => n218, C => CLK, RN => 
                           n162, Q => ram_15_2_port, QN => n_1263);
   ram_reg_15_0_inst : DFEC1 port map( D => n187, E => n218, C => CLK, RN => 
                           n164, Q => ram_15_0_port, QN => n_1264);
   ram_reg_16_2_inst : DFEC1 port map( D => n194, E => n235, C => CLK, RN => 
                           n161, Q => ram_16_2_port, QN => n_1265);
   ram_reg_16_0_inst : DFEC1 port map( D => n186, E => n235, C => CLK, RN => 
                           n161, Q => ram_16_0_port, QN => n_1266);
   ram_reg_17_0_inst : DFEC1 port map( D => n186, E => n231, C => CLK, RN => 
                           n161, Q => ram_17_0_port, QN => n_1267);
   ram_reg_19_2_inst : DFEC1 port map( D => n194, E => n227, C => CLK, RN => 
                           n160, Q => ram_19_2_port, QN => n_1268);
   ram_reg_19_0_inst : DFEC1 port map( D => n186, E => n227, C => CLK, RN => 
                           n160, Q => ram_19_0_port, QN => n_1269);
   ram_reg_20_2_inst : DFEC1 port map( D => n194, E => n243, C => CLK, RN => 
                           n160, Q => ram_20_2_port, QN => n_1270);
   ram_reg_20_1_inst : DFEC1 port map( D => n190, E => n243, C => CLK, RN => 
                           n159, Q => ram_20_1_port, QN => n_1271);
   ram_reg_21_1_inst : DFEC1 port map( D => n190, E => n223, C => CLK, RN => 
                           n159, Q => ram_21_1_port, QN => n_1272);
   ram_reg_23_2_inst : DFEC1 port map( D => n194, E => n219, C => CLK, RN => 
                           n158, Q => ram_23_2_port, QN => n_1273);
   ram_reg_23_1_inst : DFEC1 port map( D => n190, E => n219, C => CLK, RN => 
                           n158, Q => ram_23_1_port, QN => n_1274);
   ram_reg_23_0_inst : DFEC1 port map( D => n186, E => n219, C => CLK, RN => 
                           n158, Q => ram_23_0_port, QN => n_1275);
   ram_reg_24_1_inst : DFEC1 port map( D => n189, E => n236, C => CLK, RN => 
                           n158, Q => ram_24_1_port, QN => n_1276);
   ram_reg_24_0_inst : DFEC1 port map( D => n185, E => n236, C => CLK, RN => 
                           n158, Q => ram_24_0_port, QN => n_1277);
   ram_reg_25_1_inst : DFEC1 port map( D => n189, E => n232, C => CLK, RN => 
                           n157, Q => ram_25_1_port, QN => n_1278);
   ram_reg_27_0_inst : DFEC1 port map( D => n185, E => n228, C => CLK, RN => 
                           n156, Q => ram_27_0_port, QN => n_1279);
   ram_reg_28_1_inst : DFEC1 port map( D => n189, E => n244, C => CLK, RN => 
                           n156, Q => ram_28_1_port, QN => n_1280);
   ram_reg_29_2_inst : DFEC1 port map( D => n193, E => n224, C => CLK, RN => 
                           n155, Q => ram_29_2_port, QN => n_1281);
   ram_reg_29_1_inst : DFEC1 port map( D => n189, E => n224, C => CLK, RN => 
                           n155, Q => ram_29_1_port, QN => n_1282);
   ram_reg_31_2_inst : DFEC1 port map( D => n193, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_2_port, QN => n_1283);
   ram_reg_31_1_inst : DFEC1 port map( D => n189, E => n220, C => CLK, RN => 
                           n154, Q => ram_31_1_port, QN => n_1284);
   ram_reg_31_0_inst : DFEC1 port map( D => n185, E => n220, C => CLK, RN => 
                           n162, Q => ram_31_0_port, QN => n_1285);
   ram_reg_1_2_inst : DFEP1 port map( D => n196, E => n229, C => CLK, SN => 
                           n170, Q => ram_1_2_port, QN => n_1286);
   ram_reg_3_2_inst : DFEP1 port map( D => n196, E => n225, C => CLK, SN => 
                           n174, Q => ram_3_2_port, QN => n_1287);
   ram_reg_3_0_inst : DFEP1 port map( D => n188, E => n225, C => CLK, SN => 
                           n174, Q => ram_3_0_port, QN => n_1288);
   ram_reg_4_2_inst : DFEP1 port map( D => n196, E => n241, C => CLK, SN => 
                           n175, Q => ram_4_2_port, QN => n_1289);
   ram_reg_4_1_inst : DFEP1 port map( D => n192, E => n241, C => CLK, SN => 
                           n175, Q => ram_4_1_port, QN => n_1290);
   ram_reg_5_2_inst : DFEP1 port map( D => n196, E => n221, C => CLK, SN => 
                           n177, Q => ram_5_2_port, QN => n_1291);
   ram_reg_7_2_inst : DFEP1 port map( D => n196, E => n217, C => CLK, SN => 
                           n178, Q => ram_7_2_port, QN => n_1292);
   ram_reg_9_1_inst : DFEP1 port map( D => n191, E => n230, C => CLK, SN => 
                           n177, Q => ram_9_1_port, QN => n_1293);
   ram_reg_9_0_inst : DFEP1 port map( D => n187, E => n230, C => CLK, SN => 
                           n177, Q => ram_9_0_port, QN => n_1294);
   ram_reg_11_0_inst : DFEP1 port map( D => n187, E => n226, C => CLK, SN => 
                           n170, Q => ram_11_0_port, QN => n_1295);
   ram_reg_12_1_inst : DFEP1 port map( D => n191, E => n242, C => CLK, SN => 
                           n170, Q => ram_12_1_port, QN => n_1296);
   ram_reg_13_2_inst : DFEP1 port map( D => n195, E => n222, C => CLK, SN => 
                           n172, Q => ram_13_2_port, QN => n_1297);
   ram_reg_15_1_inst : DFEP1 port map( D => n191, E => n218, C => CLK, SN => 
                           n178, Q => ram_15_1_port, QN => n_1298);
   ram_reg_16_1_inst : DFEP1 port map( D => n190, E => n235, C => CLK, SN => 
                           n170, Q => ram_16_1_port, QN => n_1299);
   ram_reg_17_2_inst : DFEP1 port map( D => n194, E => n231, C => CLK, SN => 
                           n180, Q => ram_17_2_port, QN => n_1300);
   ram_reg_17_1_inst : DFEP1 port map( D => n190, E => n231, C => CLK, SN => 
                           n180, Q => ram_17_1_port, QN => n_1301);
   ram_reg_19_1_inst : DFEP1 port map( D => n190, E => n227, C => CLK, SN => 
                           n179, Q => ram_19_1_port, QN => n_1302);
   ram_reg_20_0_inst : DFEP1 port map( D => n186, E => n243, C => CLK, SN => 
                           n178, Q => ram_20_0_port, QN => n_1303);
   ram_reg_21_2_inst : DFEP1 port map( D => n194, E => n223, C => CLK, SN => 
                           n177, Q => ram_21_2_port, QN => n_1304);
   ram_reg_21_0_inst : DFEP1 port map( D => n186, E => n223, C => CLK, SN => 
                           n177, Q => ram_21_0_port, QN => n_1305);
   ram_reg_24_2_inst : DFEP1 port map( D => n193, E => n236, C => CLK, SN => 
                           n175, Q => ram_24_2_port, QN => n_1306);
   ram_reg_25_2_inst : DFEP1 port map( D => n193, E => n232, C => CLK, SN => 
                           n174, Q => ram_25_2_port, QN => n_1307);
   ram_reg_25_0_inst : DFEP1 port map( D => n185, E => n232, C => CLK, SN => 
                           n174, Q => ram_25_0_port, QN => n_1308);
   ram_reg_27_2_inst : DFEP1 port map( D => n193, E => n228, C => CLK, SN => 
                           n172, Q => ram_27_2_port, QN => n_1309);
   ram_reg_27_1_inst : DFEP1 port map( D => n189, E => n228, C => CLK, SN => 
                           n173, Q => ram_27_1_port, QN => n_1310);
   ram_reg_28_2_inst : DFEP1 port map( D => n193, E => n244, C => CLK, SN => 
                           n172, Q => ram_28_2_port, QN => n_1311);
   ram_reg_28_0_inst : DFEP1 port map( D => n185, E => n244, C => CLK, SN => 
                           n171, Q => ram_28_0_port, QN => n_1312);
   ram_reg_29_0_inst : DFEP1 port map( D => n185, E => n224, C => CLK, SN => 
                           n171, Q => ram_29_0_port, QN => n_1313);
   U2 : NOR31 port map( A => n139, B => wb, C => n250, Q => n40);
   U3 : BUF2 port map( A => address(1), Q => n125);
   U4 : BUF2 port map( A => n132, Q => n127);
   U5 : BUF2 port map( A => n132, Q => n126);
   U6 : BUF2 port map( A => n133, Q => n128);
   U7 : BUF2 port map( A => n133, Q => n129);
   U8 : BUF2 port map( A => n134, Q => n130);
   U9 : BUF2 port map( A => n134, Q => n131);
   U10 : BUF2 port map( A => n182, Q => n136);
   U11 : BUF2 port map( A => n182, Q => n137);
   U12 : BUF2 port map( A => n182, Q => n135);
   U13 : BUF2 port map( A => address(1), Q => n132);
   U14 : BUF2 port map( A => n182, Q => n138);
   U15 : BUF2 port map( A => address(1), Q => n133);
   U16 : BUF2 port map( A => address(1), Q => n134);
   U17 : INV3 port map( A => n183, Q => n182);
   U18 : NOR31 port map( A => n184, B => n183, C => n249, Q => n41);
   U19 : NOR31 port map( A => n184, B => n182, C => n249, Q => n43);
   U20 : NOR31 port map( A => n183, B => address(1), C => n249, Q => n45);
   U21 : NOR31 port map( A => n182, B => address(1), C => n249, Q => n47);
   U22 : BUF2 port map( A => n148, Q => n170);
   U23 : BUF2 port map( A => n151, Q => n176);
   U24 : BUF2 port map( A => n148, Q => n171);
   U25 : BUF2 port map( A => n153, Q => n180);
   U26 : BUF2 port map( A => n152, Q => n179);
   U27 : BUF2 port map( A => n152, Q => n178);
   U28 : BUF2 port map( A => n151, Q => n177);
   U29 : BUF2 port map( A => n150, Q => n175);
   U30 : BUF2 port map( A => n150, Q => n174);
   U31 : BUF2 port map( A => n149, Q => n173);
   U32 : BUF2 port map( A => n149, Q => n172);
   U33 : BUF2 port map( A => n140, Q => n155);
   U34 : BUF2 port map( A => n141, Q => n156);
   U35 : BUF2 port map( A => n141, Q => n157);
   U36 : BUF2 port map( A => n142, Q => n158);
   U37 : BUF2 port map( A => n142, Q => n159);
   U38 : BUF2 port map( A => n143, Q => n160);
   U39 : BUF2 port map( A => n143, Q => n161);
   U40 : BUF2 port map( A => n144, Q => n162);
   U41 : BUF2 port map( A => n144, Q => n163);
   U42 : BUF2 port map( A => n147, Q => n169);
   U43 : BUF2 port map( A => n146, Q => n167);
   U44 : BUF2 port map( A => n147, Q => n168);
   U45 : BUF2 port map( A => n145, Q => n165);
   U46 : BUF2 port map( A => n145, Q => n164);
   U47 : BUF2 port map( A => n146, Q => n166);
   U48 : BUF2 port map( A => n140, Q => n154);
   U49 : BUF2 port map( A => n153, Q => n181);
   U50 : INV3 port map( A => address(0), Q => n183);
   U51 : INV3 port map( A => address(1), Q => n184);
   U52 : INV3 port map( A => address(3), Q => n139);
   U53 : INV3 port map( A => n39, Q => n220);
   U54 : NAND22 port map( A => n40, B => n41, Q => n39);
   U55 : INV3 port map( A => n82, Q => n233);
   U56 : NAND22 port map( A => n75, B => n55, Q => n82);
   U57 : INV3 port map( A => n42, Q => n248);
   U58 : NAND22 port map( A => n43, B => n40, Q => n42);
   U59 : INV3 port map( A => n44, Q => n224);
   U60 : NAND22 port map( A => n45, B => n40, Q => n44);
   U61 : INV3 port map( A => n50, Q => n240);
   U62 : NAND22 port map( A => n51, B => n40, Q => n50);
   U63 : INV3 port map( A => n70, Q => n226);
   U64 : NAND22 port map( A => n66, B => n49, Q => n70);
   U65 : INV3 port map( A => n77, Q => n221);
   U66 : NAND22 port map( A => n75, B => n45, Q => n77);
   U67 : INV3 port map( A => n80, Q => n237);
   U68 : NAND22 port map( A => n75, B => n51, Q => n80);
   U69 : INV3 port map( A => n81, Q => n229);
   U70 : NAND22 port map( A => n75, B => n53, Q => n81);
   U71 : INV3 port map( A => n60, Q => n243);
   U72 : NAND22 port map( A => n57, B => n47, Q => n60);
   U73 : INV3 port map( A => n52, Q => n232);
   U74 : NAND22 port map( A => n53, B => n40, Q => n52);
   U75 : INV3 port map( A => n72, Q => n230);
   U76 : NAND22 port map( A => n66, B => n53, Q => n72);
   U77 : INV3 port map( A => n76, Q => n245);
   U78 : NAND22 port map( A => n75, B => n43, Q => n76);
   U79 : INV3 port map( A => n58, Q => n247);
   U80 : NAND22 port map( A => n57, B => n43, Q => n58);
   U81 : INV3 port map( A => n71, Q => n238);
   U82 : NAND22 port map( A => n66, B => n51, Q => n71);
   U83 : INV3 port map( A => n59, Q => n223);
   U84 : NAND22 port map( A => n57, B => n45, Q => n59);
   U85 : INV3 port map( A => n65, Q => n218);
   U86 : NAND22 port map( A => n66, B => n41, Q => n65);
   U87 : INV3 port map( A => n67, Q => n246);
   U88 : NAND22 port map( A => n66, B => n43, Q => n67);
   U89 : INV3 port map( A => n63, Q => n231);
   U90 : NAND22 port map( A => n57, B => n53, Q => n63);
   U91 : INV3 port map( A => n64, Q => n235);
   U92 : NAND22 port map( A => n57, B => n55, Q => n64);
   U93 : INV3 port map( A => n68, Q => n222);
   U94 : NAND22 port map( A => n66, B => n45, Q => n68);
   U95 : INV3 port map( A => n69, Q => n242);
   U96 : NAND22 port map( A => n66, B => n47, Q => n69);
   U97 : INV3 port map( A => n73, Q => n234);
   U98 : NAND22 port map( A => n66, B => n55, Q => n73);
   U99 : INV3 port map( A => n56, Q => n219);
   U100 : NAND22 port map( A => n57, B => n41, Q => n56);
   U101 : INV3 port map( A => n61, Q => n227);
   U102 : NAND22 port map( A => n57, B => n49, Q => n61);
   U103 : INV3 port map( A => n62, Q => n239);
   U104 : NAND22 port map( A => n57, B => n51, Q => n62);
   U105 : INV3 port map( A => n54, Q => n236);
   U106 : NAND22 port map( A => n55, B => n40, Q => n54);
   U107 : INV3 port map( A => n74, Q => n217);
   U108 : NAND22 port map( A => n75, B => n41, Q => n74);
   U109 : INV3 port map( A => n46, Q => n244);
   U110 : NAND22 port map( A => n47, B => n40, Q => n46);
   U111 : INV3 port map( A => n48, Q => n228);
   U112 : NAND22 port map( A => n49, B => n40, Q => n48);
   U113 : INV3 port map( A => n78, Q => n241);
   U114 : NAND22 port map( A => n75, B => n47, Q => n78);
   U115 : INV3 port map( A => n79, Q => n225);
   U116 : NAND22 port map( A => n75, B => n49, Q => n79);
   U117 : INV3 port map( A => address(4), Q => n250);
   U118 : NOR31 port map( A => n183, B => address(2), C => n184, Q => n49);
   U119 : NOR31 port map( A => n182, B => address(2), C => n184, Q => n51);
   U120 : NOR31 port map( A => address(1), B => address(2), C => n183, Q => n53
                           );
   U121 : NOR31 port map( A => address(1), B => address(2), C => n182, Q => n55
                           );
   U122 : INV3 port map( A => address(2), Q => n249);
   U123 : BUF2 port map( A => n251, Q => n141);
   U124 : BUF2 port map( A => n251, Q => n142);
   U125 : BUF2 port map( A => n251, Q => n143);
   U126 : BUF2 port map( A => n251, Q => n144);
   U127 : BUF2 port map( A => n251, Q => n153);
   U128 : BUF2 port map( A => n251, Q => n152);
   U129 : BUF2 port map( A => n251, Q => n151);
   U130 : BUF2 port map( A => n251, Q => n150);
   U131 : BUF2 port map( A => n251, Q => n149);
   U132 : BUF2 port map( A => n251, Q => n147);
   U133 : BUF2 port map( A => n251, Q => n148);
   U134 : BUF2 port map( A => n251, Q => n145);
   U135 : BUF2 port map( A => n251, Q => n146);
   U136 : BUF2 port map( A => n251, Q => n140);
   U137 : IMUX40 port map( A => ram_28_1_port, B => ram_29_1_port, C => 
                           ram_30_1_port, D => ram_31_1_port, S0 => n136, S1 =>
                           n125, Q => n15);
   U138 : IMUX40 port map( A => ram_16_1_port, B => ram_17_1_port, C => 
                           ram_18_1_port, D => ram_19_1_port, S0 => n136, S1 =>
                           n126, Q => n12);
   U139 : IMUX40 port map( A => ram_24_1_port, B => ram_25_1_port, C => 
                           ram_26_1_port, D => ram_27_1_port, S0 => n136, S1 =>
                           n125, Q => n13);
   U140 : IMUX40 port map( A => ram_12_1_port, B => ram_13_1_port, C => 
                           ram_14_1_port, D => ram_15_1_port, S0 => n136, S1 =>
                           n126, Q => n20);
   U141 : IMUX40 port map( A => ram_0_1_port, B => ram_1_1_port, C => 
                           ram_2_1_port, D => ram_3_1_port, S0 => n136, S1 => 
                           n126, Q => n17);
   U142 : IMUX40 port map( A => ram_8_1_port, B => ram_9_1_port, C => 
                           ram_10_1_port, D => ram_11_1_port, S0 => n136, S1 =>
                           n126, Q => n18);
   U143 : IMUX40 port map( A => ram_20_1_port, B => ram_21_1_port, C => 
                           ram_22_1_port, D => ram_23_1_port, S0 => n136, S1 =>
                           n126, Q => n14);
   U144 : MUX22 port map( A => n16, B => n11, S => address(4), Q => data_out(1)
                           );
   U145 : IMUX40 port map( A => n17, B => n18, C => n19, D => n20, S0 => 
                           address(3), S1 => address(2), Q => n16);
   U146 : IMUX40 port map( A => n12, B => n13, C => n14, D => n15, S0 => 
                           address(3), S1 => address(2), Q => n11);
   U147 : IMUX40 port map( A => ram_4_1_port, B => ram_5_1_port, C => 
                           ram_6_1_port, D => ram_7_1_port, S0 => n136, S1 => 
                           n126, Q => n19);
   U148 : IMUX40 port map( A => ram_12_0_port, B => ram_13_0_port, C => 
                           ram_14_0_port, D => ram_15_0_port, S0 => n136, S1 =>
                           n125, Q => n10);
   U149 : IMUX40 port map( A => ram_0_0_port, B => ram_1_0_port, C => 
                           ram_2_0_port, D => ram_3_0_port, S0 => n136, S1 => 
                           n125, Q => n7);
   U150 : IMUX40 port map( A => ram_8_0_port, B => ram_9_0_port, C => 
                           ram_10_0_port, D => ram_11_0_port, S0 => n136, S1 =>
                           n125, Q => n8);
   U151 : IMUX40 port map( A => ram_28_2_port, B => ram_29_2_port, C => 
                           ram_30_2_port, D => ram_31_2_port, S0 => n137, S1 =>
                           n126, Q => n25);
   U152 : IMUX40 port map( A => ram_16_2_port, B => ram_17_2_port, C => 
                           ram_18_2_port, D => ram_19_2_port, S0 => n137, S1 =>
                           n127, Q => n22);
   U153 : IMUX40 port map( A => ram_24_2_port, B => ram_25_2_port, C => 
                           ram_26_2_port, D => ram_27_2_port, S0 => n137, S1 =>
                           n126, Q => n23);
   U154 : IMUX40 port map( A => ram_12_2_port, B => ram_13_2_port, C => 
                           ram_14_2_port, D => ram_15_2_port, S0 => n137, S1 =>
                           n127, Q => n30);
   U155 : IMUX40 port map( A => ram_0_2_port, B => ram_1_2_port, C => 
                           ram_2_2_port, D => ram_3_2_port, S0 => n137, S1 => 
                           n127, Q => n27);
   U156 : IMUX40 port map( A => ram_8_2_port, B => ram_9_2_port, C => 
                           ram_10_2_port, D => ram_11_2_port, S0 => n137, S1 =>
                           n127, Q => n28);
   U157 : IMUX40 port map( A => ram_28_3_port, B => ram_29_3_port, C => 
                           ram_30_3_port, D => ram_31_3_port, S0 => n137, S1 =>
                           n127, Q => n35);
   U158 : IMUX40 port map( A => ram_16_3_port, B => ram_17_3_port, C => 
                           ram_18_3_port, D => ram_19_3_port, S0 => n137, S1 =>
                           n127, Q => n32);
   U159 : IMUX40 port map( A => ram_24_3_port, B => ram_25_3_port, C => 
                           ram_26_3_port, D => ram_27_3_port, S0 => n137, S1 =>
                           n127, Q => n33);
   U160 : IMUX40 port map( A => ram_30_0_port, B => ram_31_0_port, C => 
                           ram_28_0_port, D => ram_29_0_port, S0 => n135, S1 =>
                           n184, Q => n5);
   U161 : IMUX40 port map( A => ram_16_0_port, B => ram_17_0_port, C => 
                           ram_18_0_port, D => ram_19_0_port, S0 => n135, S1 =>
                           n125, Q => n2);
   U162 : IMUX40 port map( A => ram_24_0_port, B => ram_25_0_port, C => 
                           ram_26_0_port, D => ram_27_0_port, S0 => n135, S1 =>
                           n125, Q => n3);
   U163 : IMUX40 port map( A => ram_4_0_port, B => ram_5_0_port, C => 
                           ram_6_0_port, D => ram_7_0_port, S0 => n136, S1 => 
                           n125, Q => n9);
   U164 : IMUX40 port map( A => ram_20_2_port, B => ram_21_2_port, C => 
                           ram_22_2_port, D => ram_23_2_port, S0 => n137, S1 =>
                           n126, Q => n24);
   U165 : MUX22 port map( A => n6, B => n1, S => address(4), Q => data_out(0));
   U166 : IMUX40 port map( A => n2, B => n3, C => n4, D => n5, S0 => address(3)
                           , S1 => address(2), Q => n1);
   U167 : IMUX40 port map( A => n7, B => n8, C => n9, D => n10, S0 => 
                           address(3), S1 => address(2), Q => n6);
   U168 : IMUX40 port map( A => ram_20_0_port, B => ram_21_0_port, C => 
                           ram_22_0_port, D => ram_23_0_port, S0 => n135, S1 =>
                           n125, Q => n4);
   U169 : MUX22 port map( A => n26, B => n21, S => address(4), Q => data_out(2)
                           );
   U170 : IMUX40 port map( A => n27, B => n28, C => n29, D => n30, S0 => 
                           address(3), S1 => address(2), Q => n26);
   U171 : IMUX40 port map( A => n22, B => n23, C => n24, D => n25, S0 => 
                           address(3), S1 => address(2), Q => n21);
   U172 : IMUX40 port map( A => ram_4_2_port, B => ram_5_2_port, C => 
                           ram_6_2_port, D => ram_7_2_port, S0 => n137, S1 => 
                           n127, Q => n29);
   U173 : MUX22 port map( A => n36, B => n31, S => address(4), Q => data_out(3)
                           );
   U174 : IMUX40 port map( A => n37, B => n38, C => n83, D => n84, S0 => 
                           address(3), S1 => address(2), Q => n36);
   U175 : IMUX40 port map( A => n32, B => n33, C => n34, D => n35, S0 => 
                           address(3), S1 => address(2), Q => n31);
   U176 : IMUX40 port map( A => ram_4_3_port, B => ram_5_3_port, C => 
                           ram_6_3_port, D => ram_7_3_port, S0 => n138, S1 => 
                           n128, Q => n83);
   U177 : IMUX40 port map( A => ram_12_3_port, B => ram_13_3_port, C => 
                           ram_14_3_port, D => ram_15_3_port, S0 => n138, S1 =>
                           n128, Q => n84);
   U178 : IMUX40 port map( A => ram_0_3_port, B => ram_1_3_port, C => 
                           ram_2_3_port, D => ram_3_3_port, S0 => n138, S1 => 
                           n128, Q => n37);
   U179 : IMUX40 port map( A => ram_8_3_port, B => ram_9_3_port, C => 
                           ram_10_3_port, D => ram_11_3_port, S0 => n138, S1 =>
                           n128, Q => n38);
   U180 : IMUX40 port map( A => ram_28_4_port, B => ram_29_4_port, C => 
                           ram_30_4_port, D => ram_31_4_port, S0 => n138, S1 =>
                           n128, Q => n89);
   U181 : IMUX40 port map( A => ram_16_4_port, B => ram_17_4_port, C => 
                           ram_18_4_port, D => ram_19_4_port, S0 => n138, S1 =>
                           n128, Q => n86);
   U182 : IMUX40 port map( A => ram_24_4_port, B => ram_25_4_port, C => 
                           ram_26_4_port, D => ram_27_4_port, S0 => n138, S1 =>
                           n128, Q => n87);
   U183 : IMUX40 port map( A => ram_12_4_port, B => ram_13_4_port, C => 
                           ram_14_4_port, D => ram_15_4_port, S0 => n138, S1 =>
                           n128, Q => n94);
   U184 : IMUX40 port map( A => ram_0_4_port, B => ram_1_4_port, C => 
                           ram_2_4_port, D => ram_3_4_port, S0 => n138, S1 => 
                           n129, Q => n91);
   U185 : IMUX40 port map( A => ram_8_4_port, B => ram_9_4_port, C => 
                           ram_10_4_port, D => ram_11_4_port, S0 => n138, S1 =>
                           n129, Q => n92);
   U186 : IMUX40 port map( A => ram_20_3_port, B => ram_21_3_port, C => 
                           ram_22_3_port, D => ram_23_3_port, S0 => n137, S1 =>
                           n127, Q => n34);
   U187 : IMUX40 port map( A => ram_20_4_port, B => ram_21_4_port, C => 
                           ram_22_4_port, D => ram_23_4_port, S0 => n138, S1 =>
                           n128, Q => n88);
   U188 : MUX22 port map( A => n90, B => n85, S => address(4), Q => data_out(4)
                           );
   U189 : IMUX40 port map( A => n91, B => n92, C => n93, D => n94, S0 => 
                           address(3), S1 => address(2), Q => n90);
   U190 : IMUX40 port map( A => n86, B => n87, C => n88, D => n89, S0 => 
                           address(3), S1 => address(2), Q => n85);
   U191 : IMUX40 port map( A => ram_4_4_port, B => ram_5_4_port, C => 
                           ram_6_4_port, D => ram_7_4_port, S0 => n138, S1 => 
                           n129, Q => n93);
   U192 : IMUX40 port map( A => ram_28_5_port, B => ram_29_5_port, C => 
                           ram_30_5_port, D => ram_31_5_port, S0 => n138, S1 =>
                           n129, Q => n99);
   U193 : IMUX40 port map( A => ram_16_5_port, B => ram_17_5_port, C => 
                           ram_18_5_port, D => ram_19_5_port, S0 => n138, S1 =>
                           n129, Q => n96);
   U194 : IMUX40 port map( A => ram_24_5_port, B => ram_25_5_port, C => 
                           ram_26_5_port, D => ram_27_5_port, S0 => n138, S1 =>
                           n129, Q => n97);
   U195 : IMUX40 port map( A => ram_12_5_port, B => ram_13_5_port, C => 
                           ram_14_5_port, D => ram_15_5_port, S0 => n135, S1 =>
                           n129, Q => n104);
   U196 : IMUX40 port map( A => ram_0_5_port, B => ram_1_5_port, C => 
                           ram_2_5_port, D => ram_3_5_port, S0 => n135, S1 => 
                           n130, Q => n101);
   U197 : IMUX40 port map( A => ram_8_5_port, B => ram_9_5_port, C => 
                           ram_10_5_port, D => ram_11_5_port, S0 => n138, S1 =>
                           n129, Q => n102);
   U198 : IMUX40 port map( A => ram_28_6_port, B => ram_29_6_port, C => 
                           ram_30_6_port, D => ram_31_6_port, S0 => n138, S1 =>
                           n130, Q => n109);
   U199 : IMUX40 port map( A => ram_16_6_port, B => ram_17_6_port, C => 
                           ram_18_6_port, D => ram_19_6_port, S0 => n137, S1 =>
                           n130, Q => n106);
   U200 : IMUX40 port map( A => ram_24_6_port, B => ram_25_6_port, C => 
                           ram_26_6_port, D => ram_27_6_port, S0 => n137, S1 =>
                           n130, Q => n107);
   U201 : IMUX40 port map( A => ram_12_6_port, B => ram_13_6_port, C => 
                           ram_14_6_port, D => ram_15_6_port, S0 => n135, S1 =>
                           n130, Q => n114);
   U202 : IMUX40 port map( A => ram_0_6_port, B => ram_1_6_port, C => 
                           ram_2_6_port, D => ram_3_6_port, S0 => n135, S1 => 
                           n131, Q => n111);
   U203 : IMUX40 port map( A => ram_8_6_port, B => ram_9_6_port, C => 
                           ram_10_6_port, D => ram_11_6_port, S0 => n135, S1 =>
                           n130, Q => n112);
   U204 : IMUX40 port map( A => ram_20_5_port, B => ram_21_5_port, C => 
                           ram_22_5_port, D => ram_23_5_port, S0 => n135, S1 =>
                           n129, Q => n98);
   U205 : IMUX40 port map( A => ram_20_6_port, B => ram_21_6_port, C => 
                           ram_22_6_port, D => ram_23_6_port, S0 => n138, S1 =>
                           n130, Q => n108);
   U206 : MUX22 port map( A => n100, B => n95, S => address(4), Q => 
                           data_out(5));
   U207 : IMUX40 port map( A => n101, B => n102, C => n103, D => n104, S0 => 
                           address(3), S1 => address(2), Q => n100);
   U208 : IMUX40 port map( A => n96, B => n97, C => n98, D => n99, S0 => 
                           address(3), S1 => address(2), Q => n95);
   U209 : IMUX40 port map( A => ram_4_5_port, B => ram_5_5_port, C => 
                           ram_6_5_port, D => ram_7_5_port, S0 => n135, S1 => 
                           n130, Q => n103);
   U210 : MUX22 port map( A => n110, B => n105, S => address(4), Q => 
                           data_out(6));
   U211 : IMUX40 port map( A => n111, B => n112, C => n113, D => n114, S0 => 
                           address(3), S1 => address(2), Q => n110);
   U212 : IMUX40 port map( A => n106, B => n107, C => n108, D => n109, S0 => 
                           address(3), S1 => address(2), Q => n105);
   U213 : IMUX40 port map( A => ram_4_6_port, B => ram_5_6_port, C => 
                           ram_6_6_port, D => ram_7_6_port, S0 => n137, S1 => 
                           n130, Q => n113);
   U214 : IMUX40 port map( A => ram_28_7_port, B => ram_29_7_port, C => 
                           ram_30_7_port, D => ram_31_7_port, S0 => n137, S1 =>
                           n131, Q => n119);
   U215 : IMUX40 port map( A => ram_16_7_port, B => ram_17_7_port, C => 
                           ram_18_7_port, D => ram_19_7_port, S0 => n138, S1 =>
                           n131, Q => n116);
   U216 : IMUX40 port map( A => ram_24_7_port, B => ram_25_7_port, C => 
                           ram_26_7_port, D => ram_27_7_port, S0 => n138, S1 =>
                           n131, Q => n117);
   U217 : IMUX40 port map( A => ram_12_7_port, B => ram_13_7_port, C => 
                           ram_14_7_port, D => ram_15_7_port, S0 => n135, S1 =>
                           n131, Q => n124);
   U218 : IMUX40 port map( A => ram_0_7_port, B => ram_1_7_port, C => 
                           ram_2_7_port, D => ram_3_7_port, S0 => n135, S1 => 
                           n131, Q => n121);
   U219 : IMUX40 port map( A => ram_8_7_port, B => ram_9_7_port, C => 
                           ram_10_7_port, D => ram_11_7_port, S0 => n135, S1 =>
                           n131, Q => n122);
   U220 : IMUX40 port map( A => ram_20_7_port, B => ram_21_7_port, C => 
                           ram_22_7_port, D => ram_23_7_port, S0 => n135, S1 =>
                           n131, Q => n118);
   U221 : MUX22 port map( A => n120, B => n115, S => address(4), Q => 
                           data_out(7));
   U222 : IMUX40 port map( A => n121, B => n122, C => n123, D => n124, S0 => 
                           address(3), S1 => address(2), Q => n120);
   U223 : IMUX40 port map( A => n116, B => n117, C => n118, D => n119, S0 => 
                           address(3), S1 => address(2), Q => n115);
   U224 : IMUX40 port map( A => ram_4_7_port, B => ram_5_7_port, C => 
                           ram_6_7_port, D => ram_7_7_port, S0 => n135, S1 => 
                           n131, Q => n123);
   U225 : NOR31 port map( A => address(4), B => wb, C => n139, Q => n66);
   U226 : NOR31 port map( A => address(4), B => wb, C => address(3), Q => n75);
   U227 : NOR31 port map( A => address(3), B => wb, C => n250, Q => n57);
   U228 : INV3 port map( A => RESET, Q => n251);
   U229 : BUF2 port map( A => data_in(0), Q => n185);
   U230 : BUF2 port map( A => data_in(1), Q => n189);
   U231 : BUF2 port map( A => data_in(2), Q => n193);
   U232 : BUF2 port map( A => data_in(3), Q => n197);
   U233 : BUF2 port map( A => data_in(4), Q => n201);
   U234 : BUF2 port map( A => data_in(5), Q => n205);
   U235 : BUF2 port map( A => data_in(6), Q => n209);
   U236 : BUF2 port map( A => data_in(7), Q => n213);
   U237 : BUF2 port map( A => data_in(0), Q => n186);
   U238 : BUF2 port map( A => data_in(1), Q => n190);
   U239 : BUF2 port map( A => data_in(2), Q => n194);
   U240 : BUF2 port map( A => data_in(3), Q => n198);
   U241 : BUF2 port map( A => data_in(4), Q => n202);
   U242 : BUF2 port map( A => data_in(5), Q => n206);
   U243 : BUF2 port map( A => data_in(6), Q => n210);
   U244 : BUF2 port map( A => data_in(7), Q => n214);
   U245 : BUF2 port map( A => data_in(0), Q => n187);
   U246 : BUF2 port map( A => data_in(1), Q => n191);
   U247 : BUF2 port map( A => data_in(2), Q => n195);
   U248 : BUF2 port map( A => data_in(3), Q => n199);
   U249 : BUF2 port map( A => data_in(4), Q => n203);
   U250 : BUF2 port map( A => data_in(5), Q => n207);
   U251 : BUF2 port map( A => data_in(6), Q => n211);
   U252 : BUF2 port map( A => data_in(7), Q => n215);
   U253 : BUF2 port map( A => data_in(0), Q => n188);
   U254 : BUF2 port map( A => data_in(1), Q => n192);
   U255 : BUF2 port map( A => data_in(2), Q => n196);
   U256 : BUF2 port map( A => data_in(3), Q => n200);
   U257 : BUF2 port map( A => data_in(4), Q => n204);
   U258 : BUF2 port map( A => data_in(5), Q => n208);
   U259 : BUF2 port map( A => data_in(6), Q => n212);
   U260 : BUF2 port map( A => data_in(7), Q => n216);

end SYN_arch;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity DELAY_LINE is

   port( RESET, CLK : in std_logic;  Delay_Line_in : in std_logic_vector (7 
         downto 0);  Delay_Line_address : in std_logic_vector (4 downto 0);  
         Delay_Line_sample_shift : in std_logic;  Delay_Line_out : out 
         std_logic_vector (7 downto 0));

end DELAY_LINE;

architecture SYN_A of DELAY_LINE is

   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR21
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component BUF2
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component IMUX40
      port( A, B, C, D, S0, S1 : in std_logic;  Q : out std_logic);
   end component;
   
   component MUX22
      port( A, B, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DF3
      port( D, C : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component OAI212
      port( A, B, C : in std_logic;  Q : out std_logic);
   end component;
   
   signal x_0_7_port, x_0_6_port, x_0_5_port, x_0_4_port, x_0_3_port, 
      x_0_2_port, x_0_1_port, x_0_0_port, x_1_7_port, x_1_6_port, x_1_5_port, 
      x_1_4_port, x_1_3_port, x_1_2_port, x_1_1_port, x_1_0_port, x_2_7_port, 
      x_2_6_port, x_2_5_port, x_2_4_port, x_2_3_port, x_2_2_port, x_2_1_port, 
      x_2_0_port, x_3_7_port, x_3_6_port, x_3_5_port, x_3_4_port, x_3_3_port, 
      x_3_2_port, x_3_1_port, x_3_0_port, x_4_7_port, x_4_6_port, x_4_5_port, 
      x_4_4_port, x_4_3_port, x_4_2_port, x_4_1_port, x_4_0_port, x_5_7_port, 
      x_5_6_port, x_5_5_port, x_5_4_port, x_5_3_port, x_5_2_port, x_5_1_port, 
      x_5_0_port, x_6_7_port, x_6_6_port, x_6_5_port, x_6_4_port, x_6_3_port, 
      x_6_2_port, x_6_1_port, x_6_0_port, x_7_7_port, x_7_6_port, x_7_5_port, 
      x_7_4_port, x_7_3_port, x_7_2_port, x_7_1_port, x_7_0_port, x_8_7_port, 
      x_8_6_port, x_8_5_port, x_8_4_port, x_8_3_port, x_8_2_port, x_8_1_port, 
      x_8_0_port, x_9_7_port, x_9_6_port, x_9_5_port, x_9_4_port, x_9_3_port, 
      x_9_2_port, x_9_1_port, x_9_0_port, x_10_7_port, x_10_6_port, x_10_5_port
      , x_10_4_port, x_10_3_port, x_10_2_port, x_10_1_port, x_10_0_port, 
      x_11_7_port, x_11_6_port, x_11_5_port, x_11_4_port, x_11_3_port, 
      x_11_2_port, x_11_1_port, x_11_0_port, x_12_7_port, x_12_6_port, 
      x_12_5_port, x_12_4_port, x_12_3_port, x_12_2_port, x_12_1_port, 
      x_12_0_port, x_13_7_port, x_13_6_port, x_13_5_port, x_13_4_port, 
      x_13_3_port, x_13_2_port, x_13_1_port, x_13_0_port, x_14_7_port, 
      x_14_6_port, x_14_5_port, x_14_4_port, x_14_3_port, x_14_2_port, 
      x_14_1_port, x_14_0_port, x_15_7_port, x_15_6_port, x_15_5_port, 
      x_15_4_port, x_15_3_port, x_15_2_port, x_15_1_port, x_15_0_port, 
      x_16_7_port, x_16_6_port, x_16_5_port, x_16_4_port, x_16_3_port, 
      x_16_2_port, x_16_1_port, x_16_0_port, x_17_7_port, x_17_6_port, 
      x_17_5_port, x_17_4_port, x_17_3_port, x_17_2_port, x_17_1_port, 
      x_17_0_port, x_18_7_port, x_18_6_port, x_18_5_port, x_18_4_port, 
      x_18_3_port, x_18_2_port, x_18_1_port, x_18_0_port, x_19_7_port, 
      x_19_6_port, x_19_5_port, x_19_4_port, x_19_3_port, x_19_2_port, 
      x_19_1_port, x_19_0_port, x_20_7_port, x_20_6_port, x_20_5_port, 
      x_20_4_port, x_20_3_port, x_20_2_port, x_20_1_port, x_20_0_port, 
      x_21_7_port, x_21_6_port, x_21_5_port, x_21_4_port, x_21_3_port, 
      x_21_2_port, x_21_1_port, x_21_0_port, x_22_7_port, x_22_6_port, 
      x_22_5_port, x_22_4_port, x_22_3_port, x_22_2_port, x_22_1_port, 
      x_22_0_port, x_23_7_port, x_23_6_port, x_23_5_port, x_23_4_port, 
      x_23_3_port, x_23_2_port, x_23_1_port, x_23_0_port, x_24_7_port, 
      x_24_6_port, x_24_5_port, x_24_4_port, x_24_3_port, x_24_2_port, 
      x_24_1_port, x_24_0_port, x_25_7_port, x_25_6_port, x_25_5_port, 
      x_25_4_port, x_25_3_port, x_25_2_port, x_25_1_port, x_25_0_port, 
      x_26_7_port, x_26_6_port, x_26_5_port, x_26_4_port, x_26_3_port, 
      x_26_2_port, x_26_1_port, x_26_0_port, x_27_7_port, x_27_6_port, 
      x_27_5_port, x_27_4_port, x_27_3_port, x_27_2_port, x_27_1_port, 
      x_27_0_port, x_28_7_port, x_28_6_port, x_28_5_port, x_28_4_port, 
      x_28_3_port, x_28_2_port, x_28_1_port, x_28_0_port, x_29_7_port, 
      x_29_6_port, x_29_5_port, x_29_4_port, x_29_3_port, x_29_2_port, 
      x_29_1_port, x_29_0_port, x_30_7_port, x_30_6_port, x_30_5_port, 
      x_30_4_port, x_30_3_port, x_30_2_port, x_30_1_port, x_30_0_port, 
      x_31_7_port, x_31_6_port, x_31_5_port, x_31_4_port, x_31_3_port, 
      x_31_2_port, x_31_1_port, x_31_0_port, n249, n250, n251, n252, n253, n254
      , n255, n256, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
      n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, 
      n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, 
      n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, 
      n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, 
      n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, 
      n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, 
      n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, 
      n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, 
      n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, 
      n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, 
      n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, 
      n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, 
      n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, 
      n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, 
      n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, 
      n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, 
      n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, 
      n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, 
      n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, 
      n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, 
      n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, 
      n520, n521, n522, n523, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12
      , n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, 
      n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41
      , n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, 
      n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70
      , n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, 
      n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99
      , n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
      n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, 
      n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, 
      n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, 
      n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, 
      n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, 
      n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, 
      n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, 
      n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, 
      n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, 
      n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, 
      n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, 
      n244, n245, n246, n247, n248, n257, n524, n525, n526, n527, n528, n529, 
      n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, 
      n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, 
      n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, 
      n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, 
      n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, 
      n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, 
      n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, 
      n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, 
      n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, 
      n638, n639, n640, n641, n642, n643, n644, n_1314, n_1315, n_1316, n_1317,
      n_1318, n_1319, n_1320, n_1321, n_1322, n_1323, n_1324, n_1325, n_1326, 
      n_1327, n_1328, n_1329, n_1330, n_1331, n_1332, n_1333, n_1334, n_1335, 
      n_1336, n_1337, n_1338, n_1339, n_1340, n_1341, n_1342, n_1343, n_1344, 
      n_1345, n_1346, n_1347, n_1348, n_1349, n_1350, n_1351, n_1352, n_1353, 
      n_1354, n_1355, n_1356, n_1357, n_1358, n_1359, n_1360, n_1361, n_1362, 
      n_1363, n_1364, n_1365, n_1366, n_1367, n_1368, n_1369, n_1370, n_1371, 
      n_1372, n_1373, n_1374, n_1375, n_1376, n_1377, n_1378, n_1379, n_1380, 
      n_1381, n_1382, n_1383, n_1384, n_1385, n_1386, n_1387, n_1388, n_1389, 
      n_1390, n_1391, n_1392, n_1393, n_1394, n_1395, n_1396, n_1397, n_1398, 
      n_1399, n_1400, n_1401, n_1402, n_1403, n_1404, n_1405, n_1406, n_1407, 
      n_1408, n_1409, n_1410, n_1411, n_1412, n_1413, n_1414, n_1415, n_1416, 
      n_1417, n_1418, n_1419, n_1420, n_1421, n_1422, n_1423, n_1424, n_1425, 
      n_1426, n_1427, n_1428, n_1429, n_1430, n_1431, n_1432, n_1433, n_1434, 
      n_1435, n_1436, n_1437, n_1438, n_1439, n_1440, n_1441, n_1442, n_1443, 
      n_1444, n_1445, n_1446, n_1447, n_1448, n_1449, n_1450, n_1451, n_1452, 
      n_1453, n_1454, n_1455, n_1456, n_1457, n_1458, n_1459, n_1460, n_1461, 
      n_1462, n_1463, n_1464, n_1465, n_1466, n_1467, n_1468, n_1469, n_1470, 
      n_1471, n_1472, n_1473, n_1474, n_1475, n_1476, n_1477, n_1478, n_1479, 
      n_1480, n_1481, n_1482, n_1483, n_1484, n_1485, n_1486, n_1487, n_1488, 
      n_1489, n_1490, n_1491, n_1492, n_1493, n_1494, n_1495, n_1496, n_1497, 
      n_1498, n_1499, n_1500, n_1501, n_1502, n_1503, n_1504, n_1505, n_1506, 
      n_1507, n_1508, n_1509, n_1510, n_1511, n_1512, n_1513, n_1514, n_1515, 
      n_1516, n_1517, n_1518, n_1519, n_1520, n_1521, n_1522, n_1523, n_1524, 
      n_1525, n_1526, n_1527, n_1528, n_1529, n_1530, n_1531, n_1532, n_1533, 
      n_1534, n_1535, n_1536, n_1537, n_1538, n_1539, n_1540, n_1541, n_1542, 
      n_1543, n_1544, n_1545, n_1546, n_1547, n_1548, n_1549, n_1550, n_1551, 
      n_1552, n_1553, n_1554, n_1555, n_1556, n_1557, n_1558, n_1559, n_1560, 
      n_1561 : std_logic;

begin
   
   U3 : OAI212 port map( A => n111, B => n256, C => n258, Q => n516);
   U5 : OAI212 port map( A => n112, B => n255, C => n260, Q => n517);
   U7 : OAI212 port map( A => n111, B => n254, C => n261, Q => n518);
   U9 : OAI212 port map( A => n113, B => n253, C => n262, Q => n519);
   U11 : OAI212 port map( A => n113, B => n252, C => n263, Q => n520);
   U13 : OAI212 port map( A => n113, B => n251, C => n264, Q => n521);
   U15 : OAI212 port map( A => n113, B => n250, C => n265, Q => n522);
   U17 : OAI212 port map( A => n113, B => n249, C => n266, Q => n523);
   x_reg_0_7_inst : DF3 port map( D => n644, C => CLK, Q => x_0_7_port, QN => 
                           n_1314);
   x_reg_0_6_inst : DF3 port map( D => n643, C => CLK, Q => x_0_6_port, QN => 
                           n_1315);
   x_reg_0_5_inst : DF3 port map( D => n642, C => CLK, Q => x_0_5_port, QN => 
                           n_1316);
   x_reg_0_4_inst : DF3 port map( D => n641, C => CLK, Q => x_0_4_port, QN => 
                           n_1317);
   x_reg_0_3_inst : DF3 port map( D => n640, C => CLK, Q => x_0_3_port, QN => 
                           n_1318);
   x_reg_0_2_inst : DF3 port map( D => n639, C => CLK, Q => x_0_2_port, QN => 
                           n_1319);
   x_reg_0_1_inst : DF3 port map( D => n638, C => CLK, Q => x_0_1_port, QN => 
                           n_1320);
   x_reg_0_0_inst : DF3 port map( D => n637, C => CLK, Q => x_0_0_port, QN => 
                           n_1321);
   x_reg_1_7_inst : DF3 port map( D => n636, C => CLK, Q => x_1_7_port, QN => 
                           n_1322);
   x_reg_1_6_inst : DF3 port map( D => n635, C => CLK, Q => x_1_6_port, QN => 
                           n_1323);
   x_reg_1_5_inst : DF3 port map( D => n634, C => CLK, Q => x_1_5_port, QN => 
                           n_1324);
   x_reg_1_4_inst : DF3 port map( D => n633, C => CLK, Q => x_1_4_port, QN => 
                           n_1325);
   x_reg_1_3_inst : DF3 port map( D => n632, C => CLK, Q => x_1_3_port, QN => 
                           n_1326);
   x_reg_1_2_inst : DF3 port map( D => n631, C => CLK, Q => x_1_2_port, QN => 
                           n_1327);
   x_reg_1_1_inst : DF3 port map( D => n630, C => CLK, Q => x_1_1_port, QN => 
                           n_1328);
   x_reg_1_0_inst : DF3 port map( D => n629, C => CLK, Q => x_1_0_port, QN => 
                           n_1329);
   x_reg_2_7_inst : DF3 port map( D => n628, C => CLK, Q => x_2_7_port, QN => 
                           n_1330);
   x_reg_2_6_inst : DF3 port map( D => n627, C => CLK, Q => x_2_6_port, QN => 
                           n_1331);
   x_reg_2_5_inst : DF3 port map( D => n626, C => CLK, Q => x_2_5_port, QN => 
                           n_1332);
   x_reg_2_4_inst : DF3 port map( D => n625, C => CLK, Q => x_2_4_port, QN => 
                           n_1333);
   x_reg_2_3_inst : DF3 port map( D => n624, C => CLK, Q => x_2_3_port, QN => 
                           n_1334);
   x_reg_2_2_inst : DF3 port map( D => n623, C => CLK, Q => x_2_2_port, QN => 
                           n_1335);
   x_reg_2_1_inst : DF3 port map( D => n622, C => CLK, Q => x_2_1_port, QN => 
                           n_1336);
   x_reg_2_0_inst : DF3 port map( D => n621, C => CLK, Q => x_2_0_port, QN => 
                           n_1337);
   x_reg_3_7_inst : DF3 port map( D => n620, C => CLK, Q => x_3_7_port, QN => 
                           n_1338);
   x_reg_3_6_inst : DF3 port map( D => n619, C => CLK, Q => x_3_6_port, QN => 
                           n_1339);
   x_reg_3_5_inst : DF3 port map( D => n618, C => CLK, Q => x_3_5_port, QN => 
                           n_1340);
   x_reg_3_4_inst : DF3 port map( D => n617, C => CLK, Q => x_3_4_port, QN => 
                           n_1341);
   x_reg_3_3_inst : DF3 port map( D => n616, C => CLK, Q => x_3_3_port, QN => 
                           n_1342);
   x_reg_3_2_inst : DF3 port map( D => n615, C => CLK, Q => x_3_2_port, QN => 
                           n_1343);
   x_reg_3_1_inst : DF3 port map( D => n614, C => CLK, Q => x_3_1_port, QN => 
                           n_1344);
   x_reg_3_0_inst : DF3 port map( D => n613, C => CLK, Q => x_3_0_port, QN => 
                           n_1345);
   x_reg_4_7_inst : DF3 port map( D => n612, C => CLK, Q => x_4_7_port, QN => 
                           n_1346);
   x_reg_4_6_inst : DF3 port map( D => n611, C => CLK, Q => x_4_6_port, QN => 
                           n_1347);
   x_reg_4_5_inst : DF3 port map( D => n610, C => CLK, Q => x_4_5_port, QN => 
                           n_1348);
   x_reg_4_4_inst : DF3 port map( D => n609, C => CLK, Q => x_4_4_port, QN => 
                           n_1349);
   x_reg_4_3_inst : DF3 port map( D => n608, C => CLK, Q => x_4_3_port, QN => 
                           n_1350);
   x_reg_4_2_inst : DF3 port map( D => n607, C => CLK, Q => x_4_2_port, QN => 
                           n_1351);
   x_reg_4_1_inst : DF3 port map( D => n606, C => CLK, Q => x_4_1_port, QN => 
                           n_1352);
   x_reg_4_0_inst : DF3 port map( D => n605, C => CLK, Q => x_4_0_port, QN => 
                           n_1353);
   x_reg_5_7_inst : DF3 port map( D => n604, C => CLK, Q => x_5_7_port, QN => 
                           n_1354);
   x_reg_5_6_inst : DF3 port map( D => n603, C => CLK, Q => x_5_6_port, QN => 
                           n_1355);
   x_reg_5_5_inst : DF3 port map( D => n602, C => CLK, Q => x_5_5_port, QN => 
                           n_1356);
   x_reg_5_4_inst : DF3 port map( D => n601, C => CLK, Q => x_5_4_port, QN => 
                           n_1357);
   x_reg_5_3_inst : DF3 port map( D => n600, C => CLK, Q => x_5_3_port, QN => 
                           n_1358);
   x_reg_5_2_inst : DF3 port map( D => n599, C => CLK, Q => x_5_2_port, QN => 
                           n_1359);
   x_reg_5_1_inst : DF3 port map( D => n598, C => CLK, Q => x_5_1_port, QN => 
                           n_1360);
   x_reg_5_0_inst : DF3 port map( D => n597, C => CLK, Q => x_5_0_port, QN => 
                           n_1361);
   x_reg_6_7_inst : DF3 port map( D => n596, C => CLK, Q => x_6_7_port, QN => 
                           n_1362);
   x_reg_6_6_inst : DF3 port map( D => n595, C => CLK, Q => x_6_6_port, QN => 
                           n_1363);
   x_reg_6_5_inst : DF3 port map( D => n594, C => CLK, Q => x_6_5_port, QN => 
                           n_1364);
   x_reg_6_4_inst : DF3 port map( D => n593, C => CLK, Q => x_6_4_port, QN => 
                           n_1365);
   x_reg_6_3_inst : DF3 port map( D => n592, C => CLK, Q => x_6_3_port, QN => 
                           n_1366);
   x_reg_6_2_inst : DF3 port map( D => n591, C => CLK, Q => x_6_2_port, QN => 
                           n_1367);
   x_reg_6_1_inst : DF3 port map( D => n590, C => CLK, Q => x_6_1_port, QN => 
                           n_1368);
   x_reg_6_0_inst : DF3 port map( D => n589, C => CLK, Q => x_6_0_port, QN => 
                           n_1369);
   x_reg_7_7_inst : DF3 port map( D => n588, C => CLK, Q => x_7_7_port, QN => 
                           n_1370);
   x_reg_7_6_inst : DF3 port map( D => n587, C => CLK, Q => x_7_6_port, QN => 
                           n_1371);
   x_reg_7_5_inst : DF3 port map( D => n586, C => CLK, Q => x_7_5_port, QN => 
                           n_1372);
   x_reg_7_4_inst : DF3 port map( D => n585, C => CLK, Q => x_7_4_port, QN => 
                           n_1373);
   x_reg_7_3_inst : DF3 port map( D => n584, C => CLK, Q => x_7_3_port, QN => 
                           n_1374);
   x_reg_7_2_inst : DF3 port map( D => n583, C => CLK, Q => x_7_2_port, QN => 
                           n_1375);
   x_reg_7_1_inst : DF3 port map( D => n582, C => CLK, Q => x_7_1_port, QN => 
                           n_1376);
   x_reg_7_0_inst : DF3 port map( D => n581, C => CLK, Q => x_7_0_port, QN => 
                           n_1377);
   x_reg_8_7_inst : DF3 port map( D => n580, C => CLK, Q => x_8_7_port, QN => 
                           n_1378);
   x_reg_8_6_inst : DF3 port map( D => n579, C => CLK, Q => x_8_6_port, QN => 
                           n_1379);
   x_reg_8_5_inst : DF3 port map( D => n578, C => CLK, Q => x_8_5_port, QN => 
                           n_1380);
   x_reg_8_4_inst : DF3 port map( D => n577, C => CLK, Q => x_8_4_port, QN => 
                           n_1381);
   x_reg_8_3_inst : DF3 port map( D => n576, C => CLK, Q => x_8_3_port, QN => 
                           n_1382);
   x_reg_8_2_inst : DF3 port map( D => n575, C => CLK, Q => x_8_2_port, QN => 
                           n_1383);
   x_reg_8_1_inst : DF3 port map( D => n574, C => CLK, Q => x_8_1_port, QN => 
                           n_1384);
   x_reg_8_0_inst : DF3 port map( D => n573, C => CLK, Q => x_8_0_port, QN => 
                           n_1385);
   x_reg_9_7_inst : DF3 port map( D => n572, C => CLK, Q => x_9_7_port, QN => 
                           n_1386);
   x_reg_9_6_inst : DF3 port map( D => n571, C => CLK, Q => x_9_6_port, QN => 
                           n_1387);
   x_reg_9_5_inst : DF3 port map( D => n570, C => CLK, Q => x_9_5_port, QN => 
                           n_1388);
   x_reg_9_4_inst : DF3 port map( D => n569, C => CLK, Q => x_9_4_port, QN => 
                           n_1389);
   x_reg_9_3_inst : DF3 port map( D => n568, C => CLK, Q => x_9_3_port, QN => 
                           n_1390);
   x_reg_9_2_inst : DF3 port map( D => n567, C => CLK, Q => x_9_2_port, QN => 
                           n_1391);
   x_reg_9_1_inst : DF3 port map( D => n566, C => CLK, Q => x_9_1_port, QN => 
                           n_1392);
   x_reg_9_0_inst : DF3 port map( D => n565, C => CLK, Q => x_9_0_port, QN => 
                           n_1393);
   x_reg_10_7_inst : DF3 port map( D => n564, C => CLK, Q => x_10_7_port, QN =>
                           n_1394);
   x_reg_10_6_inst : DF3 port map( D => n563, C => CLK, Q => x_10_6_port, QN =>
                           n_1395);
   x_reg_10_5_inst : DF3 port map( D => n562, C => CLK, Q => x_10_5_port, QN =>
                           n_1396);
   x_reg_10_4_inst : DF3 port map( D => n561, C => CLK, Q => x_10_4_port, QN =>
                           n_1397);
   x_reg_10_3_inst : DF3 port map( D => n560, C => CLK, Q => x_10_3_port, QN =>
                           n_1398);
   x_reg_10_2_inst : DF3 port map( D => n559, C => CLK, Q => x_10_2_port, QN =>
                           n_1399);
   x_reg_10_1_inst : DF3 port map( D => n558, C => CLK, Q => x_10_1_port, QN =>
                           n_1400);
   x_reg_10_0_inst : DF3 port map( D => n557, C => CLK, Q => x_10_0_port, QN =>
                           n_1401);
   x_reg_11_7_inst : DF3 port map( D => n556, C => CLK, Q => x_11_7_port, QN =>
                           n_1402);
   x_reg_11_6_inst : DF3 port map( D => n555, C => CLK, Q => x_11_6_port, QN =>
                           n_1403);
   x_reg_11_5_inst : DF3 port map( D => n554, C => CLK, Q => x_11_5_port, QN =>
                           n_1404);
   x_reg_11_4_inst : DF3 port map( D => n553, C => CLK, Q => x_11_4_port, QN =>
                           n_1405);
   x_reg_11_3_inst : DF3 port map( D => n552, C => CLK, Q => x_11_3_port, QN =>
                           n_1406);
   x_reg_11_2_inst : DF3 port map( D => n551, C => CLK, Q => x_11_2_port, QN =>
                           n_1407);
   x_reg_11_1_inst : DF3 port map( D => n550, C => CLK, Q => x_11_1_port, QN =>
                           n_1408);
   x_reg_11_0_inst : DF3 port map( D => n549, C => CLK, Q => x_11_0_port, QN =>
                           n_1409);
   x_reg_12_7_inst : DF3 port map( D => n548, C => CLK, Q => x_12_7_port, QN =>
                           n_1410);
   x_reg_12_6_inst : DF3 port map( D => n547, C => CLK, Q => x_12_6_port, QN =>
                           n_1411);
   x_reg_12_5_inst : DF3 port map( D => n546, C => CLK, Q => x_12_5_port, QN =>
                           n_1412);
   x_reg_12_4_inst : DF3 port map( D => n545, C => CLK, Q => x_12_4_port, QN =>
                           n_1413);
   x_reg_12_3_inst : DF3 port map( D => n544, C => CLK, Q => x_12_3_port, QN =>
                           n_1414);
   x_reg_12_2_inst : DF3 port map( D => n543, C => CLK, Q => x_12_2_port, QN =>
                           n_1415);
   x_reg_12_1_inst : DF3 port map( D => n542, C => CLK, Q => x_12_1_port, QN =>
                           n_1416);
   x_reg_12_0_inst : DF3 port map( D => n541, C => CLK, Q => x_12_0_port, QN =>
                           n_1417);
   x_reg_13_7_inst : DF3 port map( D => n540, C => CLK, Q => x_13_7_port, QN =>
                           n_1418);
   x_reg_13_6_inst : DF3 port map( D => n539, C => CLK, Q => x_13_6_port, QN =>
                           n_1419);
   x_reg_13_5_inst : DF3 port map( D => n538, C => CLK, Q => x_13_5_port, QN =>
                           n_1420);
   x_reg_13_4_inst : DF3 port map( D => n537, C => CLK, Q => x_13_4_port, QN =>
                           n_1421);
   x_reg_13_3_inst : DF3 port map( D => n536, C => CLK, Q => x_13_3_port, QN =>
                           n_1422);
   x_reg_13_2_inst : DF3 port map( D => n535, C => CLK, Q => x_13_2_port, QN =>
                           n_1423);
   x_reg_13_1_inst : DF3 port map( D => n534, C => CLK, Q => x_13_1_port, QN =>
                           n_1424);
   x_reg_13_0_inst : DF3 port map( D => n533, C => CLK, Q => x_13_0_port, QN =>
                           n_1425);
   x_reg_14_7_inst : DF3 port map( D => n532, C => CLK, Q => x_14_7_port, QN =>
                           n_1426);
   x_reg_14_6_inst : DF3 port map( D => n531, C => CLK, Q => x_14_6_port, QN =>
                           n_1427);
   x_reg_14_5_inst : DF3 port map( D => n530, C => CLK, Q => x_14_5_port, QN =>
                           n_1428);
   x_reg_14_4_inst : DF3 port map( D => n529, C => CLK, Q => x_14_4_port, QN =>
                           n_1429);
   x_reg_14_3_inst : DF3 port map( D => n528, C => CLK, Q => x_14_3_port, QN =>
                           n_1430);
   x_reg_14_2_inst : DF3 port map( D => n527, C => CLK, Q => x_14_2_port, QN =>
                           n_1431);
   x_reg_14_1_inst : DF3 port map( D => n526, C => CLK, Q => x_14_1_port, QN =>
                           n_1432);
   x_reg_14_0_inst : DF3 port map( D => n525, C => CLK, Q => x_14_0_port, QN =>
                           n_1433);
   x_reg_15_7_inst : DF3 port map( D => n524, C => CLK, Q => x_15_7_port, QN =>
                           n_1434);
   x_reg_15_6_inst : DF3 port map( D => n257, C => CLK, Q => x_15_6_port, QN =>
                           n_1435);
   x_reg_15_5_inst : DF3 port map( D => n248, C => CLK, Q => x_15_5_port, QN =>
                           n_1436);
   x_reg_15_4_inst : DF3 port map( D => n247, C => CLK, Q => x_15_4_port, QN =>
                           n_1437);
   x_reg_15_3_inst : DF3 port map( D => n246, C => CLK, Q => x_15_3_port, QN =>
                           n_1438);
   x_reg_15_2_inst : DF3 port map( D => n245, C => CLK, Q => x_15_2_port, QN =>
                           n_1439);
   x_reg_15_1_inst : DF3 port map( D => n244, C => CLK, Q => x_15_1_port, QN =>
                           n_1440);
   x_reg_15_0_inst : DF3 port map( D => n243, C => CLK, Q => x_15_0_port, QN =>
                           n_1441);
   x_reg_16_7_inst : DF3 port map( D => n242, C => CLK, Q => x_16_7_port, QN =>
                           n_1442);
   x_reg_16_6_inst : DF3 port map( D => n241, C => CLK, Q => x_16_6_port, QN =>
                           n_1443);
   x_reg_16_5_inst : DF3 port map( D => n240, C => CLK, Q => x_16_5_port, QN =>
                           n_1444);
   x_reg_16_4_inst : DF3 port map( D => n239, C => CLK, Q => x_16_4_port, QN =>
                           n_1445);
   x_reg_16_3_inst : DF3 port map( D => n238, C => CLK, Q => x_16_3_port, QN =>
                           n_1446);
   x_reg_16_2_inst : DF3 port map( D => n237, C => CLK, Q => x_16_2_port, QN =>
                           n_1447);
   x_reg_16_1_inst : DF3 port map( D => n236, C => CLK, Q => x_16_1_port, QN =>
                           n_1448);
   x_reg_16_0_inst : DF3 port map( D => n235, C => CLK, Q => x_16_0_port, QN =>
                           n_1449);
   x_reg_17_7_inst : DF3 port map( D => n234, C => CLK, Q => x_17_7_port, QN =>
                           n_1450);
   x_reg_17_6_inst : DF3 port map( D => n233, C => CLK, Q => x_17_6_port, QN =>
                           n_1451);
   x_reg_17_5_inst : DF3 port map( D => n232, C => CLK, Q => x_17_5_port, QN =>
                           n_1452);
   x_reg_17_4_inst : DF3 port map( D => n231, C => CLK, Q => x_17_4_port, QN =>
                           n_1453);
   x_reg_17_3_inst : DF3 port map( D => n230, C => CLK, Q => x_17_3_port, QN =>
                           n_1454);
   x_reg_17_2_inst : DF3 port map( D => n229, C => CLK, Q => x_17_2_port, QN =>
                           n_1455);
   x_reg_17_1_inst : DF3 port map( D => n228, C => CLK, Q => x_17_1_port, QN =>
                           n_1456);
   x_reg_17_0_inst : DF3 port map( D => n227, C => CLK, Q => x_17_0_port, QN =>
                           n_1457);
   x_reg_18_7_inst : DF3 port map( D => n226, C => CLK, Q => x_18_7_port, QN =>
                           n_1458);
   x_reg_18_6_inst : DF3 port map( D => n225, C => CLK, Q => x_18_6_port, QN =>
                           n_1459);
   x_reg_18_5_inst : DF3 port map( D => n224, C => CLK, Q => x_18_5_port, QN =>
                           n_1460);
   x_reg_18_4_inst : DF3 port map( D => n223, C => CLK, Q => x_18_4_port, QN =>
                           n_1461);
   x_reg_18_3_inst : DF3 port map( D => n222, C => CLK, Q => x_18_3_port, QN =>
                           n_1462);
   x_reg_18_2_inst : DF3 port map( D => n221, C => CLK, Q => x_18_2_port, QN =>
                           n_1463);
   x_reg_18_1_inst : DF3 port map( D => n220, C => CLK, Q => x_18_1_port, QN =>
                           n_1464);
   x_reg_18_0_inst : DF3 port map( D => n219, C => CLK, Q => x_18_0_port, QN =>
                           n_1465);
   x_reg_19_7_inst : DF3 port map( D => n218, C => CLK, Q => x_19_7_port, QN =>
                           n_1466);
   x_reg_19_6_inst : DF3 port map( D => n217, C => CLK, Q => x_19_6_port, QN =>
                           n_1467);
   x_reg_19_5_inst : DF3 port map( D => n216, C => CLK, Q => x_19_5_port, QN =>
                           n_1468);
   x_reg_19_4_inst : DF3 port map( D => n215, C => CLK, Q => x_19_4_port, QN =>
                           n_1469);
   x_reg_19_3_inst : DF3 port map( D => n214, C => CLK, Q => x_19_3_port, QN =>
                           n_1470);
   x_reg_19_2_inst : DF3 port map( D => n213, C => CLK, Q => x_19_2_port, QN =>
                           n_1471);
   x_reg_19_1_inst : DF3 port map( D => n212, C => CLK, Q => x_19_1_port, QN =>
                           n_1472);
   x_reg_19_0_inst : DF3 port map( D => n211, C => CLK, Q => x_19_0_port, QN =>
                           n_1473);
   x_reg_20_7_inst : DF3 port map( D => n210, C => CLK, Q => x_20_7_port, QN =>
                           n_1474);
   x_reg_20_6_inst : DF3 port map( D => n209, C => CLK, Q => x_20_6_port, QN =>
                           n_1475);
   x_reg_20_5_inst : DF3 port map( D => n208, C => CLK, Q => x_20_5_port, QN =>
                           n_1476);
   x_reg_20_4_inst : DF3 port map( D => n207, C => CLK, Q => x_20_4_port, QN =>
                           n_1477);
   x_reg_20_3_inst : DF3 port map( D => n206, C => CLK, Q => x_20_3_port, QN =>
                           n_1478);
   x_reg_20_2_inst : DF3 port map( D => n205, C => CLK, Q => x_20_2_port, QN =>
                           n_1479);
   x_reg_20_1_inst : DF3 port map( D => n204, C => CLK, Q => x_20_1_port, QN =>
                           n_1480);
   x_reg_20_0_inst : DF3 port map( D => n203, C => CLK, Q => x_20_0_port, QN =>
                           n_1481);
   x_reg_21_7_inst : DF3 port map( D => n202, C => CLK, Q => x_21_7_port, QN =>
                           n_1482);
   x_reg_21_6_inst : DF3 port map( D => n201, C => CLK, Q => x_21_6_port, QN =>
                           n_1483);
   x_reg_21_5_inst : DF3 port map( D => n200, C => CLK, Q => x_21_5_port, QN =>
                           n_1484);
   x_reg_21_4_inst : DF3 port map( D => n199, C => CLK, Q => x_21_4_port, QN =>
                           n_1485);
   x_reg_21_3_inst : DF3 port map( D => n198, C => CLK, Q => x_21_3_port, QN =>
                           n_1486);
   x_reg_21_2_inst : DF3 port map( D => n197, C => CLK, Q => x_21_2_port, QN =>
                           n_1487);
   x_reg_21_1_inst : DF3 port map( D => n196, C => CLK, Q => x_21_1_port, QN =>
                           n_1488);
   x_reg_21_0_inst : DF3 port map( D => n195, C => CLK, Q => x_21_0_port, QN =>
                           n_1489);
   x_reg_22_7_inst : DF3 port map( D => n194, C => CLK, Q => x_22_7_port, QN =>
                           n_1490);
   x_reg_22_6_inst : DF3 port map( D => n193, C => CLK, Q => x_22_6_port, QN =>
                           n_1491);
   x_reg_22_5_inst : DF3 port map( D => n192, C => CLK, Q => x_22_5_port, QN =>
                           n_1492);
   x_reg_22_4_inst : DF3 port map( D => n191, C => CLK, Q => x_22_4_port, QN =>
                           n_1493);
   x_reg_22_3_inst : DF3 port map( D => n190, C => CLK, Q => x_22_3_port, QN =>
                           n_1494);
   x_reg_22_2_inst : DF3 port map( D => n189, C => CLK, Q => x_22_2_port, QN =>
                           n_1495);
   x_reg_22_1_inst : DF3 port map( D => n188, C => CLK, Q => x_22_1_port, QN =>
                           n_1496);
   x_reg_22_0_inst : DF3 port map( D => n187, C => CLK, Q => x_22_0_port, QN =>
                           n_1497);
   x_reg_23_7_inst : DF3 port map( D => n186, C => CLK, Q => x_23_7_port, QN =>
                           n_1498);
   x_reg_23_6_inst : DF3 port map( D => n185, C => CLK, Q => x_23_6_port, QN =>
                           n_1499);
   x_reg_23_5_inst : DF3 port map( D => n184, C => CLK, Q => x_23_5_port, QN =>
                           n_1500);
   x_reg_23_4_inst : DF3 port map( D => n183, C => CLK, Q => x_23_4_port, QN =>
                           n_1501);
   x_reg_23_3_inst : DF3 port map( D => n182, C => CLK, Q => x_23_3_port, QN =>
                           n_1502);
   x_reg_23_2_inst : DF3 port map( D => n181, C => CLK, Q => x_23_2_port, QN =>
                           n_1503);
   x_reg_23_1_inst : DF3 port map( D => n180, C => CLK, Q => x_23_1_port, QN =>
                           n_1504);
   x_reg_23_0_inst : DF3 port map( D => n179, C => CLK, Q => x_23_0_port, QN =>
                           n_1505);
   x_reg_24_7_inst : DF3 port map( D => n178, C => CLK, Q => x_24_7_port, QN =>
                           n_1506);
   x_reg_24_6_inst : DF3 port map( D => n177, C => CLK, Q => x_24_6_port, QN =>
                           n_1507);
   x_reg_24_5_inst : DF3 port map( D => n176, C => CLK, Q => x_24_5_port, QN =>
                           n_1508);
   x_reg_24_4_inst : DF3 port map( D => n175, C => CLK, Q => x_24_4_port, QN =>
                           n_1509);
   x_reg_24_3_inst : DF3 port map( D => n174, C => CLK, Q => x_24_3_port, QN =>
                           n_1510);
   x_reg_24_2_inst : DF3 port map( D => n173, C => CLK, Q => x_24_2_port, QN =>
                           n_1511);
   x_reg_24_1_inst : DF3 port map( D => n172, C => CLK, Q => x_24_1_port, QN =>
                           n_1512);
   x_reg_24_0_inst : DF3 port map( D => n171, C => CLK, Q => x_24_0_port, QN =>
                           n_1513);
   x_reg_25_7_inst : DF3 port map( D => n170, C => CLK, Q => x_25_7_port, QN =>
                           n_1514);
   x_reg_25_6_inst : DF3 port map( D => n169, C => CLK, Q => x_25_6_port, QN =>
                           n_1515);
   x_reg_25_5_inst : DF3 port map( D => n168, C => CLK, Q => x_25_5_port, QN =>
                           n_1516);
   x_reg_25_4_inst : DF3 port map( D => n167, C => CLK, Q => x_25_4_port, QN =>
                           n_1517);
   x_reg_25_3_inst : DF3 port map( D => n166, C => CLK, Q => x_25_3_port, QN =>
                           n_1518);
   x_reg_25_2_inst : DF3 port map( D => n165, C => CLK, Q => x_25_2_port, QN =>
                           n_1519);
   x_reg_25_1_inst : DF3 port map( D => n164, C => CLK, Q => x_25_1_port, QN =>
                           n_1520);
   x_reg_25_0_inst : DF3 port map( D => n163, C => CLK, Q => x_25_0_port, QN =>
                           n_1521);
   x_reg_26_7_inst : DF3 port map( D => n162, C => CLK, Q => x_26_7_port, QN =>
                           n_1522);
   x_reg_26_6_inst : DF3 port map( D => n161, C => CLK, Q => x_26_6_port, QN =>
                           n_1523);
   x_reg_26_5_inst : DF3 port map( D => n160, C => CLK, Q => x_26_5_port, QN =>
                           n_1524);
   x_reg_26_4_inst : DF3 port map( D => n159, C => CLK, Q => x_26_4_port, QN =>
                           n_1525);
   x_reg_26_3_inst : DF3 port map( D => n158, C => CLK, Q => x_26_3_port, QN =>
                           n_1526);
   x_reg_26_2_inst : DF3 port map( D => n157, C => CLK, Q => x_26_2_port, QN =>
                           n_1527);
   x_reg_26_1_inst : DF3 port map( D => n156, C => CLK, Q => x_26_1_port, QN =>
                           n_1528);
   x_reg_26_0_inst : DF3 port map( D => n155, C => CLK, Q => x_26_0_port, QN =>
                           n_1529);
   x_reg_27_7_inst : DF3 port map( D => n154, C => CLK, Q => x_27_7_port, QN =>
                           n_1530);
   x_reg_27_6_inst : DF3 port map( D => n153, C => CLK, Q => x_27_6_port, QN =>
                           n_1531);
   x_reg_27_5_inst : DF3 port map( D => n152, C => CLK, Q => x_27_5_port, QN =>
                           n_1532);
   x_reg_27_4_inst : DF3 port map( D => n151, C => CLK, Q => x_27_4_port, QN =>
                           n_1533);
   x_reg_27_3_inst : DF3 port map( D => n150, C => CLK, Q => x_27_3_port, QN =>
                           n_1534);
   x_reg_27_2_inst : DF3 port map( D => n149, C => CLK, Q => x_27_2_port, QN =>
                           n_1535);
   x_reg_27_1_inst : DF3 port map( D => n148, C => CLK, Q => x_27_1_port, QN =>
                           n_1536);
   x_reg_27_0_inst : DF3 port map( D => n147, C => CLK, Q => x_27_0_port, QN =>
                           n_1537);
   x_reg_28_7_inst : DF3 port map( D => n146, C => CLK, Q => x_28_7_port, QN =>
                           n_1538);
   x_reg_28_6_inst : DF3 port map( D => n145, C => CLK, Q => x_28_6_port, QN =>
                           n_1539);
   x_reg_28_5_inst : DF3 port map( D => n144, C => CLK, Q => x_28_5_port, QN =>
                           n_1540);
   x_reg_28_4_inst : DF3 port map( D => n143, C => CLK, Q => x_28_4_port, QN =>
                           n_1541);
   x_reg_28_3_inst : DF3 port map( D => n142, C => CLK, Q => x_28_3_port, QN =>
                           n_1542);
   x_reg_28_2_inst : DF3 port map( D => n141, C => CLK, Q => x_28_2_port, QN =>
                           n_1543);
   x_reg_28_1_inst : DF3 port map( D => n140, C => CLK, Q => x_28_1_port, QN =>
                           n_1544);
   x_reg_28_0_inst : DF3 port map( D => n139, C => CLK, Q => x_28_0_port, QN =>
                           n_1545);
   x_reg_29_7_inst : DF3 port map( D => n138, C => CLK, Q => x_29_7_port, QN =>
                           n_1546);
   x_reg_29_6_inst : DF3 port map( D => n137, C => CLK, Q => x_29_6_port, QN =>
                           n_1547);
   x_reg_29_5_inst : DF3 port map( D => n136, C => CLK, Q => x_29_5_port, QN =>
                           n_1548);
   x_reg_29_4_inst : DF3 port map( D => n135, C => CLK, Q => x_29_4_port, QN =>
                           n_1549);
   x_reg_29_3_inst : DF3 port map( D => n134, C => CLK, Q => x_29_3_port, QN =>
                           n_1550);
   x_reg_29_2_inst : DF3 port map( D => n133, C => CLK, Q => x_29_2_port, QN =>
                           n_1551);
   x_reg_29_1_inst : DF3 port map( D => n132, C => CLK, Q => x_29_1_port, QN =>
                           n_1552);
   x_reg_29_0_inst : DF3 port map( D => n131, C => CLK, Q => x_29_0_port, QN =>
                           n_1553);
   x_reg_30_7_inst : DF3 port map( D => n130, C => CLK, Q => x_30_7_port, QN =>
                           n249);
   x_reg_30_6_inst : DF3 port map( D => n129, C => CLK, Q => x_30_6_port, QN =>
                           n250);
   x_reg_30_5_inst : DF3 port map( D => n128, C => CLK, Q => x_30_5_port, QN =>
                           n251);
   x_reg_30_4_inst : DF3 port map( D => n127, C => CLK, Q => x_30_4_port, QN =>
                           n252);
   x_reg_30_3_inst : DF3 port map( D => n126, C => CLK, Q => x_30_3_port, QN =>
                           n253);
   x_reg_30_2_inst : DF3 port map( D => n125, C => CLK, Q => x_30_2_port, QN =>
                           n254);
   x_reg_30_1_inst : DF3 port map( D => n124, C => CLK, Q => x_30_1_port, QN =>
                           n255);
   x_reg_30_0_inst : DF3 port map( D => n123, C => CLK, Q => x_30_0_port, QN =>
                           n256);
   x_reg_31_7_inst : DF3 port map( D => n523, C => CLK, Q => x_31_7_port, QN =>
                           n_1554);
   x_reg_31_6_inst : DF3 port map( D => n522, C => CLK, Q => x_31_6_port, QN =>
                           n_1555);
   x_reg_31_5_inst : DF3 port map( D => n521, C => CLK, Q => x_31_5_port, QN =>
                           n_1556);
   x_reg_31_4_inst : DF3 port map( D => n520, C => CLK, Q => x_31_4_port, QN =>
                           n_1557);
   x_reg_31_3_inst : DF3 port map( D => n519, C => CLK, Q => x_31_3_port, QN =>
                           n_1558);
   x_reg_31_2_inst : DF3 port map( D => n518, C => CLK, Q => x_31_2_port, QN =>
                           n_1559);
   x_reg_31_1_inst : DF3 port map( D => n517, C => CLK, Q => x_31_1_port, QN =>
                           n_1560);
   x_reg_31_0_inst : DF3 port map( D => n516, C => CLK, Q => x_31_0_port, QN =>
                           n_1561);
   U4 : NOR21 port map( A => n114, B => RESET, Q => n267);
   U6 : BUF2 port map( A => Delay_Line_address(0), Q => n92);
   U8 : BUF2 port map( A => Delay_Line_address(0), Q => n91);
   U10 : BUF2 port map( A => Delay_Line_address(0), Q => n93);
   U12 : BUF2 port map( A => n95, Q => n114);
   U14 : INV3 port map( A => n113, Q => n96);
   U16 : INV3 port map( A => n111, Q => n110);
   U18 : INV3 port map( A => n111, Q => n109);
   U19 : INV3 port map( A => n112, Q => n108);
   U20 : INV3 port map( A => n112, Q => n107);
   U21 : INV3 port map( A => n112, Q => n106);
   U22 : INV3 port map( A => n112, Q => n105);
   U23 : INV3 port map( A => n112, Q => n104);
   U24 : INV3 port map( A => n111, Q => n103);
   U25 : INV3 port map( A => n111, Q => n102);
   U26 : INV3 port map( A => n112, Q => n101);
   U27 : INV3 port map( A => n113, Q => n100);
   U28 : INV3 port map( A => n111, Q => n99);
   U29 : INV3 port map( A => n112, Q => n98);
   U30 : INV3 port map( A => n112, Q => n97);
   U31 : BUF2 port map( A => n95, Q => n118);
   U32 : BUF2 port map( A => n95, Q => n120);
   U33 : BUF2 port map( A => n95, Q => n115);
   U34 : BUF2 port map( A => n122, Q => n117);
   U35 : BUF2 port map( A => n122, Q => n119);
   U36 : BUF2 port map( A => n122, Q => n121);
   U37 : BUF2 port map( A => n122, Q => n116);
   U38 : BUF2 port map( A => n95, Q => n122);
   U39 : BUF2 port map( A => n89, Q => n84);
   U40 : BUF2 port map( A => n90, Q => n86);
   U41 : BUF2 port map( A => n89, Q => n85);
   U42 : BUF2 port map( A => n90, Q => n87);
   U43 : BUF2 port map( A => n88, Q => n83);
   U44 : BUF2 port map( A => n88, Q => n81);
   U45 : BUF2 port map( A => n88, Q => n82);
   U46 : INV3 port map( A => n267, Q => n111);
   U47 : INV3 port map( A => n267, Q => n112);
   U48 : INV3 port map( A => n267, Q => n113);
   U49 : INV3 port map( A => n94, Q => n95);
   U50 : IMUX40 port map( A => x_16_5_port, B => x_17_5_port, C => x_18_5_port,
                           D => x_19_5_port, S0 => n92, S1 => n85, Q => n52);
   U51 : IMUX40 port map( A => x_24_5_port, B => x_25_5_port, C => x_26_5_port,
                           D => x_27_5_port, S0 => n92, S1 => n85, Q => n53);
   U52 : IMUX40 port map( A => x_12_5_port, B => x_13_5_port, C => x_14_5_port,
                           D => x_15_5_port, S0 => n92, S1 => n85, Q => n60);
   U53 : IMUX40 port map( A => x_0_5_port, B => x_1_5_port, C => x_2_5_port, D 
                           => x_3_5_port, S0 => n92, S1 => n86, Q => n57);
   U54 : IMUX40 port map( A => x_8_5_port, B => x_9_5_port, C => x_10_5_port, D
                           => x_11_5_port, S0 => n92, S1 => n85, Q => n58);
   U55 : IMUX40 port map( A => x_16_3_port, B => x_17_3_port, C => x_18_3_port,
                           D => x_19_3_port, S0 => n93, S1 => n83, Q => n32);
   U56 : IMUX40 port map( A => x_24_3_port, B => x_25_3_port, C => x_26_3_port,
                           D => x_27_3_port, S0 => n91, S1 => n83, Q => n33);
   U57 : IMUX40 port map( A => x_12_3_port, B => x_13_3_port, C => x_14_3_port,
                           D => x_15_3_port, S0 => n91, S1 => n84, Q => n40);
   U58 : IMUX40 port map( A => x_0_3_port, B => x_1_3_port, C => x_2_3_port, D 
                           => x_3_3_port, S0 => n91, S1 => n84, Q => n37);
   U59 : IMUX40 port map( A => x_8_3_port, B => x_9_3_port, C => x_10_3_port, D
                           => x_11_3_port, S0 => n91, S1 => n84, Q => n38);
   U60 : IMUX40 port map( A => x_16_6_port, B => x_17_6_port, C => x_18_6_port,
                           D => x_19_6_port, S0 => n92, S1 => n86, Q => n62);
   U61 : IMUX40 port map( A => x_24_6_port, B => x_25_6_port, C => x_26_6_port,
                           D => x_27_6_port, S0 => n92, S1 => n86, Q => n63);
   U62 : IMUX40 port map( A => x_12_6_port, B => x_13_6_port, C => x_14_6_port,
                           D => x_15_6_port, S0 => n93, S1 => n86, Q => n70);
   U63 : IMUX40 port map( A => x_0_6_port, B => x_1_6_port, C => x_2_6_port, D 
                           => x_3_6_port, S0 => n93, S1 => n87, Q => n67);
   U64 : IMUX40 port map( A => x_8_6_port, B => x_9_6_port, C => x_10_6_port, D
                           => x_11_6_port, S0 => n93, S1 => n86, Q => n68);
   U65 : IMUX40 port map( A => x_16_4_port, B => x_17_4_port, C => x_18_4_port,
                           D => x_19_4_port, S0 => n91, S1 => n84, Q => n42);
   U66 : IMUX40 port map( A => x_24_4_port, B => x_25_4_port, C => x_26_4_port,
                           D => x_27_4_port, S0 => n91, S1 => n84, Q => n43);
   U67 : IMUX40 port map( A => x_12_4_port, B => x_13_4_port, C => x_14_4_port,
                           D => x_15_4_port, S0 => n91, S1 => n84, Q => n50);
   U68 : IMUX40 port map( A => x_0_4_port, B => x_1_4_port, C => x_2_4_port, D 
                           => x_3_4_port, S0 => n91, S1 => n85, Q => n47);
   U69 : IMUX40 port map( A => x_8_4_port, B => x_9_4_port, C => x_10_4_port, D
                           => x_11_4_port, S0 => n91, S1 => n85, Q => n48);
   U70 : IMUX40 port map( A => x_16_7_port, B => x_17_7_port, C => x_18_7_port,
                           D => x_19_7_port, S0 => n93, S1 => n87, Q => n72);
   U71 : IMUX40 port map( A => x_24_7_port, B => x_25_7_port, C => x_26_7_port,
                           D => x_27_7_port, S0 => n93, S1 => n87, Q => n73);
   U72 : IMUX40 port map( A => x_12_7_port, B => x_13_7_port, C => x_14_7_port,
                           D => x_15_7_port, S0 => n93, S1 => n87, Q => n80);
   U73 : IMUX40 port map( A => x_0_7_port, B => x_1_7_port, C => x_2_7_port, D 
                           => x_3_7_port, S0 => n93, S1 => n87, Q => n77);
   U74 : IMUX40 port map( A => x_8_7_port, B => x_9_7_port, C => x_10_7_port, D
                           => x_11_7_port, S0 => n93, S1 => n87, Q => n78);
   U75 : IMUX40 port map( A => x_28_5_port, B => x_29_5_port, C => x_30_5_port,
                           D => x_31_5_port, S0 => n92, S1 => n85, Q => n55);
   U76 : IMUX40 port map( A => x_28_3_port, B => x_29_3_port, C => x_30_3_port,
                           D => x_31_3_port, S0 => n91, S1 => n83, Q => n35);
   U77 : IMUX40 port map( A => x_28_6_port, B => x_29_6_port, C => x_30_6_port,
                           D => x_31_6_port, S0 => n92, S1 => n86, Q => n65);
   U78 : IMUX40 port map( A => x_28_4_port, B => x_29_4_port, C => x_30_4_port,
                           D => x_31_4_port, S0 => n91, S1 => n84, Q => n45);
   U79 : IMUX40 port map( A => x_28_7_port, B => x_29_7_port, C => x_30_7_port,
                           D => x_31_7_port, S0 => n93, S1 => n87, Q => n75);
   U80 : IMUX40 port map( A => x_20_5_port, B => x_21_5_port, C => x_22_5_port,
                           D => x_23_5_port, S0 => n92, S1 => n85, Q => n54);
   U81 : IMUX40 port map( A => x_20_3_port, B => x_21_3_port, C => x_22_3_port,
                           D => x_23_3_port, S0 => n91, S1 => n83, Q => n34);
   U82 : IMUX40 port map( A => x_20_6_port, B => x_21_6_port, C => x_22_6_port,
                           D => x_23_6_port, S0 => n92, S1 => n86, Q => n64);
   U83 : IMUX40 port map( A => x_20_4_port, B => x_21_4_port, C => x_22_4_port,
                           D => x_23_4_port, S0 => n91, S1 => n84, Q => n44);
   U84 : IMUX40 port map( A => x_20_7_port, B => x_21_7_port, C => x_22_7_port,
                           D => x_23_7_port, S0 => n93, S1 => n87, Q => n74);
   U85 : MUX22 port map( A => n76, B => n71, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(7));
   U86 : IMUX40 port map( A => n77, B => n78, C => n79, D => n80, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n76);
   U87 : IMUX40 port map( A => n72, B => n73, C => n74, D => n75, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n71);
   U88 : IMUX40 port map( A => x_4_7_port, B => x_5_7_port, C => x_6_7_port, D 
                           => x_7_7_port, S0 => n93, S1 => n87, Q => n79);
   U89 : MUX22 port map( A => n56, B => n51, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(5));
   U90 : IMUX40 port map( A => n57, B => n58, C => n59, D => n60, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n56);
   U91 : IMUX40 port map( A => n52, B => n53, C => n54, D => n55, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n51);
   U92 : IMUX40 port map( A => x_4_5_port, B => x_5_5_port, C => x_6_5_port, D 
                           => x_7_5_port, S0 => n92, S1 => n86, Q => n59);
   U93 : MUX22 port map( A => n36, B => n31, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(3));
   U94 : IMUX40 port map( A => n37, B => n38, C => n39, D => n40, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n36);
   U95 : IMUX40 port map( A => n32, B => n33, C => n34, D => n35, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n31);
   U96 : IMUX40 port map( A => x_4_3_port, B => x_5_3_port, C => x_6_3_port, D 
                           => x_7_3_port, S0 => n91, S1 => n84, Q => n39);
   U97 : MUX22 port map( A => n66, B => n61, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(6));
   U98 : IMUX40 port map( A => n67, B => n68, C => n69, D => n70, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n66);
   U99 : IMUX40 port map( A => n62, B => n63, C => n64, D => n65, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n61);
   U100 : IMUX40 port map( A => x_4_6_port, B => x_5_6_port, C => x_6_6_port, D
                           => x_7_6_port, S0 => n93, S1 => n86, Q => n69);
   U101 : MUX22 port map( A => n46, B => n41, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(4));
   U102 : IMUX40 port map( A => n47, B => n48, C => n49, D => n50, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n46);
   U103 : IMUX40 port map( A => n42, B => n43, C => n44, D => n45, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n41);
   U104 : IMUX40 port map( A => x_4_4_port, B => x_5_4_port, C => x_6_4_port, D
                           => x_7_4_port, S0 => n91, S1 => n85, Q => n49);
   U105 : BUF2 port map( A => Delay_Line_address(1), Q => n89);
   U106 : BUF2 port map( A => Delay_Line_address(1), Q => n90);
   U107 : IMUX40 port map( A => x_16_2_port, B => x_17_2_port, C => x_18_2_port
                           , D => x_19_2_port, S0 => n92, S1 => n83, Q => n22);
   U108 : IMUX40 port map( A => x_24_2_port, B => x_25_2_port, C => x_26_2_port
                           , D => x_27_2_port, S0 => n92, S1 => n82, Q => n23);
   U109 : IMUX40 port map( A => x_12_2_port, B => x_13_2_port, C => x_14_2_port
                           , D => x_15_2_port, S0 => n91, S1 => n83, Q => n30);
   U110 : IMUX40 port map( A => x_8_2_port, B => x_9_2_port, C => x_10_2_port, 
                           D => x_11_2_port, S0 => n91, S1 => n83, Q => n28);
   U111 : IMUX40 port map( A => x_0_2_port, B => x_1_2_port, C => x_2_2_port, D
                           => x_3_2_port, S0 => n91, S1 => n83, Q => n27);
   U112 : IMUX40 port map( A => x_12_0_port, B => x_13_0_port, C => x_14_0_port
                           , D => x_15_0_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n10);
   U113 : IMUX40 port map( A => x_0_0_port, B => x_1_0_port, C => x_2_0_port, D
                           => x_3_0_port, S0 => Delay_Line_address(0), S1 => 
                           n81, Q => n7);
   U114 : IMUX40 port map( A => x_8_0_port, B => x_9_0_port, C => x_10_0_port, 
                           D => x_11_0_port, S0 => Delay_Line_address(0), S1 =>
                           n81, Q => n8);
   U115 : IMUX40 port map( A => x_16_0_port, B => x_17_0_port, C => x_18_0_port
                           , D => x_19_0_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n2);
   U116 : IMUX40 port map( A => x_24_0_port, B => x_25_0_port, C => x_26_0_port
                           , D => x_27_0_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n3);
   U117 : IMUX40 port map( A => x_16_1_port, B => x_17_1_port, C => x_18_1_port
                           , D => x_19_1_port, S0 => Delay_Line_address(0), S1 
                           => n82, Q => n12);
   U118 : IMUX40 port map( A => x_24_1_port, B => x_25_1_port, C => x_26_1_port
                           , D => x_27_1_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n13);
   U119 : IMUX40 port map( A => x_12_1_port, B => x_13_1_port, C => x_14_1_port
                           , D => x_15_1_port, S0 => n93, S1 => n82, Q => n20);
   U120 : IMUX40 port map( A => x_8_1_port, B => x_9_1_port, C => x_10_1_port, 
                           D => x_11_1_port, S0 => Delay_Line_address(0), S1 =>
                           n82, Q => n18);
   U121 : IMUX40 port map( A => x_0_1_port, B => x_1_1_port, C => x_2_1_port, D
                           => x_3_1_port, S0 => Delay_Line_address(0), S1 => 
                           n82, Q => n17);
   U122 : IMUX40 port map( A => x_28_2_port, B => x_29_2_port, C => x_30_2_port
                           , D => x_31_2_port, S0 => n92, S1 => n82, Q => n25);
   U123 : IMUX40 port map( A => x_28_1_port, B => x_29_1_port, C => x_30_1_port
                           , D => x_31_1_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n15);
   U124 : IMUX40 port map( A => x_20_2_port, B => x_21_2_port, C => x_22_2_port
                           , D => x_23_2_port, S0 => n93, S1 => n82, Q => n24);
   U125 : IMUX40 port map( A => x_4_0_port, B => x_5_0_port, C => x_6_0_port, D
                           => x_7_0_port, S0 => Delay_Line_address(0), S1 => 
                           n81, Q => n9);
   U126 : IMUX40 port map( A => x_20_0_port, B => x_21_0_port, C => x_22_0_port
                           , D => x_23_0_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n4);
   U127 : IMUX40 port map( A => x_20_1_port, B => x_21_1_port, C => x_22_1_port
                           , D => x_23_1_port, S0 => Delay_Line_address(0), S1 
                           => n82, Q => n14);
   U128 : MUX22 port map( A => n26, B => n21, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(2));
   U129 : IMUX40 port map( A => n27, B => n28, C => n29, D => n30, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n26);
   U130 : IMUX40 port map( A => n22, B => n23, C => n24, D => n25, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n21);
   U131 : IMUX40 port map( A => x_4_2_port, B => x_5_2_port, C => x_6_2_port, D
                           => x_7_2_port, S0 => n92, S1 => n83, Q => n29);
   U132 : MUX22 port map( A => n6, B => n1, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(0));
   U133 : IMUX40 port map( A => n2, B => n3, C => n4, D => n5, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n1);
   U134 : IMUX40 port map( A => n7, B => n8, C => n9, D => n10, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n6);
   U135 : IMUX40 port map( A => x_28_0_port, B => x_29_0_port, C => x_30_0_port
                           , D => x_31_0_port, S0 => Delay_Line_address(0), S1 
                           => n81, Q => n5);
   U136 : MUX22 port map( A => n16, B => n11, S => Delay_Line_address(4), Q => 
                           Delay_Line_out(1));
   U137 : IMUX40 port map( A => n17, B => n18, C => n19, D => n20, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n16);
   U138 : IMUX40 port map( A => n12, B => n13, C => n14, D => n15, S0 => 
                           Delay_Line_address(3), S1 => Delay_Line_address(2), 
                           Q => n11);
   U139 : IMUX40 port map( A => x_4_1_port, B => x_5_1_port, C => x_6_1_port, D
                           => x_7_1_port, S0 => Delay_Line_address(0), S1 => 
                           n82, Q => n19);
   U140 : BUF2 port map( A => Delay_Line_address(1), Q => n88);
   U141 : INV3 port map( A => n387, Q => n525);
   U142 : AOI221 port map( A => n122, B => x_14_0_port, C => n103, D => 
                           x_13_0_port, Q => n387);
   U143 : INV3 port map( A => n388, Q => n524);
   U144 : AOI221 port map( A => n122, B => x_15_7_port, C => n103, D => 
                           x_14_7_port, Q => n388);
   U145 : NAND22 port map( A => x_31_3_port, B => n114, Q => n262);
   U146 : NAND22 port map( A => x_31_4_port, B => n114, Q => n263);
   U147 : NAND22 port map( A => x_31_5_port, B => n114, Q => n264);
   U148 : NAND22 port map( A => x_31_6_port, B => n114, Q => n265);
   U149 : NAND22 port map( A => x_31_7_port, B => n114, Q => n266);
   U150 : INV3 port map( A => n259, Q => n94);
   U151 : NOR21 port map( A => RESET, B => Delay_Line_sample_shift, Q => n259);
   U152 : INV3 port map( A => n512, Q => n126);
   U153 : AOI221 port map( A => n118, B => x_30_3_port, C => n103, D => 
                           x_29_3_port, Q => n512);
   U154 : INV3 port map( A => n511, Q => n127);
   U155 : AOI221 port map( A => n120, B => x_30_4_port, C => n99, D => 
                           x_29_4_port, Q => n511);
   U156 : INV3 port map( A => n510, Q => n128);
   U157 : AOI221 port map( A => n115, B => x_30_5_port, C => n102, D => 
                           x_29_5_port, Q => n510);
   U158 : INV3 port map( A => n509, Q => n129);
   U159 : AOI221 port map( A => n115, B => x_30_6_port, C => n110, D => 
                           x_29_6_port, Q => n509);
   U160 : INV3 port map( A => n508, Q => n130);
   U161 : AOI221 port map( A => n118, B => x_30_7_port, C => n109, D => 
                           x_29_7_port, Q => n508);
   U162 : INV3 port map( A => n507, Q => n131);
   U163 : AOI221 port map( A => n120, B => x_29_0_port, C => n103, D => 
                           x_28_0_port, Q => n507);
   U164 : INV3 port map( A => n506, Q => n132);
   U165 : AOI221 port map( A => n115, B => x_29_1_port, C => n99, D => 
                           x_28_1_port, Q => n506);
   U166 : INV3 port map( A => n505, Q => n133);
   U167 : AOI221 port map( A => n115, B => x_29_2_port, C => n110, D => 
                           x_28_2_port, Q => n505);
   U168 : INV3 port map( A => n504, Q => n134);
   U169 : AOI221 port map( A => n118, B => x_29_3_port, C => n110, D => 
                           x_28_3_port, Q => n504);
   U170 : INV3 port map( A => n503, Q => n135);
   U171 : AOI221 port map( A => n120, B => x_29_4_port, C => n110, D => 
                           x_28_4_port, Q => n503);
   U172 : INV3 port map( A => n502, Q => n136);
   U173 : AOI221 port map( A => n115, B => x_29_5_port, C => n110, D => 
                           x_28_5_port, Q => n502);
   U174 : INV3 port map( A => n501, Q => n137);
   U175 : AOI221 port map( A => n118, B => x_29_6_port, C => n110, D => 
                           x_28_6_port, Q => n501);
   U176 : INV3 port map( A => n500, Q => n138);
   U177 : AOI221 port map( A => n118, B => x_29_7_port, C => n110, D => 
                           x_28_7_port, Q => n500);
   U178 : INV3 port map( A => n499, Q => n139);
   U179 : AOI221 port map( A => n120, B => x_28_0_port, C => n110, D => 
                           x_27_0_port, Q => n499);
   U180 : INV3 port map( A => n498, Q => n140);
   U181 : AOI221 port map( A => n115, B => x_28_1_port, C => n110, D => 
                           x_27_1_port, Q => n498);
   U182 : INV3 port map( A => n475, Q => n163);
   U183 : AOI221 port map( A => n118, B => x_25_0_port, C => n109, D => 
                           x_24_0_port, Q => n475);
   U184 : INV3 port map( A => n474, Q => n164);
   U185 : AOI221 port map( A => n118, B => x_25_1_port, C => n109, D => 
                           x_24_1_port, Q => n474);
   U186 : INV3 port map( A => n473, Q => n165);
   U187 : AOI221 port map( A => n118, B => x_25_2_port, C => n108, D => 
                           x_24_2_port, Q => n473);
   U188 : INV3 port map( A => n472, Q => n166);
   U189 : AOI221 port map( A => n118, B => x_25_3_port, C => n108, D => 
                           x_24_3_port, Q => n472);
   U190 : INV3 port map( A => n471, Q => n167);
   U191 : AOI221 port map( A => n118, B => x_25_4_port, C => n108, D => 
                           x_24_4_port, Q => n471);
   U192 : INV3 port map( A => n470, Q => n168);
   U193 : AOI221 port map( A => n118, B => x_25_5_port, C => n108, D => 
                           x_24_5_port, Q => n470);
   U194 : INV3 port map( A => n469, Q => n169);
   U195 : AOI221 port map( A => n118, B => x_25_6_port, C => n108, D => 
                           x_24_6_port, Q => n469);
   U196 : INV3 port map( A => n468, Q => n170);
   U197 : AOI221 port map( A => n118, B => x_25_7_port, C => n108, D => 
                           x_24_7_port, Q => n468);
   U198 : INV3 port map( A => n467, Q => n171);
   U199 : AOI221 port map( A => n118, B => x_24_0_port, C => n108, D => 
                           x_23_0_port, Q => n467);
   U200 : INV3 port map( A => n466, Q => n172);
   U201 : AOI221 port map( A => n118, B => x_24_1_port, C => n108, D => 
                           x_23_1_port, Q => n466);
   U202 : INV3 port map( A => n465, Q => n173);
   U203 : AOI221 port map( A => n118, B => x_24_2_port, C => n108, D => 
                           x_23_2_port, Q => n465);
   U204 : INV3 port map( A => n464, Q => n174);
   U205 : AOI221 port map( A => n118, B => x_24_3_port, C => n108, D => 
                           x_23_3_port, Q => n464);
   U206 : INV3 port map( A => n463, Q => n175);
   U207 : AOI221 port map( A => n118, B => x_24_4_port, C => n108, D => 
                           x_23_4_port, Q => n463);
   U208 : INV3 port map( A => n462, Q => n176);
   U209 : AOI221 port map( A => n118, B => x_24_5_port, C => n108, D => 
                           x_23_5_port, Q => n462);
   U210 : INV3 port map( A => n461, Q => n177);
   U211 : AOI221 port map( A => n118, B => x_24_6_port, C => n108, D => 
                           x_23_6_port, Q => n461);
   U212 : INV3 port map( A => n460, Q => n178);
   U213 : AOI221 port map( A => n118, B => x_24_7_port, C => n108, D => 
                           x_23_7_port, Q => n460);
   U214 : INV3 port map( A => n459, Q => n179);
   U215 : AOI221 port map( A => n118, B => x_23_0_port, C => n108, D => 
                           x_22_0_port, Q => n459);
   U216 : INV3 port map( A => n458, Q => n180);
   U217 : AOI221 port map( A => n118, B => x_23_1_port, C => n108, D => 
                           x_22_1_port, Q => n458);
   U218 : INV3 port map( A => n457, Q => n181);
   U219 : AOI221 port map( A => n118, B => x_23_2_port, C => n107, D => 
                           x_22_2_port, Q => n457);
   U220 : INV3 port map( A => n456, Q => n182);
   U221 : AOI221 port map( A => n118, B => x_23_3_port, C => n107, D => 
                           x_22_3_port, Q => n456);
   U222 : INV3 port map( A => n455, Q => n183);
   U223 : AOI221 port map( A => n118, B => x_23_4_port, C => n107, D => 
                           x_22_4_port, Q => n455);
   U224 : INV3 port map( A => n454, Q => n184);
   U225 : AOI221 port map( A => n118, B => x_23_5_port, C => n107, D => 
                           x_22_5_port, Q => n454);
   U226 : INV3 port map( A => n432, Q => n206);
   U227 : AOI221 port map( A => n120, B => x_20_3_port, C => n106, D => 
                           x_19_3_port, Q => n432);
   U228 : INV3 port map( A => n431, Q => n207);
   U229 : AOI221 port map( A => n120, B => x_20_4_port, C => n106, D => 
                           x_19_4_port, Q => n431);
   U230 : INV3 port map( A => n430, Q => n208);
   U231 : AOI221 port map( A => n120, B => x_20_5_port, C => n106, D => 
                           x_19_5_port, Q => n430);
   U232 : INV3 port map( A => n429, Q => n209);
   U233 : AOI221 port map( A => n120, B => x_20_6_port, C => n106, D => 
                           x_19_6_port, Q => n429);
   U234 : INV3 port map( A => n428, Q => n210);
   U235 : AOI221 port map( A => n120, B => x_20_7_port, C => n106, D => 
                           x_19_7_port, Q => n428);
   U236 : INV3 port map( A => n427, Q => n211);
   U237 : AOI221 port map( A => n120, B => x_19_0_port, C => n106, D => 
                           x_18_0_port, Q => n427);
   U238 : INV3 port map( A => n426, Q => n212);
   U239 : AOI221 port map( A => n120, B => x_19_1_port, C => n106, D => 
                           x_18_1_port, Q => n426);
   U240 : INV3 port map( A => n425, Q => n213);
   U241 : AOI221 port map( A => n120, B => x_19_2_port, C => n105, D => 
                           x_18_2_port, Q => n425);
   U242 : INV3 port map( A => n424, Q => n214);
   U243 : AOI221 port map( A => n120, B => x_19_3_port, C => n105, D => 
                           x_18_3_port, Q => n424);
   U244 : INV3 port map( A => n423, Q => n215);
   U245 : AOI221 port map( A => n120, B => x_19_4_port, C => n105, D => 
                           x_18_4_port, Q => n423);
   U246 : INV3 port map( A => n422, Q => n216);
   U247 : AOI221 port map( A => n120, B => x_19_5_port, C => n105, D => 
                           x_18_5_port, Q => n422);
   U248 : INV3 port map( A => n421, Q => n217);
   U249 : AOI221 port map( A => n120, B => x_19_6_port, C => n105, D => 
                           x_18_6_port, Q => n421);
   U250 : INV3 port map( A => n420, Q => n218);
   U251 : AOI221 port map( A => n120, B => x_19_7_port, C => n105, D => 
                           x_18_7_port, Q => n420);
   U252 : INV3 port map( A => n419, Q => n219);
   U253 : AOI221 port map( A => n120, B => x_18_0_port, C => n105, D => 
                           x_17_0_port, Q => n419);
   U254 : INV3 port map( A => n418, Q => n220);
   U255 : AOI221 port map( A => n120, B => x_18_1_port, C => n105, D => 
                           x_17_1_port, Q => n418);
   U256 : INV3 port map( A => n417, Q => n221);
   U257 : AOI221 port map( A => n120, B => x_18_2_port, C => n105, D => 
                           x_17_2_port, Q => n417);
   U258 : INV3 port map( A => n416, Q => n222);
   U259 : AOI221 port map( A => n120, B => x_18_3_port, C => n105, D => 
                           x_17_3_port, Q => n416);
   U260 : INV3 port map( A => n415, Q => n223);
   U261 : AOI221 port map( A => n120, B => x_18_4_port, C => n105, D => 
                           x_17_4_port, Q => n415);
   U262 : INV3 port map( A => n414, Q => n224);
   U263 : AOI221 port map( A => n120, B => x_18_5_port, C => n105, D => 
                           x_17_5_port, Q => n414);
   U264 : INV3 port map( A => n413, Q => n225);
   U265 : AOI221 port map( A => n120, B => x_18_6_port, C => n105, D => 
                           x_17_6_port, Q => n413);
   U266 : INV3 port map( A => n412, Q => n226);
   U267 : AOI221 port map( A => n120, B => x_18_7_port, C => n105, D => 
                           x_17_7_port, Q => n412);
   U268 : INV3 port map( A => n411, Q => n227);
   U269 : AOI221 port map( A => n120, B => x_17_0_port, C => n105, D => 
                           x_16_0_port, Q => n411);
   U270 : INV3 port map( A => n373, Q => n539);
   U271 : AOI221 port map( A => n115, B => x_13_6_port, C => n102, D => 
                           x_12_6_port, Q => n373);
   U272 : INV3 port map( A => n368, Q => n544);
   U273 : AOI221 port map( A => n115, B => x_12_3_port, C => n102, D => 
                           x_11_3_port, Q => n368);
   U274 : INV3 port map( A => n367, Q => n545);
   U275 : AOI221 port map( A => n115, B => x_12_4_port, C => n102, D => 
                           x_11_4_port, Q => n367);
   U276 : INV3 port map( A => n366, Q => n546);
   U277 : AOI221 port map( A => n115, B => x_12_5_port, C => n102, D => 
                           x_11_5_port, Q => n366);
   U278 : INV3 port map( A => n365, Q => n547);
   U279 : AOI221 port map( A => n115, B => x_12_6_port, C => n102, D => 
                           x_11_6_port, Q => n365);
   U280 : INV3 port map( A => n364, Q => n548);
   U281 : AOI221 port map( A => n115, B => x_12_7_port, C => n102, D => 
                           x_11_7_port, Q => n364);
   U282 : INV3 port map( A => n363, Q => n549);
   U283 : AOI221 port map( A => n115, B => x_11_0_port, C => n102, D => 
                           x_10_0_port, Q => n363);
   U284 : INV3 port map( A => n362, Q => n550);
   U285 : AOI221 port map( A => n115, B => x_11_1_port, C => n102, D => 
                           x_10_1_port, Q => n362);
   U286 : INV3 port map( A => n361, Q => n551);
   U287 : AOI221 port map( A => n115, B => x_11_2_port, C => n101, D => 
                           x_10_2_port, Q => n361);
   U288 : INV3 port map( A => n360, Q => n552);
   U289 : AOI221 port map( A => n115, B => x_11_3_port, C => n101, D => 
                           x_10_3_port, Q => n360);
   U290 : INV3 port map( A => n359, Q => n553);
   U291 : AOI221 port map( A => n115, B => x_11_4_port, C => n101, D => 
                           x_10_4_port, Q => n359);
   U292 : INV3 port map( A => n358, Q => n554);
   U293 : AOI221 port map( A => n115, B => x_11_5_port, C => n101, D => 
                           x_10_5_port, Q => n358);
   U294 : INV3 port map( A => n357, Q => n555);
   U295 : AOI221 port map( A => n115, B => x_11_6_port, C => n101, D => 
                           x_10_6_port, Q => n357);
   U296 : INV3 port map( A => n356, Q => n556);
   U297 : AOI221 port map( A => n115, B => x_11_7_port, C => n101, D => 
                           x_10_7_port, Q => n356);
   U298 : INV3 port map( A => n355, Q => n557);
   U299 : AOI221 port map( A => n115, B => x_10_0_port, C => n101, D => 
                           x_9_0_port, Q => n355);
   U300 : INV3 port map( A => n354, Q => n558);
   U301 : AOI221 port map( A => n115, B => x_10_1_port, C => n101, D => 
                           x_9_1_port, Q => n354);
   U302 : INV3 port map( A => n353, Q => n559);
   U303 : AOI221 port map( A => n115, B => x_10_2_port, C => n101, D => 
                           x_9_2_port, Q => n353);
   U304 : INV3 port map( A => n352, Q => n560);
   U305 : AOI221 port map( A => n115, B => x_10_3_port, C => n101, D => 
                           x_9_3_port, Q => n352);
   U306 : INV3 port map( A => n351, Q => n561);
   U307 : AOI221 port map( A => n115, B => x_10_4_port, C => n101, D => 
                           x_9_4_port, Q => n351);
   U308 : INV3 port map( A => n350, Q => n562);
   U309 : AOI221 port map( A => n115, B => x_10_5_port, C => n101, D => 
                           x_9_5_port, Q => n350);
   U310 : INV3 port map( A => n348, Q => n564);
   U311 : AOI221 port map( A => n115, B => x_10_7_port, C => n101, D => 
                           x_9_7_port, Q => n348);
   U312 : INV3 port map( A => n347, Q => n565);
   U313 : AOI221 port map( A => n115, B => x_9_0_port, C => n101, D => 
                           x_8_0_port, Q => n347);
   U314 : INV3 port map( A => n326, Q => n586);
   U315 : AOI221 port map( A => n118, B => x_7_5_port, C => n99, D => 
                           x_6_5_port, Q => n326);
   U316 : INV3 port map( A => n325, Q => n587);
   U317 : AOI221 port map( A => n120, B => x_7_6_port, C => n99, D => 
                           x_6_6_port, Q => n325);
   U318 : INV3 port map( A => n324, Q => n588);
   U319 : AOI221 port map( A => n120, B => x_7_7_port, C => n99, D => 
                           x_6_7_port, Q => n324);
   U320 : INV3 port map( A => n323, Q => n589);
   U321 : AOI221 port map( A => n115, B => x_6_0_port, C => n99, D => 
                           x_5_0_port, Q => n323);
   U322 : INV3 port map( A => n322, Q => n590);
   U323 : AOI221 port map( A => n118, B => x_6_1_port, C => n99, D => 
                           x_5_1_port, Q => n322);
   U324 : INV3 port map( A => n321, Q => n591);
   U325 : AOI221 port map( A => n120, B => x_6_2_port, C => n99, D => 
                           x_5_2_port, Q => n321);
   U326 : INV3 port map( A => n320, Q => n592);
   U327 : AOI221 port map( A => n115, B => x_6_3_port, C => n99, D => 
                           x_5_3_port, Q => n320);
   U328 : INV3 port map( A => n319, Q => n593);
   U329 : AOI221 port map( A => n118, B => x_6_4_port, C => n99, D => 
                           x_5_4_port, Q => n319);
   U330 : INV3 port map( A => n318, Q => n594);
   U331 : AOI221 port map( A => n120, B => x_6_5_port, C => n99, D => 
                           x_5_5_port, Q => n318);
   U332 : INV3 port map( A => n317, Q => n595);
   U333 : AOI221 port map( A => n115, B => x_6_6_port, C => n99, D => 
                           x_5_6_port, Q => n317);
   U334 : INV3 port map( A => n316, Q => n596);
   U335 : AOI221 port map( A => n118, B => x_6_7_port, C => n99, D => 
                           x_5_7_port, Q => n316);
   U336 : INV3 port map( A => n315, Q => n597);
   U337 : AOI221 port map( A => n120, B => x_5_0_port, C => n99, D => 
                           x_4_0_port, Q => n315);
   U338 : INV3 port map( A => n314, Q => n598);
   U339 : AOI221 port map( A => n122, B => x_5_1_port, C => n99, D => 
                           x_4_1_port, Q => n314);
   U340 : INV3 port map( A => n313, Q => n599);
   U341 : AOI221 port map( A => n115, B => x_5_2_port, C => n98, D => 
                           x_4_2_port, Q => n313);
   U342 : INV3 port map( A => n312, Q => n600);
   U343 : AOI221 port map( A => n118, B => x_5_3_port, C => n98, D => 
                           x_4_3_port, Q => n312);
   U344 : INV3 port map( A => n311, Q => n601);
   U345 : AOI221 port map( A => n120, B => x_5_4_port, C => n98, D => 
                           x_4_4_port, Q => n311);
   U346 : INV3 port map( A => n310, Q => n602);
   U347 : AOI221 port map( A => n115, B => x_5_5_port, C => n98, D => 
                           x_4_5_port, Q => n310);
   U348 : INV3 port map( A => n309, Q => n603);
   U349 : AOI221 port map( A => n122, B => x_5_6_port, C => n98, D => 
                           x_4_6_port, Q => n309);
   U350 : INV3 port map( A => n308, Q => n604);
   U351 : AOI221 port map( A => n118, B => x_5_7_port, C => n98, D => 
                           x_4_7_port, Q => n308);
   U352 : INV3 port map( A => n307, Q => n605);
   U353 : AOI221 port map( A => n120, B => x_4_0_port, C => n98, D => 
                           x_3_0_port, Q => n307);
   U354 : INV3 port map( A => n306, Q => n606);
   U355 : AOI221 port map( A => n115, B => x_4_1_port, C => n98, D => 
                           x_3_1_port, Q => n306);
   U356 : INV3 port map( A => n305, Q => n607);
   U357 : AOI221 port map( A => n122, B => x_4_2_port, C => n98, D => 
                           x_3_2_port, Q => n305);
   U358 : INV3 port map( A => n304, Q => n608);
   U359 : AOI221 port map( A => n118, B => x_4_3_port, C => n98, D => 
                           x_3_3_port, Q => n304);
   U360 : INV3 port map( A => n281, Q => n631);
   U361 : AOI221 port map( A => n118, B => x_1_2_port, C => n96, D => 
                           x_0_2_port, Q => n281);
   U362 : INV3 port map( A => n280, Q => n632);
   U363 : AOI221 port map( A => n120, B => x_1_3_port, C => n96, D => 
                           x_0_3_port, Q => n280);
   U364 : INV3 port map( A => n279, Q => n633);
   U365 : AOI221 port map( A => n115, B => x_1_4_port, C => n96, D => 
                           x_0_4_port, Q => n279);
   U366 : INV3 port map( A => n278, Q => n634);
   U367 : AOI221 port map( A => n115, B => x_1_5_port, C => n96, D => 
                           x_0_5_port, Q => n278);
   U368 : INV3 port map( A => n277, Q => n635);
   U369 : AOI221 port map( A => n118, B => x_1_6_port, C => n96, D => 
                           x_0_6_port, Q => n277);
   U370 : INV3 port map( A => n276, Q => n636);
   U371 : AOI221 port map( A => n120, B => x_1_7_port, C => n96, D => 
                           x_0_7_port, Q => n276);
   U372 : INV3 port map( A => n513, Q => n125);
   U373 : AOI221 port map( A => n119, B => x_30_2_port, C => n102, D => 
                           x_29_2_port, Q => n513);
   U374 : INV3 port map( A => n497, Q => n141);
   U375 : AOI221 port map( A => n117, B => x_28_2_port, C => n110, D => 
                           x_27_2_port, Q => n497);
   U376 : INV3 port map( A => n496, Q => n142);
   U377 : AOI221 port map( A => n117, B => x_28_3_port, C => n110, D => 
                           x_27_3_port, Q => n496);
   U378 : INV3 port map( A => n495, Q => n143);
   U379 : AOI221 port map( A => n117, B => x_28_4_port, C => n110, D => 
                           x_27_4_port, Q => n495);
   U380 : INV3 port map( A => n494, Q => n144);
   U381 : AOI221 port map( A => n117, B => x_28_5_port, C => n110, D => 
                           x_27_5_port, Q => n494);
   U382 : INV3 port map( A => n493, Q => n145);
   U383 : AOI221 port map( A => n117, B => x_28_6_port, C => n110, D => 
                           x_27_6_port, Q => n493);
   U384 : INV3 port map( A => n492, Q => n146);
   U385 : AOI221 port map( A => n117, B => x_28_7_port, C => n110, D => 
                           x_27_7_port, Q => n492);
   U386 : INV3 port map( A => n491, Q => n147);
   U387 : AOI221 port map( A => n117, B => x_27_0_port, C => n110, D => 
                           x_26_0_port, Q => n491);
   U388 : INV3 port map( A => n490, Q => n148);
   U389 : AOI221 port map( A => n117, B => x_27_1_port, C => n110, D => 
                           x_26_1_port, Q => n490);
   U390 : INV3 port map( A => n489, Q => n149);
   U391 : AOI221 port map( A => n117, B => x_27_2_port, C => n109, D => 
                           x_26_2_port, Q => n489);
   U392 : INV3 port map( A => n488, Q => n150);
   U393 : AOI221 port map( A => n117, B => x_27_3_port, C => n109, D => 
                           x_26_3_port, Q => n488);
   U394 : INV3 port map( A => n487, Q => n151);
   U395 : AOI221 port map( A => n117, B => x_27_4_port, C => n109, D => 
                           x_26_4_port, Q => n487);
   U396 : INV3 port map( A => n486, Q => n152);
   U397 : AOI221 port map( A => n117, B => x_27_5_port, C => n109, D => 
                           x_26_5_port, Q => n486);
   U398 : INV3 port map( A => n485, Q => n153);
   U399 : AOI221 port map( A => n117, B => x_27_6_port, C => n109, D => 
                           x_26_6_port, Q => n485);
   U400 : INV3 port map( A => n484, Q => n154);
   U401 : AOI221 port map( A => n117, B => x_27_7_port, C => n109, D => 
                           x_26_7_port, Q => n484);
   U402 : INV3 port map( A => n483, Q => n155);
   U403 : AOI221 port map( A => n117, B => x_26_0_port, C => n109, D => 
                           x_25_0_port, Q => n483);
   U404 : INV3 port map( A => n482, Q => n156);
   U405 : AOI221 port map( A => n117, B => x_26_1_port, C => n109, D => 
                           x_25_1_port, Q => n482);
   U406 : INV3 port map( A => n481, Q => n157);
   U407 : AOI221 port map( A => n117, B => x_26_2_port, C => n109, D => 
                           x_25_2_port, Q => n481);
   U408 : INV3 port map( A => n480, Q => n158);
   U409 : AOI221 port map( A => n117, B => x_26_3_port, C => n109, D => 
                           x_25_3_port, Q => n480);
   U410 : INV3 port map( A => n479, Q => n159);
   U411 : AOI221 port map( A => n117, B => x_26_4_port, C => n109, D => 
                           x_25_4_port, Q => n479);
   U412 : INV3 port map( A => n478, Q => n160);
   U413 : AOI221 port map( A => n117, B => x_26_5_port, C => n109, D => 
                           x_25_5_port, Q => n478);
   U414 : INV3 port map( A => n477, Q => n161);
   U415 : AOI221 port map( A => n117, B => x_26_6_port, C => n109, D => 
                           x_25_6_port, Q => n477);
   U416 : INV3 port map( A => n476, Q => n162);
   U417 : AOI221 port map( A => n117, B => x_26_7_port, C => n109, D => 
                           x_25_7_port, Q => n476);
   U418 : INV3 port map( A => n453, Q => n185);
   U419 : AOI221 port map( A => n119, B => x_23_6_port, C => n107, D => 
                           x_22_6_port, Q => n453);
   U420 : INV3 port map( A => n452, Q => n186);
   U421 : AOI221 port map( A => n119, B => x_23_7_port, C => n107, D => 
                           x_22_7_port, Q => n452);
   U422 : INV3 port map( A => n451, Q => n187);
   U423 : AOI221 port map( A => n119, B => x_22_0_port, C => n107, D => 
                           x_21_0_port, Q => n451);
   U424 : INV3 port map( A => n450, Q => n188);
   U425 : AOI221 port map( A => n119, B => x_22_1_port, C => n107, D => 
                           x_21_1_port, Q => n450);
   U426 : INV3 port map( A => n449, Q => n189);
   U427 : AOI221 port map( A => n119, B => x_22_2_port, C => n107, D => 
                           x_21_2_port, Q => n449);
   U428 : INV3 port map( A => n448, Q => n190);
   U429 : AOI221 port map( A => n119, B => x_22_3_port, C => n107, D => 
                           x_21_3_port, Q => n448);
   U430 : INV3 port map( A => n447, Q => n191);
   U431 : AOI221 port map( A => n119, B => x_22_4_port, C => n107, D => 
                           x_21_4_port, Q => n447);
   U432 : INV3 port map( A => n446, Q => n192);
   U433 : AOI221 port map( A => n119, B => x_22_5_port, C => n107, D => 
                           x_21_5_port, Q => n446);
   U434 : INV3 port map( A => n445, Q => n193);
   U435 : AOI221 port map( A => n119, B => x_22_6_port, C => n107, D => 
                           x_21_6_port, Q => n445);
   U436 : INV3 port map( A => n444, Q => n194);
   U437 : AOI221 port map( A => n119, B => x_22_7_port, C => n107, D => 
                           x_21_7_port, Q => n444);
   U438 : INV3 port map( A => n443, Q => n195);
   U439 : AOI221 port map( A => n119, B => x_21_0_port, C => n107, D => 
                           x_20_0_port, Q => n443);
   U440 : INV3 port map( A => n442, Q => n196);
   U441 : AOI221 port map( A => n119, B => x_21_1_port, C => n107, D => 
                           x_20_1_port, Q => n442);
   U442 : INV3 port map( A => n441, Q => n197);
   U443 : AOI221 port map( A => n119, B => x_21_2_port, C => n106, D => 
                           x_20_2_port, Q => n441);
   U444 : INV3 port map( A => n440, Q => n198);
   U445 : AOI221 port map( A => n119, B => x_21_3_port, C => n106, D => 
                           x_20_3_port, Q => n440);
   U446 : INV3 port map( A => n439, Q => n199);
   U447 : AOI221 port map( A => n119, B => x_21_4_port, C => n106, D => 
                           x_20_4_port, Q => n439);
   U448 : INV3 port map( A => n438, Q => n200);
   U449 : AOI221 port map( A => n119, B => x_21_5_port, C => n106, D => 
                           x_20_5_port, Q => n438);
   U450 : INV3 port map( A => n437, Q => n201);
   U451 : AOI221 port map( A => n119, B => x_21_6_port, C => n106, D => 
                           x_20_6_port, Q => n437);
   U452 : INV3 port map( A => n436, Q => n202);
   U453 : AOI221 port map( A => n119, B => x_21_7_port, C => n106, D => 
                           x_20_7_port, Q => n436);
   U454 : INV3 port map( A => n435, Q => n203);
   U455 : AOI221 port map( A => n119, B => x_20_0_port, C => n106, D => 
                           x_19_0_port, Q => n435);
   U456 : INV3 port map( A => n434, Q => n204);
   U457 : AOI221 port map( A => n119, B => x_20_1_port, C => n106, D => 
                           x_19_1_port, Q => n434);
   U458 : INV3 port map( A => n433, Q => n205);
   U459 : AOI221 port map( A => n119, B => x_20_2_port, C => n106, D => 
                           x_19_2_port, Q => n433);
   U460 : INV3 port map( A => n410, Q => n228);
   U461 : AOI221 port map( A => n121, B => x_17_1_port, C => n105, D => 
                           x_16_1_port, Q => n410);
   U462 : INV3 port map( A => n409, Q => n229);
   U463 : AOI221 port map( A => n121, B => x_17_2_port, C => n104, D => 
                           x_16_2_port, Q => n409);
   U464 : INV3 port map( A => n408, Q => n230);
   U465 : AOI221 port map( A => n121, B => x_17_3_port, C => n104, D => 
                           x_16_3_port, Q => n408);
   U466 : INV3 port map( A => n407, Q => n231);
   U467 : AOI221 port map( A => n121, B => x_17_4_port, C => n104, D => 
                           x_16_4_port, Q => n407);
   U468 : INV3 port map( A => n406, Q => n232);
   U469 : AOI221 port map( A => n121, B => x_17_5_port, C => n104, D => 
                           x_16_5_port, Q => n406);
   U470 : INV3 port map( A => n405, Q => n233);
   U471 : AOI221 port map( A => n121, B => x_17_6_port, C => n104, D => 
                           x_16_6_port, Q => n405);
   U472 : INV3 port map( A => n404, Q => n234);
   U473 : AOI221 port map( A => n121, B => x_17_7_port, C => n104, D => 
                           x_16_7_port, Q => n404);
   U474 : INV3 port map( A => n403, Q => n235);
   U475 : AOI221 port map( A => n121, B => x_16_0_port, C => n104, D => 
                           x_15_0_port, Q => n403);
   U476 : INV3 port map( A => n402, Q => n236);
   U477 : AOI221 port map( A => n121, B => x_16_1_port, C => n104, D => 
                           x_15_1_port, Q => n402);
   U478 : INV3 port map( A => n401, Q => n237);
   U479 : AOI221 port map( A => n121, B => x_16_2_port, C => n104, D => 
                           x_15_2_port, Q => n401);
   U480 : INV3 port map( A => n400, Q => n238);
   U481 : AOI221 port map( A => n121, B => x_16_3_port, C => n104, D => 
                           x_15_3_port, Q => n400);
   U482 : INV3 port map( A => n399, Q => n239);
   U483 : AOI221 port map( A => n121, B => x_16_4_port, C => n104, D => 
                           x_15_4_port, Q => n399);
   U484 : INV3 port map( A => n398, Q => n240);
   U485 : AOI221 port map( A => n121, B => x_16_5_port, C => n104, D => 
                           x_15_5_port, Q => n398);
   U486 : INV3 port map( A => n397, Q => n241);
   U487 : AOI221 port map( A => n121, B => x_16_6_port, C => n104, D => 
                           x_15_6_port, Q => n397);
   U488 : INV3 port map( A => n396, Q => n242);
   U489 : AOI221 port map( A => n121, B => x_16_7_port, C => n104, D => 
                           x_15_7_port, Q => n396);
   U490 : INV3 port map( A => n395, Q => n243);
   U491 : AOI221 port map( A => n121, B => x_15_0_port, C => n104, D => 
                           x_14_0_port, Q => n395);
   U492 : INV3 port map( A => n394, Q => n244);
   U493 : AOI221 port map( A => n121, B => x_15_1_port, C => n104, D => 
                           x_14_1_port, Q => n394);
   U494 : INV3 port map( A => n393, Q => n245);
   U495 : AOI221 port map( A => n121, B => x_15_2_port, C => n103, D => 
                           x_14_2_port, Q => n393);
   U496 : INV3 port map( A => n392, Q => n246);
   U497 : AOI221 port map( A => n121, B => x_15_3_port, C => n103, D => 
                           x_14_3_port, Q => n392);
   U498 : INV3 port map( A => n391, Q => n247);
   U499 : AOI221 port map( A => n121, B => x_15_4_port, C => n103, D => 
                           x_14_4_port, Q => n391);
   U500 : INV3 port map( A => n390, Q => n248);
   U501 : AOI221 port map( A => n121, B => x_15_5_port, C => n103, D => 
                           x_14_5_port, Q => n390);
   U502 : INV3 port map( A => n389, Q => n257);
   U503 : AOI221 port map( A => n121, B => x_15_6_port, C => n103, D => 
                           x_14_6_port, Q => n389);
   U504 : INV3 port map( A => n386, Q => n526);
   U505 : AOI221 port map( A => n122, B => x_14_1_port, C => n103, D => 
                           x_13_1_port, Q => n386);
   U506 : INV3 port map( A => n349, Q => n563);
   U507 : AOI221 port map( A => n95, B => x_10_6_port, C => n101, D => 
                           x_9_6_port, Q => n349);
   U508 : INV3 port map( A => n346, Q => n566);
   U509 : AOI221 port map( A => n95, B => x_9_1_port, C => n101, D => 
                           x_8_1_port, Q => n346);
   U510 : INV3 port map( A => n345, Q => n567);
   U511 : AOI221 port map( A => n259, B => x_9_2_port, C => n100, D => 
                           x_8_2_port, Q => n345);
   U512 : INV3 port map( A => n344, Q => n568);
   U513 : AOI221 port map( A => n259, B => x_9_3_port, C => n100, D => 
                           x_8_3_port, Q => n344);
   U514 : INV3 port map( A => n343, Q => n569);
   U515 : AOI221 port map( A => n259, B => x_9_4_port, C => n100, D => 
                           x_8_4_port, Q => n343);
   U516 : INV3 port map( A => n342, Q => n570);
   U517 : AOI221 port map( A => n259, B => x_9_5_port, C => n100, D => 
                           x_8_5_port, Q => n342);
   U518 : INV3 port map( A => n341, Q => n571);
   U519 : AOI221 port map( A => n259, B => x_9_6_port, C => n100, D => 
                           x_8_6_port, Q => n341);
   U520 : INV3 port map( A => n340, Q => n572);
   U521 : AOI221 port map( A => n259, B => x_9_7_port, C => n100, D => 
                           x_8_7_port, Q => n340);
   U522 : INV3 port map( A => n339, Q => n573);
   U523 : AOI221 port map( A => n259, B => x_8_0_port, C => n100, D => 
                           x_7_0_port, Q => n339);
   U524 : INV3 port map( A => n338, Q => n574);
   U525 : AOI221 port map( A => n259, B => x_8_1_port, C => n100, D => 
                           x_7_1_port, Q => n338);
   U526 : INV3 port map( A => n337, Q => n575);
   U527 : AOI221 port map( A => n259, B => x_8_2_port, C => n100, D => 
                           x_7_2_port, Q => n337);
   U528 : INV3 port map( A => n336, Q => n576);
   U529 : AOI221 port map( A => n259, B => x_8_3_port, C => n100, D => 
                           x_7_3_port, Q => n336);
   U530 : INV3 port map( A => n335, Q => n577);
   U531 : AOI221 port map( A => n259, B => x_8_4_port, C => n100, D => 
                           x_7_4_port, Q => n335);
   U532 : INV3 port map( A => n334, Q => n578);
   U533 : AOI221 port map( A => n259, B => x_8_5_port, C => n100, D => 
                           x_7_5_port, Q => n334);
   U534 : INV3 port map( A => n333, Q => n579);
   U535 : AOI221 port map( A => n259, B => x_8_6_port, C => n100, D => 
                           x_7_6_port, Q => n333);
   U536 : INV3 port map( A => n332, Q => n580);
   U537 : AOI221 port map( A => n259, B => x_8_7_port, C => n100, D => 
                           x_7_7_port, Q => n332);
   U538 : INV3 port map( A => n331, Q => n581);
   U539 : AOI221 port map( A => n259, B => x_7_0_port, C => n100, D => 
                           x_6_0_port, Q => n331);
   U540 : INV3 port map( A => n330, Q => n582);
   U541 : AOI221 port map( A => n259, B => x_7_1_port, C => n100, D => 
                           x_6_1_port, Q => n330);
   U542 : INV3 port map( A => n329, Q => n583);
   U543 : AOI221 port map( A => n259, B => x_7_2_port, C => n99, D => 
                           x_6_2_port, Q => n329);
   U544 : INV3 port map( A => n328, Q => n584);
   U545 : AOI221 port map( A => n95, B => x_7_3_port, C => n99, D => x_6_3_port
                           , Q => n328);
   U546 : INV3 port map( A => n327, Q => n585);
   U547 : AOI221 port map( A => n95, B => x_7_4_port, C => n99, D => x_6_4_port
                           , Q => n327);
   U548 : INV3 port map( A => n303, Q => n609);
   U549 : AOI221 port map( A => n116, B => x_4_4_port, C => n98, D => 
                           x_3_4_port, Q => n303);
   U550 : INV3 port map( A => n302, Q => n610);
   U551 : AOI221 port map( A => n116, B => x_4_5_port, C => n98, D => 
                           x_3_5_port, Q => n302);
   U552 : INV3 port map( A => n301, Q => n611);
   U553 : AOI221 port map( A => n116, B => x_4_6_port, C => n98, D => 
                           x_3_6_port, Q => n301);
   U554 : INV3 port map( A => n300, Q => n612);
   U555 : AOI221 port map( A => n116, B => x_4_7_port, C => n98, D => 
                           x_3_7_port, Q => n300);
   U556 : INV3 port map( A => n299, Q => n613);
   U557 : AOI221 port map( A => n116, B => x_3_0_port, C => n98, D => 
                           x_2_0_port, Q => n299);
   U558 : INV3 port map( A => n298, Q => n614);
   U559 : AOI221 port map( A => n116, B => x_3_1_port, C => n98, D => 
                           x_2_1_port, Q => n298);
   U560 : INV3 port map( A => n297, Q => n615);
   U561 : AOI221 port map( A => n116, B => x_3_2_port, C => n97, D => 
                           x_2_2_port, Q => n297);
   U562 : INV3 port map( A => n296, Q => n616);
   U563 : AOI221 port map( A => n116, B => x_3_3_port, C => n97, D => 
                           x_2_3_port, Q => n296);
   U564 : INV3 port map( A => n295, Q => n617);
   U565 : AOI221 port map( A => n116, B => x_3_4_port, C => n97, D => 
                           x_2_4_port, Q => n295);
   U566 : INV3 port map( A => n294, Q => n618);
   U567 : AOI221 port map( A => n116, B => x_3_5_port, C => n97, D => 
                           x_2_5_port, Q => n294);
   U568 : INV3 port map( A => n293, Q => n619);
   U569 : AOI221 port map( A => n116, B => x_3_6_port, C => n97, D => 
                           x_2_6_port, Q => n293);
   U570 : INV3 port map( A => n292, Q => n620);
   U571 : AOI221 port map( A => n116, B => x_3_7_port, C => n97, D => 
                           x_2_7_port, Q => n292);
   U572 : INV3 port map( A => n291, Q => n621);
   U573 : AOI221 port map( A => n116, B => x_2_0_port, C => n97, D => 
                           x_1_0_port, Q => n291);
   U574 : INV3 port map( A => n290, Q => n622);
   U575 : AOI221 port map( A => n116, B => x_2_1_port, C => n97, D => 
                           x_1_1_port, Q => n290);
   U576 : INV3 port map( A => n289, Q => n623);
   U577 : AOI221 port map( A => n116, B => x_2_2_port, C => n97, D => 
                           x_1_2_port, Q => n289);
   U578 : INV3 port map( A => n288, Q => n624);
   U579 : AOI221 port map( A => n116, B => x_2_3_port, C => n97, D => 
                           x_1_3_port, Q => n288);
   U580 : INV3 port map( A => n287, Q => n625);
   U581 : AOI221 port map( A => n116, B => x_2_4_port, C => n97, D => 
                           x_1_4_port, Q => n287);
   U582 : INV3 port map( A => n286, Q => n626);
   U583 : AOI221 port map( A => n116, B => x_2_5_port, C => n97, D => 
                           x_1_5_port, Q => n286);
   U584 : INV3 port map( A => n285, Q => n627);
   U585 : AOI221 port map( A => n116, B => x_2_6_port, C => n97, D => 
                           x_1_6_port, Q => n285);
   U586 : INV3 port map( A => n284, Q => n628);
   U587 : AOI221 port map( A => n116, B => x_2_7_port, C => n97, D => 
                           x_1_7_port, Q => n284);
   U588 : INV3 port map( A => n283, Q => n629);
   U589 : AOI221 port map( A => n116, B => x_1_0_port, C => n97, D => 
                           x_0_0_port, Q => n283);
   U590 : INV3 port map( A => n282, Q => n630);
   U591 : AOI221 port map( A => n116, B => x_1_1_port, C => n97, D => 
                           x_0_1_port, Q => n282);
   U592 : INV3 port map( A => n514, Q => n124);
   U593 : AOI221 port map( A => n116, B => x_30_1_port, C => n110, D => 
                           x_29_1_port, Q => n514);
   U594 : INV3 port map( A => n385, Q => n527);
   U595 : AOI221 port map( A => n122, B => x_14_2_port, C => n103, D => 
                           x_13_2_port, Q => n385);
   U596 : INV3 port map( A => n384, Q => n528);
   U597 : AOI221 port map( A => n120, B => x_14_3_port, C => n103, D => 
                           x_13_3_port, Q => n384);
   U598 : INV3 port map( A => n383, Q => n529);
   U599 : AOI221 port map( A => n122, B => x_14_4_port, C => n103, D => 
                           x_13_4_port, Q => n383);
   U600 : INV3 port map( A => n382, Q => n530);
   U601 : AOI221 port map( A => n122, B => x_14_5_port, C => n103, D => 
                           x_13_5_port, Q => n382);
   U602 : INV3 port map( A => n381, Q => n531);
   U603 : AOI221 port map( A => n122, B => x_14_6_port, C => n103, D => 
                           x_13_6_port, Q => n381);
   U604 : INV3 port map( A => n380, Q => n532);
   U605 : AOI221 port map( A => n122, B => x_14_7_port, C => n103, D => 
                           x_13_7_port, Q => n380);
   U606 : INV3 port map( A => n379, Q => n533);
   U607 : AOI221 port map( A => n122, B => x_13_0_port, C => n103, D => 
                           x_12_0_port, Q => n379);
   U608 : INV3 port map( A => n378, Q => n534);
   U609 : AOI221 port map( A => n122, B => x_13_1_port, C => n103, D => 
                           x_12_1_port, Q => n378);
   U610 : INV3 port map( A => n377, Q => n535);
   U611 : AOI221 port map( A => n122, B => x_13_2_port, C => n102, D => 
                           x_12_2_port, Q => n377);
   U612 : INV3 port map( A => n376, Q => n536);
   U613 : AOI221 port map( A => n122, B => x_13_3_port, C => n102, D => 
                           x_12_3_port, Q => n376);
   U614 : INV3 port map( A => n375, Q => n537);
   U615 : AOI221 port map( A => n122, B => x_13_4_port, C => n102, D => 
                           x_12_4_port, Q => n375);
   U616 : INV3 port map( A => n374, Q => n538);
   U617 : AOI221 port map( A => n122, B => x_13_5_port, C => n102, D => 
                           x_12_5_port, Q => n374);
   U618 : INV3 port map( A => n372, Q => n540);
   U619 : AOI221 port map( A => n122, B => x_13_7_port, C => n102, D => 
                           x_12_7_port, Q => n372);
   U620 : INV3 port map( A => n371, Q => n541);
   U621 : AOI221 port map( A => n122, B => x_12_0_port, C => n102, D => 
                           x_11_0_port, Q => n371);
   U622 : INV3 port map( A => n370, Q => n542);
   U623 : AOI221 port map( A => n122, B => x_12_1_port, C => n102, D => 
                           x_11_1_port, Q => n370);
   U624 : INV3 port map( A => n369, Q => n543);
   U625 : AOI221 port map( A => n122, B => x_12_2_port, C => n102, D => 
                           x_11_2_port, Q => n369);
   U626 : INV3 port map( A => n515, Q => n123);
   U627 : AOI221 port map( A => x_30_0_port, B => n114, C => n109, D => 
                           x_29_0_port, Q => n515);
   U628 : INV3 port map( A => n275, Q => n637);
   U629 : AOI221 port map( A => Delay_Line_in(0), B => n96, C => x_0_0_port, D 
                           => n117, Q => n275);
   U630 : INV3 port map( A => n274, Q => n638);
   U631 : AOI221 port map( A => Delay_Line_in(1), B => n96, C => x_0_1_port, D 
                           => n114, Q => n274);
   U632 : INV3 port map( A => n273, Q => n639);
   U633 : AOI221 port map( A => Delay_Line_in(2), B => n96, C => x_0_2_port, D 
                           => n119, Q => n273);
   U634 : INV3 port map( A => n272, Q => n640);
   U635 : AOI221 port map( A => Delay_Line_in(3), B => n96, C => x_0_3_port, D 
                           => n121, Q => n272);
   U636 : INV3 port map( A => n271, Q => n641);
   U637 : AOI221 port map( A => Delay_Line_in(4), B => n96, C => x_0_4_port, D 
                           => n114, Q => n271);
   U638 : INV3 port map( A => n270, Q => n642);
   U639 : AOI221 port map( A => Delay_Line_in(5), B => n96, C => x_0_5_port, D 
                           => n116, Q => n270);
   U640 : INV3 port map( A => n269, Q => n643);
   U641 : AOI221 port map( A => Delay_Line_in(6), B => n96, C => x_0_6_port, D 
                           => n114, Q => n269);
   U642 : INV3 port map( A => n268, Q => n644);
   U643 : AOI221 port map( A => Delay_Line_in(7), B => n96, C => x_0_7_port, D 
                           => n114, Q => n268);
   U644 : NAND22 port map( A => x_31_0_port, B => n114, Q => n258);
   U645 : NAND22 port map( A => x_31_1_port, B => n114, Q => n260);
   U646 : NAND22 port map( A => x_31_2_port, B => n114, Q => n261);

end SYN_A;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_FILTER.all;

entity FILTER is

   port( CLK, RESET : in std_logic;  Filter_In : in std_logic_vector (7 downto 
         0);  Filter_Out : out std_logic_vector (7 downto 0);  ADC_eoc : in 
         std_logic;  ADC_convst, ADC_rd, ADC_cs, DAC_wr, DAC_cs, DAC_ldac, 
         DAC_clr : out std_logic;  uC_address : in std_logic_vector (4 downto 
         0);  uC_data_in : in std_logic_vector (7 downto 0);  uC_wb, uC_enable 
         : in std_logic);

end FILTER;

architecture SYN_A of FILTER is

   component LOGIC0
      port( Q : out std_logic);
   end component;
   
   component LOGIC1
      port( Q : out std_logic);
   end component;
   
   component INV3
      port( A : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND22
      port( A, B : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI221
      port( A, B, C, D : in std_logic;  Q : out std_logic);
   end component;
   
   component fsm
      port( CLK, RESET, ADC_eoc : in std_logic;  ADC_convst, ADC_rd, ADC_cs, 
            DAC_wr, DAC_cs, DAC_ldac, DAC_clr : out std_logic;  Ram_Address, 
            Delay_Line_Address : out std_logic_vector (4 downto 0);  
            Delay_Line_sample_shift, Accu_ctrl, Buff_OE : out std_logic);
   end component;
   
   component BUFF
      port( CLK, RESET, Buff_OE : in std_logic;  Buff_in : in std_logic_vector 
            (7 downto 0);  Buff_out : out std_logic_vector (7 downto 0));
   end component;
   
   component ACCU
      port( CLK, RESET : in std_logic;  Accu_in : in std_logic_vector (15 
            downto 0);  Accu_ctrl : in std_logic;  Accu_out : out 
            std_logic_vector (20 downto 0));
   end component;
   
   component MULT
      port( Mult_in_A, Mult_in_B : in std_logic_vector (7 downto 0);  Mult_out 
            : out std_logic_vector (15 downto 0));
   end component;
   
   component coeff_ram
      port( CLK, RESET : in std_logic;  data_in : in std_logic_vector (7 downto
            0);  data_out : out std_logic_vector (7 downto 0);  address : in 
            std_logic_vector (4 downto 0);  wb : in std_logic);
   end component;
   
   component DELAY_LINE
      port( RESET, CLK : in std_logic;  Delay_Line_in : in std_logic_vector (7 
            downto 0);  Delay_Line_address : in std_logic_vector (4 downto 0); 
            Delay_Line_sample_shift : in std_logic;  Delay_Line_out : out 
            std_logic_vector (7 downto 0));
   end component;
   
   signal Delay_Line_Address_4_port, Delay_Line_Address_3_port, 
      Delay_Line_Address_2_port, Delay_Line_Address_1_port, 
      Delay_Line_Address_0_port, Delay_Line_sample_shift, Delay_Line_out_7_port
      , Delay_Line_out_6_port, Delay_Line_out_5_port, Delay_Line_out_4_port, 
      Delay_Line_out_3_port, Delay_Line_out_2_port, Delay_Line_out_1_port, 
      Delay_Line_out_0_port, FSM_Address_4_port, FSM_Address_3_port, 
      FSM_Address_2_port, FSM_Address_1_port, FSM_Address_0_port, 
      RAM_data_out_7_port, RAM_data_out_6_port, RAM_data_out_5_port, 
      RAM_data_out_4_port, RAM_data_out_3_port, RAM_data_out_2_port, 
      RAM_data_out_1_port, RAM_data_out_0_port, Mult_out_15_port, 
      Mult_out_14_port, Mult_out_13_port, Mult_out_12_port, Mult_out_11_port, 
      Mult_out_10_port, Mult_out_9_port, Mult_out_8_port, Mult_out_7_port, 
      Mult_out_6_port, Mult_out_5_port, Mult_out_4_port, Mult_out_3_port, 
      Mult_out_2_port, Mult_out_1_port, Mult_out_0_port, Accu_ctrl, 
      Accu_out_16_port, Accu_out_15_port, Accu_out_14_port, Accu_out_13_port, 
      Accu_out_12_port, Accu_out_11_port, Accu_out_10_port, Accu_out_9_port, 
      FSM_Buff_OE, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, 
      n20, n_1562, n_1563, n_1564, n_1565, n_1566, n_1567, n_1568, n_1569, 
      n_1570, n_1571, n_1572, n_1573, n_1574, n_1575, n_1576 : std_logic;

begin
   
   U1 : DELAY_LINE port map( RESET => RESET, CLK => CLK, Delay_Line_in(7) => 
                           Filter_In(7), Delay_Line_in(6) => Filter_In(6), 
                           Delay_Line_in(5) => Filter_In(5), Delay_Line_in(4) 
                           => Filter_In(4), Delay_Line_in(3) => Filter_In(3), 
                           Delay_Line_in(2) => Filter_In(2), Delay_Line_in(1) 
                           => Filter_In(1), Delay_Line_in(0) => Filter_In(0), 
                           Delay_Line_address(4) => Delay_Line_Address_4_port, 
                           Delay_Line_address(3) => Delay_Line_Address_3_port, 
                           Delay_Line_address(2) => Delay_Line_Address_2_port, 
                           Delay_Line_address(1) => Delay_Line_Address_1_port, 
                           Delay_Line_address(0) => Delay_Line_Address_0_port, 
                           Delay_Line_sample_shift => Delay_Line_sample_shift, 
                           Delay_Line_out(7) => Delay_Line_out_7_port, 
                           Delay_Line_out(6) => Delay_Line_out_6_port, 
                           Delay_Line_out(5) => Delay_Line_out_5_port, 
                           Delay_Line_out(4) => Delay_Line_out_4_port, 
                           Delay_Line_out(3) => Delay_Line_out_3_port, 
                           Delay_Line_out(2) => Delay_Line_out_2_port, 
                           Delay_Line_out(1) => Delay_Line_out_1_port, 
                           Delay_Line_out(0) => Delay_Line_out_0_port);
   U2 : coeff_ram port map( CLK => CLK, RESET => RESET, data_in(7) => 
                           uC_data_in(7), data_in(6) => uC_data_in(6), 
                           data_in(5) => uC_data_in(5), data_in(4) => 
                           uC_data_in(4), data_in(3) => uC_data_in(3), 
                           data_in(2) => uC_data_in(2), data_in(1) => 
                           uC_data_in(1), data_in(0) => uC_data_in(0), 
                           data_out(7) => RAM_data_out_7_port, data_out(6) => 
                           RAM_data_out_6_port, data_out(5) => 
                           RAM_data_out_5_port, data_out(4) => 
                           RAM_data_out_4_port, data_out(3) => 
                           RAM_data_out_3_port, data_out(2) => 
                           RAM_data_out_2_port, data_out(1) => 
                           RAM_data_out_1_port, data_out(0) => 
                           RAM_data_out_0_port, address(4) => n19, address(3) 
                           => n18, address(2) => n17, address(1) => n16, 
                           address(0) => n15, wb => uC_wb);
   U3 : MULT port map( Mult_in_A(7) => Delay_Line_out_7_port, Mult_in_A(6) => 
                           Delay_Line_out_6_port, Mult_in_A(5) => 
                           Delay_Line_out_5_port, Mult_in_A(4) => 
                           Delay_Line_out_4_port, Mult_in_A(3) => 
                           Delay_Line_out_3_port, Mult_in_A(2) => 
                           Delay_Line_out_2_port, Mult_in_A(1) => 
                           Delay_Line_out_1_port, Mult_in_A(0) => 
                           Delay_Line_out_0_port, Mult_in_B(7) => 
                           RAM_data_out_7_port, Mult_in_B(6) => 
                           RAM_data_out_6_port, Mult_in_B(5) => 
                           RAM_data_out_5_port, Mult_in_B(4) => 
                           RAM_data_out_4_port, Mult_in_B(3) => 
                           RAM_data_out_3_port, Mult_in_B(2) => 
                           RAM_data_out_2_port, Mult_in_B(1) => 
                           RAM_data_out_1_port, Mult_in_B(0) => 
                           RAM_data_out_0_port, Mult_out(15) => 
                           Mult_out_15_port, Mult_out(14) => Mult_out_14_port, 
                           Mult_out(13) => Mult_out_13_port, Mult_out(12) => 
                           Mult_out_12_port, Mult_out(11) => Mult_out_11_port, 
                           Mult_out(10) => Mult_out_10_port, Mult_out(9) => 
                           Mult_out_9_port, Mult_out(8) => Mult_out_8_port, 
                           Mult_out(7) => Mult_out_7_port, Mult_out(6) => 
                           Mult_out_6_port, Mult_out(5) => Mult_out_5_port, 
                           Mult_out(4) => Mult_out_4_port, Mult_out(3) => 
                           Mult_out_3_port, Mult_out(2) => Mult_out_2_port, 
                           Mult_out(1) => Mult_out_1_port, Mult_out(0) => 
                           Mult_out_0_port);
   U4 : ACCU port map( CLK => CLK, RESET => RESET, Accu_in(15) => 
                           Mult_out_15_port, Accu_in(14) => Mult_out_14_port, 
                           Accu_in(13) => Mult_out_13_port, Accu_in(12) => 
                           Mult_out_12_port, Accu_in(11) => Mult_out_11_port, 
                           Accu_in(10) => Mult_out_10_port, Accu_in(9) => 
                           Mult_out_9_port, Accu_in(8) => Mult_out_8_port, 
                           Accu_in(7) => Mult_out_7_port, Accu_in(6) => 
                           Mult_out_6_port, Accu_in(5) => Mult_out_5_port, 
                           Accu_in(4) => Mult_out_4_port, Accu_in(3) => 
                           Mult_out_3_port, Accu_in(2) => Mult_out_2_port, 
                           Accu_in(1) => Mult_out_1_port, Accu_in(0) => 
                           Mult_out_0_port, Accu_ctrl => Accu_ctrl, 
                           Accu_out(20) => n_1562, Accu_out(19) => n_1563, 
                           Accu_out(18) => n_1564, Accu_out(17) => n_1565, 
                           Accu_out(16) => Accu_out_16_port, Accu_out(15) => 
                           Accu_out_15_port, Accu_out(14) => Accu_out_14_port, 
                           Accu_out(13) => Accu_out_13_port, Accu_out(12) => 
                           Accu_out_12_port, Accu_out(11) => Accu_out_11_port, 
                           Accu_out(10) => Accu_out_10_port, Accu_out(9) => 
                           Accu_out_9_port, Accu_out(8) => n_1566, Accu_out(7) 
                           => n_1567, Accu_out(6) => n_1568, Accu_out(5) => 
                           n_1569, Accu_out(4) => n_1570, Accu_out(3) => n_1571
                           , Accu_out(2) => n_1572, Accu_out(1) => n_1573, 
                           Accu_out(0) => n_1574);
   U5 : BUFF port map( CLK => CLK, RESET => RESET, Buff_OE => n14, Buff_in(7) 
                           => Accu_out_16_port, Buff_in(6) => Accu_out_15_port,
                           Buff_in(5) => Accu_out_14_port, Buff_in(4) => 
                           Accu_out_13_port, Buff_in(3) => Accu_out_12_port, 
                           Buff_in(2) => Accu_out_11_port, Buff_in(1) => 
                           Accu_out_10_port, Buff_in(0) => Accu_out_9_port, 
                           Buff_out(7) => Filter_Out(7), Buff_out(6) => 
                           Filter_Out(6), Buff_out(5) => Filter_Out(5), 
                           Buff_out(4) => Filter_Out(4), Buff_out(3) => 
                           Filter_Out(3), Buff_out(2) => Filter_Out(2), 
                           Buff_out(1) => Filter_Out(1), Buff_out(0) => 
                           Filter_Out(0));
   U6 : fsm port map( CLK => CLK, RESET => RESET, ADC_eoc => ADC_eoc, 
                           ADC_convst => ADC_convst, ADC_rd => ADC_rd, ADC_cs 
                           => ADC_cs, DAC_wr => DAC_wr, DAC_cs => DAC_cs, 
                           DAC_ldac => n_1575, DAC_clr => n_1576, 
                           Ram_Address(4) => FSM_Address_4_port, Ram_Address(3)
                           => FSM_Address_3_port, Ram_Address(2) => 
                           FSM_Address_2_port, Ram_Address(1) => 
                           FSM_Address_1_port, Ram_Address(0) => 
                           FSM_Address_0_port, Delay_Line_Address(4) => 
                           Delay_Line_Address_4_port, Delay_Line_Address(3) => 
                           Delay_Line_Address_3_port, Delay_Line_Address(2) => 
                           Delay_Line_Address_2_port, Delay_Line_Address(1) => 
                           Delay_Line_Address_1_port, Delay_Line_Address(0) => 
                           Delay_Line_Address_0_port, Delay_Line_sample_shift 
                           => Delay_Line_sample_shift, Accu_ctrl => Accu_ctrl, 
                           Buff_OE => FSM_Buff_OE);
   U21 : INV3 port map( A => n12, Q => n15);
   U22 : AOI221 port map( A => FSM_Address_0_port, B => uC_enable, C => 
                           uC_address(0), D => n20, Q => n12);
   U23 : INV3 port map( A => n8, Q => n19);
   U24 : AOI221 port map( A => uC_enable, B => FSM_Address_4_port, C => 
                           uC_address(4), D => n20, Q => n8);
   U25 : INV3 port map( A => n9, Q => n18);
   U26 : AOI221 port map( A => FSM_Address_3_port, B => uC_enable, C => 
                           uC_address(3), D => n20, Q => n9);
   U27 : INV3 port map( A => n10, Q => n17);
   U28 : AOI221 port map( A => FSM_Address_2_port, B => uC_enable, C => 
                           uC_address(2), D => n20, Q => n10);
   U29 : INV3 port map( A => n11, Q => n16);
   U30 : AOI221 port map( A => FSM_Address_1_port, B => uC_enable, C => 
                           uC_address(1), D => n20, Q => n11);
   U31 : INV3 port map( A => n13, Q => n14);
   U32 : NAND22 port map( A => FSM_Buff_OE, B => uC_enable, Q => n13);
   U33 : INV3 port map( A => uC_enable, Q => n20);
   U34 : LOGIC1 port map( Q => DAC_clr);
   U35 : LOGIC0 port map( Q => DAC_ldac);

end SYN_A;
