//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:ZIMO ZHAO
// Date: 19 APR 2021
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps

module traffic (
    input clk,
    output reg red,
    output reg amber,
    output reg green
);
    reg [2:0]state_reg;
    reg [2:0]state_next;

    always @(posedge clk) begin  
            state_reg<=state_next;      
    end

    always @(negedge clk or state_reg or state_next) begin
        case (state_reg)   
            3'b001:
            begin
                state_next=3'b011;
                {green,amber,red}=3'b001;
            end 

            3'b011:
            begin
                state_next=3'b100;
                {green,amber,red}=3'b011;
            end 
            
            3'b100:
            begin
                state_next=3'b010;
                {green,amber,red}=3'b100;
            end 

            3'b010:
            begin
                state_next=3'b001;
                {green,amber,red}=3'b010;
            end 
                       
            default: 
            begin                
                state_next=3'b001;
                {green,amber,red}=3'b001;  
            end
        endcase
        
    end

endmodule