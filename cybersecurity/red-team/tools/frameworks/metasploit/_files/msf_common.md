# Common meterpreter commands - msfconsole

[Go back](../index.md#meterpreter)

<div class="row row-cols-lg-2"><div>

#### Linux-like commands

You can use many Linux-like commands such as:

```shell!
meterpreter> ls # list files
meterpreter> cd # move
meterpreter> pwd # path to current folder
meterpreter> cat file # print file
meterpreter> edit file # open file in vim
meterpreter> ps # see running processes
meterpreter> exit
```

#### Local commands

You can run commands on your machine in the meterpreter:

```shell!
meterpreter> lpwd # or getlwd, local path
meterpreter> lcd path # move to local path
meterpreter> lls path # list local files
meterpreter> lcat file # print local file
```
</div><div>

#### Common utilities

These are new convenient functions that were added:

```shell!
meterpreter> search -f pattern # search file by pattern
meterpreter> search -f pattern / # search inside /
meterpreter> download remote_path local_path # download
meterpreter> upload local_path remote_path # upload
```
</div></div>