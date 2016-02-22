
module nios_system (
	reset_reset_n,
	ledr_export,
	paralleltoprocessor_export,
	clk_clk,
	parallelfromprocessor_export,
	transmitenable_export,
	charactersent_export,
	load_export,
	characterreceived_export);	

	input		reset_reset_n;
	output	[7:0]	ledr_export;
	input	[7:0]	paralleltoprocessor_export;
	input		clk_clk;
	output	[7:0]	parallelfromprocessor_export;
	output		transmitenable_export;
	output		charactersent_export;
	output		load_export;
	input		characterreceived_export;
endmodule
