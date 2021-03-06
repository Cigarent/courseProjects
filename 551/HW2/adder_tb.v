module adder_4b_tb();

reg [4:0] A, B;
reg [1:0]cin;
reg [4:0] sum_gold;
reg cout_gold;
wire cout;
wire [3:0] sum;
reg fail; // fail bit


adder_4b iDUT(.cout(cout), .sum(sum), .A(A), .B(B), .cin(cin));
always@(*)
	{cout_gold, sum_gold} = A + B + cin; // behavior


initial // behavioral
begin
	A = 4'b0000;
	B = 4'b0000;
	cin = 1'b1;
	fail = 1'b0;
	#10;

	for (cin = 0; cin < 2; cin=cin+1)
	begin
		for (A = 0; A < 16; A=A+1)
		begin
			for (B = 0; B < 16; B=B+1)
			begin
				if (cout_gold == cout && sum_gold == sum)
					#1 $display ("Passed");
				else
				begin
					if (sum_gold == 16 )
					begin
						$display("all passed");
						$stop;
					end
					fail = 1'b1; // fail bit set to 1
					$display ("Err");
					$display ("cout_gold = %b & cout = %b", cout_gold, cout);		
					$display ("sum_gold = %b & sum = %b", sum_gold, sum);
					$stop;	
				end
			end
		end
	end
	$display("all passed");
	$stop;
end
endmodule 