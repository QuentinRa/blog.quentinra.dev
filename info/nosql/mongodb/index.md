## Installing MongoDB

First, let's install MongoDB.

* On Windows, I used [MongoDBCompass](https://www.mongodb.com/products/compass)
    * run <code class="bg-transparent text-dark">MongoDBCompass</code>
    * the local URL is <code class="bg-transparent text-dark">mongodb://localhost:27017/</code>
    * or you may use <code class="bg-transparent text-dark">mongodb://localhost:27017/?readPreference=primary&appname=MongoDB%20Compass&ssl=false</code>
* On Linux, I'm using ``mongo`` command ([tutorial](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/#install-mongodb-community-edition))
* You may use the [cloud database](https://www.mongodb.com/), on your mongo account

<hr class="sr">

## Starting in MongoDB

First, you should now that if something do not have values
(like a database not having "tables", a table
not having "values" or an attribute not having a value) then you won't see it.

* list all databases ``show dbs``
* move to database ``use a_name`` (even if the database do not exists)

Then a table (in SQL) is called a **Collection** and
a tuple (a line/record in SQL) is called a **Document**.

Empty collections do not exists so I you wan to create
a collection, you must give a document (explained later).

```sql
db.getCollection("table_name").insertOne(a_document_here)
```

You can find all the content of your collection using

```sql
db.getCollection("table_name").find()
-- that's the same
db.table_name.find()
```

And you can see all of your collections using

```sql
show collections
```

You can exit using ``exit`` instruction.

<hr class="sl">

## Documents

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

The keys are your attributes, the value are the value
for these attributes for this document.

```sql
-- creating table persons
-- insert a document { name: "Calistro" }
db.getCollection("persons").insertOne( { name: "Calistro" } )
-- list all
db.getCollection("table_name").find()
-- list all documents having name equals to "Calistro"
db.getCollection("table_name").find( { name: "Calistro" } )
```

**Notes**

* attributes are not properties of the collection
  but the document, so you may add an attribute
  only for some document
* each document will have a unique attribute
  ``_id`` added, having the type `ObjectId`
* from what I know, the only way to create
  a relation between two documents and either
    * making an embed document
    * using the ``_id`` value in the referencing
      document
      
An embed document would be something like this

```json
{
  "name": "John",
  "cars": [
    {
      "type": "..."
      "price": "..."
      "since": "..."
    }
  ]
}
```

<hr class="sl">

## Types

Because you may want to know but the types that
you may use a lot in mongo are
listed [here](https://docs.mongodb.com/manual/core/shell-types/).

What I want to add, let's says you are look for
a documented having the id ``60ce0899bc39bc6984e46e32``.
You can't do

```sql
-- no result, type won't match with ObjectId
db.getCollection("persons").find( { _id: "60ce0899bc39bc6984e46e32" } )
-- so you must do
db.getCollection("persons").find( { _id: ObjectId('60ce0899bc39bc6984e46e32') } )
```

<hr class="sr">

## Insert / Update / Delete

First, check the [Quick reference](https://docs.mongodb.com/manual/reference/mongo-shell/#command-helpers)
because it's quite useful.

You may use ``db.collection.insertOne()``
or ``db.collection.insertMany()`` to create new
documents in a collection like we saw above.

You can use ``db.collection.updateOne()``
or ``db.collection.updateMany()`` to update documents.

```sql
db.getCollection("persons").updateOne(
    -- a filter selecting the one to update
    { _id: ObjectId('60ce0899bc39bc6984e46e32') },
    -- update
    {
        $set: { "name": "..." }
    }
)
```

And you may use ``db.collection.deleteOne()``
and ``db.collection.deleteMany()`` to delete
documents, both taking a filter too.

<hr class="sr">

## Filter

You may add more restrictions to your filter
using ``or`` or ``and``.

```sql
db.persons.find({ $or: [ { _id: ObjectId('60ce0899bc39bc6984e46e32') }, { _id: ObjectId('60ce0899bc39bc6984e46e33') } ] })
db.persons.find({ $and: [ { _id: ObjectId('60ce0899bc39bc6984e46e32') }, { username: "example" } ] })
```

<hr class="sl">

## Notes

Create a new user

```sql
use database_name
db.createUser( { user: "myuser", pwd: "password", roles: ["readWrite"] })
```

<hr class="sr">

## Sources

* <https://docs.mongodb.com/manual/reference/mongo-shell/#command-helpers>
* <https://docs.mongodb.com/manual/tutorial/insert-documents/>
* <https://docs.mongodb.com/manual/tutorial/update-documents/>
* <https://docs.mongodb.com/manual/faq/fundamentals/#how-does-mongodb-address-sql-or-query-injection>
* <https://betterprogramming.pub/little-bobby-collections-how-to-write-a-mongodb-injection-ad58a4e2d754>
* <https://stackoverflow.com/questions/46972695/see-setup-a-user-with-mongodb-compass>
* <https://www.codevscolor.com/pages/mongodb-tutorials/>
* <https://www.mongodb.com/nodejs-database>