module adder(
    adder_intf.DUT vif
);

    always_ff @(posedge vif.clk) begin
    
        if(vif.rst) begin
            vif.sum <= 0;
        end
        
        else if(vif.valid) begin
            vif.sum <= vif.a + vif.b;
        end
    
    end

endmodule
