# SmartHouse TD9

...

<hr class="sl">

## xtend

> **Goal**: Generate a project, with a main, that can be run. We are not expecting any output (for now, unclear directives).

<details class="details-e">
<summary>Missing files</summary>

The problem is coming, as you could expect, from the model. Some problems that we found were

> **Possible problem**: **Missing names** (xxx.name.empty is raising a NPE)<br>
> **Is this your problem?**: in the first editor, you got a console with errors that happened in the second editor. Check the log inside with CTRL-F.

You may have removed names on states of your Behavior diagram to make it cleaner. That's not good because it's raising exceptions. **Check that every state, if, entry, exit** got a name.

> **Possible problem**: your model is broken 😭<br>

Open every diagram, and check that there is no classes that disappeared. Explorer every entry in the model explorer, and check that there is no duplicates entries (not two times the same class, etc.) People I know having this, didn't manage to solve it 😭.
</details>