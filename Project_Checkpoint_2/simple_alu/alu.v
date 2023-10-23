module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	
	wire [31:0] add_result, sub_result, and_result, or_result, sll_result, sra_result;
	// wire [31:0] selectB;
	wire cout1, cout2;
	wire [31:0] not_data_operandB;
	wire olf_add, olf_sub;
	
	genvar i;
	generate
		for(i = 0; i < 32; i = i + 1)
			begin: not_loop
				not n1(not_data_operandB[i], data_operandB[i]);
			end
	endgenerate
	
	// choose add or subtract
	// assign selectB = (ctrl_ALUopcode[0] ? not_data_operandB : data_operandB);
	// Add
	csa32 c1(data_operandA, data_operandB, 1'b0, add_result, cout1, olf_add);
	// Sub
	csa32 c2(data_operandA, not_data_operandB, 1'b1, sub_result, cout2, olf_sub);
	// And
	and32 a1(data_operandA, data_operandB, and_result);
	// Or
	or32 o1(data_operandA, data_operandB, or_result);
	// SLL
	sll32 sl1(data_operandA, ctrl_shiftamt, sll_result);
	// SRA
	sra32 sr1(data_operandA, ctrl_shiftamt, sra_result);

	// choose result
	assign data_result = ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ?sra_result : sll_result):(ctrl_ALUopcode[1]?(ctrl_ALUopcode[0] ? or_result : and_result):(ctrl_ALUopcode[0] ? sub_result : add_result));
	// overflow
	assign overflow = ctrl_ALUopcode[0] ? olf_sub : olf_add;
	// isNotEqual
	or o2(isNotEqual, sub_result[0], sub_result[1], sub_result[2], sub_result[3], 
							sub_result[4], sub_result[5], sub_result[6], sub_result[7],
							sub_result[8], sub_result[9], sub_result[10], sub_result[11], 
							sub_result[12], sub_result[13], sub_result[14], sub_result[15], 
							sub_result[16], sub_result[17], sub_result[18], sub_result[19], 
							sub_result[20], sub_result[21], sub_result[22], sub_result[23],
							sub_result[24], sub_result[25], sub_result[26], sub_result[27], 
							sub_result[28], sub_result[29], sub_result[30], sub_result[31]);
	// isLessThan
	xor xo1(isLessThan, overflow, sub_result[31]);
	
endmodule
