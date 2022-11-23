# Decorator

[Go back](..)

To put it simply, a decorator is a class taking another class as a parameter and adding some functions to it. You may not add functions and simply modify one, but when you see a class given in argument, then that may be a hint like ``new HTMLConverter(new Converter())``.

* ✅ : keep your ``extends`` slot (you got only one in Java)
* 🚫 : ???

<hr class="sl">

## Example in Java

May it be useful

```java
public class DriveFood implements Food {
    private final Food food;

    public DriveFood(Food food){ this.food = food; }

    @Override
    public int getPrice() {
        // increase price by seven (should be a final static but ****)
        return food.getPrice() + 3;
    }

    @Override
    public String getName() { return this.food.getName(); }
}

class Pizza implements Food {
    @Override
    public String getName() { return "Pizza"; }

    @Override
    public int getPrice() { return 7; }
}

interface Food {
    String getName();
    // returns food price
    int getPrice();

    default String print() { return "{ name:"+getName()+", price:"+getPrice()+" }"; };
}

class Test {
    public static void main(String[] args) {
        Pizza p = new Pizza();
        System.out.println(p.print()); //{ name:Pizza, price:7 }
        DriveFood f = new DriveFood(p);
        System.out.println(f.print()); // { name:Pizza, price:10 }
    }
}
```