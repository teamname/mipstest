library verilog;
use verilog.vl_types.all;
entity toplevel is
    generic(
        D_MEM           : string  := "data.txt";
        I_MEM           : string  := "fib.txt";
        D_W             : integer := 8;
        I_W             : integer := 10
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        inst_in         : in     vl_logic_vector(9 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        inst_out        : out    vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end toplevel;
