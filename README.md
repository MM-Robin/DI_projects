<div align="center">

# Digital Integrated Circuits — Lab Projects

**VHDL Design · Simulation · CPLD Implementation**

[![VHDL](https://img.shields.io/badge/VHDL-IEEE%201076-5C2D91?style=flat-square)](https://en.wikipedia.org/wiki/VHDL)
[![Tool](https://img.shields.io/badge/Simulator-Active--HDL%20%2F%20ModelSim-0078D4?style=flat-square)]()
[![Target](https://img.shields.io/badge/Target-CPLD-CC0000?style=flat-square)]()
[![HAW Hamburg](https://img.shields.io/badge/HAW-Hamburg-004F9F?style=flat-square)]()

</div>

---

## Overview

This repository contains VHDL lab projects from the **Digital Integrated Circuits (DI)** course at **HAW Hamburg**. Each lab covers the full hardware design flow — from RTL coding in VHDL, functional simulation via testbench, through to synthesis and validation on a **CPLD (Complex Programmable Logic Device)**.

---

## Repository Structure

```
DI_projects/
│
├── Lab2/                            # Lab Session 2 — Combinational Logic & Adders
│   ├── FullAdder/                   # 1-bit Full Adder (dataflow model)
│   ├── NbitAdder/                   # Generic N-bit Ripple Carry Adder
│   ├── NbitAdderWithCarry/          # N-bit Adder extended with carry flag output
│   └── ArithmeticAdder/             # Generic signed arithmetic adder (N-bit)
│
├── Lab3/                            # Lab Session 3 — Sequential Logic & Counters
│   ├── Counter_0_to_F/              # 4-bit synchronous up/down counter (0x0–0xF)
│   ├── Modulo16_Counter/            # Modulo-16 up counter
│   ├── SevenSegDisplay/             # 4-bit counter with 7-segment display output
│   └── SevenSegDisplay_Extended/    # Extended 7-segment display with new outputs
│
└── README.md
```

Each lab folder contains:

| File | Description |
|---|---|
| `design.vhd` | RTL design entity and architecture |
| `testbench.vhd` | Simulation testbench |
| `run.sh` / `run.do` | Simulation automation scripts |

---

## Lab Session 2 — Combinational Logic & Adders

**Objective:** Model, simulate, and implement combinational adder circuits in VHDL, then synthesize to a CPLD and validate on hardware.

| Module | Description |
|---|---|
| **FullAdder** | 1-bit full adder using dataflow architecture (`XOR`, `AND`, `OR`). Includes half adder entity. |
| **NbitAdder** | Generic N-bit ripple carry adder built from cascaded full adder instances. |
| **NbitAdderWithCarry** | Extension of the N-bit adder introducing an explicit carry-out flag for overflow detection. |
| **ArithmeticAdder** | Signed N-bit arithmetic adder using IEEE `numeric_std`. Supports carry-in with 5 ns propagation delay model. |

**Skills covered:**
- VHDL dataflow and structural modeling
- Generic parameters for scalable designs
- Testbench-driven functional simulation
- CPLD synthesis and hardware validation with oscilloscope measurement of propagation delays

---

## Lab Session 3 — Sequential Logic & Counters

**Objective:** Design and simulate synchronous sequential circuits including up/down counters and 7-segment display decoders, with application to timing and control systems.

| Module | Description |
|---|---|
| **Counter_0_to_F** | 4-bit synchronous up/down counter (0x0–0xF) with active-low async reset, load, direction control, count enable, and terminal count output. |
| **Modulo16_Counter** | Modulo-16 synchronous up counter with testbench verification. |
| **SevenSegDisplay** | Extends the CNT16 counter with a 16-bit BCD/7-segment encoded output (`LCDB_DATA_IN_LED`) for direct display driving. |
| **SevenSegDisplay_Extended** | Further extension adding new decoded output segments for enhanced display control. |

**Skills covered:**
- Synchronous process-based VHDL modeling (`P_REG`, `P_COMB`)
- Active-low reset, load, and terminal count logic
- BCD encoding and 7-segment display decoding
- Timing behavior: scheduling control modes, accurate time measurement in digital systems

---

## Tools & Environment

| Tool | Purpose |
|---|---|
| **Active-HDL** | RTL design entry and simulation |
| **ModelSim / QuestaSim** | Alternative simulation environment (`.do` scripts) |
| **Xilinx ISE / Quartus** | Synthesis and CPLD programming |
| **Oscilloscope** | Hardware validation and propagation delay measurement |

---

## Getting Started

### Simulate with Active-HDL

```bash
cd Lab2/FullAdder
./run.sh
```

### Simulate with ModelSim

```bash
cd Lab3/Counter_0_to_F
vsim -do run.do
```

---

## Author

<div align="center">

**Mainuddin Monsur Robin**  
*M.Sc. Information and Communication Engineering — HAW Hamburg*

[![GitHub](https://img.shields.io/badge/GitHub-MM--Robin-181717?style=flat-square&logo=github)](https://github.com/MM-Robin)

</div>
