# Inheritance

[Go back](..)

...

<div class="sr"></div>

## Example

We will create an ancestor class ``Person`` (or superclass)

```java
public class Person {

    private final String name;

    protected Person(String name){
        this.name = name;
    }

    // can only be used by inheritor
    protected String getName() { return name; }
}
```

And one inheritor, CEO.

```java
public class CEO extends Person {
    private final String company;

    public CEO(String name, String company) {
        super(name); // call to parent constructor
        this.company = company;
    }

    // set to public
    @Override
    public String getName() { return super.getName(); }
    public String getCompany() { return company; }
}
```