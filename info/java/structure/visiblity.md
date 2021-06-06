# Visibility

[Go back](..)

In java, you got 4 mode

* ``public``
* ``protected``
* ``private``
* ``<none>`` (called package and default visibility mode) 

**public** means that **everyone** can see, use/call
this property (method/attribute).

**private** means that **only your class** can see, use/call
this property (method/attribute).

**protected** means that **only your class, only
the children of your class, and those in the same
package=folder** can see, use/call
this property (method/attribute).

**package** means that **your class and the one
is the same folder=package** can see, use/call
this property (method/attribute).

### In a nutshell

Here a recap for each visibility, who can see elements
declared with this visibility.

<table class="table table-bordered table-striped">
	<tr>
		<th></th>
		<th>the class</th>
		<th>the classes in the same package=folder</th>
		<th>the classes inheriting this class</th>
		<th>anyone else</th>
	</tr>
	<tr>
		<th>public</th>
		<td>+</td>
		<td>+</td>
		<td>+</td>
		<td>+</td>
	</tr>
	<tr>
		<th>protected</th>
		<td>+</td>
		<td>+</td>
		<td>+</td>
		<td></td>
	</tr>
	<tr>
		<th>package</th>
		<td>+</td>
		<td>+</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>private</th>
		<td>+</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>

For instance, something declared protected can be
accessed by

* the declaring class
* the classes in the same folder
* and the classes inheriting of your class