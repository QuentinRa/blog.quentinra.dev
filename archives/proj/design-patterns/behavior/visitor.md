# Visitor

[Go back](..)

A visitor can do methods defined in an interface. Then you will have concrete classes taking a visitor and executing (or not) some code.

From what I understood

* create an abstract class with an ``accept`` method, taking a visitor
* a visitor is an interface of the methods that may be implemented according to the kind of visitor
* then you create visitors
* and you create concrete classes inheriting the abstract class that may do something different according to the visitor

I have seen it used in parsers, like in JetBrains's [R language parser](https://github.com/JetBrains/Rplugin/blob/master/gen/org/jetbrains/r/psi/api/RVisitor.java).

There are [examples and explanations here](https://java-design-patterns.com/patterns/visitor/).