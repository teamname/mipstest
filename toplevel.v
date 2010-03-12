module toplevel(input clk, reset, 
                input [9:0] inst_in, input [7:0] data_in, output [31:0] inst_out, output [31:0] data_out); //test signals
  parameter D_MEM = "test";
  parameter I_MEM = "test";
  wire [9:0] instr_addr_in;
  wire [7:0] data_addr_in;
  wire [31:0] instr_addr;
  wire [31:0] mem_addr;
  wire [31:0] mem_data; 
  wire [31:0] instr_data;
  wire [31:0] wr_data;
  wire [31:0] inst_outer;
  wire [31:0] data_outer;
  
  mips proc (clk, reset, instr_addr, instr_data, wr_en, mem_addr, wr_data, mem_data, instr_ack, mem_ack);
  

  assign instr_addr_in = instr_addr[9:0];
 
  assign data_addr_in = mem_addr[7:0]; 
  
  memory #(8, D_MEM) data (clk, wr_en, data_addr_in, wr_data, mem_data, mem_ack, data_in, data_outer); 

  memory #(10, I_MEM) instr (clk, 1'b0, instr_addr_in, 32'h0000, instr_data, instr_ack, inst_in, inst_outer);
  
  assign inst_out = inst_outer;
  assign data_out = data_outer;
  
endmodule