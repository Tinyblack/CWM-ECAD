//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module dice (
    input clk,
    input rst,
    input button,
    output reg [2:0]throw
);
    reg [2:0]state_reg;
    reg [2:0]state_next;

    always @(posedge clk or negedge rst) begin  
        if (~rst) 
            begin
                state_reg=3'b000;      
            end
        else 
            begin
                state_reg<=state_next;
            end       
    end

    always @(button or state_reg or state_next) begin
        state_next=state_reg;
        case (state_reg)
            3'b000:
            begin
                throw=3'b000;
                state_next=3'b001;
            end
            3'b001:
            begin
                throw=3'b001;
                if (button==1'b0) 
                    begin 
                        state_next=3'b001;
                    end
                else
                    begin
                        state_next=3'b010;
                    end
            end 
            3'b010:
            begin
                throw=3'b010;
                if (button==1'b0) 
                        state_next=3'b010;
                else
                        state_next=3'b011;
            end
            3'b011:
            begin
                throw=3'b011;
                if (button==1'b0) 
                    begin 
                        state_next=3'b011;
                    end
                else
                    begin
                        state_next=3'b100;
                    end
            end
            3'b100:
            begin
                throw=3'b100;
                if (button==1'b0) 
                    begin 
                        state_next=3'b100;
                    end
                else
                    begin
                        state_next=3'b101;
                    end
            end
            3'b101:
            begin
                throw=3'b101;
                if (button==1'b0) 
                    begin 
                        state_next=3'b101;
                    end
                else
                    begin
                        state_next=3'b110;
                    end
            end
            3'b110:
            begin
                throw=3'b110;
                if (button==1'b0) 
                    begin 
                        state_next=3'b110;
                    end
                else
                    begin
                        state_next=3'b001;
                    end
            end
            3'b111:
            begin
                throw=3'b111;
                if (button==1'b0) 
                    begin 
                        state_next=3'b001;
                    end
                else
                    begin
                        state_next=3'b010;
                    end
            end
            default: 
                begin
                    throw=3'b000;
                end
        endcase
    end  
endmodule