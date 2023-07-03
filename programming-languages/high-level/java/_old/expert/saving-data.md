# Properties

Properties are files with the `.properties` extension.

````java
import java.util.Properties;
````

Then you could do

```java
// load the file
File file = new File(versionFile);
FileReader reader = new FileReader(file);

final Properties p = new Properties();
p.load(reader); // read the properties

// close after reading
reader.close();

// then we can get the values
String stored = p.getProperty("key", null);
```

And if you want to store something

```java
FileWriter writer = new FileWriter(file);
p.store(writer, "Some properties");
writer.close();
```