## MongoDB

You can use mongoDB in Node, using MongoDB or
**mongoose** library (prefer using mongoose).

<hr class="sr">

## Creating a model

...

<hr class="sl">

## Making a query

...

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