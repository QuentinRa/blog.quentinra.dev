# MongoDB

Create a user (optional)

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