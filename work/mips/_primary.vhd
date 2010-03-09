library verilog;
use verilog.vl_types.all;
entity mips is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc_F            : out    vl_logic_vector(31 downto 0);
        inst_F          : in     vl_logic_vector(31 downto 0);
        mem_write_M     : out    vl_logic;
        alu_out_M       : out    vl_logic_vector(31 downto 0);
        write_data_M    : out    vl_logic_vector(31 downto 0);
        read_data_M     : in     vl_logic_vector(31 downto 0);
        inst_mem_ack_F  : in     vl_logic;
        data_mem_ack_M  : in     vl_logic
    );
end mips;
