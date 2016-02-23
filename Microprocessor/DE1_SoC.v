/*	Bryan Bednarski, Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	DE1_Soc.v

This Verilog module functions as a top level module for our ASCI character in/out program.
It connects our C program to the verilog hardware program through the microprocessor allowing
user interface.

*/

`include "Tserial_buffer.v"
`include "PISO.v"
`include "TstartBit.v"
`include "TcharacterBitCount.v"

`include "Rserial_buffer.v"
`include "SIPO.v"
`include "startBit.v"
`include "characterBitCount.v"

module DE1_SoC(CLOCK_50, KEY, dataIn, dataOut, LEDR);
	input CLOCK_50;
	input KEY;
	input dataIn;
	output dataOut;
	output [9:0] LEDR;
	
	wire [9:0] parallelToProcessor, parallelFromProcessor;
	wire transmitEnable, characterSent, load, characterReceived;
	
	// Generate clk off of CLOCK_50, whichClock picks rate.
	wire [31:0] clk;
	parameter whichClock = 8;
	clock_divider cdiv (CLOCK_50, clk);
	
	// instantiate microprocessor
	nios_system u0 (
        .reset_reset_n                (~KEY),                //                 reset.reset_n
        .ledr_export                  (LEDR),                  //                  ledr.export
        .paralleltoprocessor_export   (parallelToProcessor),   //   paralleltoprocessor.export
        .clk_clk                      (CLOCK_50),                      //                   clk.clk
        .parallelfromprocessor_export (parallelFromProcessor), // parallelfromprocessor.export
        .transmitenable_export        (transmitEnable),        //        transmitenable.export
        .charactersent_export         (characterSent),         //         charactersent.export
        .load_export                  (load),                  //                  load.export
        .characterreceived_export     (characterReceived)      //     characterreceived.export
    );
	
	// instantiate receiving module
	receiving r1 (clk, KEY, dataIn, parallelToProcessor, characterReceived);
	
	// instantiate transmiting module
	transmitting t1 (clk, KEY, transmitEnable, parallelFromProcessor, dataOut, characterSent, load);
	
endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;
	initial divided_clocks = 0;
	always @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule 