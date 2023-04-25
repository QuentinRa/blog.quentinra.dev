# Javadoc

<div class="row row-cols-md-2"><div>

The Javadoc is **java documentation engine** ✍️. Developers will write javadoc comments inside their code, and using the `javadoc` command, a website will be generated 🌍.

Aside from versions before 11, you can change the number in the URL to access the Javadoc for another version of Java at:

* [Java 8](https://docs.oracle.com/javase/8/docs/api/overview-summary.html) <small>(previous LTS)</small>
* [Java 11](https://docs.oracle.com/en/java/javase/11/docs/api/index.html) <small>(previous LTS)</small>
* [Java 17](https://docs.oracle.com/en/java/javase/17/docs/api/index.html) <small>(LTS)</small>
* [Java 20](https://docs.oracle.com/en/java/javase/20/docs/api/index.html) <small>(latest)</small>

</div><div>

❌ Don't write meaningless documentation.

* the type of an argument for primitive types <small>(for objects, it's ~OK)</small>
* a trivial getter/setter/constructor

✅ Write useful stuff such as:

* ranges, intervals, preconditions <small>(not null...)</small>
* exceptions
* post-conditions <small>(null->null, not null->not null...)</small>
* examples of calling a class/method/...
* ...
</div></div>