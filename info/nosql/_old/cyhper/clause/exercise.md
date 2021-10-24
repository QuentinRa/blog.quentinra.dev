# Exercises

[Go back](..)

You should remember that we are using
[this](../movies.cypher) database for this
course.

<hr class="sr">

Which movies ``Meg Ryan`` acted in?

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (m:Movie)<-[:ACTED_IN]-(:ShowbizPerson{name: "Meg Ryan"})
RETURN DISTINCT m.title</code></pre>
</blockquote>

<hr class="sl">

Who directed the movie ``The Matrix``?

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (:Movie{ title: "The Matrix"})-[:DIRECTED]-(s:ShowbizPerson)
RETURN s.name</code></pre>
</blockquote>

<hr class="sr">

Movies release between 1990-2000 (included)?

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (m:Movie)
WHERE m.released>=1990 AND m.released<=2000
RETURN m.title</code></pre>
</blockquote>

<hr class="sl">

Which actor played in a movie with Tom Cruise?

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (s:ShowbizPerson)-[:ACTED_IN]->(:Movie)<-[:ACTED_IN]-(:ShowbizPerson{name: "Tom Cruise"})
RETURN DISTINCT s.name</code></pre>

We should add DISTINCT because an actor may have played
in a movie with Tom Cruise more than once.
</blockquote>

<hr class="sr">

Who both wrote and produced the same movie?

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie)<-[:PRODUCED]-(p:ShowbizPerson)
WHERE w.name = p.name
RETURN DISTINCT w.name</code></pre>
</blockquote>

<hr class="sl">

How many wrote or produced a movie?

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (p:ShowbizPerson)-[r:WROTE|PRODUCED]->(:Movie)
RETURN DISTINCT count(p)</code></pre>
</blockquote>

<hr class="sr">

Persons directly linked with "Kevin Bacon".

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (:ShowbizPerson{name: "Kevin Bacon"})--(p:ShowbizPerson)
RETURN DISTINCT p</code></pre>

Alternative answer (too hard)

<pre><code class="language-sql"
>MATCH p=shortestPath((:b{name:"Kevin Bacon"})-[*1..2]-(c))
WHERE c.name <> "Kevin Bacon"
WITH collect(c.name) AS names
RETURN names</code></pre>
</blockquote>

<hr class="sl">

Persons indirectly linked with "Kevin Bacon".

<blockquote class="spoiler">
<pre><code class="language-sql"
>MATCH (:ShowbizPerson{name: "Kevin Bacon"})--()--(p:ShowbizPerson)
RETURN DISTINCT p.name</code></pre>

Alternative answer (too hard)

<pre><code class="language-sql"
>MATCH p=shortestPath((:b{name:"Kevin Bacon"})-[*1..2]-(c))
WHERE c.name <> "Kevin Bacon"
WITH collect(c.name) AS names
MATCH (a) WHERE NOT a.name in names
WITH collect(a.name) AS cnames
RETURN cnames</code></pre>
</blockquote>