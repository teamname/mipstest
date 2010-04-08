`timescale 1 ns / 1 ps
module fetch(input             clk,  reset, stall,
                  input  [1:0]      pc_sel,
                  input  [31:0]     pc_branch,

                  output [31:0]     pc, 

                  output  [31:0]     pc_plus_4);

  wire [31:0] pcnextF;

  parameter RESET_ADDRESS = 32'h00000000;
  parameter INTERRUPT_ADDRESS = 32'h00000100;
  
   
  mux_4 #(32)  pcmux(RESET_ADDRESS, INTERRUPT_ADDRESS,
                    pc_plus_4, pc_branch, pc_sel, pcnextF); 

  
  flip_flop_enable #(32) PC(clk,reset, ~stall, pcnextF, pc);
 // always@(posedge clk)
   assign  pc_plus_4 = pc  + 1;


endmodule
