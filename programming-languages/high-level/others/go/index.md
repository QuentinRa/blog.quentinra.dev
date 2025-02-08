# GoLang

<div class="row row-cols-lg-2"><div>

The [Go Programming Language](https://go.dev/) is a compiled high-level programming language designed at Google.

* [Open-Source Repository](https://github.com/golang/go) <small>(119.0k ⭐)</small>
* [GoLang User Manual](https://go.dev/doc/) <small>(🏫)</small>
* [GoLang Examples](https://golangexample.com/) <small>(⛪)</small>

```shell!
$ sudo apt install golang-go
$ echo "export PATH=$PATH:$(go env GOPATH)/bin" >> ~/.bashrc
```

You can install remote packages using:

```shell!
$ go install github.com/<user>/<repo>/cmd/<name>@version
```
</div><div>

Create a file `main.go` with the following:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello, Go!")
}
```
</div></div>

<hr class="sep-both">

## Go Language Basics

<div class="row row-cols-lg-2"><div>

#### Go Variables and Types

You can declare variables with `var`, and `:=`. Use `const` for constants. You can assign values when declaring a variable/constant or using `=`.

```go
const pi = 3.14        // declare + assign

var a int = 10         // declare + assign
b := true              // same
b = false              // assign, must have been declared ⚠️

var c [3]string        // declare
d := []int{42}         // declare + assign
```

📚 We use the keyword `nil` for an empty value.
</div><div>

#### Go Control-flow structures

Common control-flow structures are:

```go
if condition {} else {}

for i := 0; i < 5; i++ {}

switch value {
	case ...:
	    ...
	default:
		...
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [Go+](https://github.com/goplus/gop)
</div><div>
</div></div>