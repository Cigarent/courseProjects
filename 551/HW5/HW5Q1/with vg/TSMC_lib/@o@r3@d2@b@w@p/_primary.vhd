library verilog;
use verilog.vl_types.all;
entity OR3D2BWP is
    port(
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        A3              : in     vl_logic;
        Z               : out    vl_logic
    );
end OR3D2BWP;