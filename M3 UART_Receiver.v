`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:48 03/27/2024 
// Design Name: 
// Module Name:    UART_Receiver 
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
module UART_Receiver(Rx_dataOut, Rx_data, Stop_Error, Parity_Error, Load1, Shift1, Check_Stop, DeStart_Bit, Rx_In, Baud_Clk, Reset);

output [31:0]Rx_dataOut, Rx_data;
output Stop_Error, Parity_Error, Load1, Shift1, Check_Stop, DeStart_Bit;
input Rx_In, Baud_Clk, Reset;

Start_Bit_Detector RM1(DeStart_Bit, Rx_In, Baud_Clk);
Receiver_FSM RM2(Load1, Shift1, Check_Stop, DeStart_Bit, Parity_Error, Baud_Clk, Reset);
SIPO RM3(Rx_data, Shift1, Rx_In, Baud_Clk, Reset);
Parity_Checker RM4(Parity_Error, Load1, Rx_In, Rx_data);
Stop_Bit_Detector RM5 (.Stop_Error(Stop_Error), .Rx_dataOut(Rx_dataOut), .Check_Stop(Check_Stop), .Rx_In(Rx_In), .Rx_data(Rx_data), .Baud_Clk(Baud_Clk));
endmodule
