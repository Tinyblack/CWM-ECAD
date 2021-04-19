//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:
// Date: 
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module whole (
    input rst,
    input clk,
    input button,
    input sel,
    output [2:0]result
);

wire [2:0]throw;
wire red;
wire amber;
wire green;

dice dice_in_whole(
    .rst(rst),
    .clk(clk),
    .button(button),
    .throw(throw)
);

traffic traffic_in_whole(
    .clk(clk),
    .red(red),
    .amber(amber),
    .green(green)
);

mux mux_in_whole(
    .a(throw),
    .b({green,amber,red}),
    .sel(sel),
    .out(result)
);
 
endmodule