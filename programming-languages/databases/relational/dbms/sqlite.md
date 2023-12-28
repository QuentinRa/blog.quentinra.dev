# SQLite 🦐

<div class="row row-cols-lg-2"><div>

SQLite is a file-based database. The database is stored in a file such as `users.db` and queried using SQL.

To run SQL, either use `sqlite3 users.db` to open a prompt, or directly run a query using `sqlite3 xxx.db some_query`.

* SQLite version v1 🔎: `file users.db`
* SQLite version v2 🔎: `select sqlite_version()`
* Help 🃏: `.help`
</div><div>

Common commands:

* Dump database 🗃️: `.dump`
* List tables 🧊: `.tables`
* List columns 🫕: `PRAGMA table_info(some_table);`
* Schema ✍️: `select sql from sqlite_master`
</div></div>