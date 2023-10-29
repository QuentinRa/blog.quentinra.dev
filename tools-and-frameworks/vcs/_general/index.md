# Version Control

<div class="row row-cols-lg-2"><div>

Version control, a.k.a. source control is a system that manages changes to files in a project over time. Version control systems (VCS) are either:

* Centralized Version Control Systems (CVCS) 🏭: a central server keeps track of every change <small>(ex: [SVN](../svn/_general/index.md))</small>.

* Distributed Version Control Systems (DVCS) 🏠: each user can keep track of every change  <small>(ex: [GIT](../git/_general/index.md), [Mercurial](https://www.mercurial-scm.org/))</small>.

It's quite common in software development, especially [GIT](../git/_general/index.md).
</div><div>

VCS addresses several challenges that arise when working on software development:

* **Tracking Changes** 🔎: who made a change? when? why?...
* **Collaboration** 🌍: handle problems when multiple people work on the same file. Also handle problems when a copy of the project was made to test something, and we need to "merge" it.
* **Backup and Recovery** 😵: if something goes wrong, such as a file or some code being deleted, we can revert these changes.
* ...
</div></div>

<hr class="sep-both">

## Versioning 🌞

<div class="row row-cols-lg-2"><div>

Given the implementation of version control, the importance of proper versioning has significantly increased.

The commonly adopted approach for assigning version names to projects is known as [Semantic Versioning](https://semver.org/).

* 🗒️ The format is **MAJOR.MINOR.PATCH**
    * MAJOR: breaking change (of the API)
    * MINOR: non-breaking change, backward compatible
    * PATCH: internal change
* When <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mtext>MAJOR</mtext>
  <mo>=</mo>
  <mn>0</mn></math>: in development
* When <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mtext>MAJOR</mtext>
  <mo>&#x2265;</mo>
  <mn>1</mn></math>: Stable
</div><div>

An alternative is [Calendar Versioning](https://calver.org/).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Plastic SCM
</div><div>
</div></div>