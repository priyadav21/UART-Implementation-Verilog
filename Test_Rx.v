module Test_Rx;

reg clk,rx_in,reset;
wire [7:0]data_out;

Receiver_module UUT(.rx_in(rx_in),
                    .clk(clk),
						  .reset(reset),
						  .data_out(data_out));

initial
  begin
    clk=1'b0;
	 reset=1'b0;
	 rx_in=1'b0;
    #10 reset=1'b1;
  end
  
always
 #10 clk=~clk;
 
initial 
begin
forever
  begin
  #20 rx_in=0;
  #20 rx_in=0;
  #20 rx_in=0;
  #20 rx_in=1;
  #20 rx_in=1;
  #20 rx_in=1;
  #20 rx_in=1;
  #20 rx_in=1;
  #20 rx_in=0;
  #20 rx_in=0;
  #20 rx_in=1;
  #20 rx_in=0;
  #20 rx_in=1;
  #20 rx_in=0;
  #20 rx_in=1;
  #20 rx_in=0;
  #20 rx_in=1;
  #20 rx_in=1;
  #20 rx_in=1;

end
end
endmodule
