# Prototype

[Go back](..)

If creating an object is costly, then clone it and modify the cloned one. Be careful about the depth of the copy.

* ➡️ : no example
* ✅ : easy creation
* 🚫 : depth of the copy (problems with references)

<hr class="sl">

## Example in Java

May this code help, that's an example of using the clone method in Java

```java
public class CompteBancaire {
    @Override // donnons des frayeurs aux banquiers x)
    // on remplace bien protected par public, clone est protected par défaut
    public Object clone() {
        CompteBancaire compte = null;
        try {
            Object clone = super.clone();
            if(clone instanceof CompteBancaire){
                compte = (CompteBancaire) clone;
                // modifiez les attributs
                // ...
            } else throw new CloneNotSupportedException();
        } catch (CloneNotSupportedException e) {
            // prévoyez un comportement alternatif
        }
        return compte;
    }
}
```