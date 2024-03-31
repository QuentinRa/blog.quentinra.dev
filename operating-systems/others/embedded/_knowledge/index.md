# Embedded devices And IoT

<div class="row row-cols-lg-2"><div>

Embedded devices are systems designed to perform specific functions within larger systems.

* 📦 Compact size while not necessarily small 
* 🏡 Low power consumption
* 🧓 Longer lifespan that usual systems
* 🤖 Constrained environment <small>(computer power, small memory, etc.)</small>

They are often connected to other devices and the internet forming a network called the **Internet of Things 🤖** <small>(IOT)</small>.
</div><div>

Many functions require them to exchange data or to remote control other devices. Some protocols were designed specifically for IoT.
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
</div><div>

* WI-FI IoT SSID "XXX-IOT"
* hidden from users
* [rust-embedded](https://github.com/rust-embedded/rust-raspberrypi-OS-tutorials)
* [iothacking101](https://www.iothacking101.com/)
* [EMBA](https://github.com/e-m-b-a/emba)
* Zigbee and Z-Wave
</div></div>

<hr class="sep-both">

<div class="row row-cols-lg-2"><div>

#### Physical device vulnerabilities

* poor manufacturing or design practices => audits
* lack of encryption => ...
* weak/default passwords => strong password policy
    * Ex: Mirai botnet
* outdated firmware => stays updated, secure boot
* Limit access to devices
* Device hardening

#### Protocols

* weak or non-existent encryption, authentication, or authorization
* Fiddler (tool)
* Limit access to devices
* CoAP, and MQTT
* Radio frequency (RF)
* Zigbee, Z-wave, and Bluetooth

#### External

* OWASP IoT Project
* IoT Village
</div><div>

#### Attacks

* Fuzzing: test crashes/... American Fuzzy Lop (AFL), Peach Fuzzer,  Spike Proxy, Sulley
* Network scanners: Angry IP Scanner
* Exploitation frameworks: CANVAS, CORE IMPACT
* Firmware: Firmware Mod Kit, Binwalk...
* ChipWhisperer, Glitch, or Shakti
* JTAG or UART
</div></div>