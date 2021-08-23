# Sample discovery

[Go back](..)

Let's say `d = our data`. You could put any kind of data in `d` and I'm only using it for the sake of clarity, since these functions are not only working with our data.

<hr class="sr">

## 1. Check what you are manipulating

What are your variables? And what are their types/values?

* `str(d)`: variables types and first 10 values
* `summary(d)`: summary for each variable
* `describe(d)/brkdn(d)` from `library('pastecs')`: alternative to summary
* `describeBy(d)/stat.desc(d)` from `library('psych')`: alternative to summary
* `head(d)/tail(d)`: first/last 10 values
* `View(d)`: open in the graphical view
* `names(d)`: get variables names
* `dim(...)/length(...)`: check the length of your sample/variables
* `unique(...)/duplicated(...)`: are some values duplicated?

<hr class="sl">

## 2. Now clean and prepare your sample

Once you have at least some information

* [Dealing with NA values](na.md)
* [Converting variables](convert.md)
* [Extract the sample you will work with](sample.md)
* [Merging data](merge.md)
* [Fixing data](fix.md)
* you can also sort some variables with ``sort``