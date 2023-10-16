# Code guidelines


<hr class="sr">

## Me

Here are some of my troughs before starting.

I think you should really consider using frameworks and tools created by other developers (If they are still maintained) rather than writing everything from scratch. This should

```diff
- make the "setup" longer (installing a framework might not go smoothly)
- force you to learn a new framework/... 
+ broaden your horizons (since you will learn how someone else tackled your need)
+ reduce the maintainer workload (since another maintainer would deal with the framework)
+ it should reduce your workload too (since you should have less code to write)
+ reduce the complexity of your code (if not, pick another or publish your own framework)
```

Aside from that

* I think you should properly **document** your code (no too much documentation, consider the maintainer when coding)
* you shouldn't copy-paste code from another part of your code (anyone will tell you this one)
* give relevant names to your functions/variables, **but** only when that's useful, like `i` is better than   `index` if `i` is a simple index. Declare them at the start of a bloc.

<hr class="sl">

## Principles

**Don’t repeat yourself (DRY)**: Do not copy-paste code, make a function. Otherwise, you need to remember that you will have `n` places to patch if you found a bug, and that's not worth it. You should also use constants rather than writing, again and again, a value like `"toto"` in your code.

**You ain't gonna need it (YAGNI)**: don't write code unless you need it.

**Keep it simple, stupid (KISS)**: simple code means less code. It's easier to debug and modify, so don't make things complicated.

**Code For The Maintainer**: write your code like you will be the one to maintain it. It's hard to maintain some unreadable code, isn't it?

<hr class="sr">

## Practices

**Separation of concerns (SOC)**: simply separate your code according to what part of the program they are dealing with. This may also us to reuse some parts in another application. For instance, you should not have a class called "UndoAndRedo" or "UndoRedo".

**The Rule of One or Curly’s Law**: a part of your code must do only one thing.

**Rubber duck debugging**: when you got a problem with your code, try explaining it to a rubber duck (`canard en plastique` in French). Sometimes, simply explaining your problem to "someone", helps in solving it. Talk to your rubber duck :)

**Murphy's Law**: "Anything that can go wrong will go wrong.". Don't think "xxx won't do that" and skip some code, because "xxx" will (calling a method using the wrongs parameters, ...).

**Do The Simplest Thing That Could Possibly Work**: Simply write as little as possible, or think about the easiest solution for your problem and code it. You may improve your code later through.

<hr class="sl">

## SOLID

SOLID is an acronym for

* **S (Single)**: Do one thing
* **O (Open/Closed)**: use inheritance to modify a class like
  * if you want to modify, you can
  * but if you want to add a public member, then inherit the class
  * "Open for extension, closed for modification"
* **L (Liskov substitution)**: variables having the type A can store inheritors of A
* **I (Interfaces segregation)**: split big interfaces into a bunch of small ones
* **D (Dependencies inversion)**: create layers using interfaces and abstract classes

This is a bit more complicated and will require knowledge in Oriented-object. You should check [SOLID principles on Wikipedia](https://en.wikipedia.org/wiki/SOLID).

<hr class="sr">

## Guidelines

I started this course because of this website <https://suckless.org/>, "software that sucks less". Well, dunno about their software, but the website sucks 🙄. Still, here are some of their ideas, mixed with others (see references)

* LICENSE + README.md inside each project
* declare all variables at the start of a bloc
* add the ``*`` (pointer star) after the type, not the name
* line length: less than ``79`` characters
* declare your variable then give them a value
* use constants (const) or #define
* use [sys/queue.h](https://stackoverflow.com/questions/7627099/how-to-use-list-from-sys-queue-h) rather than your handmade lists

```c
// a space after include, ordered by name
// <> before ""
#include <stdio.h>

// not a&&b but a && b
if ( a && b ) { // "{" on the same line, space after the "if"
}

// for a function
void
fonction_name( int a, ... )
{
    
}
```

**You should do the same** before starting a project, set things up with yourself and your team.

<hr class="sl">

<img src="/courses/proj/guidelines/meme.jpg"
alt="meme" width="500"/>

<hr class="sr">

## best practices (GitHub lookup summary)

After discovering this [repository](https://github.com/trekhleb/state-of-the-art-shitcode), which is quite good for explaining what you mustn't do, I looked on GitHub's "best-practices repository". Here is a summary of the repository above and many others.

<table class="table table-bordered table-striped border-dark">
<thead>
    <tr>
        <th scope="col" style="min-width: 180px;">Style</th>
        <th scope="col" style="min-width: 180px;">Logic</th>
        <th scope="col" style="min-width: 180px;">Others</th>
    </tr>
</thead>
<tbody>
<!-- 1 -->
<tr>
<td>use a proper variable name</td>
<td>log errors</td>
<td>add a README file</td>
</tr>
<!-- 2 -->
<tr>
<td>

`do not mix naming styles` (camelCase, snake_case) unless it's intended <small>(like snake_case_CamelCase, that may be used for function's names in C)</small>
</td>
<td>remove unused code/variables (NO "for later")</td>
<td>add a LICENSE file (even if it's MIT).</td>
</tr>
<!-- 3 -->
<tr>
<td> do not mix formatting

* if you can use `"` or `'`: pick one!
* if you are adding a `;` at the end of the line, do it everywhere
* same indents for the whole file
* ...

To summarize, you should `define guidelines`
before starting.
</td>
<td>

If you ever created a function dealing with
more than one task then you should
`split it`.
</td>
<td></td>
</tr>
<!-- 4 -->
<tr>
<td>split a long line on multiples lines</td>
<td>Do not make an "if" statement directly inside one,
try merging their conditions.</td>
<td></td>
</tr>
<!-- 5 -->
<tr>
<td></td>
<td>
check the argument types <br>
<small>(if needed, the language matter)</small>
</td>
<td></td>
</tr>
</tbody>
</table>

<hr class="sl">

## Sources

* <https://en.wikipedia.org/wiki/SOLID>
* <https://en.wikipedia.org/wiki/Code_reuse>
* <https://en.wikipedia.org/wiki/GRASP_(object-oriented_design)>
* <https://en.wikipedia.org/wiki/KISS_principle>
* <https://www.baeldung.com/solid-principles>
* <https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa>
* <https://suckless.org/>
* <http://www.catb.org/~esr/writings/taoup/html/>
* <https://en.wikipedia.org/wiki/Rubber_duck_debugging>
* <http://principles-wiki.net/principles:start>
* <http://principles-wiki.net/start>
* <https://java-design-patterns.com/principles/#keep-things-dry>

**Guidelines**

* <https://suckless.org/>
* <https://man.openbsd.org/style>
* <http://doc.cat-v.org/bell_labs/pikestyle>
* <https://www.kernel.org/doc/Documentation/process/coding-style.rst>