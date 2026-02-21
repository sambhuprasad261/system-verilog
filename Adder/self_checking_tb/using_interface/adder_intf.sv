interface adder_intf #(
    parameter WIDTH = 16
)(
    input logic clk, rst
);

    logic [WIDTH-1 : 0] a, b;
    logic valid;
    logic [WIDTH : 0] sum;
    
    modport DUT (
        input clk, rst, a, b, valid,
        output sum
    );
    
    modport TB(
        input sum,clk, rst,
        output a, b, valid
    );
    
    clocking cb @(posedge clk);
        default input #1ns output #1ns;
        input sum;
        output a, b, valid;
    endclocking

endinterface 
