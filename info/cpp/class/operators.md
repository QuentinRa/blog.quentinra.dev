# Operators

[Go back](../index.md#structures-and-classes)

Every **operator** (+, +=, -, /=, <<, ...) is a **function**, and we **can overload them**. By default, you can't use them on your classes <small>(aside from the move operator "<<", and the copy assignment operator "=")</small>, so as there is **no default behavior**, you will have to **override those that you want to use**.

**You can't overload**

* `::` (scope resolution)
* `.` (dot operator, for structures/classes)
* `.*` (pointer to a member)
* `:` (ternary operator)
* `sizeof`, `typeid`, `static/dynamic/const/reinterpret cast`

> There is nothing official about external/internal operator, it's just of way of doing things. Every operator could be internal (resp. external) 😎.

<hr class="sl">

## Internal operators

We are considering internal operators, as operators that are applied on our instance. They are declared inside the class.

* `+=`, `-=`, `*=`, `/=`, `=`, `-` (ex: -1)
* `()` (const and not const), `[]` (const and not const)
* `<<`, `>>`
* ...

<details class="details-e">
<summary>HEADER 📚</summary>

```cpp
// main.hpp
#ifndef MAIN_HPP
#define MAIN_HPP

struct Fraction {
private:
	int numerator_;
	int denominator_;
public:
	Fraction(int numerator, int denominator = 1);
	
    Fraction operator-() const;
    Fraction operator+=( const Fraction& f1 );
    Fraction operator-=( const Fraction& f1 );
    Fraction operator*=( const Fraction& f1 );
	Fraction operator/=( const Fraction& f1 );
	Fraction& operator=(const Fraction & c);
}

#endif //MAIN_HPP
```
</details>

<details class="details-e">
<summary>SOURCE 📖</summary>

```cpp
// main.cpp
#include "main.hpp"

Fraction::Fraction(int numerator, int denominator) {
    numerator_ = numerator;
    denominator_ = denominator;
}

Fraction& Fraction::operator=(const Fraction & c) {
    if (&c != this) {
        this->numerator_ = c.numerator_;
        this->denominator_ = c.denominator_;
    }
    return *this;
}

Fraction Fraction::operator+=( const Fraction &f1 ) {
    return (*this) = (*this) + f1; 
}

Fraction Fraction::operator-=( const Fraction &f1 ) {
    return (*this) = (*this) - f1;
}

Fraction Fraction::operator*=( const Fraction &f1 ) {
    return (*this) = (*this) * f1;
}

Fraction Fraction::operator/=( const Fraction &f1 ) {
    return (*this) = (*this) / f1;
}
```
</details>

<hr class="sr">

## External operators

**We are considering internal operators, as operators that are applied on our instance and something else**. **They are declared outside the class**.

* `+` (ex: a + b), `-`, `*`, `=` 
* `>`, `>=`, `<`, `<=`
* `==`, `!=`
* ...

<details class="details-e">
<summary>HEADER 📚</summary>

```cpp
// main.hpp
#ifndef MAIN_HPP
#define MAIN_HPP

struct Fraction {
private:
	int numerator_;
	int denominator_;
public:
	Fraction(int numerator, int denominator = 1);
}

Fraction operator-( const Fraction &f1, const Fraction &f2 );
Fraction operator*( const Fraction &f1, const Fraction &f2 );
Fraction operator/( const Fraction &f1, const Fraction &f2 );
Fraction operator+( const Fraction &f1, const Fraction &f2 );
bool operator==( const Fraction &f1, const Fraction &f2 );
bool operator!=( const Fraction &f1, const Fraction &f2 );
bool operator<( const Fraction &f1, const Fraction &f2 );
bool operator>( const Fraction &f1, const Fraction &f2 );
bool operator<=( const Fraction &f1, const Fraction &f2 );
bool operator>=( const Fraction &f1, const Fraction &f2 );
std::ostream& operator<<(std::ostream& os, const Fraction& f);
</details>

#endif //MAIN_HPP
```
</details>

<details class="details-e">
<summary>SOURCE 📖</summary>

```cpp
// main.cpp
#include "main.hpp"

Fraction::Fraction(int numerator, int denominator) {
    numerator_ = numerator;
    denominator_ = denominator;
}

Fraction operator+(const Fraction& f1, const Fraction& f2) {
    return f1; // todo
}
Fraction operator-(const Fraction& f1, const Fraction& f2) {
    return f1 + (-f2);
}
Fraction operator*(const Fraction& f1, const Fraction& f2) {
    return f1; // todo
}
Fraction operator/(const Fraction& f1, const Fraction& f2) {
    return f1; // todo
}
bool operator==(const Fraction& f1, const Fraction& f2) {
    return false; // todo
}
bool operator!=(const Fraction& f1, const Fraction& f2) {
    return !(f1 == f2);
}
std::ostream& operator<<(std::ostream& os, const Fraction& f) {
    return os; // todo
}

bool operator<( const Fraction &f1, const Fraction &f2 ) {
    return false; // todo
}

bool operator>( const Fraction &f1, const Fraction &f2 ) {
    return f2 < f1;
}

bool operator<=( const Fraction &f1, const Fraction &f2 ) {
    return !(f2 < f1);
}

bool operator>=( const Fraction &f1, const Fraction &f2 ) {
    return !(f1 < f2);
}
```
</details>