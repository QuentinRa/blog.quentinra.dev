# BloodHound

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

[BloodHound](https://github.com/BloodHoundAD/BloodHound) <small>(9.3k ⭐)</small> is a reference when pentesting Active Directory. The tool can collect data, display results as a [Neo4J](/programming-languages/databases/non-relational/graph/neo4j.md), and provide Neo4J queries to identify attack vectors and attack paths.

They seem to be moving to an paid and a [community version](https://github.com/SpecterOps/BloodHound) <small>(0.6k ⭐)</small>.

On the target, run the data collector:

```ps
PS> .\SharpHound.exe -c All --zipfilename results
```

On your host, run [bloodhound](https://www.kali.org/tools/bloodhound/) and import the zip using 'Import Data.'

```ps
$ sudo apt install bloodhound -y
$ sudo neo4j console& # neo4j:neo4j
$ bloodhound
```

Click on the Hamburger and navigate to Analysis to run saved queries.
</div><div>

Useful queries:

* Find Shortest Paths To Domain Admins
* Find Computers with Unsupported Operating Systems 
* Find Computers where Domain Users are Local Admin

There is also an unofficial [python](https://github.com/fox-it/BloodHound.py) script <small>(1.7k ⭐)</small>.

```shell!
$ sudo apt install -y bloodhound.py
$ bloodhound-python -u 'username' -p 'password' -ns DC_IP -d domain -c all
<user sessions, users and groups, object properties, ACLS>
$ zip -r results.zip *.json
```
</div></div>