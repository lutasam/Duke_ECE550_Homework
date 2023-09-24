module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	
	wire [31:0] selectB;
	wire cout;
	wire [31:0] not_data_operandB;
	
	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
			begin: not_loop
				not n1(not_data_operandB[i], data_operandB[i]);
			end
	endgenerate
	
	// choose add or subtract
	assign selectB = (ctrl_ALUopcode[0] ? not_data_operandB : data_operandB);
	
	csa32 c1(data_operandA, selectB, ctrl_ALUopcode[0], data_result, cout, overflow);
	
endmodule
