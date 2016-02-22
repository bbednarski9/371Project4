	component nios_system is
		port (
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			ledr_export   : out std_logic_vector(7 downto 0);        -- export
			clk_clk       : in  std_logic                    := 'X'  -- clk
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			ledr_export   => CONNECTED_TO_ledr_export,   --  ledr.export
			clk_clk       => CONNECTED_TO_clk_clk        --   clk.clk
		);

