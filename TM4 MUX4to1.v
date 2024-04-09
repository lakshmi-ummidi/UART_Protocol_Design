`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:13 03/27/2024 
// Design Name: 
// Module Name:    MUX4to1 
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
module MUX4to1(Tx_dataOut, Data_Bit, Parity_Bit, S0, S1);

output Tx_dataOut;
input Data_Bit, Parity_Bit, S0, S1;
wire Start_Bit = 0, Stop_Bit = 1;
assign Tx_dataOut = (~S0&&~S1&&Start_Bit) || (~S0&&S1&&Data_Bit) || (S0&&~S1&&Parity_Bit) || (S0&&S1&&Stop_Bit);
endmodule
