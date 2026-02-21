`timescale 1ns/1ps

module tb;
  
  parameter WIDTH = 32;
  
  logic [WIDTH - 1 : 0] a, b;
  logic [WIDTH : 0] sum;
  logic clk, rst, valid;
  
  adder #(.WIDTH(WIDTH)) dut (.a(a), .b(b), .sum(sum), .clk(clk), .rst(rst), .valid(valid));

  always #5 clk = ~clk;
  
  initial begin
 
    clk = 0;
    $monitor("[%0t] The sum of a = %0d, b = %0d, valid = %d, is sum = %0d", $time, a, b, valid, sum);    

    reset();

    //@(posedge clk);
    a = 1024;
    b = 1000;
    valid = 1;

    repeat(2)@(posedge clk);
    if(sum == a + b)begin
      $display("sum matches");
    end

    else begin

      $error("Mismatch");

    end
    valid = 0;
    
    @(posedge clk);
    a = 200;
    b = 300;
    valid = 1;
    
   repeat(2)@(posedge clk);
    valid = 0;
    
    #20;
    $finish;
  end

  task reset();
    
    rst = 1;
    valid = 0;
    a = 0;
    b = 0;
    repeat(2) @(posedge clk);
    rst = 0;
    
  endtask
  
endmodule
