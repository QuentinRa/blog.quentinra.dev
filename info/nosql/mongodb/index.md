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

```mongodb
// mongo -u username --authenticationDatabase admin -p
// use admin
// db.createUser({
//     user: "username",
//     pwd:"password",
//     roles:[{ role: "userAdminAnyDatabase", db: "admin"  }]
// })
use database_name
db.createUser( { user: "myuser", pwd: "password", roles: ["readWrite"] })
```

<hr class="sr">

## MongoDB way of doing things

First, **you should now that if something do not have values**, like a database not having "tables", a table not having "values" or an attribute not having a value, **then you won't see it**.

* list all databases `show dbs`
* move to database `use database_name` ("created" if not exists)

Inside a database, you can create collections of documents. A collection could be seen as table in SQL, and documents could be seen as records/tuples.

* `show collections` <small>(remember 🙄, empty = not listed)</small>
* every document in your collection
  * `db.getCollection("name").find()`
  * `db.name.find()`

> **Note**: You can exit with `exit` 😱.

<hr class="sl">

## Documents

<div class="row row-cols-md-2 mx-0"><div>

A document is a JSON object. It's something like this

```json
{
  "key1": "value",
  "key2": 5,
  "key3": true,
  "key4": [
    {
      "key": "value"
    }
  ]
}
```
</div><div>

The keys are your attributes, the value are the value for these attributes for this document.

**Notes**

* Attributes are not properties of the document itself, so documents in a collection may have different attributes
* Each document will have a unique attribute `_id` added, having the type `ObjectId`
* The only way to create a relationship between two documents and either
  * Making an embed document (ex: `key4`)
  * Referencing the `_id` value of another document
</div></div>

> **Note**: [Types that you may use are listed here](https://docs.mongodb.com/manual/core/shell-types/) (new types are Date, ObjectId, ...)

<hr class="sr">

## Insert documents

* **Function**: insertOne(JSON)
* **Note**: create the collection if it does no exists
* **Example**

```mongodb
// insert a document { name: "Calistro" }
db.persons.insertOne( { name: "Calistro" } )
// {"_id": "617d8282a6e50c611c8e3c16", "name": "Calistro"}
```

* **Function**: insertMany(JSONArray)
* **Note**: create the collection if it does no exists
* **Example**

```mongodb
db.persons.insertMany( [ {name: "Suwan", not_used: true }, {name: "Mynasitra"} ] )
// two new documents
```

> ⚠️ **Pro tip** ⚠️: even if you may think that the field `_id` is a string, it's an **ObjectID**. Use `ObjectId(string)` to cast a string to an ObjectId.

<hr class="sl">

## Sources

* <https://docs.mongodb.com/manual/reference/mongo-shell/#command-helpers>
* <https://docs.mongodb.com/manual/tutorial/insert-documents/>
* <https://docs.mongodb.com/manual/tutorial/update-documents/>
* <https://docs.mongodb.com/manual/faq/fundamentals/#how-does-mongodb-address-sql-or-query-injection>
* <https://betterprogramming.pub/little-bobby-collections-how-to-write-a-mongodb-injection-ad58a4e2d754>
* <https://stackoverflow.com/questions/46972695/see-setup-a-user-with-mongodb-compass>
* <https://www.codevscolor.com/pages/mongodb-tutorials/>
* <https://www.mongodb.com/nodejs-database>
* <https://scotch.io/@micwanyoike/getting-started-with-mongodb-in-linux>