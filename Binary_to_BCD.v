module Binary_to_BCD(input [7:0]binary,
                     output reg [11:0]BCD);
							


always@(binary)
   BCD_task(binary,BCD);
	
task BCD_task(input [7:0]binary,
              output [11:0]BCD);
				  
reg [19:0]temp;
integer i;

  begin
     temp={12'd0,binary};
	  
	    for(i=0;i<=7;i=i+1)
		    begin
			  if(temp[19:16]>4)
			     temp[19:16]=temp[19:16]+3;
			  if(temp[15:12]>4)
			     temp[15:12]=temp[15:12]+3;
			  if(temp[11:8]>4)
			     temp[11:8]=temp[11:8]+3;
				  
				temp={temp[18:0],1'b0};
			 end
		BCD=temp[19:8];
  end
endtask 

endmodule
