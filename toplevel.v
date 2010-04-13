module toplevel(input clk, reset, 
                input [9:0] inst_in, input [7:0] data_in, output [31:0] inst_out, output [31:0] data_out,  //test signals
                output [9:0] sprite_x, output [8:0] sprite_y, output [4:0] sprite_sel, 
  output sprite_attr, sprite_pos, sprite_vis, bck_ch_active,
  output font_ch_active, font_clr, font_en,
  output [10:0] font_addr,
  output [3:0] font_data,
  output [1:0] bck, input [3:0] interrupts,
  output [4:0] audioVol, output [3:0] audioSel, output audioEn);
  
  parameter D_MEM = "data.txt";
  parameter I_MEM = "fib.txt";
  parameter D_W = 8;
  parameter I_W = 10;
  wire [9:0] instr_addr_in;
  wire [7:0] data_addr_in;
  wire [31:0] instr_addr;
  wire [31:0] mem_addr;
  wire [31:0] mem_data; 
  wire [31:0] instr_data;
  wire [31:0] wr_data;
  wire [31:0] inst_outer;
  wire [31:0] data_outer;
  wire stall_mem;
  
  mips proc (clk, reset, instr_addr, instr_data, wr_en, mem_addr, wr_data, mem_data, instr_ack, mem_ack,
  sprite_x,  sprite_y, sprite_sel,
   sprite_attr, sprite_pos, sprite_vis, bck_ch_active,
   font_ch_active, font_clr, font_en,
    font_addr,
    font_data,
   bck, interrupts, audioVol, audioSel, audioEn, stall_mem);
  

  assign instr_addr_in = instr_addr[9:0];
 
  assign data_addr_in = mem_addr[7:0]; 
  
  memory #(D_W, D_MEM) data (clk, wr_en, data_addr_in, wr_data, mem_data, mem_ack, data_in, data_outer, 1'b0); 

  memory #(I_W, I_MEM) instr (clk, 1'b0, instr_addr_in, 32'h0000, instr_data, instr_ack, inst_in, inst_outer, stall_mem);
  
  assign inst_out = inst_outer;
  assign data_out = data_outer;
  
endmodule