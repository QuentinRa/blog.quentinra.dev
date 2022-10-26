# Exploit Windows

<hr class="sl">

## Knowledge about Windows

<div class="row row-cols-md-2"><div>

**File system**

...
</div><div>

**Users**

* `Administrator`: manage users, apps, groups, system-wide settings...
* `Standard User`: can use apps, can access their files

**Permissions**

...
</div></div>


<hr class="sr">

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
* `systeminfo`: see infos about the system
* `Get-ChildItem -Path Env:`: see environment variables
* `$Env:windir`: print the value of one environment variable
* `$Env:xxx = 'yyy'`: set an environment variable

Infos on a Local Machine

* `Get-LocalGroup`: list groups (users, administrators...)
* `Get-LocalUser`:list users
* `net localgroup users`:list users in the group "users"
* `net localgroup administrators`: list administrators
* `net user username`: infos about an user
</div></div>

<hr class="sl">

## Windows environment

*Note that you may be able to use Linux paths such as `/` instead of `c:\\`.*

<div class="row row-cols-md-2"><div>

**Look for (sensitive?) information** 🔑

* `cd /`: the root, maybe you will find something interesting?
* `/Users`: usually, each folder is associated with a user
  * `/Users/xxx/Desktop`
  * `/Users/xxx/Documents`
  * You should also check the trash-box
  * Check browser history / credentials...
* Maybe check `%appdata%`

<br>

**Windows files** <small>(it may not be `/Windows`, see `$Env:windir`)</small>

* in a file explore, enter `%windir%`
* `cd /Windows/System32/config/`: this may be a location for the **Security Account Manager** (**SAM**) database file is stored. This file is used to store users, their passwords, their groups...
</div><div>

**Windows services** <small>(usually use "Win✖️R" to open one)</small>:

* `lusrmgr.msc`: list of users/groups
* `lsass` is responsible for authentication within Windows. There is [mimikatz/kiwi](https://github.com/gentilkiwi/mimikatz) (16.2k ⭐) to extract passwords from the memory. For instance, if there is a task running belonging to a user, even if they are not logged in, we can get their password.

<br>

**Random**

* Kerberos is the authentication system in Windows domains.

</div></div>