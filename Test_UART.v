module Test_UART;

reg clk,
    reset,
	// rx_in,
    tx_start;
reg [1:0]baud_select;
reg [7:0]data_in;
//wire tx_out;
wire [7:0]data_out;

Top_Module_UART DUT(.clk(clk),
                    .reset(reset),
						  .tx_start(tx_start),
						  .data_in(data_in),
						  //.tx_out(tx_out),
						  .baud_select(baud_select),
						  //.rx_in(rx_in),
						  .data_out(data_out));

initial
  begin
    reset=1'b0;
	 clk=1'b0;
	 baud_select=2'b11;
	 tx_start=1'b0;
	 #20 reset=1'b1;
	  tx_start=1'b1;
	  data_in=8'b10101010;
  end
  
 always
   #10 clk=~clk;
	
initial
  begin
  forever 
   begin
     #200 tx_start=1'b0;
	  #40 tx_start=1'b1;
	  #1000000  data_in=$random;
	end
  end
endmodule
