library verilog;
use verilog.vl_types.all;
entity SEDFKCND1BWP is
    port(
        SI              : in     vl_logic;
        D               : in     vl_logic;
        E               : in     vl_logic;
        SE              : in     vl_logic;
        CP              : in     vl_logic;
        CN              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end SEDFKCND1BWP;
