//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: ZIMO ZHAO
// Date: 19 APR 2021
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module top_tb (
);
    //Parameters
    parameter CLK_PERIOD = 10;

    //Regitsers and wires
    reg clk;
    reg rst;
    reg button;
    reg err;
    reg [2:0]throw_pre;
    wire [2:0]throw;

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
        if (throw!=3'b000) begin
            $display("*** TEST FAILED! Reset Value Wrong! Actual out=%d ***",throw);
            err=1;
        end
    end

    //
    initial begin
        #3
        throw_pre=throw;
        #2
        forever begin
            #(CLK_PERIOD/5)
            throw_pre=throw;
        end
    end

    //Button generation
    initial begin
        button=1;
        #306
        button=0;
    end

    //Simulation logic
    initial begin
        err=0;
        #3
        #2
        forever begin
            #(CLK_PERIOD)
            if (button==0 && throw!=throw_pre) begin
                $display("*** TEST FAILED! STOP FAILED. Actual out=%d ***",throw);
                err=1;
            end

            if (button==1 && (throw>6 || throw<1)) begin
                $display("*** TEST FAILED! THROW FAILED. Actual out=%d ***",throw);
                err=1;
            end
            
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



    //Instantiate module
    dice top(
        .clk(clk),
        .rst(rst),
        .button(button),
        .throw(throw)
    );


    
endmodule