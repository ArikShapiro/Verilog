module top_module ( input clk, input d, output q );
	
    wire dff1_q,dff2_q;
    my_dff dff1( .clk(clk), .d(d), .q(dff1_q) );
    my_dff dff2( .clk(clk), .d(dff1_q), .q(dff2_q) );
    my_dff dff3( .clk(clk), .d(dff2_q), .q(q) );
    
endmodule
