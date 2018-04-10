LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY DE2_70_Character_Display IS
	PORT (
		 CLOCK_50 				 : IN STD_LOGIC; 									  -- clk
		 KEY						 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);         --reset
		 DE2_70_VGA_CLK       : out std_logic; 								  -- CLK
		 DE2_70_VGA_HS        : out std_logic;                           -- HS
		 DE2_70_VGA_VS        : out std_logic;                           -- VS
		 DE2_70_VGA_BLANK     : out std_logic;                           -- BLANK
		 DE2_70_VGA_SYNC      : out std_logic;                           -- SYNC
		 DE2_70_VGA_R         : out std_logic_vector(9 downto 0);        -- R
		 DE2_70_VGA_G         : out std_logic_vector(9 downto 0);        -- G
		 DE2_70_VGA_B         : out std_logic_vector(9 downto 0)         -- B
	
	);
	END DE2_70_Character_Display;

ARCHITECTURE Structure OF DE2_70_Character_Display IS
    component de2_70
        port (
            clk_clk       : in  std_logic;                    			  -- clk
            reset_reset_n : in  std_logic;                             -- reset_n
            vga_CLK       : out std_logic;                             -- CLK
            vga_HS        : out std_logic;                             -- HS
            vga_VS        : out std_logic;                             -- VS
            vga_BLANK     : out std_logic;                             -- BLANK
            vga_SYNC      : out std_logic;                             -- SYNC
            vga_R         : out std_logic_vector(9 downto 0);          -- R
            vga_G         : out std_logic_vector(9 downto 0);          -- G
            vga_B         : out std_logic_vector(9 downto 0)           -- B
        );
    end component;
	 
	 BEGIN
			NiosII : de2_70
				port map (
					clk_clk       => CLOCK_50,                              -- clk.clk
					reset_reset_n => KEY(0), 										  -- reset.reset_n
					vga_CLK       => DE2_70_VGA_CLK,    		       		  -- vga.CLK
					vga_HS        => DE2_70_VGA_HS,    					 		  -- .HS
					vga_VS        => DE2_70_VGA_VS,       				 		  -- .VS
					vga_BLANK     => DE2_70_VGA_BLANK,     			 		  -- .BLANK
					vga_SYNC      => DE2_70_VGA_SYNC,      			  		  -- .SYNC
					vga_R         => DE2_70_VGA_R,         			  		  -- .R
					vga_G         => DE2_70_VGA_G,                    		  -- .G
					vga_B         => DE2_70_VGA_B                           -- .B
			  );
END Structure;