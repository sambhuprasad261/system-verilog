module glitch_demo;
    reg a, b, c;
    wire t1, t2, y;

    assign #5 t1 = a & b;
    assign #2 t2 = a & c;
    assign #3 y  = t1 | t2;

    initial begin
        a = 1; b = 1; c = 0;
        #10 c = 1;
        #20 $finish;
    end
endmodule