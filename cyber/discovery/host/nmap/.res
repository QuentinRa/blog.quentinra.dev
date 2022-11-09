* echo xxx name >> /etc/hosts

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