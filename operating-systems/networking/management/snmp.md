# Simple Network Management Protocol (SNMP)

<div class="row row-cols-md-2"><div>

The Simple Network Management Protocol (SNMP) is an old protocol from 1990-2000 that is still quite used by companies to manage and monitor network devices <small>(routers, switch, firewalls...)</small>.

The goal is to ensure that network devices are operating efficiently and effectively in real-time.
</div><div>

 SNMP uses the following ports
 
* **UDP/161** ⛵: to send and receive SNMP messages
* **TCP/161** ⛴️: sometimes used instead of UDP to send messages
* **UDP/162** 🔥️: to send trap messages (reports)
</div></div>

<hr class="sep-both">

### Knowledge

<div class="row row-cols-md-2"><div>

The **Management Information Base (MIB)** 📂 is a component used to store information about network devices. This is a tree-like structure with each node called an **object** 📰 and carrying information such as:

* ✈️ the number of packet that transited by this node
* 💦 the CPU utilization of a server
* ...

A **agent** 👮 is a module that runs on a network device and read/store information about the device inside the MIB.
</div><div>

The **SNMP manager** 👑 is a software that retrieves data from the MIB by asking the agent associated with each device. It runs on a network management system (NMS).

The SNMP manager can also send instructions to the agent to set or change the values of objects. The agent will update its associated device to match the instruction.

Agents can send messages also known as "traps" without being request, for instance, when a problem is detected 🔥.
</div></div>