module Test_tx_module;

reg [7:0]data_in;
reg tx_start;
reg clk;
reg reset;
wire tx_out;

Transmitter_module UUT(    .reset(reset),
									.data_in(data_in),
									.tx_start(tx_start),
									.clk(clk),
									.tx_out(tx_out)
									);

initial
  begin
    tx_start=1'b0;
	 clk=1'b0;
	 reset=1'b0;
	 data_in=8'b10101010;
	  #10 reset=1'b1;
	  #20 tx_start=1'b1;
	  #230 tx_start=1'b0;
  end
  
always
  #10 clk=~clk;
  

  
endmodule
