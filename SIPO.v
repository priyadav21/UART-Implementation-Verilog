module SIPO(input  rx_in,
            input  clk,
				       shift,
						 reset,
				output [7:0]data_in);
reg [7:0]temp_reg;
				
always@(posedge clk,negedge reset)
begin
  if(!reset)
       temp_reg<=0;
  else if(shift)
          temp_reg<={rx_in,temp_reg[7:1]};
	   // else 
		  //  temp_reg<=0;
end	  
assign data_in=temp_reg;

endmodule
