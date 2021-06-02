# TP TCHAT

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