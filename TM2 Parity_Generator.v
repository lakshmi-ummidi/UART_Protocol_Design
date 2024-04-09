`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:51:43 03/27/2024 
// Design Name: 
// Module Name:    Parity_Generator 
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
module Parity_Generator(Parity_Bit, Load, Data_In);

output reg Parity_Bit = 0;
input [31:0]Data_In;
input Load;
always@(*)
begin
	if(Load == 0) Parity_Bit = ^Data_In;
	else Parity_Bit = 1'b0;
end
endmodule
