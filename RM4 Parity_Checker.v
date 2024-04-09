`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:53 03/27/2024 
// Design Name: 
// Module Name:    Parity_Checker 
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
module Parity_Checker(Parity_Error, Load1, Rx_In, Rx_data);

output reg Parity_Error;
input Load1, Rx_In;
input [31:0]Rx_data;

always@(*)
begin
	if(Load1)
	begin
		if(Rx_In == ^Rx_data) Parity_Error <= 1'b0;
		else Parity_Error <= 1'b1;
	end
	else
		Parity_Error <= 1'b0;
end
endmodule
