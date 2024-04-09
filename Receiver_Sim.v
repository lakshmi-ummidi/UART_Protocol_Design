`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:23:51 04/09/2024 
// Design Name: 
// Module Name:    Receiver_Sim 
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
module Receiver_Sim(Stop_Error, Rx_dataOut, Parity_Error, Rx_data, Load1, Shift1, Check_Stop, DeStart_Bit, Tx_dataOut, Baud_Clk, Data_In, Clock_In, Reset);

output Stop_Error; 
output Parity_Error;
output [31:0]Rx_data, Rx_dataOut;
output Tx_dataOut;
output DeStart_Bit;
output Load1, Shift1, Check_Stop;
wire Data_Bit, Parity_Bit, S0, S1, Load, Shift;
output Baud_Clk;
wire Tx_start = 1;
input [31:0]Data_In;
input Clock_In, Reset;
Baud_Rate_Generator m1(Baud_Clk, Clock_In, Reset);
UART_Transmitter m2(Tx_dataOut, Data_Bit, Parity_Bit, S0, S1, Load, Shift, Data_In, Tx_start, Baud_Clk, Reset);
UART_Receiver m3(Stop_Error, Rx_dataOut, Parity_Error, Rx_data, Load1, Shift1, Check_Stop, DeStart_Bit, Tx_dataOut, Baud_Clk);
endmodule 