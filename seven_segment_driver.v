`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:32 07/05/2018 
// Design Name: 
// Module Name:    seven_segment_driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seven_segment_driver(input clk,
                                  reset,
									 input [3:0]a,b,c,d,
									 output reg [6:0]seg_data,
									 output reg [3:0]AN_value );
reg [19:0]count;
									 
always@(posedge clk, negedge reset)
  begin
     if(!reset)
	    begin
		    count<=0;
		    AN_value<=4'b0000;
		    seg_data<=7'b0000001;
		 end
	 else if(count==20'b11111111111111111111)
	         count<=0;
	      else
	       begin
		     count<=count+1;
			  case(count[19:18])
			     2'b00 : begin
				             AN_value<=4'b1110;
								 seg_data<=bcd_to_7segment(d);
                      end							 
				  2'b01 : begin
				             AN_value<=4'b1101;
								 seg_data<=bcd_to_7segment(c);
                      end	
			     2'b10 : begin
				             AN_value<=4'b1011;
								 seg_data<=bcd_to_7segment(b);
                      end	
				  2'b11 : begin
				             AN_value<=4'b0111;
								 seg_data<=bcd_to_7segment(a);
                      end	
			   endcase
		   end
  end

function [6:0]bcd_to_7segment(input [3:0]bcd);
   begin
	  case(bcd)                     // abcdefg
	      4'b0000 : bcd_to_7segment=7'b0000001;			
	      4'b0001 : bcd_to_7segment=7'b1001111;			
	      4'b0010 : bcd_to_7segment=7'b0010010;			
	      4'b0011 : bcd_to_7segment=7'b0000110;			
	      4'b0100 : bcd_to_7segment=7'b1001100;			
	      4'b0101 : bcd_to_7segment=7'b0100100;			
	      4'b0110 : bcd_to_7segment=7'b0100000;			
	      4'b0111 : bcd_to_7segment=7'b0001111;			
	      4'b1000 : bcd_to_7segment=7'b0000000;			
	      4'b1001 : bcd_to_7segment=7'b0000100;
         default : bcd_to_7segment=7'b1111111;			
	  endcase
	end
endfunction

endmodule
