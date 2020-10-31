module testbench();

wire [12:0]data;
reg [6:0]address;

memory M1(address, data);

initial begin
address = 7'bxxxxxx0;
#10 address = 7'b00001x1;
#10 address= 7'b00000x1;
#10 address= 7'b00000x1;
#10 address=7'b00011x1;
#10 address=7'b00010x1;
#10 address=7'b0010xx1;
#10 address=7'b0011xx1;
#10 address=7'b0100xx1;
#10 address=7'b0101xx1;
#10 address=7'b0110xx1;
#10 address=7'b0111xx1;
#10 address=7'b1000x11;
#10 address=7'b1000x01;
#10 address=7'b1001x11;
#10 address=7'b1001x01;
#10 address=7'b1010xx1;
#10 address=7'b1011xx1;
#10 address=7'b1100xx1;
#10 address=7'b1101xx1;
#10 address=7'b1110xx1;
#10 address=7'b1111xx1;

//probando otras que no son de la lista
#10 address = 7'b1010101;
#10 address = 7'b1111001;
#10 address = 7'b1010101;
#10 address = 7'b1010111;
#10 address = 7'b1010111;



#50 $finish;
end


initial begin

  $dumpfile("Ejercicio5_tb.vcd");
  $dumpvars(0,testbench);
  end

endmodule
