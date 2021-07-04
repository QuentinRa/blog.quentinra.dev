# Preferences / Properties

[Go back](..)

Properties and preferences are two ways of storing
data easily in Java. You will a see a lot of
files ``.properties`` when working with Java
project like ``gradle.properties`` but personally
I'm enjoying working with Preferences.

<hr class="sr">

## Preferences

Like the name implies, preferences should be used
to save the preferences of the user according to
an application.

```java
import java.util.prefs.Preferences;
```

Notice the **xxx.class**, that's a class of your project used
to separate the preferences for all application and the
preferences only for this application.

```java
final Preferences preferences = Preferences.userNodeForPackage(xxx.class);
// save a value for a key
preferences.put("key", value);
// format is ("key", default)
Object stored = preferences.get("key", null);
``` 