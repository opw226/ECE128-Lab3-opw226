`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2024 02:18:02 PM
// Design Name: 
// Module Name: Top_Adder_tb
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


module Top_Adder_tb();
wire[6:0] seg;
reg[1:0] a,b;


integer i;
integer j;

initial begin
    a = 2'b00;
    b = 2'b00;
    for(i = 0; i<4;i = i+1)
        begin
        a=a+2'b01;
            for(j=0;j<4;j=j+1)
            begin
                b=b+2'b01;
                
            end
            #10;
        end
 end
endmodule
