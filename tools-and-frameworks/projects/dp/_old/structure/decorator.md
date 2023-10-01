# Decorator

[Go back](..)

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