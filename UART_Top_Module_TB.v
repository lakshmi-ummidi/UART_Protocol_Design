`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:21:07 04/01/2024
// Design Name:   UART_Top_Module
// Module Name:   /home/ise/Data/Xilinx Projects/UART_Protocol_Design/UART_Top_Module_TB.v
// Project Name:  UART_Protocol_Design
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_Top_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_Top_Module_TB;

	// Inputs
	reg [31:0] Data_In;
	reg Tx_start;
	reg Clock_In;
	reg Reset;

	// Outputs
	wire [31:0] Rx_dataOut;
	wire [31:0] Rx_data;
	wire Stop_Error;
	wire Parity_Error;
	wire Load1;
	wire Shift1;
	wire Check_Stop;
	wire DeStart_Bit;
	wire Tx_dataOut;
	wire Data_Bit;
	wire Parity_Bit;
	wire S0;
	wire S1;
	wire Load;
	wire Shift;
	wire Baud_Clk;

	// Instantiate the Unit Under Test (UUT)
	UART_Top_Module uut (
		.Rx_dataOut(Rx_dataOut), 
		.Rx_data(Rx_data), 
		.Stop_Error(Stop_Error), 
		.Parity_Error(Parity_Error), 
		.Load1(Load1), 
		.Shift1(Shift1), 
		.Check_Stop(Check_Stop), 
		.DeStart_Bit(DeStart_Bit), 
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
		Clock_In = 1;
		Reset = 1;
		Tx_start = 1;
	end
	initial begin
		forever #10 Clock_In = ~Clock_In;
	end
	initial #11900000 $finish;
endmodule

