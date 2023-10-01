# Anti-Patterns

* **Magic Numbers and Strings** ✨

One of the most used anti-pattern. Programmers tend to write a lot of numbers/strings inside the code, but they are unnamed and should be stored inside a named constant, so we understand what this value is supposed to be. In some languages, you may be able to use named parameters that are convenient when you are only using a value once.

* **Golden Hammer** 🔨

You are using things you are confident in because that's easier, even though you know that this may not be the right thing to do. I did that a lot, like writing code in Java taking hundred of lines because I know how to do a lot of things in Java even though I know I could use other languages like Python for what I wanted to do.

* **Boat Anchor** ⚓

You coded something for later but didn't need it yet, YAGNI principle, You Ain't Gonna Need It.

* **God Object/Class or "The Blob"** ⛪

If you are using an object in too many parts of your code, then maybe his class is doing too much. If you got a class having a lot of dependencies, then that may be the case. This is also the case when a class is dealing with every process while the others are only storing data. **SOLUTION**: you should use an object-oriented architecture, methods related to an object must be inside his class.

* **Premature Optimization** 🐣

Focusing too much on optimization without having a proper understanding of what you are trying to optimize. This may increase a lot the complexity of the code for almost nothing.

* **Cut-and-Paste Programming** 📝

Do not copy/paste code from one part of your code to another part. Factorizing your code, using a function, will help to patch all the bugs for this code at once, and make things more readable.

* **Lava Flow/Dead code** 🔥

Someone coded something, without any documentation/clear architecture/..., and left. Now, the new maintainer doesn't dare to change the code since he's scared to break something. This might prevent you from updating to new versions... **SOLUTION**: document your code. Set up rules/guidelines/clear architecture/etc. before starting and stick to them.