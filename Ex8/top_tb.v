//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
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
    reg rst;
    //reg [5:0]pre;
    reg [5:0]product;
    //wire [5:0]result;
    wire [5:0]result;
    reg err;

    //Clock generation
    initial begin
       clk = 1'b0;
       forever begin
         #(CLK_PERIOD/2) clk=~clk;
         if (clk==1'b1) begin
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
            #(CLK_PERIOD-5)
            b=b+3'b001;
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

    //Save previous value
    initial begin
        #5
        #2
        #140
        forever begin
            #(CLK_PERIOD)
            if (read==1 && result!=product) begin
                $display("*** TEST FAILED! Actual out=%d, Expected out=%d ***",result,product);
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
    multiplxer_AX14 top(
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .read(read),
        .result(result)
    );
    
  endmodule  