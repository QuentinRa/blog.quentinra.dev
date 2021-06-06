# Iceberg paradigm

[Go back](..)

Java is realising the **iceberg paradigm**, or a least giving
you key to realise it.

When you are declaring attributes, you should make them
``private`` or `protected`. You will use `methods`
to get or set the value or your attribute.

By doing so, you can easily replace the code of the method, remove
an attribute, ... You are using the **iceberg paradigm**! The idea
is making methods the only interaction between your class and the
outside.