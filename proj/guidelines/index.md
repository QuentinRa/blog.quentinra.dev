# Introduction

You may have read in other courses about

* test-driven, model-driven, ...
* design patterns (and anti-patterns)
* frameworks

Using these, you will use the knowledge, 
experience and the code
improved by a lot of developers before you.
This course is a gathering of programmers principles
that may help you writing your code.

<hr class="sr">

## Me

Here some of my troughs before starting 

* I think your code should be enough **documented**
  so that the programmer don't take hours trying
  to understand what you tried to do, and not too much
  otherwise they may not read it.
* you shouldn't copy-paste code from another part
  of your code
* you should use frameworks or other programmer works
  (if they are still maintained) rather than rewriting
  everything from scratch and increase
    * your workload
    * the complexity of your code
    * the workload of the futures maintainers

<hr class="sl">

## Principles

**Don’t repeat yourself (DRY)**: Do not copy-paste code,
make a function. Otherwise you need to remember that you
will have ``n`` places to patch if you found a bug,
not worth. You should also use constants rather than
writing again and again a value like ``"toto"`` (for
instance) in the code.

**you ain't gonna need it (YAGNI)**: don't write code
unless you need it.

**Keep it simple, stupid (KISS)**: simple code means
less code, easier to debug, easier to modify so don't
make things complicated.

**Code For The Maintainer**: write your code like you
will be the one to maintain it. It's hard to maintain
some unreadable code, isn't it?

<hr class="sr">

## Sources

* <http://principles-wiki.net/principles:start>
* <http://principles-wiki.net/start>