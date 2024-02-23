# MSSQL 🐭

[![footprinting](../../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![attacking_common_services](../../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

<div class="row row-cols-lg-2"><div>

Microsoft SQL Server (MSSQL) is a relational database management system developed by Microsoft. It's often used by developers when building .NET applications. 

SQL Server Management Studio (SSMS) is a graphical client that can be installed along MSSQL or separately. It allows database administrators, developers, and other users to perform various tasks related to SQL Server databases.

🐲 MSSQL default port is 1433 or 2433 <small>(TCP)</small> and 1434 <small>(UDP)</small>.
</div><div>

Common commands:

```sql!
select name from sys.databases    -- list databases
select name from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb');
use db_name;                      -- select a database
-- list the tables in the database
select table_name from information_schema.tables where table_type = 'base table';
-- list the columns of the table "table_name_here"
select column_name, data_type from information_schema.columns where table_name = 'table_name_here';
```
</div></div>

<hr class="sep-both">

## MSSQL Clients

<div class="row row-cols-lg-2"><div>

#### Windows client - sqlcmd

On Windows, you can use the [sqlcmd](https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-utility?view=sql-server-ver16&tabs=go%2Cwindows&pivots=cs1-bash) utility.

```ps
PS> # -E == Windows Auth | -Q == Query
PS> sqlcmd -E -Q "select name from sys.databases"
PS> sqlcmd -E -i query.sql
PS> sqlcmd -S server_name -U sa -P password [...]
```

If [WMI (DCOM)](/operating-systems/networking/protocols/wmi.md) is available, from a Linux host, you can access `sqlcmd` after popping a powershell:

```shell!
$ impacket-wmiexec username:password@IP -shell-type powershell
```
</div><div>

#### Linux client - sqlsh

You can use [sqlsh](https://en.wikipedia.org/wiki/Sqsh) on Linux.

```shell!
$ sqsh -S IP -U 'username' -P 'password' -h
$ sqsh -S IP -U '.\\username' -P 'password' -h
```

#### Linux client - impacket

You can alternatively use [mssqlclient](/operating-systems/networking/protocols/tools/impacket.md#mssqlclient).

```shell!
$ impacket-mssqlclient username@IP -windows-auth
$ impacket-mssqlclient username:password@IP -windows-auth
```

The SQL Server might user Windows Authentication or Username/Password Authentication. Use or remove`-windows-auth` accordingly.
</div></div>


<hr class="sep-both">

## MSSQL Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Enumeration

* We can use [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) to run scripts

```shell!
$ nmap -sC -sV --script "*ms-sql*" -p 1433 IP
```

* Look for interesting [Metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md) modules.

```shell!
mfs6> search mssql/
```

#### FootHold

[![attacking_common_services](../../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* You can use [Metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md) to XXX.

```shell!
mfs6> use mssql_enum_sql_logins
mfs6> set RHOSTS IP
mfs6> set USERNAME username
mfs6> set PASSWORD password
mfs6> set USE_WINDOWS_AUTHENT true
mfs6> run
```
</div><div>

#### Exploitation

[![attacking_common_services](../../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

#### Additional Notes

* If installed, look for saved credentials in SSMS

* The services often runs as `NT SERVICE\MSSQLSERVER`

* By default, encryption is not enforced when attempting to connect.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Try running the tool as administrator
* HeidiSQL, SQLPro, mssql-cli
* [System Databases](https://learn.microsoft.com/en-us/sql/relational-databases/databases/system-databases?view=sql-server-ver15)

```sql!
SELECT name FROM master.dbo.sysdatabases
SELECT table_name FROM xxx.INFORMATION_SCHEMA.TABLES
```
</div><div>

SSMS

* File > New > Query with current connection
* Press execute to run the file
* Need to add `GO`?
</div></div>