# Memento or token

[Go back](..)

You can use this to save an object. That would be used
by undo/redo application but in fact it cost a bit
too much so not many would use it.

In most case, for an undo redo, we will save the action
done in order to reverse them or directly the action
needed to undo.

* ✅ : convenient
* 🚫 : costly

## Example

* we consider some states (1,2, ...)
* we create ``Memento`` with the name of the state 
  and the data to save
* we create a class ``Caretaker`` for all your mementos

    * ``add(Memento)``
    * ``get(int)``

Then on our object, we would add a method

* `getMemento():Memento` : returns the current memento
* `setState(Memento)` : change the state of the object 
according to a memento.