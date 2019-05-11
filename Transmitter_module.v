module Transmitter_module(input [7:0]data_in,
                          input tx_start,
								         clk,
											reset,
								  output tx_out);
	
	
wire load,shift,parity_bit,piso_out;
wire [1:0]mux_sel;


								  
FSM_Tx F1(  .tx_start(tx_start),
            .load(load),
				.shift(shift),
				.reset(reset),
				.mux_sel(mux_sel),
				.clk(clk));

				
Parity_generator P1(  .data_in(data_in),
                      .load(load),
							 .clk(clk),
							 .reset(reset),
							 .parity_bit(parity_bit));

							 
PISO P2(  .data_in(data_in),
          .load(load),
			 .reset(reset),
			 .clk(clk),
			 .shift(shift),
			 .piso_out(piso_out));

			 
Mux_4_1 M1(  .i0(1'b0),
             .i1(piso_out),
				 .i2(parity_bit),
				 .i3(1'b1),
				 .s(mux_sel),
				 .z(tx_out));


endmodule
