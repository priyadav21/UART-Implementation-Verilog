module Test_PISO;

reg [7:0]d_in;
reg clk,load,shift,reset;
wire d_out;

PISO UUT(.data_in(d_in),.reset(reset),.clk(clk),.load(load),.shift(shift),.piso_out(d_out));

initial 
  begin
    d_in=8'b10101010;
	 clk=1'b0;
	 load=1'b0;
	 shift=1'b0;
	 reset=1'b0;
	 #10 load=1'b1;
	 #10 load=1'b0;
	     reset=1'b1;
	 #10 shift=1'b1;
  end
  
always
  #10 clk=~clk;
  
initial
  begin
     #170 shift=1'b0;
	  forever
	   begin
		 #10 d_in=$random;
		  #10 load=1'b1;
		  #10 load=1'b0;
		  #10 shift=1'b1;
		  #160 shift=1'b0;		  
		end
  end

endmodule
