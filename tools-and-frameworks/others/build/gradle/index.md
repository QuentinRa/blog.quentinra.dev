# Gradle

<div class="row row-cols-md-2"><div>

Gradle is an automation tool that can be used to **build** 🏭, **test** 🧪, and **deploy** 🚀 your project. It's an alternative created to address problems with other tools such as **Maven** or **Ant**.

Gradle uses a domain-specific language (DSL) based on the Groovy programming language for defining build scripts. It's possible to use [Kotlin](/programming-languages/high-level/oo/kotlin/index.md) instead of Groovy. 

It's commonly used with [Java](/programming-languages/high-level/oo/java/_general/index.md) and [Kotlin](/programming-languages/high-level/oo/kotlin/index.md) projects.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```
plugins {
    id 'xxx' version 'xxx'
}
// gradle xxx
task xxx(arg: XXX) {}
implementation ('xxx') {
    exclude group: 'org.json', module: 'json'
}
```

* There are notes everywhere 😭 (Java>Exe...)

</div><div>

* [jitpack](https://jitpack.io/)

```
// Gradle Properties Plugin
id("net.saliman.properties") version "1.5.2"

propertiesPluginEnvironmentNameProperty = branchNumber
branchNumber = 213
```

* Groovy
</div></div>