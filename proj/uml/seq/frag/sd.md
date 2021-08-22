# sd and ref fragments

[Go back](../index.md)

These fragments are allowing you to name a diagram and reference a diagram in another sequence diagram.

Usually, You put your whole sequence diagram in a fragment called <kbd>sd</kbd> (sequence diagram) with a name.

* sort of ``sd | my_diagram``

Then in another diagram, you may reference another diagram using <kbd>ref</kbd>(reference) and the name given to the diagram you want in sd.

* sort of ``ref | my_diagram``