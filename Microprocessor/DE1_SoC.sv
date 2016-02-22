// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// File name: 
//	DE1_SoC.sv
//
// Description:
//	Interfaces the NIOS II microprocessor with the sram module in SRAM.v
//
// Author:
//	Bryan Bednarski, Joanna Mazer
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

module DE1_SoC(CLOCK_50, KEY, LEDR);
	input CLOCK_50;   // 50 MHz clock
	input  [3:0] KEY; // Active Low
	output  [9:0] LEDR;

	wire ReadWrite, enable;
	wire [10:0] address;
	wire [7:0] data;
	
	assign LEDR[9:8] = 2'b00;

test u0 (
	.address_external_connection_export   (address),   //   address_external_connection.export
	.clk_clk                              (CLOCK_50),                              //                           clk.clk
	.data_external_connection_export      (data),      //      data_external_connection.export
	.enable_external_connection_export    (enable),    //    enable_external_connection.export
	.led_pio_external_connection_export   (LEDR[7:0]),   //   led_pio_external_connection.export
	.readwrite_external_connection_export (ReadWrite), // readwrite_external_connection.export
	.reset_reset_n                        (KEY[0])       //                         reset.reset_n
);

	sram s1 (data, ReadWrite, enable, address);

endmodule
