# TP TCHAT

* [IntelliJ IDEA Setup](ide/idea.md)

## Before starting, Some errors

``Graphics pipeline error``

<blockquote class="spoiler">
That simply means that the one compiling didn't find the OS-specific files for JavaFX. Check that in your lib folder or JavaFX folder that you got some jar like <code>javafx-base-16-win</code> on Windows.
</blockquote>

``JavaFX runtime component missing``

<blockquote class="spoiler">
Oh! You got this one! Welcome to JavaFX! In order to run a JavaFX you need to give some VM options, namely <code>--module-path lib --add-modules javafx.controls,javafx.fxml</code> (if lib is the folder with JavaFX .jar libraries). Check out the tutorial for your IDE and try to set up things properly.
</blockquote>

``Can't load FXML error``

<blockquote class="spoiler">
The problem may be
<ul>
<li>you used two times one ID</li>
<li>you used an ID on the wrong component (Image instead of Button, Button instead of ToogleButton, ... you can check the types in the Controller class)
</li>
</ul>

If you see a long, weird, path for your fxml, don't go check out this file, that's just your IDE that is creating a copy. If the path is wrong, then you will get a NullPointerException since getResource will fail.
</blockquote>

``Cannot invoke "javafx.scene.control.MenuBar.isUseSystemMenuBar()" because "this.menuBar" is null``

<blockquote class="spoiler">
Comment this code
<pre><code class="language-java"
>if ((osType == OSCheck.OSType.MacOS) && !menuBar.isUseSystemMenuBar())
{
  menuBar.setUseSystemMenuBar(true);
}
</code></pre>
</blockquote>

``Controller is null``

<blockquote class="spoiler">
You probably removed (or missing) a line from your fxml your controller. Check out the first line of your FXML for <code>fx:controller="application.Controller"</code>. It should look a bit like this 
<pre class="language-xml"><code class="language-xml"
>&lt;BorderPane prefHeight="400.0" prefWidth="600.0" xmlns="http://javafx.com/javafx/16"
xmlns:fx="http://javafx.com/fxml/1" fx:controller="application.Controller" >
&lt;!-- omitted -->
&lt;/BorderPane></code>
</pre>
</blockquote>

``address/host/port already in use``

<blockquote class="spoiler">
Seems like a server or another program is already using this port. Either find the program and shut it down, or pass the program argument <code>--port a_new_port</code>. Be sure that both your server and client have the same value.
</blockquote>

<hr class="sr">

## How you should process

You will use SceneBuilder to create your .fxml files. Inside, simply drag components and create the interface that you have to. You may follow these steps

* Create ``ClientFrame.fxml``
* launch it (either using preview or the main)
* check that your view is done
* Code the Main + a part of the Controller (see a bit further)
* Test with the server
* Write the rest of the Controller

<hr class="sl">

## SceneBuilder

### Layout

Use the ``BorderPane`` component! That's a component divided into north, south, east, west, and center. You can use it to put one component at the top, one in the middle and, one at the bottom. Then you have some components like a VBox (one component per line), HBox (one per column), toolbar, menubar, ... You can even use a ``BorderPane`` inside a ``BorderPane``.

### Icons

Simply drag and drop the icons from your icons' folder to the application. Buttons can have a text + icon (+ tooltip = a component with text shown when mouse stay on this button a.k.a. hover) but by default, we only want to see the icon, so go to ``properties`` and set `Content display` to `GRAPHIC_ONLY`.

### Spacing

You need to set the label (for the server name) close to the right border. The teacher is recommending: creating an empty HBox, and editing the fxml to add the attribute ``HBox.hgrow="ALWAYS"``.

```xml
<HBox HBox.hgrow="ALWAYS" />
```

### ID and Listeners

Sometimes you will give IDs to your components. It means that you need it in the ``Controller.java``, check the attributes with ``@FXML`` to know the type/attributes needing an ID. On IntelliJ, if a @FXML attribute is properly "linked", you will have an orange symbol on the left column, so you easily know if you did something wrong.

To set an ID or a listener, click on the component and go to the code section. Listeners are methods of the controller, generally starting with ``on...``. You can set in the code menu what method should be called if an event happens. `onAction` is the name of the event when a button is clicked/pressed.

### Context Menu

It's a popup shown when using left-click. You must add one on the list view of users. But on Windows, your scene builder may crash, so you need to create the menu somewhere else then copy and paste the code inside your context menu directly in the fxml.

### Tooltip

If you can't add tooltips, add them directly in the fxml

```xml
<?import javafx.scene.control.Tooltip?>
```

```xml
<Button>
<tooltip>
<Tooltip text="message" />
</tooltip></Button>
```

<hr class="sr">

## Starting

In Main.java, uncomment the code and don't forget this todo. All the values are given for the setters and the getter is done for you.

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
* `AbstractMessagesRunner getRunner()`, the teacher corrected this one if needed

<blockquote class="spoiler">

```java
/*
 * DONE Create runner with "this" as the MessageHandler,
 * commonRun (which needs to be already set) and current logger
 */
messagesRunner = new ObjectMessagesRunner(this, commonRun, logger);
```
</blockquote>

<hr class="sl">

## Then what's my ranking

Easy

- [ ] `onSendAction`
- [ ] `onQuitAction`
- [ ] `onDisplayButtonsWithGraphicsOnly`, `onDisplayButtonsWithTextAndGraphics`,
  `onDisplayButtonsWithTextOnly`
- [ ] `onCatchupMessagesAction`

Medium

- [ ] `onClearMessagesAction` (check ClearMessagesRunnable)
- [ ] `onClearSelectedUsers` (you need your user list done and users in it)
- [ ] `onKickSelectedUsers` (you need your user list done and users in it)
- [ ] `onShowDateOnMessages` (if message cell is done)

Medium / Hard

- [ ] `onFilterMessagesAction`
- [ ] `onUpdate` (this may be tricky but read the subject, a lot of help is given)

Hard

- [ ]  `onChanged` (check the Javadoc, you got an example of how to use "c")
- [ ] `onActionSortMessagesByContent`/ `onActionSortMessagesByAuthor`/
  `onActionSortMessagesByDate` (same code)

<hr class="sr">

## initialize

And here is some help for `initialize`

* you should not code it in one go, simply write a bit of it
  * `#authorList` is `this.authorsObservableList`. You need to link an observable list with the view (usersListView). If the list is changed, then the view will change.
  * some methods that you could use are written inside the subject !!!
  * your class implements `implements ListChangeListener<String>` meaning you got a listener for the listview changes, but you have to add it. The teacher gave this code ``usersListView.getSelectionModel().getSelectedItems().addListener(this);``.
  * `Set #graphicsOnlyMenuItem to true` : set selected
  * `showDateOnMessagesMenuItem` : same
  * `displayLabeled` : it's a list, so you need to add to the list all buttons that may be changed if we want to show text or text+image in our buttons instead of text only.
* otherwise, you need to create `MessageCell` (that's a copy of UserCell with some changes)

<hr class="sl">

## Tackle a todo

As an example for one TODO, onSendAction an easy one can be understood as

```java
// TODO: "replace with send message contained in #messageText to server and clears 
// #messageText"
//
// You are tasked to do 2 things but you need to think about 4 things
// - send a message ... => find how to send a message
// - contained in #messageText => get text from an input field
// - send a message, meaning the string that you got from the input
// - clears #messageText => clean input field
```

And, in order to send a message, `messagesRunner` have a method `sendMessage(string)` so you can do `this.messagesRunner.sendMessage("a message here");`.