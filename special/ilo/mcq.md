# MCQ

[Go back](index.md)

A lot of questions that the teacher is usually asking us. They are all about the practical classes, while Java-related questions are in the Java course.

<hr class="sr">

## Question 1

What's the design pattern for the class Group in TP Figures, which contains a lot of Figures. Note that Group is also a Figure.

<blockquote class="spoiler">
It's the <b>Composite design pattern</b>.
</blockquote>

<hr class="sl">

## Question 2

In TP Tchat, in the method ``void updateMessages()``, which operations were intermediary?

* ``stream.forEach((Message m) -> appendMessage(m));``
* ``stream = stream.filter(authorFilter);``
* ``Stream<Message> stream = messagesList.stream();``
* ``stream = stream.sorted();``

<blockquote class="spoiler">
The 2nd and the 4th ones, since in both we are consuming our stream to create a new one.
</blockquote>

<hr class="sr">

## Question 3

In TP Tchat, Controller implements ``ListChangeListener<String>``. What's the design pattern?

<blockquote class="spoiler">
It's Observer/Observable design pattern.
</blockquote>

<hr class="sl">

## Question 4

In TP Tchat, the teacher used ``Map<String, Color> colorMap = newTreeMap<String, Color>()`` to store the color(Color) for each user (String). What instructions are valid?

* ``colorMap.put("Olias", Color.BEIGE);``
* ``colorMap.put(Color.AQUA, "Antholien");``
* ``colorMap.get(Color.GREEN);``
* ``colorMap.get("Cloris");``

<blockquote class="spoiler">
The 1st one since we have String-Color and the 4th one since <code>get</code> method take a key and the key has the type String since we are associating for each username a color.
</blockquote>

<hr class="sr">

## Question 5

In TP Tchat, the class ``ChatClient`` is handling the message (send/receive). It is M, V, or C in MVC?

<blockquote class="spoiler">
I think it's <b>M</b>, since ChatClient can be viewed as a class interacting with a Database (the server here).
</blockquote>

<hr class="sl">

## Question 6

In TP Tchat, we were giving ``Runnables`` to ``Platform.runLater``. True or False?

1. the runnable classes were declared as inner classes (``classes internes``)
2. the runnable classes were declared as nested classes (``classes imbriquée``)
3. we could have used lambda expressions
4. we couldn't have used lambda expressions
5. we could have used anonymous classes

<blockquote class="spoiler">
The classes are not static, so they were declared as inner classes. We could have used a <b>lambda expression</b>, since <b>Runnable</b> is a functional interface. We could have used an anonymous class, it works no matter the class.
</blockquote>

<hr class="sr">

## Question 7

In TP Figures, what's the design pattern used when we are calling ``equals(Figure f)`` inside ``equals(Object obj)`` among Template Method, Equalizer, Decorator, and Adapter?

<blockquote class="spoiler">
My first trough is the <b>Template Method</b> because <code>equals, hashcode, ...</code> are methods defined in the template that is named <code>Object</code>. But, since this is not "about equals" as it looks like this is about "the same method but more specialized" then I would pick <b>Decorator=Wrapper</b> because it looks like a Parser that becomes a XMLParser/PDFParser/... to me.
</blockquote>

<hr class="sl">

## Question 8

In TP Lists, ``CollectionList<E> extends AbstractCollection<E>`` which is a ``Collection<E>`` wrapping a `ForwardList<E>`. What's the design pattern among Iterator, Decorator, Composite, and Adaptor?

<blockquote class="spoiler">
First, I checked that <code>ForwardList</code> wasn't a Collection. Hence, I would pick the pattern <code>Adaptor</code> because we are providing an interface (a Collection) for our ForwardList.
</blockquote>