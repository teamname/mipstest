module memory(input clk, wr_en, input addr, input data_in, output  mem_out, output reg rd_ack, input test_in, output test_out);
  
   parameter RAM_FILE = "test.mem";
   parameter RAM_WIDTH = 32;
   parameter RAM_ADDR_BITS = 10;
   
   wire [RAM_ADDR_BITS - 1: 0] addr;
   wire [RAM_WIDTH - 1: 0] data_in;
   wire [RAM_ADDR_BITS - 1: 0] test_in;
   reg [RAM_WIDTH - 1: 0] test_out;
   reg [RAM_WIDTH - 1: 0] mem_out;

   reg [RAM_WIDTH-1:0] ram [(2**RAM_ADDR_BITS)-1:0];


   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
      $readmemh(RAM_FILE, ram);

   always @(posedge clk) begin
         rd_ack <= 1'b0;
         if (wr_en) begin
            ram [addr] <= data_in;
          end
          else begin
            mem_out <= ram[addr];
            rd_ack <= 1'b1;
          end
   end
   
   always@(test_in) begin
     test_out = ram[test_in];
	endmodule