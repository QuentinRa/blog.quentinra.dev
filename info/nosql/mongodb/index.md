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

<hr class="sr">

## Sources

* <https://docs.mongodb.com/manual/faq/fundamentals/#how-does-mongodb-address-sql-or-query-injection>
* <https://betterprogramming.pub/little-bobby-collections-how-to-write-a-mongodb-injection-ad58a4e2d754>