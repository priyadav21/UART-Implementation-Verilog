module Test_Top_module_1;

reg clk,reset,tx_start;
reg [7:0]data_in;
reg [1:0]baud_select;
wire [6:0]cathode;
wire [3:0]anode;

Top_module_1 UUT(.clk(clk),
                 .reset(reset),
					  .tx_start(tx_start),
					  .data_in(data_in),
					  .cathode_value(cathode),
					  .anode_value(anode),
					  .baud_select(baud_select));
					  
initial 
  begin
   clk=0;
	reset=1;
	tx_start=0;
	data_in=0;
	baud_select=2'b11;
	#10 reset=0;
	    
	//#1300000 tx_start=0;
  end

always 
  #10 clk=~clk;
  
initial	
	begin
		#10 tx_start=1; data_in=$random;
	end


//  
//initial 
//  begin
//    forever
//	   #20000000 data_in=$random;
//  end
endmodule
