`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 01:42:50 PM
// Design Name: 
// Module Name: Top_Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module Top_Adder(A,B,CI,SUM,CO);
    input A,B,CI;
    output SUM,CO;
    
    wire cin;
    
    assign cin = 1'b0;
    
    FA A1(A,B,cin,SUM,CO);
    
endmodule */
    
module FA(a,b,ci,sum,co);
    input a,b,ci;
    output sum,co;
    
    assign sum = a^b^ci;
    assign co = (a&b)|(b&ci)|(ci&a);

endmodule

/*module Top_2bit_ripple(A,B, segt);

    input [1:0] A,B;
    wire [2:0] S;
    output [6:0] segt;
    wire cin_0;
    wire [3:0] bcd;
    
    wire c;
    
    assign cin_0 = 1'b0;
    assign bcd = {1'b0, S};
    
    FA A1(A[0], B[0], cin_0, S[0], c);
    FA A2(.ci(c), .co(S[2]), .a(A[1]), .b(B[1]), .sum(S[1]));
    
    BCD_7_SEG uut1(bcd,segt);

endmodule */

module Top_2bit_look_ahead(a,b,segt);
    input [1:0] a,b;
    output [6:0] segt;
    wire [1:0] s;
    wire [3:0] bcd;
    
    wire[2:0] w_c;
    wire[1:0] w_g, w_p, w_s;
    
    assign w_g[0] = a[0] & b[0];
    assign w_g[1] = a[1] & b[1];
    
    assign w_p[0] = a[0]^b[0];
    assign w_p[1] = a[1]^b[1];
    
    assign w_c[0] = 1'b0;
    assign w_c[1] = w_g[0]|(w_p[0]&w_c[0]);
    assign w_c[2] = w_g[1]|(w_p[1]&w_c[1]);
    
    FA uut1(.a(a[0]), .b(b[0]), .ci(w_c[0]), .sum(s[0]));
    FA uut2(.a(a[1]), .b(b[1]), .ci(w_c[1]), .sum(s[1]));
    //assign cout = w_c[2];
    
    assign bcd = {1'b0,w_c[2],s};
    
    BCD_7_SEG(bcd, segt);

endmodule 

module BCD_7_SEG(bcd,seg);
    input [3:0]bcd;
    output [6:0] seg;
    reg [6:0]seg;
    
    
    always@(bcd)
    begin
        case(bcd)
            0 : seg = 7'b1000000;
            1 : seg = 7'b1111001;
            2 : seg = 7'b0100100;
            3 : seg = 7'b0110000;
            4 : seg = 7'b0011001;
            5 : seg = 7'b0010010;
            6 : seg = 7'b0000010;
            7 : seg = 7'b1111000;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule
