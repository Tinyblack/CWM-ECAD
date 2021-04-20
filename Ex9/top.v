//////////////////////////////////////////////////////////////////////////////////
// Exercise #9 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a module that lights leds
//  at different frequencies
//
//  inputs:
//           rst_n, clk_n, clk_p, button
//
//  outputs:
//           led_0, led_1, led_2
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,

    input rst_n,
    input button,
    output reg led_0,
    output reg led_1,
    output reg led_2);
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

    always @(posedge clk or button or rst_n) begin
        if (~rst_n || button)
        begin
            led_0=1'b0;
            led_1=1'b0;
            led_2=1'b0;
        end
        else
        begin
            led_0=clk;
            led_1=~clk;
            led_2=clk;
        end
    end

endmodule
