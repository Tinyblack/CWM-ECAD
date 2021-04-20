//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module multiplier (
    input clk,
    input [2:0]a,
    input [2:0]b,
    input read,
    output [5:0]result
);
    
blk_mem_gen_0 memory (
  .clka(clk),    // input wire clka
  .ena(read),      // input wire ena
  .addra({b,a}),  // input wire [5 : 0] addra
  .douta(result)  // output wire [5 : 0] douta
);
endmodule
