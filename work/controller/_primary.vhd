library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        opD             : in     vl_logic_vector(5 downto 0);
        functD          : in     vl_logic_vector(5 downto 0);
        rsD             : in     vl_logic_vector(4 downto 0);
        rtD             : in     vl_logic_vector(4 downto 0);
        stallD          : in     vl_logic;
        stallE          : in     vl_logic;
        stallM          : in     vl_logic;
        stallW          : in     vl_logic;
        flushE          : in     vl_logic;
        flushM          : in     vl_logic;
        aeqzD           : in     vl_logic;
        aeqbD           : in     vl_logic;
        agtzD           : in     vl_logic;
        altzD           : in     vl_logic;
        mdrunE          : in     vl_logic;
        alu_or_mem_E    : out    vl_logic;
        alu_or_mem_M    : out    vl_logic;
        alu_or_mem_W    : out    vl_logic;
        data_mem_write_M: out    vl_logic;
        byte_repaet_M   : out    vl_logic;
        halfword_repaet_M: out    vl_logic;
        is_branch       : out    vl_logic;
        alu_b_sel       : out    vl_logic;
        is_unsinged_D   : out    vl_logic;
        sign_extend_en_M: out    vl_logic;
        regdstE         : out    vl_logic;
        rw_E            : out    vl_logic;
        rw_M            : out    vl_logic;
        rw_W            : out    vl_logic;
        is_jump         : out    vl_logic;
        jmp_based_on_reg: out    vl_logic;
        of_e            : out    vl_logic;
        alu_shift_md_sel: out    vl_logic_vector(1 downto 0);
        alu_cnt_E       : out    vl_logic_vector(2 downto 0);
        linkD           : out    vl_logic;
        luiE            : out    vl_logic;
        rd_src_D        : out    vl_logic;
        pc_src          : out    vl_logic_vector(1 downto 0);
        branch_src      : out    vl_logic_vector(1 downto 0);
        is_branch_or_jmp_E: out    vl_logic;
        no_valid_op_E   : out    vl_logic;
        dummy_E         : out    vl_logic;
        halfwordE       : out    vl_logic;
        hilodisableE    : out    vl_logic_vector(1 downto 0);
        hiloaccessD     : out    vl_logic;
        mdstartE        : out    vl_logic;
        hilosrcE        : out    vl_logic;
        spriteE         : out    vl_logic;
        fontE           : out    vl_logic;
        backgroundE     : out    vl_logic;
        posE            : out    vl_logic;
        attrE           : out    vl_logic;
        visiE           : out    vl_logic;
        cnt_int         : out    vl_logic;
        rti             : out    vl_logic
    );
end controller;
