`timescale 1 ns / 1 ps
module fetch(input clk, reset, stall,
                  input [1:0] pc_sel,
                  input [31:0] pc_branch,
                  input [3:0] interrupts,
                  input rti,

                  output [31:0] pc,

                  output [31:0] pc_plus_4);

  wire [31:0] pcnextF1, pcnextF2, pcnextF;
  wire [31:0] epc;
  wire int_en, int_en1, inter0, inter1, inter2, inter3;
  reg sr;
  wire [3:0] reset_l, inter_rst;
  
  parameter RESET_ADDRESS = 32'h00000000;
  parameter INTERRUPT_ADDRESS1 = 32'h00000000;
  parameter INTERRUPT_ADDRESS2 = 32'h00000000;
  parameter INTERRUPT_ADDRESS3 = 32'h00000000;
  parameter INTERRUPT_ADDRESS4 = 32'h00000000;
  parameter EXCEPTION_ADDRESS = 32'h00000100;
  
  assign int_en = (|interrupts) & sr &~stall;
  
   
mux_4 #(32) pcmux(RESET_ADDRESS, EXCEPTION_ADDRESS ,
                    pc_plus_4, pc_branch, pc_sel, pcnextF1);
 

  assign pcnextF2 = !int_en1 ? pcnextF1 :
                  (inter0 ? INTERRUPT_ADDRESS1 :
                  (inter1 ? INTERRUPT_ADDRESS2 :
                  (inter2 ? INTERRUPT_ADDRESS3 :
                  INTERRUPT_ADDRESS4 )));
  
  assign pcnextF = rti ? epc : pcnextF2;
                  
  flip_flop_enable #(32) PC(clk,reset, ~stall, pcnextF, pc);
  
  flip_flop_enable #(32) EPC(clk,reset, int_en1, pcnextF1, epc);
  
  //stores what interrupt we are handling
  flip_flop_enable #(4) intrst (clk, reset, int_en1 & sr, {(inter3 & ~inter2 & ~inter0 &~inter1),(inter2 & ~inter0 &~inter1), (inter1 & ~inter0), inter0}, inter_rst);
  
  
  assign reset_l = {inter_rst[3] & rti, inter_rst[2] & rti, inter_rst[1] & rti, inter_rst[0] & rti}; //reset for interrupt latches
  
  intlatch int0 (inter0, interrupts[0], reset_l[0]|reset); //latches in interrupt
  intlatch int1 (inter1, interrupts[1], reset_l[1]|reset);
  intlatch int2 (inter2, interrupts[2], reset_l[2]|reset);
  intlatch int3 (inter3, interrupts[3], reset_l[3]|reset);
  
  assign int_en1 = (inter0 | inter1 | inter2 | inter3) & sr & (!stall);
  
  always@ (posedge clk)
    if(reset | rti)
      sr = 1'b1;
    else
      if(int_en1)
        sr = 1'b0;
      else
        sr = sr;
  
   assign pc_plus_4 = pc + 1;


endmodule
