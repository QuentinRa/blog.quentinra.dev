# CMD

> Run a command when image is started
> Only one per container

Syntax is like

```none
CMD command
or
CMD "command1;command2;..."
or
CMD ["command","arg1","arg2"]
```

* ``command`` : a command, is the os-image-specific
  language

**Exemples**

```dockerfile
# run my_prog when image is started
CMD ["./bin/my_prog"]
```