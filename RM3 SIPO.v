`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:23:05 03/27/2024 
// Design Name: 
// Module Name:    SIPO 
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
module SIPO(Rx_data, Shift1, Rx_In, Baud_Clk, Reset);

output [31:0]Rx_data;
input Shift1, Rx_In, Baud_Clk, Reset;
reg [31:0]t = 32'd0;

always@(posedge Baud_Clk or negedge Reset)
begin
	if(!Reset) t <= 0;
	else if(Shift1)
	begin
		t <= t >> 1;
		t[31] <= Rx_In;
	end
	else t <= t;
end
assign Rx_data = t;
endmodule
