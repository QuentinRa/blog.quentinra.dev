# Memento or token

[Go back](..)

You can use this to save an object. That may be used by undo/redo in an application but in fact, it cost a bit too much, hence not many seem to use it. In most cases, for an undo-redo, we will save the action that the user did, or the action that we should do to undo it.

* ✅ : convenient
* 🚫 : costly

<hr class="sl">

## Example

* we consider some states (1,2, ...)
* we create ``Memento`` with the name of the state and the data to save
* we create a class `Caretaker` for all your mementos

    * `add(Memento)`
    * `get(int)` (which of the stored memento you want?)

Then on our object, we would add a method

* `getMemento():Memento` : returns the current memento
* `setState(Memento)` : change the state of the object according to a memento.