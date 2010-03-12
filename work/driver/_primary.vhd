library verilog;
use verilog.vl_types.all;
entity driver is
    generic(
        D_ME            : string  := "test1.hex";
        I_ME            : string  := "test1.hex";
        TEST_FILE       : string  := "test.txt"
    );
end driver;
