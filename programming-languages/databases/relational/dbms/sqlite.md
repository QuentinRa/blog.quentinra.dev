# SQLite 🦐

[![mustacchio](../../../../cybersecurity/_badges/thm-p/mustacchio.svg)](https://tryhackme.com/room/mustacchio)

<div class="row row-cols-lg-2"><div>

SQLite is a file-based database. The database is stored in a file such as `users.db` and queried using SQL.

To run SQL, either use `sqlite3 users.db` to open a prompt, or directly run a query using `sqlite3 xxx.db some_query`.

* SQLite version v1 🔎: `file users.db`
* SQLite version v2 🔎: `select sqlite_version()`
* Help 🃏: `.help`

✍️ You can use [sqlitebrowser](https://github.com/sqlitebrowser/sqlitebrowser) <small>(22.0k ⭐)</small> to visualize the database.
</div><div>

Common commands:

* Dump database 🗃️: `.dump`
* List tables 🧊: `.tables`
* List columns 🫕: `PRAGMA table_info(some_table);`
* Schema ✍️: `select sql from sqlite_master`
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Open An SQLite Database On Windows Using [PSSQLite](https://github.com/RamblingCookieMonster/PSSQLite) <small>(0.3k ⭐)</small>

```ps
PS> Set-ExecutionPolicy Bypass -Scope Process
PS> Import-Module .\PSSQLite.psd1
PS> $db = '.\test.sqlite'
PS> Invoke-SqliteQuery -Database $db -Query "<query here>" | ft -wrap
```
</div><div>
</div></div>