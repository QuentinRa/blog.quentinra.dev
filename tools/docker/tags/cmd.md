# CMD

[Go back](..#most-used-instructions)

Run a command when the image is started.
**You may only have one per container**.
The syntax is

```dockerfile
CMD command
# or
CMD "command1;command2;..."
# or
CMD ["command","arg1","arg2"]
```

with ``command``, a command in the os-image-specific
language. You could use it to start a program etc.

<hr class="sl">

## Example

```dockerfile
# run my_prog when image is started
CMD ["./bin/my_prog"]
```