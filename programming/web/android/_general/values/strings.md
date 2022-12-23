# strings.xml

[Go back](../index.md#resources)

## Currency

<div class="row row-cols-md-2 mx-0"><div>

Given an amount (int), you can generate a string for a currency with

```kotlin
val amount = NumberFormat.getCurrencyInstance().format(1300.74)
```
</div><div>

* `$1,300.74` (USA, CA...)
* `£1,300.74` (UK)
* `1 300,74€` (FR)
* ...
</div></div>

<hr class="sr">

## Dates

<div class="row row-cols-md-2"><div>

```kotlin
val formatter = SimpleDateFormat("FORMAT", Locale.getDefault())
val calendar = Calendar.getInstance()
val xxx = formatter.format(calendar.time)
```
</div><div class="align-self-center">

See [SimpleDateFormat](https://developer.android.com/reference/java/text/SimpleDateFormat#date-and-time-patterns).

For instance: `ss`, "s" means "seconds", and because there are 2,  it means "use 2 digits" <small>(such as "01" instead of "1")</small>
</div></div>