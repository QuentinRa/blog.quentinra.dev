# Web Assembly

<div class="row row-cols-lg-2"><div>

WebAssembly is a binary instruction format that is supported by all major web browsers. It allows developers to write a part if not all of their application in languages such as C, C++, or Rust.

WebAssembly applications are intended to be fast and efficient.

* 🤖 **Binary Format** (.wasm): syntax similar to assembly
* 🧑 **Text Format** (.wat): human-readable assembly modules

From your web browser debugger, you can extract the WAT code.
</div><div>

We can use the [wabt](https://github.com/WebAssembly/wabt) <small>(7.2k ⭐)</small> project to process web assembly files.

```shell!
$ docker build . -t wabt:latest           # Dockerfile below
$ alias wabt='docker run --rm -v $(pwd):/tmp wabt'
$ wabt wat2wasm dummy.wat -o dummy.wasm   # WAT to WASM
$ wabt wasm-objdump dummy.wasm -x         # objdump -x
$ wabt dummy.wasm -o dummy2.wat           # WASM to WAT
$ wabt wasm2c dummy.wasm -o dummy.c       # C code
$ wabt wasm-decompile dummy.wasm -o dummy # C-like code
```

<details class="details-n">
<summary>WABT Dockerfile</summary>

```dockerfile!
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    git cmake clang python3 ninja-build

RUN git clone --recursive https://github.com/WebAssembly/wabt.git
WORKDIR /wabt
RUN git submodule update --init && \
    mkdir build && cd build && \
    cmake -GNinja -DCMAKE_BUILD_TYPE=Release .. && \
    ninja && ninja install
	
RUN useradd -ms /usr/sbin/nologin wabt
USER wabt
WORKDIR /tmp
```
</details>
</div></div>