# Smart Occupancy Monitoring System

A hardware-based **Smart Occupancy Monitoring System** implemented using **Verilog HDL** on the **PYNQ-Z2 FPGA** platform. The system accurately counts the number of people entering and exiting a room using **IR break-beam sensors** and **Finite State Machine (FSM)** logic. It provides real-time occupancy monitoring, capacity control, and energy-efficient automation suitable for smart buildings, classrooms, offices, and public spaces.

---

## 📌 Project Overview

Conventional occupancy monitoring systems based on microcontrollers often suffer from sequential processing delays and limited real-time performance. This project overcomes these limitations by implementing the entire design in hardware on an FPGA, enabling deterministic timing, parallel processing, and high-speed operation.

The system uses two IR sensors placed at the entrance of a room to detect movement direction. Based on the sensor activation sequence, an FSM determines whether a person is entering or exiting and updates the occupancy count accordingly.

---

## ✨ Features

- Real-time occupancy monitoring
- Accurate bidirectional people counting
- FPGA-based hardware implementation
- Finite State Machine (FSM) for direction detection
- IR break-beam sensor interface
- Occupancy limit monitoring
- Overcrowding alert generation
- Energy-efficient room automation
- ASIC-ready design using Cadence tools
- Low latency and deterministic performance

---

## 🛠 Technologies Used

### Hardware

- PYNQ-Z2 FPGA Board
- IR Break-Beam Sensors
- Power Supply
- LEDs / Display Module
- Connecting Wires

### Software

- Verilog HDL
- Xilinx Vivado Design Suite
- PYNQ Framework
- Cadence (ASIC Design Flow)

---

## 🏗 System Architecture

```
                +-------------------+
                |   IR Sensor A     |
                +---------+---------+
                          |
                          |
                +---------v---------+
                | Sensor Interface  |
                | Debounce & Sync   |
                +---------+---------+
                          |
                +---------v---------+
                |  Finite State     |
                |    Machine (FSM)  |
                +---------+---------+
                          |
                +---------v---------+
                | Up/Down Counter   |
                +---------+---------+
                          |
          +---------------+----------------+
          |                                |
+---------v---------+             +---------v---------+
| Occupancy Display |             | Alert System      |
+-------------------+             +-------------------+
```

---

## ⚙ Working Principle

1. Two IR sensors continuously monitor the doorway.
2. When a person crosses the entrance, the IR beam is interrupted.
3. Sensor signals are synchronized and filtered.
4. The FSM determines movement direction.
5. Entry increments the occupancy count.
6. Exit decrements the occupancy count.
7. The updated occupancy is displayed.
8. If the room exceeds the maximum capacity, an alert is generated.

---

## 📂 Project Structure

```
Smart_occupancy_monitoring_system/
│
├── rtl/
│   ├── sensor_interface.v
│   ├── fsm.v
│   ├── counter.v
│   ├── controller.v
│   └── top_module.v
│
├── testbench/
│   └── tb_top.v
│
├── constraints/
│   └── top.xdc
│
├── simulation/
│
├── synthesis/
│
├── docs/
│
├── images/
│
└── README.md
```

---

## 🚀 Design Flow

```
IR Sensors
      │
      ▼
Signal Conditioning
      │
      ▼
Finite State Machine
      │
      ▼
Occupancy Counter
      │
      ▼
Capacity Check
      │
      ▼
Display / Alert
```

---

## 📊 Performance

| Parameter | Result |
|-----------|--------|
| Counting Accuracy | 96–98% |
| Direction Detection | ~97% |
| Response Time | < 1 second |
| False Trigger Rate | < 2% |
| Continuous Operation | Stable |
| Power Consumption | Low |

---

## 🎯 Applications

- Smart Classrooms
- Offices
- Libraries
- Auditoriums
- Hospitals
- Shopping Malls
- Conference Halls
- Smart Buildings
- Industrial Facilities

---

## 🔮 Future Enhancements

- IoT integration for remote monitoring
- Cloud dashboard
- Mobile application
- Wireless communication
- AI-assisted occupancy prediction
- Multi-door occupancy tracking
- Vision-based verification
- Smart HVAC integration

---

## 📸 Results

The system was successfully implemented and verified on the **PYNQ-Z2 FPGA** platform.

Achievements:

- Accurate bidirectional counting
- Real-time occupancy updates
- Low-latency hardware processing
- Reliable operation during continuous movement
- Energy-efficient implementation

---

## 💻 Getting Started

### Clone the Repository

```bash
git clone https://github.com/pravin2007-ctrl/Smart_occupancy_monitoring_system.git
```

### Open in Vivado

1. Launch Vivado Design Suite.
2. Create a new RTL project.
3. Add all Verilog source files.
4. Add the XDC constraint file.
5. Run Simulation.
6. Run Synthesis.
7. Run Implementation.
8. Generate Bitstream.
9. Program the PYNQ-Z2 FPGA.

---

## 📚 References

- Xilinx Vivado Design Suite
- PYNQ-Z2 Reference Manual
- Verilog HDL
- Cadence ASIC Design Tools

---

## 👨‍💻 Author

**Pravin A**

B.E. Electronics and Communication Engineering

GitHub: https://github.com/pravin2007-ctrl

---


## ⭐ Support

If you found this project useful, please consider giving it a **⭐ Star** on GitHub.
