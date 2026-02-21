//`timescale 1ns/1ps
`include "logic_gates_b.sv"

module tb;

	logic a, b, and_g, or_g, nor_g, nand_g, xor_g, xnor_g, not_g;
	
	gates_b dut (.a(a), .b(b), .and_g(and_g), .or_g(or_g), .nor_g(nor_g), .nand_g(nand_g), .not_g(not_g), .xor_g(xor_g), .xnor_g(xnor_g));
	
	initial begin
	
	    $monitor("[%0t]ns  a = %b, b = %b, not_g = %b, and_g = %b, nand_g = %b, or_g = %b, nor_g = %b, xor = %b, xnor = %b", $time, a, b, not_g, and_g, nand_g, or_g, nor_g, xor_g, xnor_g);
	
	    #5;
	
	    #1; a = 0; b = 0;
	    
	    #1; a = 1; b = 0;
	    
	    #1; a = 0; b = 1;
	    
	    #1; a = 1; b = 1;
	    
	    #1;
	    
	    $finish;
	
	end

endmodule
