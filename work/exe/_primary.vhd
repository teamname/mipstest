library verilog;
use verilog.vl_types.all;
entity exe is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        alu_src_E       : in     vl_logic;
        luiE            : in     vl_logic;
        md_start_E      : in     vl_logic;
        alu_out_sel     : in     vl_logic_vector(1 downto 0);
        forward_a_E     : in     vl_logic_vector(1 downto 0);
        forward_b_E     : in     vl_logic_vector(1 downto 0);
        alu_cnt_E       : in     vl_logic_vector(2 downto 0);
        src_a_E         : in     vl_logic_vector(31 downto 0);
        src_b_E         : in     vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        alu_out_M       : in     vl_logic_vector(31 downto 0);
        sign_imm_E      : in     vl_logic_vector(31 downto 0);
        pc_E            : in     vl_logic_vector(31 downto 0);
        src_b_out_E     : out    vl_logic_vector(31 downto 0);
        alu_out_E       : out    vl_logic_vector(31 downto 0);
        of_E            : out    vl_logic;
        md_run_E        : out    vl_logic
    );
end exe;
