```make
# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html

SIM ?= icarus
FST ?= -fst
TOPLEVEL_LANG ?= verilog

SRC_DIR = $(PWD)/../src

# Your actual source file
PROJECT_SOURCES = tt_um_ecc_processor.v

ifneq ($(GATES),yes)

# RTL simulation
SIM_BUILD = sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate-level simulation
SIM_BUILD = sim_build/gl
COMPILE_ARGS += -DGL_TEST
COMPILE_ARGS += -DFUNCTIONAL
COMPILE_ARGS += -DUSE_POWER_PINS
COMPILE_ARGS += -DSIM
COMPILE_ARGS += -DUNIT_DELAY=\#1

VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

COMPILE_ARGS += -I$(SRC_DIR)

# Testbench
VERILOG_SOURCES += $(PWD)/tb_tt_um_ecc_processor.v

TOPLEVEL = tb

COCOTB_TEST_MODULES = test

include $(shell cocotb-config --makefiles)/Makefile.sim
```
