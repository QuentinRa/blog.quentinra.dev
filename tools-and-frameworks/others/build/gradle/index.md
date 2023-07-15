# Gradle

**[Old notes](_old.md)**

...

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
</div></div>