//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module top_tb (
);
    //Parameters
    parameter CLK_PERIOD = 10;

    //Regitsers and wires

    reg rst;
    reg clk;
    reg button;
    reg sel;
    wire [2:0]result;
    reg [2:0]pre;
    reg err;

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
    end

    //Button generation
    initial begin
        button=1;
        #305
        button=0;
    end

    //Select generation
    initial begin
        sel=0;
        #450
        sel=1;
    end

    //Save previous value
    initial begin
        #3
        pre=result;
        #2
        forever begin
            #2
            pre=result;
        end
    end

    //Simulation logic
    initial begin
        err=0;
        #(CLK_PERIOD)
        forever begin
            #(CLK_PERIOD)

            if (sel==0 && button==0 && result!=pre) begin
                $display("*** TEST FAILED! STOP FAILED. Actual out=%d ***",result);
                err=1;
            end

            if (sel==0 && button==1 && (result>6 || result<1)) begin
                $display("*** TEST FAILED! THROW FAILED. Actual out=%d ***",result);
                err=1;
            end
            
            if (sel==1 && pre==3'b001 && result!=3'b011) begin
                $display("*** TEST FAILED! RED -> RED+AMBER FAILED. Actual out=%d ***",result);
                err=1;
            end

            if (sel==1 && pre==3'b011 && result!=3'b100) begin
                $display("*** TEST FAILED! RED+AMBER -> GREEN FAILED. Actual out=%d ***",result);
                err=1;
            end

            if (sel==1 && pre==3'b100 && result!=3'b010) begin
                $display("*** TEST FAILED! GREEN -> AMBER FAILED. Actual out=%d ***",result);
                err=1;
            end

            if (sel==1 && pre==3'b010 && result!=3'b001) begin
                $display("*** TEST FAILED! AMBER -> RED FAILED. Actual out=%d ***",result);
                err=1;
            end
            
        end
    end

    //Finish test, check for success
    initial begin
    #450 //This contorl the time of simulation
        if (err==0) begin
            $display("*** TEST A PASSED! :) ***");
        end
    #10
    err=0;
    #120
        if (err==0) begin
            $display("*** TEST B PASSED! :) ***");
        end
    
    $finish;
    end



    //Instantiate module
    whole top(
        .rst(rst),
        .clk(clk),
        .button(button),
        .sel(sel),
        .result(result)
    );
  endmodule  