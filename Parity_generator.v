module Parity_generator(input [7:0]data_in,
                        input load,
								input clk,
								input reset,
                        output reg parity_bit);
//always@(*)//posedge clk)
//   if(load==1)
//	     parity_bit <= data_in[0]~^data_in[1]~^data_in[2]~^data_in[3]~^data_in[4]~^data_in[5]~^data_in[6]~^data_in[7];
//   else
//	    parity_bit<=parity_bit;


always @(posedge clk or negedge reset)
begin
	if(!reset)
		begin
			parity_bit<=0;
		end
	else
		begin
			if(load)
				parity_bit<=^data_in;
			else
				parity_bit<=parity_bit;
		end
end

endmodule
