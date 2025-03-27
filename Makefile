
GHDL = ghdl
GTKWAVE = gtkwave

TEST_DIR = ./test
SRC = ./comp

EXEC_NAME = and_gate_tb

TFLAGS = --vcd=and_gate.vcd

analyze: $(SRC)/and_gate.vhdl $(TEST_DIR)/and_gate_tb.vhdl
	@$(GHDL) -a $^

build: work-obj93.cf
	$(GHDL) -e $(EXEC_NAME)

test:
	$(GHDL) -r $(EXEC_NAME) $(TFLAGS)

wave:
	$(GTKWAVE) *.vcd

clean:
	@rm work-obj*