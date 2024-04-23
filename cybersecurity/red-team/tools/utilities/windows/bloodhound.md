# BloodHound

[![active_directory_enumeration_attacks](../../../../_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![adenumeration](../../../../_badges/thm/adenumeration.svg)](https://tryhackme.com/r/room/adenumeration)

<div class="row row-cols-lg-2"><div>

[BloodHound](https://github.com/BloodHoundAD/BloodHound) <small>(9.3k ⭐)</small> is a reference when pentesting Active Directory. The tool can collect data, display results as a [Neo4J](/programming-languages/databases/non-relational/graph/neo4j.md), and provide Neo4J queries to identify attack vectors and attack paths.

They seem to be moving to an paid and a [community version](https://github.com/SpecterOps/BloodHound) <small>(0.7k ⭐)</small>.

On the target, run a data collector such as [SharpHound](https://github.com/BloodHoundAD/SharpHound) <small>(0.6k ⭐)</small>:

```ps
PS> .\SharpHound.exe -c All --zipfilename results
PS> .\SharpHound.exe -c Session --zipfilename results
PS> .\SharpHound.exe --CollectionMethods All --Domain example.com --ExcludeDCs
```

There is also an unofficial [python](https://github.com/fox-it/BloodHound.py) collector <small>(1.7k ⭐)</small>:

```shell!
$ sudo apt install -y bloodhound.py
$ bloodhound-python -u 'username' -p 'password' -ns DC_IP -d domain -c all
$ bloodhound-python -u 'username@example.com' -p 'password' -d domain -dc DC_IP -c all
<user sessions, users and groups, object properties, ACLS>
$ zip -r results.zip *.json
```
</div><div>

On your host, run [bloodhound](https://www.kali.org/tools/bloodhound/) and import the zip using 'Import Data.'

```shell!
$ sudo neo4j console& # neo4j:neo4j, change password
$ sudo apt install bloodhound -y
$ # Need a custom version such as 4.1.0 below?
$ wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.1.0/BloodHound-linux-x64.zip && unzip BloodHound-linux-x64.zip && rm -rf BloodHound-linux-x64.zip && cd BloodHound-linux-x64 && chmod +x BloodHound
```

```shell!
$ bloodhound
$ ./BloodHound --no-sandbox # locally installed
```

⚠️ The collection version must match your BloodHound version, or results may not be correctly parsed leading to missing attacks paths.

⚠️ Ideally, a collector should be run once to capture everywhere, then twice a day <small>(10 a.m. and 14p.m.)</small> to ensure sessions data is correct.
</div></div>

<hr class="sep-both">

## BloodHound Overview

<div class="row row-cols-lg-2"><div>

A few notes:

* 🛬 Click on 'Import Data' or drag and drop your zip to import it.
* 📚 Navigate to Analysis to run saved queries
* 🔎 Click on objects <small>(don't hesitate!)</small> to load them in the view
* 🔑 Use the search bar to search objects. There is a path icon to search for a path between objects <small>(e.g., from current user to admin)</small>.
* 🖨️ Press <kbd>CTRL</kbd> to see labels below each node

Node information:

* Outbound Object Control: ACL attacks, refer to [this](/cybersecurity/red-team/s4.privesc/windows/topics/privs.md#windows-dangerous-aces)
</div><div>

Useful queries:

* Find Shortest Paths To Domain Admins
* Find Computers with Unsupported Operating Systems
* Find Computers where Domain Users are Local Admin
* Find Users with Foreign Domain Group Membership
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* For Azure instances, there is [AzureHound](https://github.com/BloodHoundAD/AzureHound) <small>(0.5k ⭐)</small>

```cypher
MATCH p1=shortestPath((u1:User)-[r1:MemberOf*1..]->(g1:Group)) MATCH p2=(u1)-[:CanPSRemote*1..]->(c:Computer) RETURN p2
```
</div><div>
</div></div>