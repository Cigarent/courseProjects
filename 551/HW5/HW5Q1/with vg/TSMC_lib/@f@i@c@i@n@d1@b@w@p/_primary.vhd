library verilog;
use verilog.vl_types.all;
entity FICIND1BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        CIN             : in     vl_logic;
        S               : out    vl_logic;
        CO              : out    vl_logic
    );
end FICIND1BWP;
