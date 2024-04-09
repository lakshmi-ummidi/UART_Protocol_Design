`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:17 03/27/2024 
// Design Name: 
// Module Name:    Receiver_FSM 
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
module Receiver_FSM(Load1, Shift1, Check_Stop, DeStart_Bit, Parity_Error, Baud_Clk, Reset);

output reg Load1, Shift1, Check_Stop;
input DeStart_Bit, Parity_Error, Baud_Clk, Reset;
reg var1, var2, var3;
reg f1, f2, f3;
reg [4:0]x1 = 1;
reg [3:0]x2 = 1;
reg [3:0]x3 = 1;
reg [1:0]Present_state = 2'b00, Next_state = 2'b00;
parameter IDLE = 2'b00, DATA_BIT = 2'b01, PARITY_BIT = 2'b10, STOP_BIT = 2'b11;

always@(*)
begin
	case(Present_state)
	IDLE:
	begin
		Next_state = DeStart_Bit? DATA_BIT : IDLE;
		Load1 = 0; Shift1 = 0; Check_Stop = 0;
		var1 = 0; var2 = 0; var3 = 0;
	end
	DATA_BIT:
	begin
		Next_state = f1? PARITY_BIT : DATA_BIT;
		Load1 = 0; Shift1 = 1; Check_Stop = 0;
		var1 = 1; var2 = 0; var3 = 0;
	end
	PARITY_BIT:
	begin
		Next_state = Parity_Error? IDLE : (f2? STOP_BIT : PARITY_BIT);
		Load1 = 1; Shift1 = 0; Check_Stop = 0;
		var1 = 0; var2 = 1; var3 = 0;
	end
	STOP_BIT:
	begin
		Next_state = f3? IDLE : STOP_BIT;
		Load1 = 0; Shift1 = 0; Check_Stop = 1;
		var1 = 0; var2 = 0; var3 = 1;
	end
	default:
	begin
		Next_state = IDLE;
		Load1 = 0; Shift1 = 0; Check_Stop = 0;
		var1 = 0; var2 = 0; var3 = 0;
	end
	endcase
end

always@(posedge Baud_Clk, negedge Reset)
begin
	if(Reset == 0) Present_state <= IDLE;
	else Present_state <= Next_state;
end

always@(posedge Baud_Clk)
begin
	if(var1)
	begin
		if(x1 == 5'd31)
		begin
			f1 = 1; x1 = 0;
		end
		else
		begin
			f1 = 0; x1 = x1 + 1;
		end
	end
	else
	begin
		f1 = 0;
	end
end

always@(posedge Baud_Clk)
begin
	if(var2)
	begin
		if(x2 == 4'd15)
		begin
			f2 = 1; x2 = 0;
		end
		else
		begin
			f2 = 0; x2 = x2 + 1;
		end
	end
	else
	begin
		f2 = 0;
	end
end

always@(posedge Baud_Clk)
begin
	if(var3)
	begin
		if(x3 == 4'd15)
		begin
			f3 = 1; x3 = 0;
		end
		else
		begin
			f3 = 0; x3 = x3 + 1;
		end
	end
	else
	begin
		f3 = 0;
	end
end
endmodule
