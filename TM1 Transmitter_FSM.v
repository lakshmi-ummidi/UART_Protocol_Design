`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:33:03 03/27/2024 
// Design Name: 
// Module Name:    Transmitter_FSM 
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
module Transmitter_FSM(S0, S1, Load, Shift, Tx_start, Baud_Clk, Reset);

output reg S0, S1, Load, Shift;
input Tx_start, Baud_Clk, Reset;
reg [2:0]Present_state;
reg [2:0]Next_state = 2'b000;
reg flag1, flag2, temp, temp1;
reg [5:0]x1 = 1;
reg [3:0]x2 = 1;
parameter IDLE = 3'b000, START_BIT = 3'b001, DATA_BIT = 3'b010, PARITY_BIT = 3'b011, STOP_BIT = 3'b100;
always@(*)
begin
	case(Present_state)
	IDLE: 
	begin
		Next_state = Tx_start? START_BIT : IDLE;
		S0 = 1; S1 = 1; Load = 0; Shift = 0;
		temp = 0; temp1 = 0;
	end
	START_BIT: 
	begin
		Next_state = flag1? DATA_BIT : START_BIT;
		S0 = 0; S1 = 0; Load = 1; Shift = 0;
		temp = 0; temp1 = 1;
	end
	DATA_BIT: 
	begin
		Next_state = flag2? PARITY_BIT : DATA_BIT;
		S0 = 0; S1 = 1; Load = 0; Shift = 1;
		temp = 1; temp1 = 0;
	end
	PARITY_BIT: 
	begin
		Next_state = flag1? STOP_BIT : PARITY_BIT;
		S0 = 1; S1 = 0; Load = 0; Shift = 0;
		temp = 0; temp1 = 1;
	end
	STOP_BIT: 
	begin
		Next_state = flag1? IDLE : STOP_BIT;
		S0 = 1; S1 = 1; Load = 0; Shift = 0;
		temp = 0; temp1 = 1;
	end
	default:
	begin
		Next_state = 3'b000;
		S0 = 1; S1 = 1; Load = 0; Shift = 0;
		temp = 0; temp1 = 0;
	end
	endcase
end

always@(posedge Baud_Clk)
begin
	if(temp)
	begin
		if(x1 == 6'd32)
		begin
			flag2 = 1; x1 = 0;
		end
		else
		begin
			flag2 = 0; x1 = x1 + 1;
		end
	end
	else
		flag2 = 0;
end

always@(posedge Baud_Clk)
begin
	if(temp1)
	begin
		if(x2 == 5'd15)
		begin
			flag1 = 1; x2 = 0;
		end
		else
		begin
			flag1 = 0; x2 = x2 + 1;
		end
	end
	else
		flag1 = 0;
end

always@(posedge Baud_Clk or negedge Reset)
begin
	if(Reset == 0)
		Present_state <= IDLE;
	else
		Present_state <= Next_state;
end
endmodule
