# Files

[Go back](../index.md)

This is a list of all file-related functions. They are supposed to work the same on any OS, like Java was supposed to be.

<hr class="sl">

You may use them to move from a directory to another (`cd`/`ls`)

* `getwd()`: equivalent of Linux command `pwd`, returns current directory
* `sedwd(path)`: equivalent of Linux command `cd path`, change the current directory
* `dir()/list.files()`: equivalent of Linux command `ls .`, list the current directory files

<hr class="sl">

## Read a file

* `read.csv('path')`: read a csv, separated by commas (,)
* `read.csv2('path')`: read a csv, separated by semicolons (;)
* `source(path)`: run an R file (path can be a URL)
* `cat(path, sep = '\n')`: print a file
* `readLines(path)`: read a file

If you are doing this in statistics, then beware. By default, a string is considered as a quantitative variable even if it's "yes"/"no" so you may have to add the parameter "stringsAsFactors=TRUE" or manually convert the variables.

Note that you can replace "read" in all functions above by "write" and get the write function (aside from cat, where you have to add the argument "file").

<hr class="sr">

## Other functions

* `file.path(folder, folder, ...)`: create a path (`/` Linux, `\` Windows)
* `dir.create(path)`: create folder 
* `file.create(path)`: create file
* `file.exists(path)`: true if the file exists
* `file.info(path)`: returns file information
* `file.copy(path,new_path)`: copy file
* `file.rename(path,new_path)`: rename file