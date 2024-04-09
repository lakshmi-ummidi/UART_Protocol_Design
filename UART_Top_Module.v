`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:33 03/27/2024 
// Design Name: 
// Module Name:    UART_Top_Module 
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
module UART_Top_Module(Rx_dataOut, Rx_data, Stop_Error, Parity_Error, Load1, Shift1, Check_Stop, DeStart_Bit, Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Baud_Clk, Data_In, Tx_start, Clock_In, Reset);

output [31:0]Rx_dataOut, Rx_data;
output Stop_Error, Parity_Error, Load1, Shift1, Check_Stop, DeStart_Bit;
output Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Baud_Clk;
input [31:0]Data_In;
input Tx_start, Clock_In, Reset;

Baud_Rate_Generator M1 (Baud_Clk, Clock_In, Reset);
UART_Transmitter M2 (Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Data_In, Tx_start, Baud_Clk, Reset);
UART_Receiver M3(Rx_dataOut, Rx_data, Stop_Error, Parity_Error, Load1, Shift1, Check_Stop, DeStart_Bit, Tx_dataOut, Baud_Clk, Reset);
endmodule
