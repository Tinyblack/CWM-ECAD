//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: ZIMO ZHAO
// Date: 2021 APR 15
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 10ps

module top_tb(
    );
    
    //Parameters
    parameter CLK_PERIOD = 10;

    //Regitsers and wires
    reg clk;
    reg rst;
    reg enable;
    reg dir;
    reg err;
    reg [7:0]out_pre;
    wire [7:0]out;


    //Clock generation
    initial begin
       clk = 1'b0;
       forever begin
         #(CLK_PERIOD/2) clk=~clk;
       end
    end

    //Rest generation
    initial begin
        rst=1;
        #1
        rst=0;
        #1
        rst=1;
        if (out!=8'b0000_0000) begin
            $display("*** TEST FAILED! Reset Value Wrong! Actual out=%d ***",out);
            err=1;
        end
    end

    initial begin
        #3
        enable=0;
        #17
        enable=1;
    end

    initial begin
        #3
        dir=1;
        #17
        #285
        dir=0;
    end

    //Simulation logic
    initial begin
        err=0;
        #3
        out_pre=out;
        #17
        #2
        forever begin
            #(CLK_PERIOD)
            if (enable==0 && out!=out_pre) begin
                $display("*** TEST FAILED! Enable function FAILED. Actual out=%d ***",out);
                err=1;
            end

            if (enable==1 && dir==1 && out!=out_pre+8'b0000_0001) begin
                $display("*** TEST FAILED! Increase function FAILED. Actual out=%d ***",out);
                err=1;
            end

            if (enable==1 && dir==0 && out!=out_pre-8'b0000_0001) begin
                $display("*** TEST FAILED! Decrease function FAILED. Actual out=%d ***",out);
                err=1;
            end
            out_pre=out;
        end
    end

    
    //Finish test, check for success
    initial begin
    #600 //This contorl the time of simulation
        if (err==0) begin
            $display("*** TEST PASSED! :) ***");
        end
    $finish;
    end

    //Instantiate counter module

     counter top (
     .rst (rst),
     .enable (enable),
     .direction (dir),
     .clk (clk),
     .counter_out (out)
     );
endmodule 
