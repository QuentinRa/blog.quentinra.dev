# Visitor Design Pattern

[Go back](../index.md#behavioral-)

<div class="row row-cols-lg-2"><div>

**Aliases** 📌: None

**Description** 📚: A class can accept some visitors <small>(ex: has a `accept(SomeVisitor)` method)</small>. Our method will behave differently according to the kind of visitor. 

We usually call the `visit` method on the visitor <small>(ex: `someVisitor.visit(this)`)</small>.

</div><div>

**Advantages** ✅

* xxx

**Disadvantages** 🚫

* ???

**Notes** 📝

* Used in Parsers such as [JetBrains R Parser](https://github.com/JetBrains/Rplugin/blob/master/gen/org/jetbrains/r/psi/api/RVisitor.java)
</div></div>