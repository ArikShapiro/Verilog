module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_lower,cout_0,cout_1;
    wire [15:0] sum_lower;
    wire [15:0] sum_upper_0;
    wire [15:0] sum_upper_1;
    
    add16 add_lower( .a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum_lower), .cout(cout_lower) );
    add16 add_upper_0( .a(a[31:16]), .b(b[31:16]), .cin(0),.sum(sum_upper_0), .cout(cout_0) );
    add16 add_upper_1( .a(a[31:16]), .b(b[31:16]), .cin(1),.sum(sum_upper_1), .cout(cout_1) );
    
    always @ (*) begin
      case (cout_lower)
         1'b0 : sum = {sum_upper_0,sum_lower};
         1'b1 : sum = {sum_upper_1,sum_lower};
      endcase
   end
 
endmodule



