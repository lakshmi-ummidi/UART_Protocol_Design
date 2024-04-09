`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:15:50 04/09/2024 
// Design Name: 
// Module Name:    Transmitter_Sim 
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
module Transmitter_Sim(Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Baud_Clk, Data_In, Tx_start, Clock_In, Reset);

output Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Baud_Clk;
input [31:0]Data_In;
input Tx_start, Clock_In, Reset;
Baud_Rate_Generator m1(Baud_Clk, Clock_In, Reset);
UART_Transmitter m2(Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Data_In, Tx_start, Baud_Clk, Reset);
endmodule
