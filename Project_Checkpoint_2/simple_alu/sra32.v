module sra32(input [31:0] a, input [4:0] select, output [31:0] out);
	
	wire [31:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9;
	
	assign temp0 = select[0] ? {1'b0, a[31:1]} : a;
	assign temp1 = select[1] ? {2'b00, temp0[31:2]} : temp0;
	assign temp2 = select[2] ? {4'b0000, temp1[31:4]} : temp1;
	assign temp3 = select[3] ? {8'b00000000, temp2[31:8]} : temp2;
	assign temp4 = select[4] ? {16'b0000000000000000, temp3[31:16]} : temp3;
	
	assign temp5 = select[0] ? {1'b1, a[31:1]} : a;
	assign temp6 = select[1] ? {2'b11, temp5[31:2]} : temp5;
	assign temp7 = select[2] ? {4'b1111, temp6[31:4]} : temp6;
	assign temp8 = select[3] ? {8'b11111111, temp7[31:8]} : temp7;
	assign temp9 = select[4] ? {16'b1111111111111111, temp8[31:16]} : temp8;
	
	assign out = a[31] ? temp9 : temp4;
	
endmodule