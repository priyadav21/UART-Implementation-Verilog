module Parity_checker_odd(input [7:0]data_in,
                          input rx_in,
								        parity_check,
											clk,
										  reset,
								  output reg parity_error,
								  output reg [7:0]data_out);

always@(posedge clk, negedge reset)
  begin
   if(!reset)
	 begin
	   data_out<=0;
		parity_error<=0;
	 end
	else
      begin
   		if(parity_check)
	         begin      
	            if(^data_in==rx_in) 
		            begin 
                    parity_error<=1;				  
				        data_out<=data_in;
			            end
		         else
      				  begin
                      parity_error<=0;
							 data_out<=0;
                    end 
		      end
			 else
      		  begin
                    parity_error<=0;
						  data_out<=data_out;
               end 
          			 
      end
  end  
endmodule
