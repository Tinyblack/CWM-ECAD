//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module top_tb (
);
    //Parameters
    parameter CLK_PERIOD = 10;

    //Regitsers and wires

    reg [2:0]a;
    reg [2:0]b;
    reg clk;
    reg read;
    reg [5:0]pre;
    reg [5:0]product;
    wire [5:0]result;
    reg err;

    //Clock generation
    initial begin
       clk = 1'b0;
       forever begin
         #(CLK_PERIOD/2) clk=~clk;
         if (clk==1'b1) begin
             pre=product;
             product=a*b;
         end
       end
    end

    //Select generation
    initial begin
        read=0;
        #105
        read=1;
    end

    initial begin
        a=3'b000;
        forever begin
            #(CLK_PERIOD)
            a=a+3'b001;
        end
    end

    initial begin
        b=3'b000;
        forever begin
            #(CLK_PERIOD-3)
            b=b+3'b001;
        end
    end

    //Save previous value
    initial begin
        #5
        #2
        #140
        forever begin
            #(CLK_PERIOD)
            if (read==1 && result!=pre) begin
                $display("*** TEST FAILED! Actual out=%d, Expected out=%d ***",result,pre);
                err=1;
            end
        end
    end

    //Simulation logic
    initial begin
        err=0;
    end

    //Finish test, check for success
    initial begin //This maximum simulation time is set in .tcl file.
    #600 
        if (err==0) begin
            $display("*** TEST PASSED! :) ***");
        end
    $finish;
    end



    //Instantiate module
    multiplier top(
        .clk(clk),
        .a(a),
        .b(b),
        .read(read),
        .result(result)
    );
    
  endmodule  