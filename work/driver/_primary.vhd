library verilog;
use verilog.vl_types.all;
entity driver is
    generic(
        D_ME            : string  := "data.txt";
        I_ME            : string  := "test_001.dat";
        TEST_FILE       : string  := "test.txt"
    );
end driver;
