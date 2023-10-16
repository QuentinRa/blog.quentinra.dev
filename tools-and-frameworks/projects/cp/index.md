# Coding Practices

<div class="row row-cols-md-2"><div>

When developing software, there are well-known guidelines, [patterns](../dp/index.md), methodologies and tools that can help boost developers. 🥇

* 💍 [StackOverflow](https://stackoverflow.com/): most of the time, another developer had a similar question or problem as you and asked about it here.

* 🍼 [ChatGPT](https://chat.openai.com/): a chatbot that is somewhat like a smarter search engine thought it often provides incorrect results

One of the life-saving methodologies when you have a bug is the [Rubber duck debugging](https://en.wikipedia.org/wiki/Rubber_duck_debugging) method. While you explain the problem to a rubber duck, you might be enlightened and find the solution. 🦆
</div><div>
</div></div>

<hr class="sep-both">

## Coding Principles

<div class="row row-cols-md-2"><div>

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

Before creating something from scratch, try to look is there is a maintained stable solution that could start from. It reduces the code to maintain and the time it takes to get a working program. 

<br>

#### Do The Simplest Thing That Could Possibly Work ✅

Write as little code as possible to get a working program. Think about the easiest solution to a problem and code it. You will then improve your code when you need it.
</div></div>

<hr class="sep-both">

## Code Formatting 🧼

<div class="row row-cols-md-2"><div>

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

To avoid making the code hard to read and to maintain, developers often define formatting rules. There are a lot of **linters** 🫧, at least one per programming language, that can detect and automatically clean-up the code according to the formatting rules defined.

* [ESLint](https://eslint.org/) for JavaScript
* [pylint](https://pylint.org/) for Python
* [markdownlint](https://github.com/DavidAnson/markdownlint) for Markdown
* [ShellCheck](https://www.shellcheck.net/) for Shell Scripts
* [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html) for C/C++
* ...

👉 **Common elements**: tabulation, spacing, variables names, lines width, position of symbols/elements in the code, symbols to use, etc.
</div></div>