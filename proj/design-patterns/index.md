# Design patterns

Most of the time when coding, you will write some
part of code that a lof of developers written before
you. Design patterns are the result of their reflexion
on how one should implement this code.

There a 4 great kind of design patterns

* **creation** : how to create objects
* **structure** : how to structure your code
* **behaviour** : how to make the interactions between objects
* **architectural** : how to think your code
* and **anti-patterns** : what you **mustn't** do

Just so you know a **GREAT** tip : if you copy and paste some code then in 100%
of cases you are doing a mistake.

You may, should and must check this course 
<https://www.gofpatterns.com/design-patterns/module1/intro-design-patterns.php>
about design patterns since the official one may help and be more accurate than
this one.

## Creation

* [Factory](creation/factory.md)
  : Delegate construction to a factory class (`Truc t = Factory.createTruc()`)
* [AbstractFactory](creation/abstract-factory.md)
  : A factory of factories.
* [Singleton](creation/singleton.md)
  : Only one instance of a class
* [Multiton](creation/multiton.md)
  : Only n instances of a class
* [Prototype](creation/prototype.md)
  : Clone instead of creating complex objects
* [Builder](creation/builder.md)
  : Break object creation into modules
* Object Pool
  : Create a finite pool of objects, allow others
  classes to use them, then handles to cleaning afterwards.

## Structure

* [Adaptor](structure/adaptor.md)
  : Interface that the client wanted with our code and the client
* [Facade](structure/facade.md)
  : simplified API to use our code
* [Composite](structure/composite.md)
  : Abstract class implemented by children
* [Bridge](structure/bridge.md)
  : Interact with interfaces rather than concrete implementations
* [Decorator](structure/decorator.md)
  : Wrapper of a class to change a part of it,
  alternative to legacy with extends.
* Flyweight
  : If you got a lot lot lot of objects then you can
  use the flyweight.
* [Proxy](structure/proxy.md)
  : call a remote object or use an attribute of
  a subclass to prevent yourself from coding some methods.

## Behaviour

* [Chain of Responsibility](behaviour/chain-of-responsibility.md)
  : Lists of class me may trigger for an action
* [Iterator](behaviour/iterator.md)
  : Iterates a list of Unknowns items
* [Observable](behaviour/observable.md)
  : watch object changes and trigger events
* [Memento](behaviour/memento.md)
  : save and load objects
* [NullObject](behaviour/null-object.md)
  : an empty object
* [Command](behaviour/command.md)
  : break into class the one using the command and the command
* [Interpreter](behaviour/interpreter.md)
  : language parser
* [Template](behaviour/template.md)
  : define classes properties
* [State](behaviour/state.md)
  : change object behaviour according to state
* [Strategy](behaviour/strategy.md)
  : family of objects
* [Visitor](behaviour/visitor.md)
  : object change according to visitor
* [Mediator](behaviour/mediator.md)
  : relation between classes

## Architectural

* [MVC](architectural/mvc.md)
  : Model - View - Controller
* DAO
  : DAO (data access objet)
  
## Sources

* Florent MADELAINE ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* David ROUSSEL ([ENSIIE](https://www.ensiie.fr/) teacher)
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

References
* <https://fr.wikibooks.org/wiki/Patrons_de_conception>
* <https://www.javatpoint.com/design-patterns-in-java>
* <https://www.geeksforgeeks.org/the-decorator-pattern-set-2-introduction-and-design/>
* <https://www.gofpatterns.com/>
* <https://www.geeksforgeeks.org/null-object-design-pattern/>
* <https://www.tutorialspoint.com/design_pattern/null_object_pattern.htm>
* <https://www.tutorialspoint.com/design_pattern/chain_of_responsibility_pattern.htm>
* <https://www.baeldung.com/java-observer-pattern>
* <https://www.geeksforgeeks.org/interpreter-design-pattern/>
* <https://www.tutorialspoint.com/design_pattern/data_access_object_pattern.htm>
* <https://www.tutorialspoint.com/design_pattern/composite_entity_pattern.htm>