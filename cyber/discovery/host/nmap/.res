* echo xxx name >> /etc/hosts
* nmap xxx
  * Service Info: Host: Os:

`nmap -n`: no dns resolution
nmap -O is no always useful to return the OS. Try using -sN on the open ports too.

ARP scan: This scan uses ARP requests to discover live hosts
ICMP scan: This scan uses ICMP requests to identify live hosts

* If sudo + local => ARP
* If sudo + outside:ICMP echo requests, TCP ACK (Acknowledge) to port 80, TCP SYN (Synchronize) to port 443, and ICMP timestamp request.
* When an unprivileged user tries to scan targets outside the local network, Nmap resorts to a TCP 3-way handshake by sending SYN packets to ports 80 and 443.
* sudo -PR: ARP scan
  * arp-scan --localnet or simply arp-scan -l
  * sudo arp-scan -I eth0 -l
* sudo -PE ( ICMP echo request)
* Because ICMP echo requests tend to be blocked, you might also consider ICMP Timestamp or ICMP Address Mask requests to tell if a system is online. Nmap uses timestamp request (ICMP Type 13) and checks whether it will get a Timestamp reply (ICMP Type 14). Adding the -PP option tells Nmap to use ICMP timestamp requests.
* Similarly, Nmap uses address mask queries (ICMP Type 17) and checks whether it gets an address mask reply (ICMP Type 18). This scan can be enabled with the option -PM.
* TCP SYN -> RST (Reset) if closed `-PS` (if root, reply with RST/ACK otherwise)
* TCP ACK -> send ACK reply? RST -PA
  * used to check if host is up, as RST is replied 'cause no connection
  * If you try it as an unprivileged user, Nmap will attempt a 3-way handshake.
* UDP sudo -PU
* -R, query DNS server even for offline hosts

* https://tryhackme.com/room/nmap02
  * unfiltered
  * TCP actually send an RST,ACK to close the connection
  * Note that we can use -F to enable fast mode and decrease the number of scanned ports from 1000 to 100 most common ports.
  * It is worth mentioning that the -r option can also be added to scan the ports in consecutive order instead of random order. This option is useful when testing whether ports open in a consistent manner, for instance, when a target boots up.
* Wireshark ip.addr==X.X.X.X / tcp / && / tcp.port
* -sU -F (:D)
* you can press enter to force nmap to display the progress
* section about -T https://tryhackme.com/room/nmap02
* Null scan (no flag set)
* FIN scan (send the flag saying "no more to send")
* XMAS (FIN=no more, PSH=push the data to the app, URG=urgent)
* Maimon (FIN=no more, ACK, -sM, most target will reply with RST regardless of open or not)
* -sA ACK scan (send ACK, reply RST regardless...). If may be useful to know which ports are behind a firewall, if a port answered or the firewall did.
* Window scan, same as ACK scan, but analyse the window field of RST responses which on some system may indicate if a port is open (-sW)
* --scanflags RSTSYNFIN (Custom)
* the fact that a firewall allowed a port to respond do not mean that the port is open, as the firewall may not have been updated, or maybe it's a trap.
* sudo/all
* nmap -S SPOOFED_IP IP (but you must have control on the SPOOFED IP to fetch results) -e NET_INTERFACE --spoof-mac SPOOFED_MAC (if on the same network). Maybe used to create decoys.
* nmap -D A,B,C target (decoy scans)
* -f size/8 packets -ff size/16 packets
* --mtu, and --data-length NUM
* Idle/Zombie host that we can communicate with such as a printer. We can use its address with spoofing, then send it a message, and check with "IP ID" if it received a probe. choosing an idle host is indispensable for the accuracy of the scan. -sI
* --reason (see why nmap is telling us xxx is open/...)
* If -vv does not satisfy your curiosity, you can use -d for debugging details or -dd for even more details. You can guarantee that using -d will create an output that extends beyond a single screen.

```
Adding -sV to your Nmap command will collect and determine service and version information for the open ports. You can control the intensity with --version-intensity LEVEL where the level ranges between 0, the lightest, and 9, the most complete. -sV --version-light has an intensity of 2, while -sV --version-all has an intensity of 9.

no -sS with -sV as we need to connection
```

* --traceroute
* -sS -O isok
* -sC execute default scripts
* --script "ftp*"
* can search for cve in nmap folder
* Grepable (grepable)