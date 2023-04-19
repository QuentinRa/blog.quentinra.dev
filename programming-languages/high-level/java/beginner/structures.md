# Structures

[Go back](../index.md#beginner)

As usual, you will find most of the statement you could expect (if, for i, while, do while), and some new statements (or not) such as for each, switch (and ehanched switch) etc.

Please take note that in Java, a condition must be either true or false. Values such as 1 or 0 are not working (they would in C).

```java
boolean cond = ...; // some value here
```

Also please take note that in a loop, you can use these two keywords

* **break**: ends **one** loop
* **continue**: skip all following statements and go to the next loop turn.

<hr class="sr">

## if statement

```java
if(cond){}
if(cond){} else {}
if(cond){} else if {}
if(cond){} else if {} else {}

// inline
// cond?if_true:if_value
// example
ìnt v = cond? 5 : 7;
```

<hr class="sl">

## for i

```java
for(int i=0; i < ... ; i++){}
```

<hr class="sr">

## while

```java
while (cond) {}
```

<hr class="sl">

## do while

```java
do { } while(cond);
```

<hr class="sr">

## for each

Here a new one, the foreach

```java
for (Integer e: new Integer[]{5,6,7}) {
    // some code
    // e=5 then e=6 then e=7
}
```

<hr class="sl">

## switch

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

You could also make something like that (a stupid example, but you can see the word yield to return the value)

```java
String result = switch (s) {
	case "John", "Jane" -> "yes";
	default -> {
		int length = s.length();
		yield length % 2 == 0 ? "yes" : "no";
	}
};
```