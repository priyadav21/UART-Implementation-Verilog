module Top_module_1(input clk,
                          reset,
								  tx_start,
						  input [7:0]data_in,
						  input [1:0]baud_select,
						  output [6:0]cathode_value,
						  output [3:0]anode_value  );
						  
wire [7:0]data_out;

Top_Module_UART U1(.data_in(data_in),
                   .clk(clk),
						 .reset(~reset),
						 .tx_start(tx_start),
						 .baud_select(baud_select),
						 .data_out(data_out));
						 
Binary_to_7segment Bts(.Binary(data_out),
                       .clk(clk),
							  .reset(~reset),
							  .cathode_data(cathode_value),
							  .anode_value(anode_value));


endmodule
