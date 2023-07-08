# MongoDB

<hr class="sl">

## Console

* On **Windows**, almost everything is made using the **interface**, but you may open the console by clicking on the small tab at the bottom of the screen.
* On **Linux**, I used `mongosh`, so I was only using the **command-line**.

This course will mostly cover Mongo from the point of view of a command-line user, as it's easy to execute something using the interface on Windows, given a command, and the driver usually provides something similar to the commands used in `mongosh`.

<hr class="sl">

## Create a user (optional)

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

First, **you should know that if something does not have values**, like a database not having "tables", a table not having "values" or an attribute not having a value, **then you won't see it**.

* list all databases `show dbs`
* move to database `use database_name` ("created" if not exists)

Inside a database, you can create collections of documents. A collection could be seen as a table in SQL, and documents could be seen as records/tuples.

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

The keys are your attributes, the values are the value for these attributes for this document.

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
* **Note**: create the collection if it does not exist
* **Example**

```mongodb
// insert a document { name: "Calistro" }
db.persons.insertOne( { name: "Calistro" } )
// {"_id": "617d8282a6e50c611c8e3c16", "name": "Calistro"}
```

* **Function**: insertMany(JSONArray)
* **Note**: create the collection if it does not exist
* **Example**

```mongodb
db.persons.insertMany( [ {name: "Suwan", not_used: true }, {name: "Mynasitra"} ] )
// two new documents
```

<hr class="sl">

## Find documents

You may find(JSON, JSON) or findOne(JSON, JSON).

* the first value is the filter, a SQL WHERE <small>(empty object=default=No restriction)</small>
* the second value is the project, a SQL SELECT <small>(empty=default=Select *)</small>

<details class="details-e">
<summary>Examples of SQL vs MongoDB</summary>

Note that I won't give examples for `findOne`, as this is the same as `find`, but return one row (in SQL, it would be `LIMIT 0,1`).

<table class="table table-bordered table-striped border-dark">
<tr><th>SQL</th><th>MongoDB</th></tr>

<tr><td><pre class="language-sql"><code>SELECT name FROM persons</code></pre>
</td><td>

```mongodb
db.persons.find({}, { name: true })
```
</td></tr>

<tr><td><pre class="language-sql"><code>SELECT * FROM persons</code></pre>
</td><td>

```mongodb
db.persons.find()
```
</td></tr>

<tr><td><pre class="language-sql"><code>SELECT name FROM persons WHERE name = "Calistro"</code></pre>
</td><td>

```mongodb
db.persons.find({ name: "Calistro" }, { name: true })
```
</td></tr>

<tr><td><pre class="language-sql"><code>SELECT * FROM persons WHERE name = "Calistro"</code></pre>
</td><td>

```mongodb
db.persons.find( { name: "Calistro" } )
```
</td></tr>

<tr><td><pre class="language-sql"><code>SELECT * FROM persons WHERE name >= "Calistro"</code></pre>
</td><td>

```mongodb
db.persons.find({ name: { $gte: "Calistro" } })
// you can use $gte (>=) $gt (>) $eq (=) $ne (<>) $lt (<) $lte (<=)
```
</td></tr>

<tr><td><pre class="language-sql"><code>-- no equivalent</code></pre>
</td><td>

```mongodb
db.persons.find({ name: { $exists: true } })
```
</td></tr>

<tr><td><pre class="language-sql"><code
>SELECT * FROM persons WHERE name = "Calistro" OR
                            name = "Luna"</code></pre>
</td><td>

```mongodb
db.persons.find({ $or: [ 
  { name: 'Calistro' },
  { name: 'Luna' }
] })
// $or (OR), $and (AND), $NOR (not any of the predicates)
```
</td></tr>
</table>
</details>

> ⚠️ **Pro tip** ⚠️: even if you may think that the field `_id` is a string, it's an **ObjectId**. Use `ObjectId(string)` to cast a string to an ObjectId.

```mongodb
// no matches
db.persons.find( { _id: "617d8282a6e50c611c8e3c16" } )
// 1 matches, same id ✨, "same" request ✨
db.persons.find( { _id: ObjectId('617d8282a6e50c611c8e3c16') } )
```

> **Pro tip**: when using projection, or in some cases such as updating something, you are setting a bool at true for a column. Well, lazy as we are, we are also using `1` or `""` instead of `true`.

<hr class="sr">

## Update and Delete

* use UpdateOne(JSON, JSON) or UpdateMany(JSONArray, JSON)

<details class="details-e">
<summary>Set attributes</summary>

```mongodb
db.persons.updateOne(
    // select
    { _id: ObjectId('617d8282a6e50c611c8e3c16') },
    // set selected
    {
        // create name with value, or update field
        $set: { "name": "Mr. Calistro" }
    }
)
```
</details>

<details class="details-e">
<summary>Unset attributes</summary>

```mongodb
db.persons.updateOne(
    // select
    { _id: ObjectId('617e5dd65f15583a7c4e06ea') },
    {
        // delete this field for this document
        $unset: { "not_used": true }
    }
)
```
</details>

* use DeleteOne(JSON) or DeleteMany(JSON)

```mongodb
db.persons.deleteOne({ _id: ObjectId('617d8282a6e50c611c8e3c16') })
```

<hr class="sl">

## Methods

In MongoDB, you can chain a lot of calls, unless the call is "terminal".

<table class="table table-bordered table-striped border-dark">
<tr><th>SQL concept</th><th>MongoDB</th></tr>

<tr><td><pre class="language-sql"><code>COUNT(*)</code></pre></td><td>

```mongodb
db.persons.find().size() // terminal
```
</td></tr>

<tr><td><pre class="language-sql"><code>LIMIT 0,1</code></pre></td><td>

```mongodb
db.persons.find().skip(0).limit(1)
db.persons.find().skip(countPerPage * page).limit(countPerPage)
```
</td></tr>

<tr><td><pre class="language-sql"><code>ORDER BY</code></pre></td><td>

```mongodb
db.persons.find().sort({name: 1}) // ASC
db.persons.find().sort({name: -1}) // DESC
```
</td></tr>
</table>

<hr class="sr">

## Embed documents

You should [read the official documentation](https://www.mongodb.com/basics/embedded-mongodb).

<div class="row row-cols-md-2 mx-0"><div>

```mongodb
db.persons.updateOne(
    { name: "Calistro" },
    {
        $set: {
            cars: {
                main: {
                    model: "Something"
                }
            }
        }
    }
)
db.persons.findOne({ name: "Calistro" })
// cars = {"main": {"model": "Something"}}
```
</div><div>

```mongodb
db.persons.findOne({ name: "Calistro" })
// cars = {"main": {"model": "Something"}}
```

For embed items, you can use `.` (dot) to use a field everywhere we used fields such as `name`. Note that this time, the name of the field must be between `""` (quotes).

```mongodb
db.persons.findOne(
    { "cars.main.model": "Something" }
)
// Calistro ...
```
</div></div>

> **Note**: this is one of the ways to make a relationship between documents. You are simply storing a document inside another. You could give an ObjectId to main referencing another document inside another collection (ex: cars).

<hr class="sl">

## Sources

* <https://www.mongodb.com/basics/examples>
* <https://docs.mongodb.com/manual/reference/mongo-shell/#command-helpers>
* <https://docs.mongodb.com/manual/tutorial/insert-documents/>
* <https://docs.mongodb.com/manual/tutorial/update-documents/>
* <https://docs.mongodb.com/manual/faq/fundamentals/#how-does-mongodb-address-sql-or-query-injection>
* <https://betterprogramming.pub/little-bobby-collections-how-to-write-a-mongodb-injection-ad58a4e2d754>
* <https://stackoverflow.com/questions/46972695/see-setup-a-user-with-mongodb-compass>
* <https://www.codevscolor.com/pages/mongodb-tutorials/>
* <https://www.mongodb.com/nodejs-database>
* <https://scotch.io/@micwanyoike/getting-started-with-mongodb-in-linux>