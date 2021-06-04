# TP TCHAT

[Go back](..)

First the TP is in two parts

* simply answer some question (but **don't code 
  any todo**)
* then wait for JavaFX project, and code it. When you
will have to test with a server, run the server
  from the previous TP (nothing to do aside running)
  and that's it.
  
Materials

* [Source Part1](download:sources/TPChat.zip)
* [Source Part2](download:sources/ChatClientJavaFX.zip)
  
## Choose your IDE

I highly recommends using **IntelliJ** (easy to learn) for this one,
since that's may be your first time with JavaFX and
IntelliJ have a great support for JavaFX. You can solve
in less than 30 seconds problems like
``Can't load FXML``.

* [Eclipse Setup](ide/eclipse.md)
* [IntelliJ IDEA Setup](ide/idea.md)
* [VSCode Setup](ide/vsc.md)

## Before starting, Some errors

``Graphic pipeline error``

<blockquote class="spoiler">
That's simply means that the one compiling didn't found the OS
specific files for javafx. Check that in your lib folder or JavaFX folder
that you got some jar like <code>javafx-base-16-win</code>
on Windows.
</blockquote>

``JavaFX runtime component missing``

<blockquote class="spoiler">
Oh ! You got this one ! Welcome to JavaFX! In order to run a JavaFX you need to give some
VM options, namely
<code>--module-path lib --add-modules javafx.controls,javafx.fxml</code>
if lib is a folder with JavaFX .jar libraries. Check our the IDE tutorial
and try to setup things properly.
</blockquote>

``Can't load FXML error``

<blockquote class="spoiler">
The problem may be
<ul>
<li>you used two times one ID</li>
<li>you used an ID on the wrong component (image instead of button,
Button instead of ToogleButton, ... you can check the types in the Controller
class)
</li>
</ul>

If you see a enormous path for your fxml, don't go check out this file, that's just
your IDE who is creating a copy. If the path is wrong then you will got a NullPointerException
since getResource will fail.
</blockquote>

``Controller is null``

<blockquote class="spoiler">
Hum you probably removed from your fxml your controller.
Check out the first line of your FXML for <code>fx:controller="application.Controller"</code>.
Should look a bit like this (this is a raw file)
<pre class="language-xml"><code class="language-xml"
>&lt;BorderPane prefHeight="400.0" prefWidth="600.0" xmlns="http://javafx.com/javafx/16"
xmlns:fx="http://javafx.com/fxml/1" fx:controller="application.Controller" &gt;
&lt;/BorderPane&gt;</code>
</pre>
</blockquote>

``address/host/port already in use``

<blockquote class="spoiler">
Seems like a server or another program is already using this port. Either found the program and shut it down or pass
the program argument <code>--port a_new_port</code>. Be sure that both your server and client have the same value.
</blockquote>

## How you should process

You will use SceneBuilder to create your .fxml files. Inside simply drag components and create the interface
that you have to. Please take note of theses steps

* Create ``ClientFrame.fxml``
* launcher, test
* Main + start Controller (only the easy part, see a bit further)
* Test with the server
* Write the rest of the Controller

## Layout

Please take note of ``BorderPane`` component. That's a component divided in north, south, east,
west and center. You can use it to put one component at the top, one in the middle and one at the bottom. Then you have
some components like a vbox (one component per line), hbox (one per column), toolbar, menubar, ... You can even use a
``BorderPane`` inside a ``BorderPane``.

## Icons

Simply drag and drop the icons from your icons folder to the application. Buttons can have a text + icon (+ tooltip =
a component with text shown when mouse stay on this button a.k.a. hover) but by default we only want to see the icon
so go to ``properties`` and set `Content display` to `GRAPHIC_ONLY`.

## Spacing

You need to set the label (for the server name) at the right. The teacher is recommending to create an empty
HBox then go to the fxml and add the attribute ``HBox.hgrow="ALWAYS"``.

```xml
<HBox HBox.hgrow="ALWAYS" />
```

## ID and Listeners

Sometimes you will give IDs to some components. That means you need it in the ``Controller.java``, check the attributes
with ``@FXML`` to know the type / attributes requiring an ID. On IntelliJ, if a @FXML attribute is linked then you will have
some orange visual symbol on the left column so you easily know if you did something wring.

To set and ID or a listener, click on the component and go to code section. Listeners are methods of the controller generally
starting with ``on...``. You can set in the code menu what method should be called if an event appends. `onAction` mean
when a button is clicked/pressed if you didn't know.

## Context Menu

If a popup shown when using left click. You must add one on the list view of users. But on Windows your scene builder
may crash so you need to create the menu somewhere else then copy and paste the code inside your context menu directly
in the fxml.

## Tooltip

If you can't add tooltips, check it looks like that

```xml
<?import javafx.scene.control.Tooltip?>
```

```xml
<Button>
<tooltip>
<Tooltip text="message" />
</tooltip></Button>
```

## Coding the main (the basic)

In Main.java, de-comment the code and don't forget this easy todo.
All the values are given for the setters and the getter is done for you.

```java
// --------------------------------------------------------------------
// Get controller's instance and get/set some values such as
//	- set name as author's name into controller
//	- set this logger as parent logger of controller
//	- set #commonRun on controller
//	- set #host server on controller
//	- set parent stage on controller so it can be closed later
//	- get controller's runner in order to thread it
// --------------------------------------------------------------------
```

Then complete these

* `Controller()`
* `setServer(String serverName)`
* `AbstractMessagesRunner getRunner()`, the teacher corrected this one

```java
/*
 * DONE Create runner whith "this" as the MessageHandler,
 * commonRun (which needs to be already set) and current logger
 */
messagesRunner = new ObjectMessagesRunner(this, commonRun, logger);
```

## Then what's my ranking

Easy

- [ ] `onSendAction`
- [ ] `onQuitAction`
- [ ] `onDisplayButtonsWithGraphicsOnly`, `onDisplayButtonsWithTextAndGraphics`,
  `onDisplayButtonsWithTextOnly`
- [ ] `onCatchupMessagesAction`

Medium

- [ ] `onClearMessagesAction` (=> ClearMessagesRunnable)
- [ ] `onClearSelectedUsers` (need you user list to have the user view shown)
- [ ] `onKickSelectedUsers` (need you user list to have the user view shown)
- [ ] `onShowDateOnMessages` (if message cell is done)

Medium / Hard

- [ ] `onFilterMessagesAction`
- [ ] `onUpdate` (may be tricky but read the subject, a lot is given)

Hard

- [ ]  `onChanged` (check the Javadoc, you got an example of how to use c)
- [ ] `onActionSortMessagesByContent`/ `onActionSortMessagesByAuthor`/
  `onActionSortMessagesByDate` (same code)
  
And here is some help for `initialize`

* you should not code it in one go, simply write a bit of it
  * `#authorList` is `this.authorsObservableList`. You need to link an observable list with the view (usersListView). Then
  if the list is changed, then the view will change.
  * some methods are written in the subject !!!
  * your class implements `implements ListChangeListener<String>` meaning you got a listener for the listview
    changes but you have to add it. The teacher gave this code ``usersListView.getSelectionModel().getSelectedItems().addListener(this);``.
  * `Set #graphicsOnlyMenuItem to true` : set selected
  * `showDateOnMessagesMenuItem` : same
  * `displayLabeled` : it's a list, so you need to add to the list all buttons that may be changed if we want to show text or text+image
  in our buttons instead of text only.
* otherwise you need to create `MessageCell` (that's a copy of UserCell with some changes)

As an example for one TODO, onSendAction an easy one can be understood as

```java
// "replace with send message contained in #messageText to server and clears #messageText"
// ça demande deux choses, donc ce genre de découpage
// - send message ... => find how to send a message
// - contained in #messageText => get text from an input field
// - send a message, meaning the string that you got from the input
// - clears #messageText => clean input field
```

And in order to send a message, `messagesRunner` have a method `sendMessage(string)`
so you can do `this.messagesRunner.sendMessage("a message here");`.