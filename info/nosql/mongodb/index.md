# MongoDB

**MongoDB** is a database storing data using **JSON documents**. You will use JSON everywhere, and there is **almost no syntax**. This come at the cost: **it's tricky to reference something**. You will have to use the ID of a document, or nest a document inside another 😬.

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