# Coding Practices

<div class="row row-cols-lg-2"><div>

When developing software, there are well-known guidelines, [patterns](../dp/index.md), methodologies and tools that can help boost developers. 🥇
</div><div>

One of the life-saving methodologies, when you have a bug, is the [Rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging) method. While you explain the problem to a rubber duck, you might be enlightened and find the solution. 🦆
</div></div>

<hr class="sep-both">

## Coding Helpers

<div class="row row-cols-lg-2"><div>

#### Websites

A few notables:

* [StackOverflow](https://stackoverflow.com/) 🍹: most of the time, another developer had a similar question or problem as us and asked about it here.
</div><div>

#### Artificial Intelligences

A few notables:

* [ChatGPT](https://chat.openai.com/) 🐈: a chatbot that is somewhat like a smarter search engine though it often provides incorrect <small>(or outdated)</small> results
* [tabnine](https://www.tabnine.com/): TabNine AI coding assistant
* [Microsoft Copilot](https://adoption.microsoft.com/en-us/copilot/) ⛄: Microsoft AI coding assistant
* [FauxPilot](https://github.com/fauxpilot/fauxpilot) ☃️: an open-source AI assistant
* [codeproject](https://www.codeproject.com/): 👻
* [codegrepper](https://www.codegrepper.com/index.php): 👻
</div></div>

<hr class="sep-both">

## Coding Principles

<div class="row row-cols-lg-2"><div>

#### Don’t repeat yourself (DRY) 🎰

Write your code once. Don't copy and paste. Write functions. It reduces the number of locations to patch when a bug is found.

Also, avoid reusing hard-coded constants, such as `"Hello, World"`, and store them in a constant, for the same reason.

➡️ Apply [Code Reuse](https://en.wikipedia.org/wiki/Code_reuse) as much as possible.

<br>

#### You ain't gonna need it (YAGNI) 🚮

Don't write code for something unless you need it **right now**. Stop writing code that will supposedly be used 'later'.

<br>

#### Separation of concerns (SOC) 🪓

Split each element so that they only handle one thing.

<br>

#### Curly's Law ⚖️

Each function variable or any element of your code should only do and mean one thing at a time.

<br>

#### Murphy's law ✨

*"Anything that can go wrong will go wrong."* For instance, always check that the preconditions of a function are correct, do not expect that they will always be as expected. Test your code.
</div><div>

#### Keep it simple, stupid (KISS) 😘

Simple code is easier to debug and maintain. Don't make things complicated, write simple code that works.

<br>

#### Code For The Maintainer 🌍

Put yourself in the shoes of the maintainer when writing code to ensure that the code is genuinely maintainable.

<br>

#### Don't reinvent the wheel 🛞

Before creating something from scratch, try to find if there is a maintained stable solution that could start from. It reduces the code to maintain and the time it takes to get a working program. 

<br>

#### Do The Simplest Thing That Could Possibly Work ✅

Write as little code as possible to get a working program. Think about the easiest solution to a problem and code it. You will then improve your code when you need it.

#### SOLID

SOLID is a popular acronym in object-oriented projects:

* **Single** 📝: Each class should have one responsibility
* **Open/Closed** 🥨: "Open for extension, closed for modification". Use inheritance etc. to modify the behavior of a class.
* **Liskov substitution** 👻: if B inherits from A, then we must ensure code working with A works with B.
* **Interfaces segregation** 🪓: keep your interfaces  relevant to the one that uses it (don't force them to implement unneeded stuff)
* **Dependencies inversion** ⛳: ensure high-level classes do not depend on low-level ones using interfaces, abstract classes etc.
</div></div>

<hr class="sep-both">

## Code Formatting 🧼

<div class="row row-cols-lg-2"><div>

It's common for developers to have different preferred formatting habits when writing code. A few examples with a simple "if" 😱:

```c
if (condition)              // no braces
if (condition) {}           // dirty one-line
if ( condition ) {}         // inner spacing
if ( condition == true ) {} // explicit 
if ( true == condition ) {} // "fix" = instead of ==
if (condition)              // common syntax - new line
{
}
if (condition) {            // common syntax - same line
}
```
</div><div>

To avoid making the code hard to read and maintain, developers often define formatting rules. There are a lot of **linters** 🫧, at least one per programming language, that can detect and automatically clean up the code according to the formatting rules defined.

* [ESLint](https://eslint.org/) or [js-beautify](https://beautifier.io/) for JavaScript
* [pylint](https://pylint.org/) for Python
* [markdownlint](https://github.com/DavidAnson/markdownlint) for Markdown
* [ShellCheck](https://www.shellcheck.net/) for Shell Scripts
* [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html) for C/C++
* [prettier](https://prettier.io/) for HTML, CSS, JavaScript, Markdown...
* ...

👉 **Common elements**: tabulation, spacing, variable names, lines width, position of symbols/elements in the code, symbols to use, etc.
</div></div>

<hr class="sep-both">

## Pair-programming

<div class="row row-cols-lg-2"><div>

Pair-programming 🪷 or [Mob programming](https://en.wikipedia.org/wiki/Mob_programming) <small>(when more than two)</small> 🪖 is one of the most well-known coding practices.

Multiple persons are working together on the same computer. One writes code, while the others:

* Provide help 🍻
* Give advice and suggestions 🎫
* Ask questions when your code is unclear 🤔
* Think about potential problems in the code 💥
* ...
</div><div>

Make sure to take turns if you are often doing it.

There are many extensions to popular IDEs or text editors allowing us to do pair-programming on two computers remotely. It's useful as two persons can write the code instead of one.

* [JetBrains Code With Me](https://www.jetbrains.com/code-with-me/)
* [Visual Studio Live Share](https://visualstudio.microsoft.com/services/live-share/)

*"Two heads are better than one"*
</div></div>

<hr class="sep-both">

## Programming Paradigms

<div class="row row-cols-lg-2"><div>

#### Model-Driven Development 🪞

The Model-Driven Development (MDD) means that the code must, at any time, be the mirror of the model that we designed.

The model is commonly designed using [UML](/tools-and-frameworks/projects/modeling/uml/_knowledge/index.md). It refers to all diagrams associated with the project <small>(class diagrams, activity diagrams etc.)</small>.

The procedure to make a good model:

1. **User Stories** (US) 🛣️: describe each functionality in a few words.
2. **Use case diagram** 🪴: create a [Use case diagram](/tools-and-frameworks/projects/modeling/uml/diagrams/use_case/index.md) from US
3. **Basic class diagram** ✍️: identify the first classes and methods and add them to a [Class diagram](/tools-and-frameworks/projects/modeling/uml/diagrams/class/index.md)
4. **Sequence Diagram** 🙋‍♂️: for each use case, create a [sequence diagram](/tools-and-frameworks/projects/modeling/uml/diagrams/sequence/index.md). You must use actors, classes, and methods from other diagrams. Complete your diagrams each time you something is missing <small>(method, method arguments etc.)</small>.
5. **Implementation** 📦: generate the code from the model and improve your model as you work on the implementation.


➡️ It may be helpful to create a mock-up of the application first to better identify user stories.
</div><div>

#### Data-Driven Programming 🗃️

[Data-driven programming](https://en.wikipedia.org/wiki/Data-driven_programming) is a paradigm where the behavior of the program is driven by the data we provide.

For instance, in a game, we could define quests directly inside the code or we could create JSON/XML/... for each quest and load them inside the program <small>(which is a Data-Driven approach)</small>.

It allows us to change the data or add new files without editing the code. It's both easier to use and to maintain. Editing data files may not require  any programming knowledge, and they can be processed by other tools <small>(ex: we could develop a graphical editor)</small>.

<br>

#### Documentation-Driven Development 📝

[Literate programming](https://en.wikipedia.org/wiki/Literate_programming) is a coding practice in which we write documentation before and alongside the code to explain its purpose.

It's sometimes called "Documentation-Driven Development" to enforce the idea that we must write documentation before the code, and that it drives what we code.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

Static Code Analysis

* [JSHint](https://jshint.com/) for JavaScript

Static Type Checker

* [Flow](https://flow.org/) for JavaScript
</div><div>

* [holopin](https://www.holopin.io/) (badges)
</div></div>