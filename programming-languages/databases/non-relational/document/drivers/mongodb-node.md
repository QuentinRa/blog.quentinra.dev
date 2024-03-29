# MongoDB - Node Driver

<div class="row row-cols-lg-2"><div>

There are two libraries to use [MongoDB](../mongodb.md) in [Node.js](/programming-languages/web/node.js/_general/index.md):

* [MongoDB](https://www.npmjs.com/package/mongodb) (9.8k ⭐, <small>official</small>)
* [mongoose](https://www.npmjs.com/package/mongoose) (25.8k ⭐, <small>recommended</small>)

We will **only** cover mongoose. To install it:

```ps
$ npm install mongoose
```
</div><div>

And, to connect to your database:

```js!
const mongoose = require('mongoose');

// connect, settings from the documentation
await mongoose.connect('mongodb://xxx', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useFindAndModify: false,
  useCreateIndex: true
});
```
</div></div>

<hr class="sep-both">

## Basic usage

<div class="row row-cols-lg-2"><div>

Mongoose is an Object-Document Mapping <small>(ODM)</small> library. It means we'll abstract the database as a JSON Schema, and mongoose will act as a **bridge** between objects <small>(JavaScript)</small> and documents <small>(MongoDB)</small>. 

#### Schema

A schema is the abstraction of the database.

```js!
const UsersSchema = new Schema({
    name: {
        type: String,
        minLength: 2,
        maxLength: 128,
        trim: true,
        default: 'John doe'
    },
    // embedded document/sub-document
    cars: [
        {
            model: {
                type: String,
                required: true
            }
        }
    ]
})
```
</div><div>

#### Model

From a schema, we can instantiate a model from which you can call methods with the same arguments as in the [MongoDB](../mongodb.md) course.

```js!
const UsersModel = mongoose.model('Users', Users);
await UsersModel.find(...);
await UsersModel.findOne(...);
await UsersModel.updateOne(...);
await UsersModel.updateMany(...);
await UsersModel.insertOne(...);
await UsersModel.insertMany(...);
```

🧼 Don't forget to [catch](/programming-languages/web/javascript/_general/index.md#catch-exceptions) and handle exceptions.

🔥 You **can't** access attributes that are not in your model, even if you can see them with `console.log`.

✍️ Some useful methods when dealing with `ObjectID`:

```js
// generate an ObjectID
new mongoose.Types.ObjectId();
// cast from string to ObjectID
mongoose.Types.ObjectId("id");
// verify that an ID is valid
mongoose.Types.ObjectId.isValid("id")
```
</div></div>