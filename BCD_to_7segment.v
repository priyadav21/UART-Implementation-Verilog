module BCD_to_7segment(input [3:0]BCD,
                       output [6:0]cathode,//6 to 0 => g to a
							  output anode);
always@(BCD)
  begin
  segment_task(BCD,cathode,anode);
  
  end

task segment_task(input [3:0]BCD,
                    output [6:0]cathode,
						  output anode);
  begin
   anode=1'b0;
     case(BCD)
	                        //gfedcba
		  4'b0000 : cathode=7'b0111111;
		  4'b0001 : cathode=7'b0000110;
		  4'b0010 : cathode=7'b1011011;
		  4'b0011 : cathode=7'b1001111;
		  4'b0100 : cathode=7'b1100110;
		  4'b0101 : cathode=7'b1101101;
		  4'b0110 : cathode=7'b1111101;
		  4'b0111 : cathode=7'b0000111;
		  4'b1000 : cathode=7'b1111111;
		  4'b1001 : cathode=7'b1101111;
		  default : cathode=7'd0;
		  
	  endcase
  end
endtask						  

endmodule
