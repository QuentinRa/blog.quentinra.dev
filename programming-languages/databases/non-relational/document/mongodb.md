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

```json!
{
  "name": "John Doe",
  "email": "john@example.com",
  "addresses": { "main": null }
}
```

⚠️️ JSON documents in a collection [may not](https://www.mongodb.com/docs/manual/core/schema-validation/specify-json-schema/#std-label-schema-validation-json) have the same attributes.

✍️ JSON keys are mostly called "attributes".

🔑 Each document as a `_id` attribute of type `ObjectId`

📑 Entries in address are called [embedded documents](https://www.mongodb.com/basics/embedded-mongodb). 
</div></div>

<hr class="sep-both">

## Manipulate documents

<div class="row row-cols-md-2"><div>

#### Add documents

If a collection doesn't exist, it is created.

```js!
db.some_collection.insertOne( a_document )
db.some_collection.insertMany( [ a_document, ...] )
```

#### Delete documents

See also: `deleteMany(JSONArray)`.

```js!
db.some_collection.deleteOne({ _id: ObjectId('some_id') })
```
</div><div>

#### Update documents

See also: `updateMany(JSONArray, JSON)`.

```js!
db.some_collection.updateOne(
    { _id: ObjectId('some_id') }, // select
    {
        $set: { "name": "xxx" }   // add or set attributes
    }
)
```

You can use `$unset: { "name": true }` to remove an attribute.

For nested documents, use:

```json!
$set: {
    addresses: {
        "main": { /* ... */ }
    }
}
```
</div></div>

<hr class="sep-both">

## Find documents

<div class="row row-cols-md-2"><div>

You will use `find` or variants to find documents. They usually take two arguments, and return a list of documents.

```js!
db.some_collection.find()            // list all documents
db.some_collection.find({}, {})      // list all documents
db.some_collection.find(filter, projection) // ???
```

👉 For nested documents, use a dot, such as `addresses.main`.

#### Filter parameter

The filter determined which documents are returned. It's optional, and by default, all documents are returned.

Here are some examples of filters:

```js!
{}                             // no filter
{ _id: ObjectId('id') }        // find by ID 
{ name: "xxx" }                // filter by name ==
{ age: { $gte: 15 } }          // filter by age >= 15
                               //   $gt (>) $eq (=) $ne (<>)
                               //   $ne (<>) $lt (<) $lte (<=)
{ name: { $exists: true } }    // has an attribute "name"
{ $or: [                       // see also: $and, $nor
  { name: 'XXX' },
  { name: 'YYY' }
] }
```
</div><div>

#### Projection parameter

The projection determines which attributes are returned. It's optional, and by default, all attributes are returned.

Here are some examples of projections:

```js!
{}                         // all
{ name: true }             // name attribute only
```

#### Useful method chains

You may call some methods on the `find` output.

```js!
db.xxx.find().size()   // number of documents
db.xxx.find().skip(0)  // skip n first results
db.xxx.find().limit(1) // only fetch n documents
db.xxx.find().skip(countPerPage * page).limit(countPerPage)
db.persons.find().sort({name: 1})  // sort ASC
db.persons.find().sort({name: -1}) // sort DESC
// ...
```
</div></div>

<hr class="sep-both">

## User management

<div class="row row-cols-md-2"><div>

You can create an administrator using:

```js!
$ mongo -u username --authenticationDatabase admin -p
use admin
db.createUser({
    user: "username",
    pwd:"password",
    roles:[{ role: "userAdminAnyDatabase", db: "admin"  }]
})
```
</div><div>

Then, you can create normal users using:

```js!
use database_name
db.createUser( { user: "myuser", pwd: "password", roles: ["readWrite"] })
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old 2](../nosql/mongo.md)
* [_old 3](../nosql/drivers/mongodb.md)
</div><div>


</div></div>