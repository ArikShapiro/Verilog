`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

    wire and1;
	wire and2;
	wire or1;
    
	assign and1=a&b;
	assign and2=c&d;
	assign out=and1|and2;
    assign or1=and1|and2;
    assign out_n=~or1;
     
endmodule

