//ejercici03 en verilog
module testbench();


reg Direccion;
reg reset;
wire [2:0]out;
reg clk;

  MaquinaMoore E3(Direccion,clk,reset,out);


    initial begin
        clk = 0;
        reset=0;
        Direccion = 1;
        #1 reset=1;
        #1 reset=0;
        #1 Direccion=0;
    end

    always #2 clk= ~clk;

    initial begin
    #10
        $dumpfile("Ejercicio03_tb.vcd");
        $dumpvars(0,testbench);
    end
    initial
    #50 $finish;

endmodule
