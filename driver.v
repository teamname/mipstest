`timescale 1ns / 1ps;
module driver();
  
  parameter D_ME = "data.txt"; //data mem
  parameter I_ME = "fib.txt"; //instr mem
  parameter TEST_FILE = "test.txt"; //address in hex <SPACE> 
  //expected value in decimal
  integer TEST_SZ;
  reg [9:0] inst_in;
  reg [7:0] data_in;
  wire [31:0] inst_out, data_out;
  wire [9:0] spx;
  wire [8:0] spy;
  wire [4:0] spsel;
  wire spattr, sppos, spvis, bgch, ftch, ftcl, ften;
  wire [10:0] ftaddr;
  wire [3:0] ftdat;
  wire [1:0] bg;
  reg clk;
  reg rst;
  
  integer k; //loop
  //test addr array
  reg [7:0] ins [100:0];
  
  //expected output array
  reg [31:0] outs [100:0]; 


  //file stuff
  integer file_handle, num_bytes_in_line;

  toplevel #(D_ME, I_ME, 8, 10) DUT (clk, rst, inst_in, data_in, inst_out, data_out, spx, spy, spsel, spattr,
                sppos, spvis, bgch, ftch, ftcl, ften, ftaddr, ftdat, bg); //instantiate module
  
  always
    forever #10 clk = ~clk; //create clock
  initial begin
    //setup test data from file
  clk = 0;
  file_handle = $fopen(TEST_FILE,"r");
  TEST_SZ = 0;
    while(!$feof(file_handle)) begin
      num_bytes_in_line = $fscanf(file_handle,"%h %d\n" ,ins[TEST_SZ], outs[TEST_SZ]);//make fscanf!!
      TEST_SZ = TEST_SZ + 1;
      //$display("line: %h %h \n", ins[k-1], outs[k-1]);
    end 
    
      
    end    
    
  initial begin
    //initials
    rst = 1'b1;
    data_in = 8'hed;
    inst_in = 10'h004;
    #10 data_in = 8'h00;
  
    
    #60 rst = 1'b0;
    #100000;
    data_in = 8'h14;
    #10;
    data_in = 8'h01;
    #10;
    for(k = 0; k < TEST_SZ; k = k + 1) begin
      data_in = ins[k];
      #10;
      if(data_out != outs[k])
        $display("Unexpected output for k = %d, addr: %h, expected: %d, got : %d", k, data_in, outs[k], data_out);
      else
        $display("Output for k = %d was okay!addr: %h, val: %d", k, ins[k], data_out); 
    end
    #10;
    
    $stop;
  end //end initial
  
  
  
endmodule
