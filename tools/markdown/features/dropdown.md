# Dropdown

[Go back](..#html-in-markdown)

You can make a dropdown like this

<details class="p-3 mb-3 border border-dark">
<summary>Click here</summary>
Content
</details>

with this code (I added the border)

```html
<details>
<summary>Click here</summary>
Content
</details>
```

<hr class="sl">

## Open by default

You can make it open by default

<details open class="p-3 mb-3 border border-dark">
<summary>Click here</summary>
Content
</details>

with this code (I added the border)

```html
<details>
<summary>Click here</summary>
Content
</details>
```

<hr class="sr">

## Example

You can look at this amazing example that [I found here](https://gist.github.com/ImminentFate/931bd780de7fb2aecc376e7af446c5df),
which I modified a bit.

<blockquote>
<table><tbody><tr></tr><tr><td>
<details>
<summary><span><b>Click here to see the answer</b></span>

<h6>Could you guess what's this code doing?</h6>

```java
public class Math {
    private static final float value = 2.0;
    public static float increaseN(float n){ return n + value; }
}
```
</summary><hr>
<h6>Answer</h6>

It's not working! **2.0** is a double not a float! But increase n
is working properly and return n plus the value 2.
</details></td></tr></tbody>
</table>
</blockquote>

The corresponding code is

<pre><code class="language-html"
>&lt;blockquote&gt;
&lt;table&gt;&lt;tbody&gt;&lt;tr&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;
&lt;details&gt;
&lt;summary&gt;&lt;span&gt;&lt;b&gt;Click here to see the answer&lt;/b&gt;&lt;/span&gt;

&lt;h6&gt;Could you guess what's this code doing?&lt;/h6&gt;

```java
public class Math {
    private static final float value = 2.0;
    public static float increaseN(float n){ return n + value; }
}
```
&lt;/summary&gt;&lt;hr&gt;
&lt;h6&gt;Answer&lt;/h6&gt;

It's not working! **2.0** is a double not a float! But increase n
is working properly and return n plus the value 2.
&lt;/details&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;
&lt;/table&gt;
&lt;/blockquote&gt;</code></pre>