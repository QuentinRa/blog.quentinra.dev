# External operators

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

#include <ostream>

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

// if inside a namespace, use :: (ig: ns::operator+)

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

> **Pro tip**: you may use references instead of returning a value.