# Structures

[Go back](..)

You will only use this one, the if statement.

```ocaml
if (condition) then a_value else another_value
```

Did you notice? the then and else must be evaluated as
a value! Giving something like that

```ocaml
if (condition) then 5 else 7
```

Of course, since an expression is evaluated as a value,
you can put a statement inside (function call, ...).

```ocaml
if (condition) then 
  if (condition) then 5
  else 7
else 2
```

Please take note

* else is **required**
* a_value and another_value must have the same **type**

<div class="sl"></div>

**Don't make a fool of yourself, do not write**

```ocaml
if (condition) then true else false
```

since the condition is already a boolean and you will trigger
most of the experienced guys.

<div class="sr"></div>

You **mustn't use that** (not joking, it's not functional)
but here you go.

```ocaml
for i = startval to endval do
	
done

while condition do
	
done
```