	component nios_system is
		port (
			reset_reset_n                : in  std_logic                    := 'X';             -- reset_n
			ledr_export                  : out std_logic_vector(7 downto 0);                    -- export
			paralleltoprocessor_export   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			clk_clk                      : in  std_logic                    := 'X';             -- clk
			parallelfromprocessor_export : out std_logic_vector(7 downto 0);                    -- export
			transmitenable_export        : out std_logic;                                       -- export
			charactersent_export         : out std_logic;                                       -- export
			load_export                  : out std_logic;                                       -- export
			characterreceived_export     : in  std_logic                    := 'X'              -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			reset_reset_n                => CONNECTED_TO_reset_reset_n,                --                 reset.reset_n
			ledr_export                  => CONNECTED_TO_ledr_export,                  --                  ledr.export
			paralleltoprocessor_export   => CONNECTED_TO_paralleltoprocessor_export,   --   paralleltoprocessor.export
			clk_clk                      => CONNECTED_TO_clk_clk,                      --                   clk.clk
			parallelfromprocessor_export => CONNECTED_TO_parallelfromprocessor_export, -- parallelfromprocessor.export
			transmitenable_export        => CONNECTED_TO_transmitenable_export,        --        transmitenable.export
			charactersent_export         => CONNECTED_TO_charactersent_export,         --         charactersent.export
			load_export                  => CONNECTED_TO_load_export,                  --                  load.export
			characterreceived_export     => CONNECTED_TO_characterreceived_export      --     characterreceived.export
		);

