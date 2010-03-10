module toplevel(input clk, reset, 
                input [9:0] inst_in, input [7:0] data_in, output reg [31:0] inst_out, output reg [31:0] data_out); //test signals
  parameter D_MEM = "test";
  parameter I_MEM = "test";
  assign disabled = 1'b0;
  
  mips proc (clk, reset, instr_addr, instr_data, wr_en, mem_addr, wr_data, mem_data, instr_ack, mem_ack);
  
  assign instr_addr_in = instr_addr [9:0];
  assign data_addr_in = mem_addr [7:0]; 
  
  memory #(D_MEM, 32, 8) data (clk, wr_en, data_in, wr_data, mem_data, mem_ack, data_in, data_out); 

  memory #(I_MEM, 32, 10) instr (clk, disabled, instr_addr_in, 32'h0000, instr_data, instr_ack, inst_in, inst_out);
  
endmodule