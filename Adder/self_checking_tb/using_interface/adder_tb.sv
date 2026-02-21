module adder_tb;

    parameter WIDTH = 32;
    
    logic clk, rst;
    
    adder_intf #(.WIDTH(WIDTH)) intf(clk, rst);
    adder dut(intf.DUT);
    
    int num_transcation = 0;
    int pass_count = 0;
    int fail_count = 0;
    int num_trans = 0;
    
    typedef struct{
        
        logic [WIDTH-1 : 0] a;
        logic [WIDTH-1 : 0] b;
        logic valid;
        logic [WIDTH : 0] expected_sum;
    
    }txn_t;
    
    txn_t sb_queue[$];
    
    task reset();
        rst <= 1;
        intf.a <= 0;
        intf.b <= 0;
        intf.valid <= 0;
        repeat(2)@(posedge clk);
        rst <= 0;
    endtask
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        
        reset();
        @(posedge clk);
        
        num_trans = $urandom_range(10, 100);
        $display("Nums_trans = %0d", num_trans);
        
        repeat(num_trans) begin
        
            @(intf.cb);
            intf.cb.valid <= $random;
            intf.cb.a <= $urandom_range(0, 255);
            intf.cb.b <= $urandom_range(0, 255);
        end
        
        repeat(3)@(posedge clk);
        
        $display("\n ========= Scoreboard =========");
        $display("Total valid transcations : %0d", num_transcation);
        $display("Pass Count = %0d", pass_count);
        $display("Fail Count = %0d", fail_count);
        
        if(fail_count == 0)
            $display("STATUS : Test Passed");
        else
            $display("STATUS : Test Failed");
        
        $finish;
     
    end
    /*
    always @(intf.cb) begin
        if(!rst && intf.cb.valid) begin
        
            $display("Time = [%0t] a = %0d, b = %0d, valid = %0d, sum = %0d", $time, intf.cb.a, intf.cb.b, intf.cb.valid, intf.cb.sum);
        
        end
       
        else if(intf.valid == 0 && !rst)begin
        
            $display("Time = [%0t] a = %0d, b = %0d, valid = %0d, sum = %0d", $time, intf.cb.a, intf.cb.b, intf.cb.valid, intf.cb.sum);
        
        end
    
    end
    */
    
    always @(posedge clk) begin
    
        if(!rst && intf.valid) begin
        
            txn_t t;
            t.a <= intf.a;
            t.b <= intf.b;
            t.valid <= intf.valid;
            t.expected_sum <= intf.a + intf.b;
            
            sb_queue.push_back(t);
        end
    
    end
    
    always @(posedge clk) begin
    
        if(!rst && sb_queue.size() > 0) begin
            txn_t t;
            t = sb_queue.pop_front();
            
            num_transcation++;
            
            if(intf.sum === t.expected_sum) begin
                pass_count++;
                $display("Pass [%0t] | a = %0d | b = %0d | valid = %0d | expected = %0d, got = %0d", $time, t.a, t.b, t.valid, t.expected_sum, intf.sum);
            end
            else begin
            
                fail_count++;
                $display("Fail [%0t] | a = %0d | b = %0d | valid = %0d | expected = %0d, got = %0d", $time, t.a, t.b, t.valid, t.expected_sum, intf.sum);
                
            end
        end
    end

endmodule
