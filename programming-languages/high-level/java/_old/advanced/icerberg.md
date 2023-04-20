# Iceberg paradigm

[Go back](../../index.md#advanced)

Java is realizing the **iceberg paradigm**, or a least giving you the keys to implements it.

When you are declaring attributes, you should make them `private` or `protected`. You will use `methods` to get or set the value of your attribute.

By doing so, you can easily replace the code of the method, remove an attribute, ... You are using the **iceberg paradigm**! The idea is to make methods the only interaction between your class and the outside.