//bus driver es buffer triestado de 4 bit , el enabled es para los 4 bits
module bus_driver(input [3:0]entrada_buffer, input enabled, output reg [3:0] data_bus);

always @(entrada_buffer or enabled)
  begin
    if (enabled)
      data_bus <= entrada_buffer;
    else
      data_bus <= 4'bZ;
  end

endmodule

module accumulator(input [3:0] Y, input rst, clk, enabled, output reg [3:0] accu);

always@(posedge clk, posedge rst)
begin
if(rst)
accu <= 4'b0;
else if(enabled)
accu <= Y;
end
endmodule


module ALU(input [3:0] A, B, input [2:0]F,
           output [3:0] Y, output reg [1:0] zero_carry);

reg[4:0] salida_alu;//se usan 5 bits por el carry y zero
assign Y = salida_alu[3:0];


always @(*)
begin
case(F)
3'b000:         //000 es dejar pasar A
salida_alu <= A;
3'b010:         // 010 es dejar pasar B
salida_alu <= B;
3'b011:         //011 es sumar
salida_alu <= A + B;
3'b001:         //001 es restar (comparar)
salida_alu <= A - B;
3'b100:         //NAND o NOR se hizo nand
salida_alu <= ~ (A & B);
default salida_alu <= A + B;
endcase

if(salida_alu == 5'b0) begin
zero_carry <= 2'b10;
end
if(salida_alu > 5'b10000) begin
zero_carry <= 2'b01;
end
if(salida_alu != 5'b0 & salida_alu <5'b10000) begin
zero_carry <= 2'b0;
end



end
endmodule


module conexion(input [3:0]entrada_buffer1C, input [2:0]control_ALU, input clk, rst, enableBus1, enableBus2, enableAccu,
                output [3:0] salidaBus2);

wire [3:0]data_busC;
wire [3:0]accuC;
wire [3:0]salida_ALUC;
wire [1:0]zero_carryC;

bus_driver Bus1(entrada_buffer1C,enableBus1, data_busC);
ALU ALU1(accuC,data_busC,control_ALU, salida_ALUC, zero_carryC);
accumulator ACCU1(salida_ALUC, rst, clk, enableAccu, accuC);
bus_driver Bus2(salida_ALUC, enableBus2, salidaBus2);
endmodule
