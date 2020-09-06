
module flip_flop(input wire clk,input wire [3:0] d, input wire reset, set,output reg [3:0] q);
//las entradas son clk, d que es de 4 bits, el reset y el set
//la salida es un registro q de 4 bits
always @ (posedge clk) q<= ( reset ? 4'b0000 : d) | (set ? 4'b1111 : 4'b0000);
// se utiliza operador ternario
// se hace un or de las opciones para asignarle ese valor a q
always @ (posedge reset) q = 4'b0000;
// siempre en reset se pone valor de 0 en la salida
endmodule
