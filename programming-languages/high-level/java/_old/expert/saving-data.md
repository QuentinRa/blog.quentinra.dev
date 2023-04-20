# Preferences / Properties

[Go back](../index.md#advanced)

Properties and preferences are two ways of storing data easily in Java. You will a see a lot of files `.properties` when working with Java project like `gradle.properties` but personally I'm enjoying working with Preferences.

<hr class="sr">

## Preferences

Like the name implies, preferences should be used to save the preferences of the user according to an application.

```java
import java.util.prefs.Preferences;
```

Notice the **xxx.class**, that's a class of your project used to separate the preferences for all application and the preferences only for this application.

```java
final Preferences preferences = Preferences.userNodeForPackage(xxx.class);
// save a value for a key
preferences.put("key", "value");
// format is ("key", default_if_not_found)
String stored = preferences.get("key", null);
``` 

See this great article [preferences-api](https://www.amitph.com/introduction-to-java-preferences-api/).

<hr class="sl">

## Properties

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