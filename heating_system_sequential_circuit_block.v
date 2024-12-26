`timescale 1ns / 1ps


`include "constant.vh"

module heating_system(
    input clk,
    input reset,
    input [`temperature_sensor_data_width-1:0] temp,
    input [`motion_sensor_data_width-1:0] presence,
    input [`window_sensor_data_width-1:0] window,
    input [`ac_cool_data_width-1:0] ac_cool,            
    output reg heating_system
    );
   

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            heating_system <= 0;
        end else begin
            if (temp < `temp_treshold && presence && !window && !ac_cool) begin
                heating_system <= 1;
            end else begin
                heating_system <= 0;
            end
        end
    end
    
endmodule
