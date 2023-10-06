module sra32(input [31:0] a, input [4:0] select, output [31:0] out);
	
	assign out = ($signed(a)) >>> select;
	
endmodule