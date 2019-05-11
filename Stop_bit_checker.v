module Stop_bit_checker(input rx_in,
                              check_stop,
										clk,
										reset,
								input [7:0]data_in,
								//output reg stop_bit,
								output reg [7:0]data_out);

always@(posedge clk, negedge reset)
  if(!reset)
    data_out<=0;
	else    
     if(check_stop&rx_in)
	    //begin 
	        //stop_bit<=rx_in;
     		  //if(rx_in)
			     data_out<=data_in;
				//else
				  // data_out<=0;
		 //end
	//else
	  // data_out<=0;
endmodule
