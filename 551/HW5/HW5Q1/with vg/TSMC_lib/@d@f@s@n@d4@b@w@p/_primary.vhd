library verilog;
use verilog.vl_types.all;
entity DFSND4BWP is
    port(
        D               : in     vl_logic;
        CP              : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFSND4BWP;
