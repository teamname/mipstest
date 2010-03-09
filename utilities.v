`timescale 1 ns / 1 ps



module compare_equal #(parameter WIDTH = 32)
             (input [WIDTH-1:0] a, b,
              output            eq);

  assign  eq = (a == b);
endmodule

module compare_to_zero #(parameter WIDTH = 32)
                 (input [WIDTH-1:0]  a,
                  output        eq);

  assign  eq = (a == 0);
endmodule

module ncompare_to_zero #(parameter WIDTH = 32)
                 (input [WIDTH-1:0]  a,
                  output        eq);

  assign  eq = (a != 0);
endmodule

module compare_gt_zero #(parameter WIDTH = 32)
                 (input [WIDTH-1:0] a,
                  output       eq);

  assign  eq = ~a[WIDTH-1] & (a[WIDTH-2:0] !== 0);
endmodule

module compare_lt_zero #(parameter WIDTH = 32)
                 (input [WIDTH-1:0] a,
                  output       eq);

  assign  eq = a[WIDTH-1];
endmodule

module shift_left_2(input  [31:0] a,
           output [31:0] y);

  
  assign  y = {a[29:0], 2'b00};
endmodule


module extend_sign #(parameter INPUT = 16, OUTPUT = 32)
               (input  [INPUT-1:0] a,
               input  enable,
               output [OUTPUT-1:0] y);
               
  wire extension;
  
  assign  extension = (enable ? a[INPUT-1] : 0);
  assign  y = {{OUTPUT-INPUT{extension}}, a};
endmodule


module flip_flop #(parameter WIDTH = 8)
              (input                  clk, reset, clear,
               input      [WIDTH-1:0] d, 
               output reg [WIDTH-1:0] q);

  reg [WIDTH-1:0] master;

  always @(clk, reset, d, clear)
    if (clk)  master <= reset ? 0 : (clear ? 0 : d);

  always @(clk, master)
    if (clk)  q <= master;
endmodule

module flip_flop_enable_clear #(parameter WIDTH = 32)
                 (input                  clk, reset,
                  input                  en, clear,
                  input      [WIDTH-1:0] d, 
                  output reg [WIDTH-1:0] q);
 
  reg [WIDTH-1:0] master;

  always @(clk, reset, en, d, q, clear)
    if (clk)  master <= reset ? 0 : (clear ? 0 : (en ? d : q));

  always @(clk, master)
    if (clk)  q <= master;
endmodule

module flip_flop_enable #(parameter WIDTH = 32)
                (input                  clk, reset,
                 input                  en,
                 input      [WIDTH-1:0] d, 
                 output reg [WIDTH-1:0] q);
 
  reg [WIDTH-1:0] master;

  always @(clk, reset, en, d, q)
    if (clk)  master <= reset ? 0 : (en ? d : q);

  always @(clk, master)
    if (clk)  q <= master;
endmodule

module flip_flop_no_reset #(parameter WIDTH = 32)
               (input                  clk,
                input                  en,
                input      [WIDTH-1:0] d, 
                output reg [WIDTH-1:0] q);
 
  reg [WIDTH-1:0] master;

  always @(clk, en, d, q)
    if (clk)  master <= en ? d : q;

  always @(clk, master)
    if (clk)  q <= master;
endmodule

module flip_flop_reset #(parameter WIDTH = 32)
              (input                  clk, reset,
               input      [WIDTH-1:0] d, 
               output reg [WIDTH-1:0] q);
 
  reg [WIDTH-1:0] master;

  always @(clk, reset, d)
    if (clk)  master <= reset ? 0 : d;

  always @(clk, master)
    if (clk)  q <= master;
endmodule


module mux_2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] d0, d1, 
              input              s, 
              output [WIDTH-1:0] y);

  assign  y = s ? d1 : d0; 
endmodule

module mux_3 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] d0, d1, d2,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

  assign  y = s[1] ? d2 : (s[0] ? d1 : d0); 
endmodule

module mux_4 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] d0, d1, d2, d3,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

  assign  y = s[1] ? (s[0] ? d3 : d2)
                     : (s[0] ? d1 : d0); 
endmodule

module mux_5 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] d0, d1, d2, d3, d4,
             input   [2:0]  s,
                output  [WIDTH-1:0] y);

  // 101 = d4; 100 = d3; 010 = d2; 001 = d1; 000 = d0

  assign  y = s[2] ? (s[0] ? d4 : d3)
                     : (s[1] ? d2 : (s[0] ? d1 : d0));
endmodule


module decoder_2 (input  [1:0] x,
             output [3:0] y);

  assign  y = (x[0] ? (x[1] ? 4'b1000 : 4'b0010)
                      : (x[1] ? 4'b0100 : 4'b0001));
endmodule

module decoder_1 (input        x,
             output [1:0] y);

  assign  y = (x ? 2'b01 : 2'b10);
  endmodule
module and2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b,
              output [WIDTH-1:0] y);

  assign  y = a & b;
endmodule

module xor2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b,
              output [WIDTH-1:0] y);

  assign  y = a ^ b;
endmodule

module increment #(parameter WIDTH = 32)
            (input  [WIDTH-1:0] a,
             output [WIDTH-1:0] y,
             output             cout);
 
  assign  {cout, y} = a + 1'b1;
endmodule

module is_zero #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a,
              output             y);
 
  assign  y = ~|a;
endmodule

module priority_encoder_8 (input       [7:0]  a,
                  output reg [2:0]  y);
   always @ ( * )
    casex(a)
      // rearrange to set priority.
      8'b1xxxxxxx : y <= 3'b000;
      8'b01xxxxxx : y <= 3'b001;
      8'b001xxxxx : y <= 3'b010;
      8'b0001xxxx : y <= 3'b011;
      8'b00001xxx : y <= 3'b100;
      8'b000001xx : y <= 3'b101;
      8'b0000001x : y <= 3'b110;
      8'b00000001 : y <= 3'b111;
      default    : y <= 3'bxxx;
    endcase
endmodule

module tri_state_buf #(parameter WIDTH = 32)
               (input en,
                input [WIDTH-1:0] a,
                output [WIDTH-1:0] y);
    wire [WIDTH-1:0] highz;
    assign highz = {WIDTH{1'bz}};
    assign  y = en ? a : highz;        
endmodule

// Complementary mux
module cmux_2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] d0, d1, 
              input              s,
              output [WIDTH-1:0] y1,
              output [WIDTH-1:0] y2);

  assign  y1 = s ? d1 : d0;
  assign  y2 = s ? d0 : d1;
endmodule


