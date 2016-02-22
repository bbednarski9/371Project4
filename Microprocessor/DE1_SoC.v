/*	Bryan Bednarski, Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	DE1_Soc.v

This Verilog module functions as a top level module for our ASCI character in/out program.
It connects our C program to the verilog hardware program through the microprocessor allowing
user interface.

*/

module DE1_SoC(CLOCK_50, KEY, LEDR);
	input CLOCK_50;
	input KEY[0];
	output [9:0] LEDR;
	
	// instantiate microprocessor
    nios_system u0 (
        .reset_reset_n (~KEY[0]), // reset.reset_n
        .ledr_export   (LEDR),   //  ledr.export
        .clk_clk       (CLOCK_50)        //   clk.clk
    );
	
	// instantiate receiving module
	
	// instantiate sending module
	
	
endmodule