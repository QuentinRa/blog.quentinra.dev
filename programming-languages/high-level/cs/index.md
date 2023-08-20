# C# - CSharp

<div class="row row-cols-md-2"><div>

C# <small>(CSharp)</small> is a relatively modern [object-oriented](/programming-languages/_paradigm/oo.md) programming language introduced and maintained by Microsoft 🪟.

It's used by [Microsoft .NET framework](https://dotnet.microsoft.com/en-us/download/dotnet-framework) 💻, the [Unity game engine](https://unity.com/) in game development 🕹️, and some web applications 🌍.

**Where to learn?** 🎓

* [Documentation](https://learn.microsoft.com/en-us/dotnet/csharp/) (⛪)
* [C# Yellow Book](https://www.robmiles.com/c-yellow-book/) (👻)
* [LearnCS](https://www.learncs.org/) (👻)
</div><div>

You can either download and use [VSCode](/tools-and-frameworks/editors/vscode/index.md), or use another IDE such as [Rider](/tools-and-frameworks/editors/jetbrains/rider/index.md). You may use neither and use [dotnet](https://dotnet.microsoft.com/en-us/download/dotnet) from the command-line.

```shell!
PS> mkdir project && cd project
PS> dotnet.exe new console # init a .NET console app
PS> dotnet.exe build       # generate bin
PS> dotnet.exe run         # generate bin
Hello, World!
```

To get started, edit `Program.cs`.
</div></div>

<hr class="sep-both">

## Core knowledge

<div class="row row-cols-md-2"><div>

#### Variables

```cs
string variable1;       // explicit type
string variable2 = "";  // default value
var variable3 = "";     // implicit type
```

#### Types

Here are some C# types:

```cs
int xxx = 42;             // Int32
float xxx = 21f + 21F;    // Single
double xxx = 21.0 + 21d;  // Double
bool xxx = true || false; // Boolean
char xxx = 'c';           // Char
string xxx = "xxx";       // String
```

To declare a **nullable-type** 🧨, e.g., **explicitly** allowing the variable to be null, add `?` after the type. When using a nullable variable, we will have a reminder that the variable may be null.

```cs
int? xxx = 42;  // may be null
```

➡️ To suppress the warning, use `!`, e.g., `xxx!.Something`.
</div><div>

#### Print some text in the terminal

```cs
Console.WriteLine("Hello, World!");
Console.WriteLine("Hello, " + variable + "!");
```

#### Operators

Here is a list of most [operators](/programming-languages/_paradigm/stuff/operators.md).

```cs
xxx
```
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-md-2"><div>

#### Branching

Usual if/else.
</div><div>

#### Loops

...
</div></div>

<hr class="sep-both">

## Classes

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Nuget packages
* [NUnit](https://nunit.org/)
* [Linq](https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/concepts/linq/introduction-to-linq-queries)
* [C# Cheatsheet](https://gist.github.com/jwill9999/68c0da6c4c58efb42e25f887152256e1)
</div><div>
</div></div>