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

### In a nutshell :
<table>
	<tr>
		<th></th>
		<th>class</th>
		<th>package=folder</th>
		<th>children</th>
		<th>other</th>
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