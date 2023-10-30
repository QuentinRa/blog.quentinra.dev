# R programming

* [Matrix](syntax/types/matrix.md)
* [Lists](syntax/types/lists.md)
* [Functions](syntax/functions.md)

<table class="table border-dark table-bordered table-striped">
<tr><td>

You will use this a lot, you can **see the help for a function** with `?my_function`
* examples with `examples(my_function)`
* args with `args(my_function)`
* source code with `body(my_function)`
</td></tr>
<tr><td>
Open the documentation either in your IDE or your browser with <code>help.start()</code>.
</td></tr>
<tr><td>
Either look for or load a dataset with <code>data()/data('dataset')</code>.
</td></tr>
<tr><td>
In R, when you are making a generalization of something, you usually name it <code>name.generalization_name</code>. For instance, if you got a vector of numbers <code>data$numbers</code>, then you would have <code>data$numbers.pos</code>. Same for functions like <code>mean</code>, <code>mean.test</code>,
...
</td></tr>
</table>

<hr class="sl">

## Advanced notes

Here you can find some notes about functions that you might use (mainly in statistics).

* [Environment](utils/environment.md)
* [Files](utils/files.md)
* [Maths](utils/math.md)
* [Plots](utils/plot.md)

<hr class="sr">

## Updating R

* Windows

```r
if(!require(installr)) {
  install.packages("installr"); 
  require(installr)
}
updateR()
```

* Linux/MacOs

```r
list <- as.data.frame(installed.packages(.libPaths()[1]), stringsAsFactors = F)
install.packages(list$Package)
```