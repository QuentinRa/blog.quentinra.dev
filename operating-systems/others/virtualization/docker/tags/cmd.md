# CMD

[Go back](../../../../_kmp/_archives/tools/docker#most-used-instructions)

Run a command when the image is started. **You may only have one per container**. The syntax is

```dockerfile
CMD command
# or
CMD "command1;command2;..."
# or
CMD ["command","arg1","arg2"]
```

With `command`, a command in the image's language. You could use it to start a program etc.

<hr class="sl">

## Example

```dockerfile
# run my_prog when image is started
CMD ["./bin/my_prog"]
```