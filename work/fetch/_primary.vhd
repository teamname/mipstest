library verilog;
use verilog.vl_types.all;
entity fetch is
    --generic(
      --RESET_ADDRESS   : integer type with unrepresentable value!
      --INTERRUPT_ADDRESS: integer type with unrepresentable value!
    --);
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        stall           : in     vl_logic;
        pc_sel          : in     vl_logic_vector(1 downto 0);
        pc_branch       : in     vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        pc_plus_4       : out    vl_logic_vector(31 downto 0)
    );
end fetch;
