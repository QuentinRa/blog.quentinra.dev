# Pair-programming

This is quite easy. It's usually used in agile projects, since it's one of the extreme programming methods.

> You got **two persons** and **one computer**, one code, while the other
> 
> * gives advice (help, improvements)
> * ask for explications about what's this part of code is supposed to do (hint to add comments)
> * think about problems that may arise (like a wrong argument or an invalid usage)

The two should switch roles at least once in a while. This will help writing a more maintainable code, maybe faster since <q>Four eyes are better than two</q>. It's quite useful to train a new developer, so I'm practicing that a lot when I'm starting a project with a less experienced developer to make sure that they don't waste time on useless stuff and improve their skills faster.

You got tools like VSC/IntelliJ, allowing you to work on your friend's computer and code with him. This may help for debugging the code too, aside from remotely working in pairs.

An extension of this method, where instead of 2, the whole team (😰) is working on one computer, is called [Mob programming (Wikipedia)](https://en.wikipedia.org/wiki/Mob_programming).

<hr class="sl">

## Model-driven development (MDD)

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