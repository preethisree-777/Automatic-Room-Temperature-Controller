`timescale 1ns/1ps

module act_tb;

reg clk;
reg reset;
reg [7:0] c_temp;
reg [7:0] d_temp;
reg [3:0] temp_tol;

wire ht_on;
wire cl_on;

auto_temp_controller dut(
    .clk(clk),
    .reset(reset),
    .current_temp(c_temp),
    .desired_temp(d_temp),
    .temp_tolerance(temp_tol),
    .heater_on(ht_on),
    .cooler_on(cl_on)
);

// clock generation
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    c_temp = 0;
    d_temp = 0;
    temp_tol = 4'd2;

    #20;
    reset = 0;

    d_temp = 70;

    // Test cases
    c_temp = 65; #50; // heating
    c_temp = 72; #50; // cooling
    c_temp = 70; #50; // idle
    c_temp = 50; #50; // heating
    c_temp = 90; #50; // cooling

    #100;
    $finish;

end

initial begin
    $monitor("Time=%0t current=%d desired=%d heater=%b cooler=%b",
              $time, c_temp, d_temp, ht_on, cl_on);
end

endmodule
