module testbench();

reg [3:0]entrada_buffer1C;
wire [3:0]salida_ALUC;
wire [3:0]salida_buffer2C;
reg [2:0] control_ALU;
reg clk;
reg rst;
reg enableBus1;
reg enableBus2;
reg enableAccu;
integer i;

conexion C1(entrada_buffer1C,control_ALU,clk, rst,enableBus1, enableBus2, enableAccu,
            salida_buffer2C);

initial begin
clk = 1'b1;
rst = 1'b1;
enableBus1 = 1'b0;  enableBus2 = 1'b0; enableAccu = 1'b0;
#1 rst = 1'b0;
#1 enableBus1 = 1'b1;  enableBus2 = 1'b1; enableAccu = 1'b1;
//probando operaicon de dejar pasar y sumar.
#1 entrada_buffer1C = 4'b1;
#1 control_ALU = 3'b010;
#1 entrada_buffer1C = 4'd5;
#2 control_ALU = 3'b000;

#1 entrada_buffer1C = 4'd10; //probando que funcione el carry
#1 control_ALU = 3'b010;
#2 control_ALU = 3'b011;

#1 entrada_buffer1C = 4'd0; //probando que funcione el cero
#1 control_ALU = 3'b010;


#1 entrada_buffer1C = 4'b1; //probando la comparacion
#1 control_ALU = 3'b010;
#1 entrada_buffer1C = 4'd8;
#2 control_ALU = 3'b001;

#1 entrada_buffer1C = 4'd8; //probando la comparacion con otros numeros
#1 control_ALU = 3'b010;
#1 entrada_buffer1C = 4'd6;
#2 control_ALU = 3'b001;  

#1 entrada_buffer1C = 4'd2; //probando NAND
#1 control_ALU = 3'b010;
#1 entrada_buffer1C = 4'd3;
#2 control_ALU = 3'b100;


#2 $finish;
end




initial begin

  $dumpfile("Ejercicio2_tb.vcd");
  $dumpvars(0,testbench);
  end

always
#1 clk = ~clk;

endmodule
