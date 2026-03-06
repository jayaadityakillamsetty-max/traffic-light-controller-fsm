# traffic-light-controller-fsm
Implementation of Traffic Light Controller using FSM logic in verilog HDL
# Traffic Light Controller using FSM (Verilog)
This project demonstrates a simple traffic light controller designed using a Finite State Machine (FSM) in Verilog. The controller simulates how traffic signals operate at a road intersection by switching between different states such as green, yellow, and red.
The design uses a clock signal and a timer to control how long each signal remains active. A pedestrian request input is also included so the controller can respond when someone needs to cross the road.
The behaviour of the system is verified using a Verilog testbench, and the output signals are observed through simulation waveforms.
## Features
- Finite State Machine based traffic signal control  
- Timer controlled signal transitions  
- Pedestrian request support  
- Simulation using Verilog testbench
## Simulation Waveform
![Waveform](waveform.png)
## Files
- `traffic_light_controller.v` – Main Verilog design  
- `testbench.v` – Testbench used for simulation  
- `waveform.png` – Simulation output waveform
