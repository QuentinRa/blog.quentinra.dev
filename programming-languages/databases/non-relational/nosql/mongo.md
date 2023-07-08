# MongoDB

You can use mongoDB in Node, using MongoDB or
**mongoose** library (prefer using 
[mongoose](https://www.npmjs.com/package/mongoose)).

```js
const mongoose = require('mongoose');
```

Connecting

```js
// from the doc
await mongoose.connect('url', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useFindAndModify: false,
  useCreateIndex: true
});
```

<hr class="sr">

## Creating a model

```js
const Users = new Schema({
    name: {
        type: String,
        minLength: 2,
        maxLength: 128,
        trim: true
        default: 'John doe'
    },
    // embed / sub-document
    cars: [
        {
            model: {
                type: String,
                required: true
            }
        }
    ]
})

const Model = mongoose.model('Users', Users);
```

<hr class="sl">

## Making a query

```js
await Model.find({});
await Model.findOne(/* ... */);
// replace "Calistro" by "calistro"
await Model.updateOne({ name : "Calistro"}, { name: "calistro" });
await Model.updateMany(/* ... */);
// insert a document with the name = "Calistro"
await Model.insertOne({ name : "Calistro"});
await Model.insertMany(/* array of objects */);
// ...
```

Note that you should provide a callback or handles
errors with a ``try-catch``.

Note that you can't use variables that are not in the
model, even if you can see them with console.log.

<hr class="sr">

## Notes

**ObjectID**

Note that you can give a String for _id (or any
ObjectId). mongoose will try to cast it and will
raise an exception if the cast failed.

```js
// generate
new mongoose.Types.ObjectId();
// cast
mongoose.Types.ObjectId("id");
// verify valid
mongoose.Types.ObjectId.isValid("id")
```

**Pagination**

```js
Model.find().skip(count * offset).limit(count)
```

<hr class="sl">

## Sources

* <https://stackoverflow.com/questions/39719021/how-to-set-limit-offset-skip-in-mongoose-query>
* <https://stackoverflow.com/questions/42685297/mongodb-with-mongoose-limit-subdocuments>
* <https://stackoverflow.com/questions/5830513/how-do-i-limit-the-number-of-returned-items>
* <https://stackoverflow.com/questions/17899750/how-can-i-generate-an-objectid-with-mongoose>
* <https://masteringjs.io/tutorials/mongoose/update>