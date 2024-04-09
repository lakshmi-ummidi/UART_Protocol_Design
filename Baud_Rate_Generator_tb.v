`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:13:26 04/09/2024
// Design Name:   Baud_Rate_Generator
// Module Name:   /home/ise/Data/Xilinx Projects/UART_Protocol_Design/Baud_Rate_Generator_tb.v
// Project Name:  UART_Protocol_Design
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Baud_Rate_Generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Baud_Rate_Generator_tb;

	// Inputs
	reg Clock_In;
	reg Reset;

	// Outputs
	wire Baud_Clk;

	// Instantiate the Unit Under Test (UUT)
	Baud_Rate_Generator uut (
		.Baud_Clk(Baud_Clk), 
		.Clock_In(Clock_In), 
		.Reset(Reset)
	);

	initial begin
		// Initialize Inputs
		Clock_In = 1;
		Reset = 1;
	end
	initial begin
		forever #10 Clock_In = ~Clock_In;
	end 
      
endmodule

