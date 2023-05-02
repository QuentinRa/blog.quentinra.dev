# TP TCHAT

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

<hr class="sl">

## SceneBuilder

### Icons

Simply drag and drop the icons from your icons' folder to the application. Buttons can have a text + icon (+ tooltip = a component with text shown when mouse stay on this button a.k.a. hover) but by default, we only want to see the icon, so go to ``properties`` and set `Content display` to `GRAPHIC_ONLY`.

### Spacing

You need to set the label (for the server name) close to the right border. The teacher is recommending: creating an empty HBox, and editing the fxml to add the attribute ``HBox.hgrow="ALWAYS"``.

```xml!
<HBox HBox.hgrow="ALWAYS" />
```

### ID and Listeners

Sometimes you will give IDs to your components. It means that you need it in the ``Controller.java``, check the attributes with ``@FXML`` to know the type/attributes needing an ID. On IntelliJ, if a @FXML attribute is properly "linked", you will have an orange symbol on the left column, so you easily know if you did something wrong.

To set an ID or a listener, click on the component and go to the code section. Listeners are methods of the controller, generally starting with ``on...``. You can set in the code menu what method should be called if an event happens. `onAction` is the name of the event when a button is clicked/pressed.

### Context Menu

It's a popup shown when using left-click. You must add one on the list view of users. But on Windows, your scene builder may crash, so you need to create the menu somewhere else then copy and paste the code inside your context menu directly in the fxml.

### Tooltip

If you can't add tooltips, add them directly in the fxml

```xml!
<?import javafx.scene.control.Tooltip?>
```

```xml!
<Button>
<tooltip>
<Tooltip text="message" />
</tooltip></Button>
```