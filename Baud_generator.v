module Baud_generator(input [1:0]baud_select,
                      input clk,
							        reset,
							 output reg baud_out);
							 
localparam baud_rate1=41667;
localparam baud_rate2=20834;
localparam baud_rate3=10417;
localparam baud_rate4=5209;
reg [15:0]mod_count;
reg [15:0]count;

always@(*)
  begin
     case(baud_select)
/*1200 baud rate*/2'b00: mod_count=baud_rate1;
/*1200 baud rate*/2'b01: mod_count=baud_rate2;
/*1200 baud rate*/2'b10: mod_count=baud_rate3;
/*1200 baud rate*/2'b11: mod_count=baud_rate4;
                default: mod_count=0; 
	  endcase
  end

always@(posedge clk, negedge reset)
  begin
     if(!reset)
		begin
       count<=0;
		 baud_out<=0;
		end
     else
        begin
            if(count==mod_count)
                begin
                   baud_out<=1'b1;
                   count<=0;
                end
             else 
                 begin
                    baud_out<=0;
                    count<=count+1;
                 end
        end
  end		  
endmodule


