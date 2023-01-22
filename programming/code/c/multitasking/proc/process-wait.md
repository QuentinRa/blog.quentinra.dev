# Processes : wait

[Go back](../../../__old/c)

### Exploiting status and waitpid

**Note** : you may pass this section unless
you need right now to use status.

Return child process pid or `-1`.  `status` will be described
bellow and ``options`` are rarely used be you may have
to use them is you want a particular behaviour for your ``wait``.

``pid`` of waitpid can be

* ``x < -1`` : any child whose group ID is equals to the absolute value of `x`
* ``-1`` : any child
* ``0`` : any child of the same group
* ``x > 0`` : any process having `x` as `pid`