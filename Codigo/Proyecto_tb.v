// Proyecto testbench
module testbench();

reg ticket;
reg [1:0]billete;
reg [1:0]tiempo;
reg clk;
reg reset;
wire [3:0]se;
wire [2:0]vuelto;
wire [2:0]saldo;
wire factura;
wire ingresado;
wire ticket_sellado;
wire motor;
wire talanquera;
wire contar;
wire [3:0]ea;
reg  sensor;


main M1(tiempo, billete, ticket, reset, sensor, clk,
        factura, talanquera);

initial begin
clk = 1;
reset = 0;
#1 reset = 1;
#1 reset = 0;

sensor = 1;
#3	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	0	;	tiempo[1] =	0	;	ticket =	0	;
#5	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	0	;	tiempo[1] =	0	;	ticket =	1	;
#10	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	0	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	; //se realizaron variaciones de 100
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	; //debido a que ingresado tarda en cambiar
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	; //por lo que esto facilita el cambio de estado
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	0	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	; sensor =0;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	; sensor = 1;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	1	;	billete[1] =	1	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;
#100	billete[0] =	0	;	billete[1] =	0	;	tiempo[0] =	1	;	tiempo[1] =	1	;	ticket =	1	;




#500 $finish;
end

always
  #5 clk = !clk;




initial begin
       $dumpfile("Proyecto_tb.vcd");
       $dumpvars(0,testbench);
   end
endmodule
