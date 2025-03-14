# Godot (pentesting)

[![godot_0_protection](../../_badges/rootme/cracking/godot_0_protection.svg)](https://www.root-me.org/en/Challenges/Cracking/Godot-0-protection)
[![godot_0_protection](../../_badges/rootme/cracking/godot_bytecode.svg)](https://www.root-me.org/en/Challenges/Cracking/Godot-Bytecode)
[![godot_0_protection](../../_badges/rootme/cracking/godot_mono.svg)](https://www.root-me.org/en/Challenges/Cracking/Godot-Mono)

<div class="row row-cols-lg-2"><div>

[Godot](https://github.com/godotengine/godot) is an open-source game engine. It supports 2D and 3D, and can compile binaries to Windows, Linux, macOS, Android, etc.

* [GitHub](https://github.com/godotengine/godot) <small>(95.1k ⭐)</small>
* 📚 It uses the GDScript scripting languages
* 📚 It supports C# scripts too
</div><div>

We can use [Godot RE Tools](https://github.com/bruvzg/gdsdecomp/) <small>(1.9k ⭐)</small> to reverse GDScripts, and extract assets such as images or DLL files.

```ps
# Download RE Tools v0.6.2
$ wget https://github.com/bruvzg/gdsdecomp/releases/download/v0.6.2/GDRE_tools-v0.6.2-linux.zip
$ unzip "GDRE_tools-v0.6.2-linux.zip"
$ chmod +x gdre_tools.x86_64
$ ./gdre_tools.x86_64
```

Use `RE Tools > Recover Project` and select the files to recover.
</div></div>