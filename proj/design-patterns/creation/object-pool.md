# Object pool

[Go back](..)

You got something good [here](https://java-design-patterns.com/patterns/object-pool/)
but here are some of my notes

* you usually create a pool of a size
  (and may also the pool to increase)
* the size of the pool is the number of this
  kind of objects you are planning to use **at the same time**
* instead a creating new objects, you are gonna
  use those in the pool

Note that you usually use that when creating a new
object cost a lot.

And a real-life example would be the musics in Unity,
you may store them inside a pool a reuse the music
GameObjects when you need to change musics.