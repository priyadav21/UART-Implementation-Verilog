module Top_Module_UART(input [7:0]data_in,
                       input rx_in,
							        reset,
									  clk,
									  tx_start,
							  input [1:0]baud_select,
						   output  tx_out,
						   output  [7:0]data_out);
wire tx_out;						
wire baud_out;						
Baud_generator B1(.clk(clk),
                  .reset(reset),
						.baud_select(baud_select),
						.baud_out(baud_out));

Transmitter_module T1(.data_in(data_in),
                   .tx_start(tx_start),
						 .clk(baud_out),.reset(reset),
						 .tx_out(tx_out));
						 
						 
Receiver_module R1(.rx_in(/*tx_out*/rx_in),
                   .clk(baud_out),
						 .reset(reset),
						 .data_out(data_out));

endmodule
