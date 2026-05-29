# SPDX-FileCopyrightText: © 2026 Dhanush Kulkarni

# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_ecc_processor(dut):

```
dut._log.info("Starting ECC Processor Test")

clock = Clock(dut.clk, 10, unit="us")
cocotb.start_soon(clock.start())

dut.ena.value = 1
dut.ui_in.value = 0
dut.uio_in.value = 0
dut.rst_n.value = 0

await ClockCycles(dut.clk, 5)

dut.rst_n.value = 1

# Test 1
dut.ui_in.value = 5
dut.uio_in.value = 3

await ClockCycles(dut.clk, 1)

expected = (5 * 3) + 5
assert int(dut.uo_out.value) == expected

# Test 2
dut.ui_in.value = 10
dut.uio_in.value = 4

await ClockCycles(dut.clk, 1)

expected = (10 * 4) + 10
assert int(dut.uo_out.value) == expected

# Test 3
dut.ui_in.value = 20
dut.uio_in.value = 30

await ClockCycles(dut.clk, 1)

expected = ((20 * 30) + 20) & 0xFF
assert int(dut.uo_out.value) == expected

dut._log.info("ECC Processor Test Passed")
