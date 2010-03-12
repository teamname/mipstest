`timescale 1ns / 1ps;
module driver();
  
  parameter D_ME = "test1.hex"; //data mem
  parameter I_ME = "test1.hex"; //instr mem
  parameter TEST_FILE = "test.txt";
  integer TEST_SZ;
  reg [9:0] inst_in;
  reg [7:0] data_in;
  wire [31:0] inst_out, data_out;
  reg clk;
  reg rst;
  
  integer k; //loop
  //test addr array
  reg [7:0] ins [100:0];
  
  //expected output array
  reg [31:0] outs [100:0]; 


  //file stuff
  integer file_handle, num_bytes_in_line;

  toplevel #(D_ME, I_ME) DUT (clk, rst, inst_in, data_in, inst_out, data_out); //instantiate module
  
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
    
    for(k = TEST_SZ; k < 101; k = k + 1)
      begin
        ins[k] = 0;
        outs[k] = 0;
      end
      
    end    
    
  initial begin
    //initials
    rst = 1'b1;
    data_in = 8'h00;
    inst_in = 10'h000;
  
    
    #55 rst = 1'b0;
    #100000;
    
    for(k = 0; k < 100; k = k + 1) begin
      data_in = k;
      if(data_out != outs[k])
        $display("Unexpected output for k = %d, addr: %h, expected: %d, got : %d", k, ins[k], outs[k], data_out);
      else
        $display("Output for k = %d was okay!addr: %h, val: %d", k, k, data_out); 
    end
    
    $stop;
  end //end initial
  
  
  
endmodule
