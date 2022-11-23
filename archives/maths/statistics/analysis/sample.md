# Sample

[Go back](discovery.md)

Most of the time, you won't do your research on
the whole data. You are picking a part called a sample,
and you will work on it. You will have the data used to

* learn the model (=learning sample,
  most likely something like 75%-80% of your data)
* validate the model (=validation sample,
  the 25%-20% remaining)

**Warning**: you would randomly pick the elements
of your sample (independent and identically distributed
"i.i.d"). In R, you must use the sample function.
