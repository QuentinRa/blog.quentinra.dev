## MCQ Questions about TPs

[Go back](index.md)

<br>

**Question 1**

What's the design pattern for the class Group in TP Figures
who contains a lot of Figures. Group is also a Figure.

<blockquote class="spoiler">
It's Composite design pattern.
</blockquote>

<br>

**Question 2**

In TP Tchat, in the method ``void updateMessages()``,
which operations were intermediary?

* ``stream.forEach((Message m) -> appendMessage(m));``
* ``stream = stream.filter(authorFilter);``
* ``Stream<Message> stream = messagesList.stream();``
* ``stream = stream.sorted();``

<blockquote class="spoiler">
The 2nd and the 4th one since we are consuming our stream
to create a new one.
</blockquote>

<br>

**Question 3**

In TP Tchat, Controller implements ``ListChangeListener<String>``.
What's the design pattern?

<blockquote class="spoiler">
It's Observer/Observable design pattern.
</blockquote>

<br>

**Question 4**

In TP Tchat, the teacher used ``Map<String, Color> colorMap = newTreeMap<String, Color>()``
to store the color(Color) for each user (String). What instructions
are valid

* ``colorMap.put("Olias", Color.BEIGE);``
* ``colorMap.put(Color.AQUA, "Antholien");``
* ``colorMap.get(Color.GREEN);``
* ``colorMap.get("Cloris");``

<blockquote class="spoiler">
The 1st one since we have String-Color and the 4th one
since <code>get</code> method take a key and the key has the type String
since we are associating for each username a color.
</blockquote>