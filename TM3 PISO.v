`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:09:17 03/27/2024 
// Design Name: 
// Module Name:    PISO 
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
module PISO(Data_Bit, Load, Shift, Data_In, Baud_Clk, Reset);

output reg Data_Bit = 0;
input Load, Shift, Baud_Clk, Reset;
input [31:0]Data_In;
reg [31:0]var;

always@(posedge Baud_Clk)
begin
	if(Reset == 0)
	begin
		Data_Bit <= 0;
		var <= 0;
	end
	else if(Load) var <= Data_In;
	else if(Shift)
	begin
		Data_Bit <= var[0];
		var <= var >> 1;
	end
	else if(~Load && ~Shift) Data_Bit <= 0;
end
endmodule
