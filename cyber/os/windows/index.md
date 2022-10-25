# Exploit Windows

<hr class="sl">

## Windows handy commands

<div class="row row-cols-md-2"><div>

Most Linux commands are available, although they are aliases to Windows commands

* `cd`: move to another folder
* `ls`: list files in a folder
* `pwd`: path to the current directory
* `cat`: print (usually small) files
* `find`: find a file/folder
* `wget`: download something
</div><div>

Learn more about your environment

* `whoami`: see your username, or `NT AUTHORITY\SYSTEM` (root)
* `hostname`: see hostname
* `net localgroup administrators`: see users, and if they are administrators or not.
</div></div>

<hr class="sr">

## Windows environment

*Note that you may be able to use Linux paths such as `/` instead of `c:\\`.*

<div class="row row-cols-md-2"><div>

**Look for (sensitive?) information** 🔑

* `cd /`: the root, maybe you will find something interesting?
* `cd /Users/path/to/Documents`: usual place to store documents
* `cd /Windows/System32/config/`: this may be a location for the **Security Account Manager** (**SAM**) database file is stored. This file is used to store users, their passwords, their groups...
</div><div>
</div></div>