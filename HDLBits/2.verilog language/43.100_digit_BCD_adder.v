module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [99:0] c_out;
    bcd_fadd u_bcd_fadd(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c_out[0]),.sum(sum[3:0]));
    
	generate
		genvar i;
		for(i=1; i<100; i=i+1)
		begin : gen_rest_of_fadds
			bcd_fadd u_bcd_fadd(.a(a[4*i+3:4*i]),.b(b[4*i+3:4*i]),.cin(c_out[i-1]),.cout(c_out[i]),.sum(sum[4*i+3 : 4*i]));
		end
	endgenerate
    
	assign cout = c_out[99]; 
endmodule

