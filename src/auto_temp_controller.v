`timescale 1ns/1ps

module auto_temp_controller (
  input       clk,
  input       reset,
  input [7:0] current_temp,
  input [7:0] desired_temp,
  input [3:0] temp_tolerance,
  output reg  heater_on,
  output reg  cooler_on
);

localparam [2:0] 
    IDLE    = 3'b001,
    HEATING = 3'b010,
    COOLING = 3'b100;

reg [2:0] state, next_state;

//---------------------------
// STATE REGISTER
//---------------------------
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end

//---------------------------
// NEXT STATE LOGIC
//---------------------------
always @(*) begin
    case (state)

        IDLE: begin
            if (current_temp < (desired_temp - temp_tolerance))
                next_state = HEATING;
            else if (current_temp > (desired_temp + temp_tolerance))
                next_state = COOLING;
            else
                next_state = IDLE;
        end

        HEATING: begin
            if (current_temp >= desired_temp)
                next_state = IDLE;
            else
                next_state = HEATING;
        end

        COOLING: begin
            if (current_temp <= desired_temp)
                next_state = IDLE;
            else
                next_state = COOLING;
        end

        default: next_state = IDLE;

    endcase
end

//---------------------------
// OUTPUT LOGIC
//---------------------------
always @(posedge clk or posedge reset) begin
    if (reset) begin
        heater_on <= 1'b0;
        cooler_on <= 1'b0;
    end
    else begin
        case(state)

            IDLE: begin
                heater_on <= 0;
                cooler_on <= 0;
            end

            HEATING: begin
                heater_on <= 1;
                cooler_on <= 0;
            end

            COOLING: begin
                heater_on <= 0;
                cooler_on <= 1;
            end

            default: begin
                heater_on <= 0;
                cooler_on <= 0;
            end

        endcase
    end
end

endmodule
