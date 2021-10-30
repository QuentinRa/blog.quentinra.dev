# MongoDB

**MongoDB** is a database storing data using **JSON-based (BSON) documents**. You will use JSON everywhere, and there is **almost no syntax**. This come at the cost: **it's tricky to reference something**. You will have to use the ID of a document, or nest a document inside another 😬.

* Windows
  * Install [MongoDBCompass](https://www.mongodb.com/products/compass)
  * Run MongoDBCompass
  * Enter the local URL `mongodb://localhost:27017/`
* [Linux](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/#install-mongodb-community-edition)
* [Cloud database](https://www.mongodb.com/) (account required)

<hr class="sl">

## Console

* On **Windows**, almost everything is made using the **interface**, but you may open the console by clicking on the small tab at the bottom of the screen.
* On **Linux**, I used `mongod`, so I was only in **command-line**.

This course will mostly cover Mongo from the point of view of a command-line user, as it's easy to execute something using the interface on Windows, given a command, and driver usually provide something similar to the commands used in `mongod`.

<hr class="sl">

## Create an user (optional)

```sql
-- store credentials in admin database
use admin

db.createUser({
    user: "username",
    pwd:"password",
    roles:[
        { role: "userAdminAnyDatabase", db: "admin"  }
    ]
})
```

Then, you can log in with

```bash
mongo -u username --authenticationDatabase admin -p
```

<hr class="sr">

## MongoDB way of doing things

First, **you should now that if something do not have values**, like a database not having "tables", a table not having "values" or an attribute not having a value, **then you won't see it**.

* list all databases `show dbs`
* move to database `use a_name` ("created" if not exists)

Inside a database, you can create collections of documents. A collection could be seen as table in SQL, and documents could be seen as records/tuples.

* `show collections` (remember 🙄, empty = not listed)
* every document in your collection
  * `db.getCollection("name").find()`
  * `db.name.find()`

> **Pro tip**: You can exit with `exit` 😱.