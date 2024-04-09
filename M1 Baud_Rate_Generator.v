`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:56:47 04/01/2024 
// Design Name: 
// Module Name:    Baud_Rate_Generator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Baud_Rate_Generator(Baud_Clk, Clock_In, Reset);

output reg Baud_Clk = 1;
input Clock_In, Reset;
wire [11:0]temp = 12'd325;
reg [11:0]Baud_Counter = 0;

always@(posedge Clock_In or negedge Reset)
begin
	if(Reset == 0)
	begin
		Baud_Clk <= 0;
	end
	else if(Baud_Counter == temp)
	begin
		Baud_Counter = 1;
		Baud_Clk <= ~Baud_Clk;
	end
	else
	begin
		Baud_Counter = Baud_Counter + 1;
		Baud_Clk <= Baud_Clk;
	end
end
endmodule