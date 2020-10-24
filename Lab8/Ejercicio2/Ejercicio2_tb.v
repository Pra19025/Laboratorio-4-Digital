module testbench();

reg [11:0] address;
wire [7:0] datos;
reg [7:0] test_memory [0:9];

memory m1(address, datos);


initial begin
#1 $display("Loading rom.");
#1 address = 8'b0;
#1 $readmemb("memory.txt", test_memory);
#5 address = 8'b1;
#5 address = 8'd2;
#5 address = 8'd3;
#5 address = 8'd4;
#5 address = 8'd5;
#5 address = 8'd6;
#5 address = 8'd7;
#5 address = 8'd8;
#5 address = 8'd9;
#500 $finish;
  end
  initial begin
         $dumpfile("Ejercicio2_tb.vcd");
         $dumpvars(0,testbench);
     end
endmodule
