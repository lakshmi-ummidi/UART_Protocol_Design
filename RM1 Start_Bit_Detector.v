`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:00 03/27/2024 
// Design Name: 
// Module Name:    Start_Bit_Detector 
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
module Start_Bit_Detector(DeStart_Bit, Rx_In, Baud_Clk);

output reg DeStart_Bit;
input Rx_In, Baud_Clk;
reg [3:0]count = 0;
always@(posedge Baud_Clk)
begin
	if(Rx_In == 0)
	begin
		if(count == 4'd15)
		begin
			count = 0;
			DeStart_Bit = 1;
		end
		else
		begin
			count = count + 1;
			DeStart_Bit = 0;
		end
	end
	else
	begin
		count = 0;
		DeStart_Bit = 0;
	end
end
endmodule
