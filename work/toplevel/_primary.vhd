library verilog;
use verilog.vl_types.all;
entity toplevel is
    generic(
        D_MEM           : string  := "test";
        I_MEM           : string  := "test"
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end toplevel;
