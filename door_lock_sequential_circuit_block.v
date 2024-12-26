`include "constant.vh"

module door_lock_system(
    input clk,
    input reset,
    input [`door_motion_sensor_data_width-1:0] door_motion_sensor,
    output reg lock_door
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lock_door <= 1'b0;
        end else begin
            if (door_motion_sensor == 1'b0)
                lock_door <= 1'b1;
            else  
                lock_door <= 1'b0;
        end
    end
endmodule
