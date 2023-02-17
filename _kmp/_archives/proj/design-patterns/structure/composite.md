# Composite

[Go back](..)

This pattern is exploiting `Liskov substitution principle` meaning a child-class can be viewed as a parent class.

We will create a class ``parent`` with a method such as ``get...``.  Then we will have `children` extending our `parent` class and implementing this or these methods. Usually, one child does some recursive work because he got an attribute having the type of the parent class, and he calls the method on it. And the other one simply returns a value.

* ✅ : generic, easy to ask for an information
* 🚫 : ???

<hr class="sl">

## Example in Java

We got some components that can be either a file or a folder (we can have others folders or files inside). We want to count the number of files.

```java
public interface Component {
    // nombre de fichiers
    int getFileCount();
}

public class File implements Component {
    // a file count for one file
    @Override
    public int getFileCount() { return 1; }
}

public class Folder implements Component {
    // all files
    private final ArrayList<Component> content;

    // creates
    public Folder(Component ... content) {
        this.content = new ArrayList<>();
        this.content.addAll(Arrays.asList(content));
    }

    @Override
    public int getFileCount() {
        int count = 0;
        // ask for each component, getFileCount
        for (Component c:this.content) {
            count += c.getFileCount();
        }
        return count;
    }
}

public class Main {
    public static void main(String[] args) {
        int c = new Folder(
                new File(),
                new Folder(
                        new File(),
                        new Folder(),
                        new Folder(),
                        new Folder(),
                        new File()
                ),
                new File()
        ).getFileCount();
        System.out.println("Count:"+c);
    }
}
```