# Model-driven development (MDD)

You will create a model during the conception phase. Then your code will be the exact representation of the model (same attributes, classes, ...), at least the "public" part of your code. If you need to add something, then first change the model.

This method is quite powerful but will ask you to do quite a lot of work during the conception (since the development will be quite easy and fast, or at least very straightforward).

* [User stories](mdd/user-stories.md)
* [Class diagram](mdd/class.md)
* [Sequence diagram](mdd/seq.md)
* And now code the application. Using StarUML you can generate Java code from your UML diagrams.

Since I don't like wasting my time, I think you should

* do a mock-up of your application (with events... maybe in Bootstrap/JS or using an app)
* then do the **MDD** method

By doing so, you will most likely find more things than doing, again and again, loops, using the sequence diagram to find the missing classes/attributes/relationships... Or coding, then going back to update the model... I'm using Bootstrap, and it makes' it easy to create a mock-up (at least I'm doing this for all my apps, and I feel like it's worth it). Check the [HMI](../../../_it/project/hmi/index.md) course to get some help.