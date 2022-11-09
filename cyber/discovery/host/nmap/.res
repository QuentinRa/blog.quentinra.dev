* echo xxx name >> /etc/hosts

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