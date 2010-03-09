module memory(input clk, wr_en, input reg [7:0] addr, input reg [31:0] data_in, output reg [31:0] mem_out);
  
  
   parameter RAM_WIDTH = 32;
   parameter RAM_ADDR_BITS = 8;

   reg [RAM_WIDTH-1:0] ram [(2**RAM_ADDR_BITS)-1:0];
   reg [RAM_WIDTH-1:0] out1, out2;


   //  The following code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
      $readmemh("<data_file_name>", ram, <begin_address>, <end_address>);

   always @(posedge clk) begin
         if (wr_en)
            ram [addr] <= data_in;
          else
            mem_out <= ram[addr];
   end
						
						
						 output        mem_write_M, // write enable for data memory
            output [31:0] alu_out_M,  // data memory address
            output [31:0] write_data_M, // write data
            input  [31:0] read_data_M, // rread data
            input         inst_mem_ack_F, data_mem_ack_M); // acknowledges
