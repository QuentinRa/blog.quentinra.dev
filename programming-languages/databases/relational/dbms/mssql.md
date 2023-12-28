# MSSQL 🐭

[![footprinting](../../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)


<div class="row row-cols-lg-2"><div>

Microsoft SQL Server (MSSQL) is a relational database management system developed by Microsoft. It's often used by developers when building .NET applications. 

SQL Server Management Studio (SSMS) is a graphical client that can be installed along MSSQL or separately. . It allows database administrators, developers, and other users to perform various tasks related to SQL Server databases.

🐲 MSSQL default port is 1433.
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

## MSSQL Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Impacket mssqlclient

On Linux, you can use [mssqlclient](/operating-systems/networking/protocols/tools/impacket.md#mssqlclient)

```shell!
$ impacket-mssqlclient username@IP -windows-auth
$ impacket-mssqlclient username:password@IP -windows-auth
```

The `-windows-auth` option is optional because the administrator might have set up a separate account to access the database, aiming to limit lateral movement.

<br>

#### Leverage WMI to access the powershell client

If [WMI (DCOM)](/operating-systems/networking/protocols/wmi.md) is available, you can use the powershell client:

```shell!
$ impacket-wmiexec username:password@IP -shell-type powershell
```
```ps
PS> # -E == Windows Auth | -Q == Query
PS> sqlcmd -E -Q "select name from sys.databases"
PS> sqlcmd -E -i query.sql
PS> sqlcmd -S server_name -U sa -P password [...]
```

</div><div>

#### Random Notes

You can also use some [Metasploit](/cybersecurity/red-team/tools/frameworks/metasploit/index.md) modules.

```shell!
$ msfconsole -q
mfs6> search mssql/             # Find useful modules
mfs6> use mssql_enum_sql_logins # Random example
mfs6> set RHOSTS IP
mfs6> set USERNAME username
mfs6> set PASSWORD password
mfs6> set USE_WINDOWS_AUTHENT true
mfs6> run
```

Other Notes

* See also: [nmap](/cybersecurity/red-team/tools/scanners/ports/nmap.md) `ms-sql*` scripts

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
</div><div>

SSMS

* File > New > Query with current connection
* Press execute to run the file
* Need to add `GO`?
</div></div>