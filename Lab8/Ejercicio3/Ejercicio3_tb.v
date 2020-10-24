//ejercicio 3
module testbench();

reg [3:0] A, B;
reg [2:0] F;

wire [3:0] Y;

integer i;
alu a1(A,B,F,Y);

initial
begin
F = 3'b0;
A = 4'd2  ;
B= 4'd3;

for (i=0; i<=7;i=i+1)
begin
F = F + 3'd1;
#10;
end

A = 4'd2;
B= 4'd3;

end

initial begin
       $dumpfile("Ejercicio3_tb.vcd");
       $dumpvars(0,testbench);
   end

endmodule
