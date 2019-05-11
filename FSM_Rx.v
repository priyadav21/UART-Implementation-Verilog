module FSM_Rx(input  fsm_enable,
                     parity_error,
							clk,
							reset,
				  output reg shift,
				         check_parity,
							check_stop );
							
localparam idle=3'b000;
//localparam start=3'b001;
localparam data=3'b010;
localparam parity=3'b011;
localparam stop=3'b100;

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
		
		   idle    : if(fsm_enable==1)
			              n_s<=data;//start;
					    else
					        n_s<=idle;
						
			//start   : n_s<=data;
			
			data    : if(count==3'b111)
			              n_s<=parity;
			          else
							   n_s<=data;
						   		       
					
			parity  : if(parity_error)
			             n_s<=idle;
						 else 
						    n_s<=stop;
			
			stop    : n_s<=idle;
						 
			
			default : n_s<=idle;
			
		endcase
  end		


always@(posedge clk, negedge reset)
  begin
    if(!reset)
	    count<=0;
	  else if(p_s==data)
      	  if(count==3'b111)
	           count<=0;
			  else
			     count<=count+1;
	     else
		    count<=0;
  end 
  
always@(*)
  begin
     case(p_s)
	     idle : begin 
		           shift=0;
					  check_parity=0;
					  check_stop=0;
					end 
		 /*start : begin 
		           shift<=0;
					  check_parity<=0;
					  check_stop<=0;
					end */
			data : begin 
		           shift=1;
					  check_parity=0;
					  check_stop=0;
					end 
		parity : begin 
		           shift=0;
					  check_parity=1;
					  check_stop=0;
					end 
			stop : begin 
		           shift=0;
					  check_parity=0;
					  check_stop=1;
					end 
	  default : begin 
		           shift=0;
					  check_parity=0;
					  check_stop=0;
					end 
	 endcase
  end 
  
endmodule 