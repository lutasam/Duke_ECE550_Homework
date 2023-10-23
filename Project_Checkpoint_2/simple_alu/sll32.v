module sll32(input [31:0] a, input [4:0] select, output [31:0] out);

	wire [31:0] temp0, temp1, temp2, temp3;
	
	assign temp0 = select[0] ? {a[30:0], 1'b0} : a;
	assign temp1 = select[1] ? {temp0[29:0], 2'b00} : temp0;
	assign temp2 = select[2] ? {temp1[27:0], 4'b0000} : temp1;
	assign temp3 = select[3] ? {temp2[23:0], 8'b00000000} : temp2;
	assign out = select[4] ? {temp3[15:0], 16'b0000000000000000} : temp3;
	
endmodule