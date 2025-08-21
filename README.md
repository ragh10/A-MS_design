# A-MS_design

#Mixed signal design for high speed circuits:-
High Speed Serializer/Deserializer (SERDES) Design
Guided by Prof.Ram Achar (Carleton University)

Abstract

Designed and implemented a Serializer/Deserializer (SerDes) transceiver in 65nm CMOS, integrating Serializer, Deserializer, CTLE, and SAR ADC blocks for robust high-speed data communication.
<img width="975" height="199" alt="image" src="https://github.com/user-attachments/assets/0389dfc1-64bf-44a3-956e-b2ffc0539ec7" />

Methodology

>Designed Serializer (PISO) and Deserializer (SIPO) using optimized flip-flop/MUX-based digital logic.

>Developed a CTLE with equalization and impedance matching to compensate for high-frequency channel losses.

>Built an 8-bit SAR ADC (S/H, comparator, DAC, latch) for signal digitization.

Results:-

>Achieved 5–10 GHz serial data transmission with low jitter.

>CTLE boosted degraded input from ~290 mV → ~900 mV, improving eye-opening.

>SAR ADC provided accurate 8-bit digitization of received signals.

Tools & Skills

Cadence Virtuoso | Mixed-Signal/Analog Design | High-Speed Link Verification

#Digital electronics:
1) ALU
>Designed ALU in Verilog, completed RTL synthesis, and implemented full-chip layout including floorplanning, and P&R.
>Implemented power planning, guard rings, and IR drop mitigation; exported final GDSII and verified in Virtuoso.
2) CAN TRANSMITTER BUFFER
>Designed and optimized a CAN transmitter buffer module in Verilog code utilizing FSM concepts for reducing complexity.
>Developed a Verilog test bench with sample inputs and ran simulations to analyze outputs and validate design functionality.
3) NOR3
>Designed schematic and layout level design of 2 and 3 input NOR gate in TSMC 65nm and GPDK045nm using Virtuoso
>Performed spectre simulation analyzing circuit characterstics, layout verification including DRC, LVS and QRC using Assura and Quantus and Post layout simulation.



