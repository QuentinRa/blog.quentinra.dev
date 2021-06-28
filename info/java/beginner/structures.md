# Structures

[Go back](..)

Please take note that in Java, a condition must be either
true or false. Values such as 1 or 0 are not working since
they are not true nor false.

```java
boolean cond = ...; // some value here
```

Also please take note that in a loop, you can use these two
keywords

* **break**: ends **one** loop
* **continue**: skip all following statements and go to the next
loop turn.

<div class="sr"></div>

```java
if(cond){}
if(cond){} else {}
if(cond){} else if {}
if(cond){} else if {} else {}
```

Or some inline version ``ìnt v = cond? 5 : 7;`` for instance
where the syntax is ``cond?if_true:if_value``.

<div class="sl"></div>

```java
for(int i=0; i < ... ; i++){}
```

<div class="sr"></div>

```java
while (cond) {}
```

<div class="sl"></div>

```java
do { } while(cond);
```

<div class="sr"></div>

Here a new one, the foreach

```java
for (Integer e: new Integer[]{5,6,7}) {
    // some code
    // e=5 then e=6 then e=7
}
```

<div class="sl"></div>

Then the switch case

```java
switch (x){
    case value1:
        // ...
        break;
    case value2 : /* ... */ break;
    default :  /* ... */ break;
}
```

Here is the enhanced switch

```java
switch (x){
    // a bloc
    case v1 -> {
        System.out.println("1st branch");
    }
    // one line
     case v2, v3, v4 -> System.out.println("2nd branch");
    // default
    default -> System.out.println("other");
}
```

You could also make something like that

```java
String result = switch (s) {
    case "0", "1" -> "yes/no";
    default -> {
        for (int i = 2; i < 5; i++) {
            if (s.equals(i+""))
                yield s;
        }
        yield "";
    }
};
```