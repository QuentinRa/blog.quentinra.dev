# ILO

ILO is not an easy course so you will need strength
or backup in order to master it, or just survive in it.

* [Figures TP](figures/index.md)
* [Lists TP](lists/index.md)
* [Tchat TP](tchat/index.md)

And that's all I can do. As a side note, we have a **Java** course
with a part about **JavaFX** and **Tests** with JUnit.
We also have a course about **Design patterns** and **C++**.

## MCQ Questions about TPs

What's the design Pattern for class Group in TP Figures
who contains a lof of Figures. Group is also a Figure.

<blockquote class="spoiler">
Composite design pattern.
</blockquote>

In TP Tchat, in the method ``void updateMessages()``,
what operations where intermediary.

* ``stream.forEach((Message m) -> appendMessage(m));``
* ``stream = stream.filter(authorFilter);``
* ``Stream<Message> stream = messagesList.stream();``
* ``stream = stream.sorted();``

<blockquote class="spoiler">
The 2nd and the 4th one since we are consuming our stream
to create a new one.
</blockquote>

In TP Tchat, Controller implements ``ListChangeListener<String>``.
What's the design pattern ?

<blockquote class="spoiler">
Observer/Observable design pattern.
</blockquote>

In TP Tchat, the teacher used ``Map<String, Color> colorMap = newTreeMap<String, Color>()``
to store the color(Color) for each user (String). What instructions
are valid

* ``colorMap.put("Olias", Color.BEIGE);``
* ``colorMap.put(Color.AQUA, "Antholien");``
* ``colorMap.get(Color.GREEN);``
* ``colorMap.get("Cloris");``

<blockquote class="spoiler">
The 1st one since we have String-Color and the 4th one
since get take a key and the key have the type String
since we are associating for each username a color.
</blockquote>