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

import {
    "fmt"
}

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

// Arrays
var c [3]string        // declare
d := []int{42}         // declare + assign
append(d, 21)          // add a value

// Maps
m := map[string]int{
    "foo": 1,
    "bar": 2,
}
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

for endpoint := range endpoints {
    if _, found := known_endpoints[endpoint]; !found {
        // ...
    }
}
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-lg-2"><div>

Declaring a function is straightforward:

```go
func foo(bar string) string {
    return bar
}

// implicit syntax for (a int, b int)
func add(a, b int) int {
    return a + b
}
```

You can declare return variables directly in the signature:

```go
func add(a, b int) (c int) {
	c = a + b
	return
}
```
</div><div>

Multiple functions are returning a tuple with the error as the last parameter:

```go
func divide(a, b int) (int, error) {
    if b == 0 {
        return 0, fmt.Errorf("cannot divide by zero")
    }
    return a / b, nil
}

// handle the error
_, err := divide(1, 0)
if err != nil {
    log.Fatal(err.Error())
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