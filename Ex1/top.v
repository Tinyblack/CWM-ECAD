//////////////////////////////////////////////////////////////////////////////////
// Exercise #1 
// Student Name: ZIMO ZHAO
// Date: 09 APR 2021
//
//  Description: In this exercise, you need to design a logical unit, where the  
//  output acts according to the following truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0]
//  0 | 1 | func [1]
//  1 | 0 | func [2]
//  1 | 1 | func [3]
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module logicalunit(
    input a,
    input b,
    input [3:0] func,
    output out
    );
    
    wire   out;
         
    assign out=(a==1'b0&&b==1'b0)?func[0]:
    (a==1'b0&&b==1'b1)?func[1]:
    (a==1'b1&&b==1'b0)?func[2]:
    func[3];

endmodule
