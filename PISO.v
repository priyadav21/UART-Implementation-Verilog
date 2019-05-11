module PISO(input [7:0]data_in,
            input  clk,
						 load,
						 shift,
						 reset,
				output  piso_out);
				
reg [7:0]temp_reg;
	

always@(posedge clk,negedge reset)
   begin
	  if(!reset)
	     temp_reg<=8'b00000000;
     else  if(load)
              temp_reg<=data_in;
           else if(shift)
		            begin
					     temp_reg<={2'b0,temp_reg[7:1]};
					   end 
       	 
	end
	assign piso_out=temp_reg[0];

endmodule
