# Protect a jar

[Go back](../index.md#expert)

What's obfuscating and could we do something better to prevent someone to reverse your code back to the Java code?

Well, first a `jar` is like an executable of your java code, you can run it with `java -jar jar-name` or create one with `jar cvf name.jar class class assets_folder ...`.

You may add a MANIFEST.MF in your jar describing it

* <https://docs.oracle.com/javase/tutorial/deployment/jar/build.html>
* <https://docs.oracle.com/javase/tutorial/deployment/jar/manifestindex.html>
* <https://docs.oracle.com/javase/tutorial/deployment/jar/defman.html>

But well once you got a jar, or someone else jar, you can try to find the JAVA source code. That's quite possible considering that the machine needs to understand your code so you can't really prevent this.

The most used tools are **Obfuscators** since they will rewrite your code using some fancy names, ... to make it less understandable even after the code got decompiled.

* [yguard](https://www.yworks.com/products/yguard)
* [proguard](https://github.com/Guardsquare/proguard)

But that's only something making things slower for the curious user, It won't really help. But some clever guys created a solution rewriting some part of Java and providing a new JRE (that's not really clever but that's the only way). 

* [protector4J](https://protector4j.com/)
* free trial for 7 days
* the protection is valid forever (unless it was made using trial version) even if your license expired
* you can ask for a reduction by mail for students