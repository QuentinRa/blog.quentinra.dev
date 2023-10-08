# Database Diagram

<div class="row row-cols-md-2"><div>

A database diagram seems to be an unofficial diagram mostly based on a simplified [Class Diagram]() with some semantic changes.

<div class="text-center">

![_uml/basic.pu](_uml/basic.svg)
</div>

A **class** 🗃️, such as `Person`, is a structured data definition. It has **attributes** 📚 such as `name` which has the type `String`.
</div><div>

A **record** 🎫 is a concrete instance of a class, e.g., we gave concrete values to each attribute of the class <small>(ex: Person(id=1, name="John Doe"))</small>.

Some attributes such as `id` are special attributes called **identifiers**. They are used to identify a record <small>(e.g., given an ID, we can find a person)</small>.

**Associations** 🔗, **Generalizations** 👨‍👩‍👧‍👦, and **multiplicity** 🔢 are the same as for classes diagrams.

<br>

👀 In practice, identifiers are usually called **keys** 🔑 while a key is actually the implementation <small>(ex: in SQL)</small> of an identifier.

🚀 We often use [OCL](https://en.wikipedia.org/wiki/Object_Constraint_Language) along the diagram to express constraints.
</div></div>

<hr class="sep-both">

## My notes

<div class="row row-cols-md-2"><div>

#### Identifiers

**Rules** 📝

* Each class must have an identifier 
* Identifiers are unique and not null <small>(by design)</small>
* An identifier can be composed of multiple attributes

**Diagram** 🎨

* `# attr` or <code><u>attr</u></code>: an attribute part of the primary key
* `* attr`: an attribute that can potentially become a key
* `⊛ attr`: an artificial key

Both primary keys and artificial keys are explained [here](/programming-languages/databases/relational/_knowledge/index.md#terminology).
</div><div>

#### Changes with class diagrams

**Diagram** 🎨

* There is no concept of `visibility` <small>(#attr does not mean protected)</small>
* There is no concept of `class attributes` <small>(<u>attr</u> is not a class attribute)</small>
* There are usually no `operations`. If there are, it means we will use [PL/SQL](/programming-languages/databases/relational/plsql/index.md) or another procedural language to code them.
</div></div>