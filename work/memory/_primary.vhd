library verilog;
use verilog.vl_types.all;
entity memory is
    generic(
        RAM_FILE        : string  := "test.mem";
        RAM_WIDTH       : integer := 32;
        RAM_ADDR_BITS   : integer := 8
    );
    port(
        clk             : in     vl_logic;
        wr_en           : in     vl_logic;
        addr            : in     vl_logic_vector(7 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        mem_out         : out    vl_logic_vector(31 downto 0);
        rd_ack          : out    vl_logic
    );
end memory;
