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

`timescale 1ns / 100ps

module mux(
    input a,
    input b,
    input sel,
    output reg out);

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
