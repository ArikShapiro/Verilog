module top_module (input x, input y, output z);
    wire w1,w2,w3,w4,w5,w6;
    mod_A ia1(.x(x),.y(y),.z(w1));
    mod_B ib1(.x(x),.y(y),.z(w2));
    mod_A ia2(.x(x),.y(y),.z(w3));
    mod_B ib2(.x(x),.y(y),.z(w4));
    assign w5 = w1|w2;
    assign w6 = w3&w4;
    assign z = w5^w6;

endmodule


module mod_A (input x, input y, output z);
    assign  z = (x^y) & x;
endmodule

module mod_B ( input x, input y, output z );
    assign z = ((~x)&(~y)) + ((x)&(y));

endmodule

