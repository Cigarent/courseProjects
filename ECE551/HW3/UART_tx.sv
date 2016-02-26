module UART_tx(clk, rst_n, TX, trmt, TX_DATA, tx_done);

input clk, rst_n, trmt;
input [7:0] TX_DATA;
output logic TX, tx_done;

typedef enum reg[1:0] {IDLE, LOAD, TRAN} UART_state;
UART_state state, next_state;

logic [3:0] bit_cnt;
logic [11:0] baud_cnt;
logic [9:0] tx_shift_reg;
logic load, shift, transmitting;
logic set_done, clr_done;

//bit counter
always @(posedge clk) begin
	if (load)
		bit_cnt <= 4'b0000;
	else if(shift)
		bit_cnt <= bit_cnt + 1;
	else
		bit_cnt <= bit_cnt;
	end
		
//baud_cnt module
always @(posedge clk) begin
	if (load)
		baud_cnt <= 12'b000000000000;
	else if (transmitting)
		baud_cnt <=  baud_cnt +1;
	else
		baud_cnt = baud_cnt;
		//how to get shift
	end

	assign shift = (baud_cnt==12'b101000101100)? 1:0;

//shift module	
always @(posedge clk, negedge rst_n) begin
	if (!rst_n)
		tx_shift_reg <= 9'b000000001;
	else if (load)
		tx_shift_reg <= {1'b1, TX_DATA, 1'b0};
	else if (shift)
		tx_shift_reg <= tx_shift_reg>>1;
	else
		tx_shift_reg <= tx_shift_reg;
	end

	assign TX = (state == IDLE)? 1'b1:tx_shift_reg[0];
//output logic
always @(posedge clk, negedge rst_n, set_done, clr_done) begin
	if (!rst_n)
		tx_done <= 1'b0;
	else if (set_done==1'b1)
		tx_done <= 1'b1;
	else if (clr_done==1'b1)
		tx_done <= 1'b0;
	else
		tx_done <= tx_done;
end
	
//state machine 
always @(posedge clk, negedge rst_n) begin
	if (!rst_n)
		state <= IDLE;
	else
		state <= next_state;
	end

//next_state logic	
always_comb begin
	set_done = 1'b0;
	clr_done = 1'b0;
	load = 1'b0;
	transmitting = 1'b0;
	
	case(state)
	IDLE:
		if (trmt) begin
			next_state = LOAD;
			clr_done = 1'b1;
			set_done = 1'b0;
			load = 1'b1;
		end
		else begin
			next_state = IDLE;
			load  =1'b0;
			transmitting = 1'b0;
		end
	LOAD:
		if (shift) begin
			next_state = TRAN;
			transmitting = 1'b1;
		end
		else
			next_state = LOAD;
	TRAN:
		if (bit_cnt==4'b1001) begin
			set_done=1'b1;
			next_state=IDLE;
		end
		else begin
			next_state = LOAD;
		end
	default:
		next_state = IDLE;
	endcase
end	

endmodule
