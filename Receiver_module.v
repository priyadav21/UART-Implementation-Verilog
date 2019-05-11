module Receiver_module(input rx_in,
                             clk,
									  reset,
                       output [7:0]data_out );
							  
wire fsm_enable,
     parity_error,
	  //stop_bit,
     shift,
	  parity_check,
	  check_stop;
wire [7:0]data_in_pc,data_in_sb;	  

Start_bit_checker S1(.rx_in(rx_in),
							.fsm_enable(fsm_enable));	

							
FSM_Rx F1(.fsm_enable(fsm_enable),
          .parity_error(parity_error),
			// .stop_bit(stop_bit),
			 .clk(clk),
			 .reset(reset),
			 .shift(shift),
			 .check_parity(parity_check),
			 .check_stop(check_stop));
			 
			 
Parity_checker_odd P1(.data_in(data_in_pc),
                      .rx_in(rx_in),
							 .reset(reset),
							 .clk(clk),
							 .parity_check(parity_check),
							 .parity_error(parity_error),
							 .data_out(data_in_sb));
SIPO S2(.rx_in(rx_in),
        .shift(shift),
		  .clk(clk),
		  .reset(reset),
		  .data_in(data_in_pc));
		  
Stop_bit_checker S3(.rx_in(rx_in),
                    .clk(clk),
						  .reset(reset),
                    .check_stop(check_stop),
						  //.stop_bit(stop_bit),
						  .data_in(data_in_sb),
						  .data_out(data_out));

endmodule
