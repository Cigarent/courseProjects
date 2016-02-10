module add8bit_tb();

reg [7:0] stm_a,stm_b; // used as stimulus for a,b
reg stm_cin; // used as stimulus for cin
wire [7:0] sum_mon; // used to monitor sum
wire cout_mon,ov_mon; // used to monitor cout & ov

add8bit iDUT(.a(stm_a), .b(stm_b), .cin(stm_cin),.cout(cout_mon), .sum(sum_mon),.ov(ov_mon));

initial begin
stm_a = 8'hA5;
stm_b = 8'h5A;
stm_cin = 0; // result should be FF
#5; // wait 5 time units
stm_a = 8'hFF;
stm_b = 8'h11;
stm_cin = 0; // result should be 00
#5; // wait 5 time units
end

endmodule