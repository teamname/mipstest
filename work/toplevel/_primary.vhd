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
        data_out        : out    vl_logic_vector(31 downto 0);
        sprite_x        : out    vl_logic_vector(9 downto 0);
        sprite_y        : out    vl_logic_vector(8 downto 0);
        sprite_sel      : out    vl_logic_vector(4 downto 0);
        sprite_attr     : out    vl_logic;
        sprite_pos      : out    vl_logic;
        sprite_vis      : out    vl_logic;
        bck_ch_active   : out    vl_logic;
        font_ch_active  : out    vl_logic;
        font_clr        : out    vl_logic;
        font_en         : out    vl_logic;
        font_addr       : out    vl_logic_vector(10 downto 0);
        font_data       : out    vl_logic_vector(3 downto 0);
        bck             : out    vl_logic_vector(1 downto 0)
    );
end toplevel;
