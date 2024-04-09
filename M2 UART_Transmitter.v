`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:24:29 03/27/2024 
// Design Name: 
// Module Name:    UART_Transmitter 
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
module UART_Transmitter(Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Data_In, Tx_start, Baud_Clk, Reset);
output Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift;
input [31:0]Data_In;
input Tx_start, Baud_Clk, Reset;

Transmitter_FSM TM1(S0, S1, Load, Shift, Tx_start, Baud_Clk, Reset);
Parity_Generator TM2(Parity_Bit, Load, Data_In);
PISO TM3 (Data_Bit, Load, Shift, Data_In, Baud_Clk, Reset);
MUX4to1 TM4 (Tx_dataOut, Data_Bit, Parity_Bit, S0, S1);
endmodule
