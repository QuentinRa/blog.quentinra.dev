# Composite

[Go back](..)

This pattern is exploiting ``Liskov substitution principe`` meaning a child-class
can be viewed as a parent class.

We will create a class ``parent`` with a method such as
``get...``. Then we will have `children` extending our `parent` class
and implementing this or theses methods. Usually of child do some recursive
work meaning that he got a attribute with the type of the parent class. And
the other one simply returns a value.

* ✅ : generic, easy to ask for an information
* 🚫 : ???

## Example in java

We got some component that can be either a file or a folder (meaning
we can have others folder or files inside). We want to count the number
of files.

```java
public interface Component {
    // nombre de fichiers
    int getFileCount();
}

public class File implements Component {
    // file count for one file
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

public class Test {
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