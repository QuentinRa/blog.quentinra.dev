# Composite Design Pattern

[Go back](../index.md#structural-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: The composite is used to handle in a uniform way both components and groups of components.

For instance, 

* A file (component) and a folder (group)
* A leaf (component) and a branch (group)
* ...

Each group can contain other groups and/or components. 
</div><div>

**Advantages** ✅

* Generic and uniform

**Disadvantages** 🚫

* ???

**Notes** 📝

* This pattern relies heavily on [Polymorphism](/programming-languages/_paradigm/oo.md#content-polymorphism)
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-md-2 mt-4"><div>

```java
// Component (Abstract Class)
public interface FileSystemComponent {
    void getFileCount();
}
```

```java
// Leaf (File)
public class File implements FileSystemComponent {
    @Override
    public int getFileCount() {
        return 1;
    }
}
```

```java
// Composite (Folder)
public class Folder implements FileSystemComponent {
    private final List<FileSystemComponent> children = new ArrayList<>();
    public Folder(String name) {}

    public void addChildren(FileSystemComponent child) {
        children.add(child);
    }

    @Override
    public int getFileCount() {
        int count = 0;
        for (FileSystemComponent component : children) {
            count += component.getFileCount();
        }
        return count;
    }
}
```
</div><div>

```java
public class Main {
    public static void main(String[] args) {
        // Creating files
        File file1 = new File("file1.txt");
        File file2 = new File("file2.txt");
        File file3 = new File("file3.txt");

        // Creating folders
        Folder rootFolder = new Folder("Root");
        Folder subFolder = new Folder("Subfolder");

        // Adding files and subfolder to the root folder
        rootFolder.addChildren(file1);
        rootFolder.addChildren(file2);
        rootFolder.addChildren(subFolder);

        // Adding a file to the subfolder
        subFolder.addChildren(file3);

        // Count files
        System.out.println("Total Files: " + rootFolder.getFileCount());
    }
}
```
</div></div>