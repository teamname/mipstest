library verilog;
use verilog.vl_types.all;
entity toplevel_s is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_out        : out    vl_logic_vector(31 downto 0);
        inst_out        : out    vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        inst_in         : in     vl_logic_vector(9 downto 0)
    );
end toplevel_s;
