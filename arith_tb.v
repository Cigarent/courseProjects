module arith_tb();

reg [7:0] stm_a,stm_b;// used as stimulus for a,b
reg stm_sub; // used as stimulus for sub
wire [7:0] sum_mon; // used to monitor sum
wire cout_mon, ov_mon; // used to monitor cout & ov

arith iDUT(.a(stm_a), .b(stm_b), .sub(stm_sub), .sum(sum_mon),.ov(ov_mon));

initial begin

stm_a = 8'hA5;
stm_b = 8'h5A;
stm_sub = 0; // result should be FF
#15; // wait 5 time units
stm_a = 8'h11;
stm_b = 8'h11;
stm_sub = 0; // result should be 02
#15; // wait 5 time units
stm_a = 8'hA5;
stm_b = 8'h5A;
stm_sub = 0; // result should be FF
#15; // wait 5 time units
stm_a = 8'hFF;
stm_b = 8'h2;
stm_sub = 1; // result should be FD
#15; // wait 5 time units
stm_a = 8'hA5;
stm_b = 8'h5A;
stm_sub = 1; 
#15; // wait 5 time units
stm_a = 8'h01;
stm_b = 8'h01;
stm_sub = 1; 
#15; // wait 5 time units
stm_a = 8'hA5;
stm_b = 8'h5A;
stm_sub = 1; 
#15; // wait 5 time units
stm_a = 8'hFF;
stm_b = 8'h2;
stm_sub = 0; 
#15; // wait 5 time units

end

endmodule