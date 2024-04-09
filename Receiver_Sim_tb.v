`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:26:31 04/09/2024
// Design Name:   Receiver_Sim
// Module Name:   /home/ise/Data/Xilinx Projects/UART_Protocol_Design/Receiver_Sim_tb.v
// Project Name:  UART_Protocol_Design
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Receiver_Sim
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Receiver_Sim_tb;

	// Inputs
	reg [31:0] Data_In;
	reg Clock_In;
	reg Reset;

	// Outputs
	wire Stop_Error;
	wire [31:0] Rx_dataOut;
	wire Parity_Error;
	wire [31:0] Rx_data;
	wire Load1;
	wire Shift1;
	wire Check_Stop;
	wire DeStart_Bit;
	wire Tx_dataOut;
	wire Baud_Clk;

	// Instantiate the Unit Under Test (UUT)
	Receiver_Sim uut (
		.Stop_Error(Stop_Error), 
		.Rx_dataOut(Rx_dataOut), 
		.Parity_Error(Parity_Error), 
		.Rx_data(Rx_data), 
		.Load1(Load1), 
		.Shift1(Shift1), 
		.Check_Stop(Check_Stop), 
		.DeStart_Bit(DeStart_Bit), 
		.Tx_dataOut(Tx_dataOut), 
		.Baud_Clk(Baud_Clk), 
		.Data_In(Data_In), 
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
		Clock_In = 1;
		Reset = 1;
	end
	
	initial begin
		forever #10 Clock_In = ~Clock_In;
	end 
	initial #1300000 $finish;
      
endmodule

