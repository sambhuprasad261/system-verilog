module gates_b(
	
	input logic a, 
	input logic b,
	output logic and_g,
	output logic or_g,
	output logic xor_g,
	output logic nand_g,
	output logic nor_g,
	output logic xnor_g,
	output logic not_g
	
);

	always_comb begin
	
		and_g = a & b;
		or_g = a | b;
		nor_g = ~(a | b);
		nand_g = ~(a & b);
		xor_g = a ^ b;
		xnor_g = ~(a ^ b);
		not_g = ~a;
	
	end

endmodule
