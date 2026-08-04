# Verilog_Sequential_Projects
---

## 📖 Overview

**Sequential_Projects** is a collection of fundamental **sequential digital circuits** implemented using **Verilog HDL**. This repository demonstrates the design and implementation of commonly used digital systems based on **Finite State Machines (FSMs)**, counters, and sequential logic.

The repository includes **Digital Clock, Elevator Controller, Pulse Generator, Sequence Detector, Stop Watch, and Traffic Light Controller**. Each module is written using synthesizable Verilog HDL, accompanied by a dedicated testbench, and can be simulated to verify its functionality using waveform analysis.

These projects are widely used in FPGA development, embedded systems, ASIC design, and VLSI applications. They help build a strong foundation in digital system design, timing circuits, and state-machine implementation.

---

# 📖 Modules

## 1. Digital Clock

### Description

A **Digital Clock** is a sequential timing circuit that displays the current time in **Hours, Minutes, and Seconds (HH:MM:SS)**. It continuously updates the time based on the system clock and automatically rolls over seconds, minutes, and hours when their maximum values are reached.

### Features

* Displays time in HH:MM:SS format
* Automatic rollover of seconds, minutes, and hours
* Synchronous sequential design
* Reset support
* Suitable for FPGA implementation

---

## 2. Elevator Controller

### Description

An **Elevator Controller** is an FSM-based sequential circuit that controls the movement of an elevator between different floors. It processes floor requests, determines the movement direction, and safely transitions between floors while stopping at the requested destination.

### Features

* FSM-based implementation
* Controls upward and downward movement
* Floor request handling
* Safe state transitions
* Easily expandable to multiple floors

---

## 3. Pulse Generator

### Description

A **Pulse Generator** is a sequential circuit that generates a pulse of fixed duration in response to a trigger signal. Pulse generators are commonly used in digital timing circuits, synchronization, and event-triggered applications.

### Features

* Generates fixed-width pulses
* Clock synchronized operation
* Reset functionality
* Simple sequential implementation
* Useful for timing and triggering applications

---

## 4. Sequence Detector

### Description

A **Sequence Detector** is a Finite State Machine (FSM) that detects a predefined binary sequence from a serial input stream. When the desired sequence is detected, the output becomes HIGH for one clock cycle before continuing to monitor the input stream.

### Features

* FSM-based design
* Supports overlapping sequence detection
* Serial data processing
* Reliable sequence recognition
* Suitable for communication systems

---

## 5. Stop Watch

### Description

A **Stop Watch** is a sequential timing circuit used to measure elapsed time in **Minutes and Seconds (MM:SS)**. It provides controls for starting, stopping, and resetting the timer while maintaining accurate time counting.

### Features

* Start, Stop, and Reset operations
* MM:SS time display
* Synchronous counting
* Real-time timer implementation
* Suitable for FPGA projects

---

## 6. Traffic Light Controller

### Description

A **Traffic Light Controller** is an FSM-based controller that manages traffic signals for a highway and side road. It cycles through Green, Yellow, and Red states in a predefined sequence to ensure smooth and safe traffic flow.

### Features

* FSM-based traffic control
* Automatic signal sequencing
* Highway and side-road management
* Configurable timing intervals
* Safe state transitions

---

# 🛠 Tools Used

* **Verilog HDL** – Hardware Description Language used to design the sequential circuits
* **EDA Playground** – Online platform for Verilog coding and simulation
* **ModelSim / QuestaSim** – HDL simulation and functional verification
* **Intel Quartus II / Quartus Prime** – FPGA synthesis and implementation

---

# 🎯 Learning Outcomes

After completing these designs, you will understand:

* Fundamentals of sequential logic circuits
* Finite State Machine (FSM) design methodology
* Digital timing and clock-driven systems
* Sequence detection using FSM
* Digital controller implementation
* Simulation and verification using Verilog HDL

---

# 📚 Applications

* Digital Clocks
* Traffic Signal Controllers
* Elevator Control Systems
* Digital Timers
* Industrial Automation
* Embedded Systems
* FPGA Development
* ASIC Design
* VLSI Digital Systems

---

# 🚀 Conclusion

This repository provides a practical introduction to **sequential digital system design using Verilog HDL**. By implementing **Digital Clock, Elevator Controller, Pulse Generator, Sequence Detector, Stop Watch, and Traffic Light Controller**, the fundamental concepts of **sequential logic, finite state machines (FSMs), timing circuits, and digital control systems** can be thoroughly understood.

These designs serve as essential building blocks for advanced digital hardware applications, including **FPGA development, embedded systems, automation, communication systems, and VLSI design**.

---

⭐ If you find this repository helpful, don't forget to *Star* it!
