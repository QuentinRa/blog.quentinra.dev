# Fixing data

[Go back](discovery.md)

Sometimes, you are also handling data with mistakes.
For instance, someone wrote "Fr" while another
wrote "Fr" while another wrote "France" while another
wrote "Frence"... All of them are representing the
same thing and you see to fix that so that R will
understand.

```r
library('forcats')
fct_collapse(data, "col" = c("Fr","FR", "France", "Frence"))
# another less stupid example
fct_collapse(data, "col" = c("Firefox","mozilla", "Mozilla"))
```