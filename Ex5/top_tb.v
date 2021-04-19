//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: ZIMO ZHAO
// Date: 19 APR 2021
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module top_tb (
);
    //Parameters
    parameter CLK_PERIOD = 10;

    //Regitsers and wires
    reg clk;
    reg err;
    reg [2:0]light_pre;
    wire red;
    wire amber;
    wire green;

    //Clock generation
    initial begin
       clk = 1'b0;
       forever begin
         #(CLK_PERIOD/2) clk=~clk;
       end
    end

    //
    initial begin
        #3
        light_pre={green,amber,red};
        #2
        forever begin
            #(CLK_PERIOD/5)
            light_pre={green,amber,red};
        end
    end

    //Simulation logic
    initial begin
        err=0;
        #(CLK_PERIOD)
        #(CLK_PERIOD/2+1)
        forever begin
            #(CLK_PERIOD)
            if (light_pre==3'b001 && {green,amber,red}!=3'b011) begin
                $display("*** TEST FAILED! RED -> RED+AMBER FAILED. Actual out=%d ***",{green,amber,red});
                err=1;
            end

            if (light_pre==3'b011 && {green,amber,red}!=3'b100) begin
                $display("*** TEST FAILED! RED+AMBER -> GREEN FAILED. Actual out=%d ***",{green,amber,red});
                err=1;
            end

            if (light_pre==3'b100 && {green,amber,red}!=3'b010) begin
                $display("*** TEST FAILED! GREEN -> AMBER FAILED. Actual out=%d ***",{green,amber,red});
                err=1;
            end

            if (light_pre==3'b010 && {green,amber,red}!=3'b001) begin
                $display("*** TEST FAILED! AMBER -> RED FAILED. Actual out=%d ***",{green,amber,red});
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
    traffic top(
        .clk(clk),
        .red(red),
        .amber(amber),
        .green(green)
    );
  endmodule  