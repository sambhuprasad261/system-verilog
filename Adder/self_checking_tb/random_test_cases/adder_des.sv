module adder #(

    parameter WIDTH = 32

)(

    input logic [WIDTH - 1 : 0] a, b,
    input logic valid, rst, clk,
    output logic [WIDTH : 0] sum

);

    always_ff @(posedge clk) begin
    
        if(rst) begin
        
            sum <= 0;
        
        end
        
        else if(valid) begin
        
            sum <= a + b;
            
        end
    
    end

endmodule 
