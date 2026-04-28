# Automatic Room Temperature Controller using FSM

## Project Description

Designed and implemented an Automatic Room Temperature Controller using Verilog HDL and Xilinx Vivado based on Finite State Machine (FSM) design.

The system automatically controls heater and cooler operations depending on the comparison between current room temperature and desired temperature with a tolerance range.

The controller operates using three states:

- IDLE
- HEATING
- COOLING

The design was verified using simulation and further validated through synthesis, implementation, timing analysis, and power analysis.

---

## Problem Statement

Manual temperature control is inefficient in smart rooms and embedded systems. An automatic controller is needed to maintain room temperature within a desired range.

This project solves that problem by using FSM-based logic to automatically turn ON the heater or cooler based on temperature conditions.

---

## Solution Approach

- Compare current temperature with desired temperature
- Apply tolerance range for stable operation
- Use FSM for state transitions
- Turn ON heater when temperature is low
- Turn ON cooler when temperature is high
- Return to IDLE when temperature becomes normal

---

## Technologies Used

- Verilog HDL
- Xilinx Vivado
- FSM Design
- RTL Design
- FPGA Design Flow
- Timing Analysis
- Power Analysis

---

## Key Features

- Automatic Heater/Cooler Control
- FSM-based Temperature Decision Logic
- Tolerance-based Stable Operation
- Low Hardware Resource Utilization
- Successful Timing Closure
- Power Efficient Design

---

## Results

- Successful FSM implementation
- Correct heater and cooler switching
- No timing violations
- Total On-Chip Power: 0.811 W
- Resource Utilization:
  - LUTs: 37
  - Flip-Flops: 5

---

## Learning Outcome

This project helped in gaining practical knowledge of:

- FSM-based Digital Design
- Verilog RTL Coding
- Simulation using Testbench
- Vivado Synthesis and Implementation
- Power and Timing Analysis
- FPGA Optimization

---

## Author

**Preethi Sree**  
Electronics and Communication Engineering
