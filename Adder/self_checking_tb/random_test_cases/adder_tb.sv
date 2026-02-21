module adder_tb;

    parameter WIDTH = 32;
    
    logic valid, clk, rst;
    logic [WIDTH - 1 : 0] a, b;
    logic [WIDTH : 0] sum;
    int num_trans = 5;
    
    typedef struct{
    
        logic [WIDTH - 1 : 0] a;
        logic [WIDTH - 1 : 0] b;
        logic [WIDTH : 0] expected;
    
    } txn_t;
    
    int pass_count = 0;
    int fail_count = 0;
    
    txn_t sb_queue[$];
    
    adder #(.WIDTH(WIDTH)) dut (.a(a), .b(b), .sum(sum), .clk(clk), .rst(rst), .valid(valid));
    
    initial begin
    
        clk = 0;
        forever #5 clk = ~clk; 
    
    end
    
    initial begin
    
        reset();
        
        for(int i = 0; i < num_trans; i++)begin
            
            a = $urandom_range(255);
            b = $urandom_range(255);
            valid = $random;
            
            @(posedge clk);
            
            $display("[%0t] trans [%0d] a = %0d, b = %0d, valid = %0d, sum = %0d", $time, i + 1, a, b, valid, sum);
            $display();
            

            /*
            $write("[%0t] trans [%0d] a = %0d, b = %0d, valid = %0d, ", $time, i + 1, a, b, valid);
            @(posedge clk);
            $write("sum = %0d\n", sum);
            $display("\n");
            */
        
        end  
        
        repeat(5) @(posedge clk);
        
        $display("=========================");
        $display("Transcations Completed!");
        $display("Pass = %0d", pass_count);
        $display("Fail = %0d", fail_count);
        $display("=========================");
        
        #100;
        $finish;
            
    end
    
    always @(posedge clk) begin
    
        if(!rst && valid) begin
        
            txn_t t;
            
            t.a = a;
            t.b = b;
            t.expected = a + b;
            
            sb_queue.push_back(t);
        
        end
    
    end
    
    always @(posedge clk) begin
    
        if(!rst && sb_queue.size() > 0)begin
        
            txn_t t;
            t = sb_queue.pop_front();
            
            @(posedge clk);
            
            if(sum !== t.expected) begin
            
                $error("Fail: a = %0d, b = %0d expected = %0d, got = %0d", t.a, t.b, t.expected, sum);
                fail_count++;
            
            end
            
            else begin
            
                $display("Pass: a = %0d, b = %0d, result = %0d", t.a, t.b, sum);
                pass_count++;
            
            end
        
        end
    
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
