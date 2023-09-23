# Object pool

[Go back](..)

The idea is a bit like the singleton, but this time you're creating a pool of objects, which may have a fixed size or not. You got a good [tutorial here](https://java-design-patterns.com/patterns/object-pool/), but here are some of my notes

* you usually create a pool of a size (you may also allow it to increase)
* the size of the pool is the number of this kind of objects you are planning to use **at the same time**
* instead of creating new objects, you are going to reuse those in the pool

Note that you usually use that when creating a new object costs a lot.

A real-life example would be the music in Unity. You may store the musics' GameObjects inside a pool and reuse them.