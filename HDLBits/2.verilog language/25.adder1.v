module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_1,cout_2;
    wire [15:0] sum_lower;
    wire [15:0] sum_upper;
    
    add16 add_lower( .a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum_lower), .cout(cout_1) );
    add16 add_upper( .a(a[31:16]), .b(b[31:16]), .cin(cout_1),.sum(sum_upper), .cout(cout_2) );
    assign sum = {sum_upper,sum_lower};
        

endmodule
