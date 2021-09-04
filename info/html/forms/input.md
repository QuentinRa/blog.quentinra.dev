# Learning about form input fields

[Go back](../index.md#forms)

This is most likely the kind of field you will use the most, as it can be transformed according to the value inside "type" (checkbox, radio, ...).

* **name**: it's the name that will be used server-side to get the value of a field. Don't add one if you don't want the data of a field to be submitted.
* **type**: that's the type of your field like
    * **text**
    * date
    * **password**
    * tel
    * range
    * **checkbox**
    * **radio**
    * number
* **placeholder**: put a default value that will be removed when the user writes something
* **value**: you can set a value

<hr class="sr">

## Examples

<table class="table border-dark table-bordered table-striped">
<thead>
<tr>
<th>Description</th>
<th>Code</th>
<th>Preview</th>
</tr>
</thead>
<tbody>

<!-- Text -->
<tr>
<td>Text</td>
<td>
&lt;input name="name" type="text" value="" placeholder="John Doe" />
</td>
<td>
<input name="name" type="text" value="" placeholder="John Doe" />
</td>
</tr>

<!-- Password -->
<tr>
<td>Password<br>Show dots instead of the real value.</td>
<td>
&lt;input name="password" type="password" value="John Doe" />
</td>
<td>
<input name="password" type="password" value="John Doe" placeholder="" />
</td>
</tr>

<!-- Email -->
<tr>
<td>Email<br>Check that we have at least "a@b.c".</td>
<td>
&lt;input name="password" type="email" value="" placeholder="john@doe.tld" />
</td>
<td>
<input name="password" type="email" value="" placeholder="john@doe.tld" />
</td>
</tr>

<!-- Date -->
<tr>
<td>Date</td>
<td>
&lt;input name="date" type="date" />
</td>
<td>
<input name="date" type="date" />
</td>
</tr>

<!-- Range -->
<tr>
<td>Range</td>
<td>
&lt;input name="range" type="range" />
</td>
<td>
<input name="range" type="range" />
</td>
</tr>

<!-- Checkbox -->
<tr>
<td>Checkbox</td>
<td>
&lt;input name="pp" type="checkbox" checked />
</td>
<td>
<input name="pp" type="checkbox" checked />
</td>
</tr>

<!-- Radio -->
<tr>
<td>Radio</td>
<td>
Alice? &lt;br><br>
&lt;label for="yes">yes?&lt;/label><br>
&lt;input name="alice" id="yes" name="yes" type="radio" /><br>
&lt;label for="no">no!&lt;/label><br>
&lt;input name="alice" id="no" name="no" type="radio" />
</td>
<td>
Alice? <br>
<label for="yes">yes?</label>
<input name="alice" id="yes" name="yes" type="radio" />
<label for="no">no!</label>
<input name="alice" id="no" name="no" type="radio" />
</td>
</tr>

</tbody>
</table>