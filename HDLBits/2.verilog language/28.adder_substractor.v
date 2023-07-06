module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout_1,cout_2;
    wire [15:0] sum_lower;
    wire [15:0] sum_upper;
    wire [31:0] b_in;
    assign b_in = b^{32{sub}};
    
    add16 add_lower( .a(a[15:0]), .b(b_in[15:0]), .cin(sub), .sum(sum_lower), .cout(cout_1) );
    add16 add_upper( .a(a[31:16]), .b(b_in[31:16]), .cin(cout_1),.sum(sum_upper), .cout(cout_2) );
    assign sum = {sum_upper,sum_lower};

endmodule

