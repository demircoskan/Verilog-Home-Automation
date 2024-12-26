`timescale 1ns / 1ps


`include "constant.vh"

module lights(
    input clk,
    input reset,
    input [`daylight_sensor_data_width-1:0] daylight,
    input [`motion_sensor_data_width-1:0] presence,
    output reg lights
    );


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lights <= 0;
        end else begin
            if (daylight < `light_threshold && presence) begin
                lights <= 1;
            end else begin
                lights <= 0;
            end
        end
    end   
endmodule
