# Prototype

[Go back](..)

If you need a lot of work creating an object, then clone it
and modify the cloned one. Be careful about the depth of the copy.

* ➡️ : no example
* ✅ : easy creation
* 🚫 : depth of the copy (problems with references)

## Example in java

May this code help, that's an example of using clone method in java

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