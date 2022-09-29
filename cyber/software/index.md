# Reverse Engineering

Try to analyse, and exploit programs by accessing the underlying code, which can help finding database credential, or stuff like that. Any program is converted to a binary (language machine) via the compiler. The goal of Reverse Engineering is to find the code that generated this binary file.

<hr class="sl">

## Assembly

![Level: Intermediate](https://img.shields.io/badge/level-Advanced-fae7b5)

One level above binary (010010...), we have a language called assembly which is basically written in instructions specific to a set of machines (Intel, ARM...). You need to use the appropriate tool according to the kind of application.

* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `radare2` to convert a binary in an assembly
* <i class="bi bi-info-square" style="background:#fae7b5"></i> Use `ILSpy`/`dotPeek` ❤️ to decompile .NET applications