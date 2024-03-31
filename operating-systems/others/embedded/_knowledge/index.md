# Embedded devices And IoT

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day21.svg)](https://tryhackme.com/room/adventofcyber4)


<div class="row row-cols-lg-2"><div>

Embedded devices are systems designed to perform specific functions within larger systems.

* 📦 Compact size while not necessarily small 
* 🏡 Low power consumption
* 🧓 Longer lifespan that usual systems
* 🤖 Constrained environment <small>(computer power, small memory, etc.)</small>

They are often connected to other devices and the internet forming a network called the **Internet of Things 🤖** <small>(IOT)</small>.
</div><div>

Many functions require them to exchange data or to remote control other devices. Some protocols were designed specifically for IoT.

* "IoT data protocol" for protocols over TCP
* "IoT network protocol" for protocols over wireless technology
</div></div>

<hr class="sep-both">

## Low-Level Communication

<div class="row row-cols-lg-2"><div>

The basis of low-level communication is to send zeros and ones by respectively turning off and on the power.

#### UART And USART — Low-Level Communication

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day19.svg)](https://tryhackme.com/room/adventofcyber4)

Universal Asynchronous Receiver-Transmitter <small>(UART)</small> or Universal Synchronous Asynchronous Receiver Transmitter <small>(USART)</small> are both clock-less serial communication protocols.

For UART, one wire `RT` is used to receive data, while another wire `TX` is used to send data. The devices define the communication settings:

* 🚗 Baud rate or bit rate <small>(communication speed)</small>
* 🖼️ Frame size <small>(often 8 bits per message)</small>
* ⏱️ Start/Stop bits <small>(before/after the message was sent)</small>
* ...

It usually involves a `CTS`, a `RTS`, and a `GND` wires.
</div><div>

#### SPI — Low-Level Communication

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day19.svg)](https://tryhackme.com/room/adventofcyber4)

The Serial Peripheral Interface <small>(SPI)</small> is often used for communication between microprocessors and peripherals <small>(ex: SD Card)</small>.

There is a channel `SCK` with the clock telling the receiver when it needs to read data, and channels `DATA IN/OUT` to read/write data.

* It's faster and more reliable that UART.
* Clock signals are only sent from one "controller" device

#### I2C — Low-Level Communication

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day19.svg)](https://tryhackme.com/room/adventofcyber4)

The Inter-Integrated Circuit (I2C) was designed to be faster than UART using a clock, while using fewer wires than for SPI.

#### Logic Analyzer Tools

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day19.svg)](https://tryhackme.com/room/adventofcyber4)

[saleae](https://www.saleae.com/) can be used to capture  and analyze UART traffic. Create an analyzer with the correct settings, and click on the terminal to view the analyzed text messages given the settings.
</div></div>

<hr class="sep-both">

## IoT Communications

<div class="row row-cols-lg-2"><div>

#### MQTT Protocol

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day21.svg)](https://tryhackme.com/room/adventofcyber4)

MQTT (Message Queuing Telemetry Transport) is a publish-subscribe communication protocol where a broker store the last message from a publisher and continuously relays them.

A message is associated with a topic, usually `<name>/<id>/<function>`, which allows brokers to handle multiple messages. The ID refers to the device ID typically fetched from the topic `device/init`.

```shell!
$ sudo apt install -y mosquitto-clients
$ mosquitto_sub -t device/ping
$ mosquitto_sub -h example.com -t device/ping
$ mosquitto_pub -h example.thm -t xxx/yyy -m "A message"
$ # -d | -i id | -p port | -u user | -P pass | -url URL 
```

📚 By default, anyone can read/write to any topic.
</div><div>

#### CoAP Protocol

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day21.svg)](https://tryhackme.com/room/adventofcyber4)

CoAP (Constrained Application Protocol) is a protocol converting HTTP requests to a simple and lightweight message format over UDP. 

#### AMQP Protocol

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day21.svg)](https://tryhackme.com/room/adventofcyber4)

AMQP (Advanced Message Queuing Protocol) is a protocol for asynchronous messaging between various different applications.

#### DDS Protocol

[![adventofcyber4](../../../../cybersecurity/_badges/thm/adventofcyber4/day21.svg)](https://tryhackme.com/room/adventofcyber4)

DDS (Data Distribution Service) is a publish-subscribe communication protocol for real-time and embedded systems.
</div></div>

<hr class="sep-both">

## Firmware Analysis

<div class="row row-cols-lg-2"><div>

Moved to [Firmware Analysis](/cybersecurity/purple-team/reverse/index.md#firmware-reversing-and-analysis).
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Access Point > to-do (Zigbee and Z-Wave)
* Investigation > IoT
* [variot.eu](https://www.variot.eu/)
* IoT (VLAN (technology) - IoT (concept))
* we want to isolate them 
* printer 
* segment IoT devices
* WI-FI IoT SSID "XXX-IOT"
* hidden from users
* [rust-embedded](https://github.com/rust-embedded/rust-raspberrypi-OS-tutorials)
* [iothacking101](https://www.iothacking101.com/)
* [EMBA](https://github.com/e-m-b-a/emba)
* Zigbee and Z-Wave
* OWASP IoT Project
* IoT Village
</div><div>

Physical device vulnerabilities

* poor manufacturing or design practices => audits
* weak/default passwords => strong password policy
  * Ex: Mirai botnet
* Limit access to devices
* Device hardening

Protocols

* weak or non-existent encryption, authentication, or authorization
* Fiddler (tool)
* Limit access to devices
* CoAP, and MQTT
* Radio frequency (RF)
* Zigbee, Z-wave, and Bluetooth

Attacks

* Fuzzing: test crashes/... American Fuzzy Lop (AFL), Peach Fuzzer,  Spike Proxy, Sulley
* Network scanners: Angry IP Scanner
* Exploitation frameworks: CANVAS, CORE IMPACT
* ChipWhisperer, Glitch, or Shakti
* JTAG or UART
</div></div>