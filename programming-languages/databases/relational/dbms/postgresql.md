# PostgreSQL 🍰

[![cozyhosting](../../../../cybersecurity/_badges/htb-p/cozyhosting.svg)](https://app.hackthebox.com/machines/CozyHosting)

<div class="row row-cols-lg-2"><div>

[PostgreSQL](https://github.com/postgres) is an open-source relational database management system. It uses and extends the SQL language combined with many features that safely store and scale complex data workloads.

**Port(s)** 🐊: 5432 (TCP)

```ps
$ psql -h SOME_IP -U root
$ psql -h SOME_IP -U root -d database
```

⚠️ Don't forget `-h` or it doesn't seem to work.
</div><div>

Some commands

```sql!
SELECT datname FROM pg_database; -- list databases
\c db_name                       -- select one
\dt                              -- list tables
\d table_name                    -- describe table
SELECT tablename FROM pg_tables WHERE schemaname = 'public'; -- list tables
SELECT column_name, data_type FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'table_name'; -- describe table
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `service postgresql status`
</div><div>
</div></div>