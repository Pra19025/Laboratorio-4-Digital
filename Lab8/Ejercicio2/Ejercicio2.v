module memory (address ,data);
input [11:0] address;
output [7:0] data;


reg [7:0] mem [0:4095] ;

assign data = mem[address];

initial begin
  $readmemb("memory.txt", mem);
end

endmodule
