//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: ZIMO ZHAO
// Date: 09 APR 2021
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module mux(
    input [2:0]a,
    input [2:0]b,
    input sel,
    output reg [2:0]out);

    always @(sel,a,b) 
    begin
        #4
    if (sel) 
        begin
            out<=b;
        end
    else
        begin
            out<=a;
        end  
    end 

endmodule
