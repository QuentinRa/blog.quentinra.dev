# MongoDB

<div class="row row-cols-md-2"><div>

MongoDB is a popular **Document** [NoSQL](../index.md) Database. It stores data as **JSON-based (BSON) documents**. All queries use [JSON](/programming-languages/others/data/json.md), so there is almost no MongoDB-specific syntax.

* [MongoDB Manual](https://www.mongodb.com/docs/manual/introduction/)
* [MongoDB Guides](https://www.mongodb.com/docs/guides/)

You can [use Compass GUI](https://www.mongodb.com/products/compass). Otherwise, follow [MongoDB install instructions](https://www.mongodb.com/docs/manual/administration/install-community/) (`mongosh`...), or use the [cloud](https://www.mongodb.com/atlas/database) database.
</div><div>

The URL is commonly `mongodb://localhost:27017/`.

* ✅ No account required
* 🌱 Easy to learn
* 🤝 open-source ([GitHub](https://github.com/mongodb/mongo), 24.0k ✨)
* 🚀 Almost no syntax, it's mainly JSON
* 🌫️ Cloud <small>(free version available)</small> or self-hosted <small>(local)</small>
* 🔥 Hard to reference documents <small>(there is no concept of relationship)</small>
</div></div>

<hr class="sep-both">

## Core logic

<div class="row row-cols-md-2"><div>

As MongoDB is a NoSQL database, it's common for documents <small>(e.g. an user)</small> to have missing fields <small>(ex: missing address, if no purchases yet)</small>.

In MongoDB, empty databases, empty collections, or attributes with no values, are **not shown** ✍️ <small>(e.g., in { x = null, y = 4 }, x is not shown)</small>.

#### Databases

Databases are sort of folders in which we store [collections](#collections).

```ps
$ show dbs                 # list databases
$ use some_database_name   # load or create
```

#### Collections

A collection is an array of JSON documents <small>(=a table in SQL)</small>.

```ps
$ show collections              # show non-empty collections
$ db.getCollection("name").XXX  # do XXX on collection "name"
$ db.name.XXX                   # do XXX on collection "name"
```
</div><div>

#### Documents

A document is a record within a collection <small>(ex: an user)</small>. It's a [JSON](/programming-languages/others/data/json.md) ([BJSON](https://www.mongodb.com/docs/mongodb-shell/reference/data-types/)) object, and it's the same as a record/tuple in SQL.

```json
{
  "name": "John Doe",
  "email": "john@example.com",
   "address": []
}
```

⚠️️ JSON documents in a collection [may not](https://www.mongodb.com/docs/manual/core/schema-validation/specify-json-schema/#std-label-schema-validation-json) have the same attributes.

✍️ JSON keys are mostly called "attributes".

🔑 Each document as a `_id` attribute of type `ObjectId`

📑 Entries in address are called [embedded documents](https://www.mongodb.com/basics/embedded-mongodb). 
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](../nosql/mongodb/index.md)
* [_old 2](../nosql/mongo.md)
* [_old 3](../nosql/drivers/mongodb.md)
</div><div>


</div></div>