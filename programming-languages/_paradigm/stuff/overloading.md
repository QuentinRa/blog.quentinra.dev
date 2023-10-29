# Function Overloading

<div class="row row-cols-lg-2"><div>

Function overloading in the traditional sense refers to a feature allowing multiple functions to have the **same name**, but with different parameter lists <small>(more or fewer arguments, different types...)</small>.

* ⚠️ The name of the arguments is ignored
* ⚠️ The return type is ignored
* Some languages may have different constraints

Some languages allow a **non-traditional** overload, where the last declared function with the same name overrides all previous ones.
</div><div>

```c
int xxx();                     // ✅
int xxx(String xxx);           // ✅
int xxx(String yyy);           // ❌ conflict with 2
int xxx(String xxx, int yyy);  // ✅
int xxx(int xxx, String xxx);  // ✅
float xxx(String xxx);         // ❌ conflict with 2
float xxx(int xxx);            // ⚠️ may not be accepted
```
</div></div>