Design-and-Simulation-of-8-8-Synchronous-RAM


This project implements an 8×8 Synchronous Random Access Memory (RAM) using Verilog HDL.
The RAM has 8 memory locations (3‑bit address) and each location stores 8‑bit data.
All read and write operations are performed synchronously on the rising edge of the clock.

A testbench is also included to simulate and verify the functionality:

When we = 1, the input data is written to the addressed location.

When we = 0, the data stored at the addressed location is read and sent to the output.

Key Features:

8 memory locations × 8‑bit width

Synchronous operation with clock

Simple, synthesizable Verilog code

Ready‑to‑run testbench for simulation

