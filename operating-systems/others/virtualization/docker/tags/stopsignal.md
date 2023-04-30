# STOPSIGNAL

[Go back](../../../../_kmp/_archives/tools/docker#most-used-instructions)

When you press `CTRL-C`, you send a signal "die" to docker, the signal code for `CTRL-C` is 9. You can change the code that will trigger "die" here.

```dockerfile
STOPSIGNAL code
```

With `code` a signal code. The man might help you [man 7 signal](https://www.man7.org/linux/man-pages/man7/signal.7.html) since at least all the codes are in it (1-31) but you may check
  * [list of signals](https://unix.stackexchange.com/questions/317492/list-of-kill-signals)
  * [signals](https://unix.stackexchange.com/questions/6332/what-causes-various-signals-to-be-sent)