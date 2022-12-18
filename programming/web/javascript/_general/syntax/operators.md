# Operators

[Go back](../index.md#basic-syntax)

Every usual operator is available, but you should be careful when checking the equality as we got two operators which are working differently (strict/non-strict comparison).

* `=` (assignation)
* `+`, `-`, `*`, `/` 
* `>`, `<`, `<=`, `>=`
* `^` (modulo), `**` (exponentiation/power)
* `+=`/`-=`/... (`a+=b` is the same as `a=a+b`)
* `var++` (var+=1), `var--` (var-=1)
* `&&` (and), `||` (or), `!` (not)
* `+` (concatenation)

As for testing the equality

* `5 == "5"`: **true**, non-strict comparison (value is the same)
* `5 === "5"`: **false**, strict comparison (type+value must be the same)
* `5 != "5"`: **false**, non-strict comparison (value is different)
* `5 !== "5"`: **true**, strict comparison (type or value are different)