`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:18:35 04/09/2024
// Design Name:   Transmitter_Sim
// Module Name:   /home/ise/Data/Xilinx Projects/UART_Protocol_Design/Transmitter_Sim_tb.v
// Project Name:  UART_Protocol_Design
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Transmitter_Sim
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Transmitter_Sim_tb;

	// Inputs
	reg [31:0] Data_In;
	reg Tx_start;
	reg Clock_In;
	reg Reset;

	// Outputs
	wire Tx_dataOut;
	wire Data_Bit;
	wire Parity_Bit;
	wire S0;
	wire S1;
	wire Load;
	wire Shift;
	wire Baud_Clk;

	// Instantiate the Unit Under Test (UUT)
	Transmitter_Sim uut (
		.Tx_dataOut(Tx_dataOut), 
		.Data_Bit(Data_Bit), 
		.Parity_Bit(Parity_Bit), 
		.S0(S0), 
		.S1(S1), 
		.Load(Load), 
		.Shift(Shift), 
		.Baud_Clk(Baud_Clk), 
		.Data_In(Data_In), 
		.Tx_start(Tx_start), 
		.Clock_In(Clock_In), 
		.Reset(Reset)
	);
	
	initial begin
		Data_In = 32'd8900; #1066000;
		Data_In = 32'd8901; #1066000;
		Data_In = 32'd8902; #1066000;
		Data_In = 32'd8903; #1066000;
		Data_In = 32'd8904; #1066000;
		Data_In = 32'd8905; #1066000;
		Data_In = 32'd8906; #1066000;
		Data_In = 32'd8907; #1066000;
		Data_In = 32'd8908; #1066000;
		Data_In = 32'd8909; #1066000;
		Data_In = 32'd8910; #1066000;
	end

	initial begin
		Tx_start = 1;
		Clock_In = 1;
		Reset = 1;
	end
	
	initial begin
		forever #10 Clock_In = ~Clock_In;
	end 
      
endmodule

