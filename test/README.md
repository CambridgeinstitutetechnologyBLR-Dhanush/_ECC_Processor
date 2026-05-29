# ECC Processor Testbench

This directory contains the simulation and verification environment for the ECC Processor TinyTapeout project.

The testbench uses **Cocotb** to verify the functionality of the ECC Processor and ensure correct operation before physical implementation.

## Project Files

* `test.py` – Cocotb test script
* `tb_tt_um_ecc_processor.v` – Verilog testbench wrapper
* `Makefile` – Simulation build and execution script
* `tb.gtkw` – GTKWave signal configuration
* `requirements.txt` – Python package dependencies

## Setting Up

1. Install the required Python packages:

```bash
pip install -r requirements.txt
```

2. Verify that the Makefile references the ECC Processor source file:

```make
VERILOG_SOURCES = ../src/tt_um_ecc_processor.v
```

3. Ensure the testbench instantiates:

```verilog
tt_um_ecc_processor
```

as the DUT (Device Under Test).

## How to Run

### RTL Simulation

Run the RTL simulation:

```bash
make -B
```

This compiles the ECC Processor RTL and executes the Cocotb test.

### Gate-Level Simulation

After OpenLane successfully generates the gate-level netlist:

1. Copy the generated netlist:

```bash
cp ../runs/wokwi/results/final/verilog/gl/tt_um_ecc_processor.v gate_level_netlist.v
```

2. Run gate-level simulation:

```bash
make -B GATES=yes
```

## Waveform Generation

Simulation generates waveform files for debugging.

### Generate FST Waveform

```bash
make -B
```

Output:

```text
tb.fst
```

### Generate VCD Waveform

Edit the testbench to use:

```verilog
$dumpfile("tb.vcd");
```

Then run:

```bash
make -B FST=
```

Output:

```text
tb.vcd
```

## Viewing Waveforms

### Using GTKWave

```bash
gtkwave tb.fst tb.gtkw
```

### Using Surfer

```bash
surfer tb.fst
```

## ECC Processor Function

The ECC Processor performs a simplified ECC arithmetic operation:

```text
Result = (Scalar × Point) + Scalar
```

Inputs:

* `ui_in[7:0]` : Scalar value
* `uio_in[7:0]` : Point coordinate

Output:

* `uo_out[7:0]` : Computed ECC result

## Author

Dhanush Kulkarni
