ghdl -a and_gate.vhdl and_gate_tb.vhdl # Analyze source
ghdl -e and_gate_tb # Build executable
ghdl -r and_gate_tb --vcd=and_gate.vcd # Run simulation
gtkwave and_gate.vcd # View waveform in GTKWave
