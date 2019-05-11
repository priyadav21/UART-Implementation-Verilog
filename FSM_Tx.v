module FSM_Tx(input tx_start,
                    clk,
						  reset,						  
              output reg load,
                         shift,
              output reg [1:0]mux_sel);
				  
localparam idle  =3'b000;
localparam start  =3'b001;
localparam data   =3'b010;
localparam parity =3'b011;
localparam stop   =3'b100;

reg [2:0]p_s,n_s;
reg [2:0]count;

always@(posedge clk,negedge reset)
   begin 
	  if(!reset)
	    p_s<=idle;
	  else
	     p_s<=n_s;
	end
	
always@(*)
  begin
		case(p_s)
		
		   idle    : if(tx_start==1)
			              n_s<=start;
					    else
					        n_s<=idle;
						
			start   : n_s<=data;
			
			data    : if(count==3'b111)
			              n_s<=parity;
			          else
							   n_s<=data;
						   		       
					
			parity  : n_s<=stop;
			
			stop    : if(tx_start)
			            n_s<=start;
						 else
						   n_s<=idle;
			
			default : n_s<=idle;
			
		endcase
	end
	
always@(posedge clk,negedge reset)
 begin
   if(!reset)
	   count<=3'b000;
	else if(p_s==data)
	        if(count==3'b111)
			     count<=3'b000;
			  else 
			     count<=count+1;
			  
		  else count<=3'b000;
 end
	
always@(*)
  begin
    case(p_s)
	   idle : begin
		          load<=1'b0;
					 shift<=1'b0;
					 mux_sel<=2'b11;
				  end	   
		start : begin
		          load<=1'b1;
					 shift<=1'b0;
					 mux_sel<=2'b00;
				  end	   
		data  : begin
		          load<=1'b0;
					 shift<=1'b1;
					 mux_sel<=2'b01;
				  end	   
		parity: begin
		          load<=1'b0;
					 shift<=1'b0;
					 mux_sel<=2'b10;
				  end	   
		stop  : begin
		          load<=1'b0;
					 shift<=1'b0;
					 mux_sel<=2'b11;
				  end		
	   default: begin
		          load<=1'b0;
					 shift<=1'b0;
					 mux_sel<=2'b11;
				  end
	  endcase
  end		
		
endmodule
