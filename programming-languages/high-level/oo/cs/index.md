# CSharp (C#)

<div class="row row-cols-lg-2"><div>

CSharp or C# is a relatively modern [object-oriented](/programming-languages/_paradigm/oo.md) programming language introduced and maintained by Microsoft 🪟.

It's used by [Microsoft .NET framework](https://dotnet.microsoft.com/en-us/download/dotnet-framework) 💻, the [Unity game engine](https://unity.com/) for game development 🕹️, and some web applications 🌍.

**Where to learn?** 🎓

* [Documentation](https://learn.microsoft.com/en-us/dotnet/csharp/) (⛪)
* [C# Yellow Book](https://www.robmiles.com/c-yellow-book/) (👻)
* [LearnCS](https://www.learncs.org/) (👻)
</div><div>

You can either download and use [VSCode](/tools-and-frameworks/editors/gui/vscode/index.md), or use another IDE such as [Rider](/tools-and-frameworks/editors/gui/jetbrains/rider/index.md). You may use neither and use [dotnet](https://dotnet.microsoft.com/en-us/download/dotnet) from the command line.

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

<div class="row row-cols-lg-2"><div>

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
int sum = 5 + 5;          // 10
int subtraction = 5 - 5;  // 0
int product = 5 * 5;      // 25
int division = 6 / 5;     // 1
x += 1;                   // same as x = x + 1
x++;                      // same as x = x + 1
// see also: --, -=, *=, and /= 
// logical
if (5 == 5) {}         // true ⚠️ see also "Object#equals"
if (5 != 5) {}         // false
// see also: >, >=, <, <=
if (!false) {}         // logical NOT => true
if (true || false) {}  // logical OR => true
if (true && false) {}  // logical AND => false
if (true ^ false) {}   // logical XOR => true

string t = ""+5;       // concatenation (+cast), see String
```
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-lg-2"><div>

#### Branching

Usual if/else.

```cs
if (true) {} 
if (true) {} else {}
if (true) {} else if (false) {} else {}
```

Ternary operator: `condition ? value_if_true : value_if_value`.

```java
string value = true ? "true" : "false";
```
</div><div>

#### Loops

In every loop, you can use `break` to exit the loop, and you can use `continue` to end the current iteration, and process to the next one.

```java
// usual loop - i in [0, 10[
for (var i = 0; i < 10; ++i) {}
// reverse loop - i in ]0, 10]
for (var i = 10; i > 0; i--) {}
// nested loop
for (var i = 0; i < 5; ++i) {
    for (var j = 0; j < 5; ++j) {}
}
```

```java
while(true) {}; // repeat while true
do {} while(true); // executed at least once
```
</div></div>

<hr class="sep-both">

## Classes

<div class="row row-cols-lg-2"><div>

Usually, each C# [class](/programming-languages/_paradigm/oo.md#classes-and-objects) is usually in a separate file, while the filename doesn't necessarily dictate the name of the class defined within it.

```cs
public class ClassNameHere {}
```

#### Namespaces

To make things cleaner, we usually use namespaces to group classes. A namespace is roughly equal to a folder.

```cs
namespace Memorize.Code; // ./Memorize/Code/Test.cs

public class Test {}
```

Aside from default classes, every other class must be imported:

```cs
using Memorize.Code;

var test = new Test();
```

#### Visibility

Each class/attribute/method/... has a visibility modifier determining [who](/programming-languages/_paradigm/oo.md#access-control) can use a method/access an attribute/...

➡️ By default, everything is **private**.
</div><div>

#### Attributes

```cs
private string _attribute;
public string Name { get; private set; }
public string Name { get;; }
```

#### Method

```cs
private void Xxx() {}
private void Yyy()
{
    Xxx(); // same as this.Xxx();
}
```
</div></div>

<hr class="sep-both">

## Inheritance

<div class="row row-cols-lg-2"><div>

C# implements [inheritance](/programming-languages/_paradigm/oo.md#content-inheritance) similarly to Java. Classes can have one parent, and implement multiple **interfaces**.

```cs
public class Parent
{
    public Parent() {}
}

public class Child : Parent
{
    public Child() : base() {}
}
```
</div><div>

#### Override

Child classes can override a method, e.g., change the inner code of a method that was declared within their parent.

The child class uses `base` to reference the parent class.

We can only override a **virtual** method.

```cs
// in the parent
protected virtual void XXX() {}
// in the inheritor - you can change the code
protected override int XXX() {
    return base.XXX(); // default behavior
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Nuget packages
* [NUnit](https://nunit.org/)
* [Linq](https://docs.microsoft.com/fr-fr/dotnet/csharp/programming-guide/concepts/linq/introduction-to-linq-queries)
* [C# Cheatsheet](https://gist.github.com/jwill9999/68c0da6c4c58efb42e25f887152256e1)
* Switch, foreach
* `[Serializable]`
* `() => { return z; }`
* `private void XXX<T>(T xxx)`
* `throw new NotImplementedException();`
* `IEnumerator`, `yield break/return null`
* `struct`
* `new List<>(); Find Add { null } Exists ForEach`
</div><div>

```cs
public string Name { get { return _name; } set { _name = value; } }
public string Name { get => _name; set { _name = value; } }
public string Name { get => _name; init => _name = value; }
public string Name { get; private set; }
```
```cs
public class XXX
{
    public static bool operator ==(XXX a, XXX b)
    {
        return false;
    }

    public static bool operator !=(XXX a, XXX b)
    {
        return false;
    }
}
```
</div></div>