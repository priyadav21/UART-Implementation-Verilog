module Start_bit_checker(input rx_in,
                         output reg fsm_enable);

always@(*)
   if(!rx_in)
	   fsm_enable=1'b1;
	else
	   fsm_enable=1'b0;

endmodule
