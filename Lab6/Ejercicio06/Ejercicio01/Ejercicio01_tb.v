module testbench();
    reg A,B;
    reg reset01;
    wire out01;
    reg clk;

     Ejercicio01 E1(A,B,clk,reset01,out01);


    initial clk =0 ;

    initial begin
        reset01=0;
        #1 reset01=1;
        #1 reset01=0;
        #1 A=0; B=0;
        #17 B=1;
        #20 A=1;B=0;
        #100 B=1;
        #20  B=0;
        #40  B=1;
        #20  A=0; B=0;
        #20 $finish;
    end

    always #10 clk= ~clk;

    initial begin
        $dumpfile("Ejercicio01_tb.vcd");
        $dumpvars(0,testbench);
    end

endmodule
