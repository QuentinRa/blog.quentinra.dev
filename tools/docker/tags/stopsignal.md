# STOPSIGNAL

[Go back](..)

> When you make ``CTRL-C`` you send
> a signal to docker to die, the code is 9.
> 
> You can change that here.

Syntax is like

```none
STOPSIGNAL code
```

* ``code`` : a signal code
    * the man
      might help you 
      [man 7 signal](https://www.man7.org/linux/man-pages/man7/signal.7.html)
      since at least all the codes are in it (1-31)
    * [list of signals](https://unix.stackexchange.com/questions/317492/list-of-kill-signals)
    * [signals](https://unix.stackexchange.com/questions/6332/what-causes-various-signals-to-be-sent)