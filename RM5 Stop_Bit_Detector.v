`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:41:03 04/01/2024 
// Design Name: 
// Module Name:    Stop_Bit_Detector 
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
module Stop_Bit_Detector(Stop_Error, Rx_dataOut, Check_Stop, Rx_In, Rx_data, Baud_Clk);

output reg Stop_Error;
output reg [31:0]Rx_dataOut;
input Rx_In, Check_Stop, Baud_Clk;
input [31:0]Rx_data;
reg [2:0]count = 0;

always@(posedge Baud_Clk)
begin
	if(Check_Stop)
	begin
		if(Rx_In)
		begin
			if(count == 15)
			begin
				count <= 0; Stop_Error <= 0;
				Rx_dataOut <= Rx_data;
			end
			else
			begin
				count <= count + 1;
				Stop_Error <= 0;
				Rx_dataOut <= Rx_data;
			end
		end
		else
		begin
			Stop_Error <= 1;
			Rx_dataOut <= 32'h0000;
		end
	end
	else
	begin
		Stop_Error <= 0;
		Rx_dataOut <= Rx_data;
	end
end	
endmodule