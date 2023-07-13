module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    parameter [2:0] A  = 3'd0;	// below s1    
    parameter [2:0] B_higher = 3'd1;// between s1 & s2 (previous level is higher)
    parameter [2:0] B_lower = 3'd2;// between s1 & s2 (previous level is lower)
    parameter [2:0] C_higher = 3'd3;// between s2 & s3 (previous level is higher)
    parameter [2:0] C_lower = 3'd4;	// between s2 & s3 (previous level is lower)
    parameter [2:0] D  = 3'd5;	// above s3

	reg [2:0] state, next_state;

	always @(posedge clk) begin
		if(reset) state <= A;
		else state <= next_state;
	end

	always @(*) begin
		case(state)
			A: next_state = (s[1]) ? B_lower : A;
			B_higher : next_state = (s[2]) ? C_lower : ((s[1]) ? B_higher : A);
			B_lower : next_state = (s[2]) ? C_lower : ((s[1]) ? B_lower : A);
			C_higher : next_state = (s[3]) ? D  : ((s[2]) ? C_higher : B_higher);
			C_lower : next_state = (s[3]) ? D  : ((s[2]) ? C_lower : B_higher);
			D : next_state = (s[3]) ? D  : C_higher;
		endcase
	end

	always @(*) begin
		case(state)
			A  : {fr3, fr2, fr1, dfr} = 4'b1111;
			B_higher : {fr3, fr2, fr1, dfr} = 4'b0111;
			B_lower : {fr3, fr2, fr1, dfr} = 4'b0110;
			C_higher : {fr3, fr2, fr1, dfr} = 4'b0011;
			C_lower : {fr3, fr2, fr1, dfr} = 4'b0010;
			D  : {fr3, fr2, fr1, dfr} = 4'b0000;
		endcase
	end


endmodule
