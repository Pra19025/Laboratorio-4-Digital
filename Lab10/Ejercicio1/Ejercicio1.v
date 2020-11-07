//modulo del programm counter
module pc(input [11:0] valor_load, input load, enablePC, clk, rst, output reg [11:0] pc);

always @(posedge clk, posedge rst)
begin
  if (rst)  begin
    pc <=12'b0;
  end
  if (enablePC & ~rst & ~load) begin
    pc <= pc +1;
  end
  if(load & ~rst & enablePC) begin
    pc <=valor_load;
  end
end
endmodule


module ROM (input [11:0] address, output [7:0]data);

reg [11:0] mem [0:4095]; //memoria de 12 bits, con 8 bits de ancho.
assign data = mem[address];

initial begin
$readmemb("memory.txt", mem);
end

endmodule


module fetch(input [7:0] D, input clk, rst, enableFetch, output reg [3:0] operando, instruccion);
//es un flip flop de 8 bits
always  @(posedge clk, posedge rst)
begin
if (rst) begin
  operando <= 4'b0;
  instruccion <=4'b0;
  end
if(enableFetch & ~rst) begin
  operando <= D[3:0 ];
  instruccion <= D[7:4];
end
end
endmodule

module conexion (input [11:0] valor_load, input clk, rst, enablePCC, enableFetchC, loadC,
                 output [3:0] operandoC, instruccionC, output [7:0] dataC);
//en este modulo se conectan los otros modulos

wire loadC;
wire enablePCC;
wire enableFetchC;
wire clk;
wire rst;
wire [11:0] pcC;
wire [7:0]dataC;
wire [3:0] operandoC;
wire [3:0] instruccionC;


pc PC1(valor_load, loadC, enablePCC, clk, rst, pcC);
ROM r1(pcC, dataC);
fetch F1(dataC, clk, rst, enableFetchC, operandoC, instruccionC);
endmodule // conexion
