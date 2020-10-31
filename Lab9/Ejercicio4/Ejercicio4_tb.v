module testbench();

reg enabled;
reg [3:0]A;
wire[3:0]Y;


buffer B1(A, enabled, Y);

initial begin
enabled = 3'b0;
A = 3'b0;
#10 enabled = 3'b111;
#10 A = 3'd5;
#10 enabled = 3'b0;

#10 $finish;
end

initial begin
  $dumpfile("Ejercicio4_tb.vcd");
  $dumpvars(0,testbench);
end

endmodule
