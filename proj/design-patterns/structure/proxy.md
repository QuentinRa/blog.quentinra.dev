# Proxy

[Go back](..)

A class having an attribute being another class and using this other class to implements some methods.

* ✅ : easy implementation, no extends
  * 🚫 : if you have too many methods to "proxy"

<hr class="sl">

## Example in Java

```java
import java.util.ArrayList;

public class Sac {
    private final ArrayList<Object> objects;

    public Sac(ArrayList<Object> objects){ this.objects = objects; }

    // proxy
    public boolean ajouter(Object o){ return this.objects.add(o); }
    public boolean remove(Object o){ return this.objects.remove(o); }
    public boolean contient(Object o){ return this.objects.contains(o); }
    // ...

}
```