module top_module( 
    input [31:0] in,
    output [31:0] out );//
    wire [7:0] w1,w2,w3,w4;
    assign w1 = in[7:0];
    assign w2 = in[15:8];
    assign w3 = in[23:16];
    assign w4 = in[31:24];
    assign out = {w1,w2,w3,w4};
    
    // assign out[31:24] = ...;

endmodule

