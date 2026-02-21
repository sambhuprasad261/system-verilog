
module adder #(parameter WIDTH = 16)(

  input logic [WIDTH - 1 : 0] a, b,
  input logic valid, clk, rst,
  output logic [WIDTH : 0] sum
  
);
  
  always_ff @(posedge clk or posedge rst)begin
    
    if(rst)begin
      
      sum <= 0;
      
    end
    
    else if(valid) begin
        
        sum <= a + b;
        
      end 
  
  end
  
endmodule
