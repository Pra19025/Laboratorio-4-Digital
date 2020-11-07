module testbench();

reg [11:0]valor_load;
reg load;
reg enablePC;
reg enableFetch;
reg clk;
reg rst;
wire [11:0]pc;
wire [7:0] program_byte;
wire [3:0] operando;
wire [3:0] instruccion;


conexion C1(valor_load,clk,rst, enablePC, enableFetch,load, operando, instruccion, program_byte);


initial begin
clk = 1;
rst = 1'b1;
valor_load = 12'd0;
#1 rst = 1'b0;
enablePC = 1'b1;
enableFetch = 1'b1;
load = 1'b1;
#2 valor_load = 12'd10;
#1 rst = 0;
#2load = 1'b0;

#1 load = 1'b1; //probando si se vuelve a recargar el valor de load
#1enablePC = 1'b0;    enableFetch = 1'b0;   //probando enables
#10 enablePC = 1'b1;    enableFetch = 1'b1;
valor_load = 12'd0;
load = 1'b0; 


#50 $finish;
end

initial begin

  $dumpfile("Ejercicio1_tb.vcd");
  $dumpvars(0,testbench);
  end

  always
  #1 clk = !clk;


endmodule
