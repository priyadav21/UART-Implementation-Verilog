module Binary_to_7segment(input [7:0]Binary,
                          input clk,
								        reset,
								  output [6:0]cathode_data,
								  output [3:0]anode_value );
								  
wire [11:0]BCD;

Binary_to_BCD btb(.binary(Binary),
                  .BCD(BCD));
						
seven_segment_driver btss(.clk(clk),
                          .reset(reset),
								  .a(4'b0000),
								  .b(BCD[11:8]),
								  .c(BCD[7:4]),
								  .d(BCD[3:0]),
								  .seg_data(cathode_data),
								  .AN_value(anode_value));


endmodule
