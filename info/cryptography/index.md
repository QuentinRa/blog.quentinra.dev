# Cryptography

![note: draft](https://img.shields.io/badge/note-draft-orange) <small>(upcoming)</small>

Cryptography is the knowledge related to the **encryption** and **decryption** of messages. This course is more a mathematical course than a programming course, at least for now 😖.

<hr class="sl">

## Mathematical references

A summary of what you need to know.

<details class="details-e">
<summary>Euclidean division (<code>Division euclidienne</code>)</summary>

Dividing $a$ by $b$, mean solving $a = b * q + r$. You need to find **quotient** $q$ and the **remainder** (`reste`) $r$, with $r \lt b$. Both are unique.

We are saying that $b$ is a **divisor** of $a$ if $r = 0$, written $a\ |\ b$. It would also mean that $a$ is a multiple of $b$.

> * $25/5$: $25 = 5 * 5 + 0$ so $5|25$
> * $25/4$: $25 = 4 * 6 + 1$

</details>

<details class="details-e" open>
<summary>Greatest common divisor (<code>Plus grand diviseur commun</code>)</summary>

$D(a,b)$ is the set of the common divisors between $a$ and $b$. We are calling **greatest common divisor** (GCD or `PGCD`) the greatest value of $D(a,b)$, written $GCD(a,b)$ or $a \wedge b$.

> Example: what's the GCD of $(27, 15)$
> <p>
> \begin{split}
> D(27, 15) = D(27-15{\color{grey}*1}, 15)\\ = D(12, 15) = D(12, 15-12{\color{grey}*1})\\ = D(12, 3) = D(12-3*4, 3)\\ = D(0, 3) = 3 = 27 \wedge 15
> \end{split}
> </p>
> 
> **Formula**: $a \wedge b = (a - b * q) \wedge b$

</details>

<hr class="sl">

## Bézout's identity (`Thèorème de Bezout`) 

The formula is $a \wedge b = a * x + b * u$. **Bézout coefficients** $x$ and $y$ are not unique. Sometimes, this is easy to find the coefficients, but **if this isn't**, use a table (tip: read the example first)

| k | $r_k$ | $q_k$ | $x_k$ | $y_k$ | Bézout |
|---|---|---|---|---|---|
| 0 | a | ❌ | 1 | 0 | |
| 1 | b | the q in a/b | 0 | 1 | |
|...|the r in a/b|...|$x_{k-2}-q_{k-1}*x_{k-1}$|$y_{k-2}-q_{k-1}*y_{k-1}$|$r_k=a*x_k+b\*y_k$|

Example: $a=98$ and $b=77$.

| k | $r_k$ | $q_k$ | $x_k$ | $y_k$ | Bézout |
|---|---|---|---|---|---|
| 0 | 98 | ❌ | ${\color{red}1}$ | 0 | $98 = 98 * 1 + 77 * 0$ |
| 1 | 77 | ${\color{green}1}$ | ${\color{blue}0}$ | 1 | $77 = 98 * 0 + 77 * 1$ |
| 2 | 21 | 3 | ${\color{red}1}-{\color{green}1}*{\color{blue}0}=1$ | $0 - 1*1=-1$ | $21 = 98 * 1 + 77 * -1$ |
| 3 | 14 | 1 | $0 - 3 * 1 = -3$ | $1 - 3 * -1=4$ | $14 = 98 * -3 + 77 * 4$ |
| 3 | 7  | 2 | $1 - 1 * -3 = 4$ | $-1 - 1 * 4=-5$ | $7 = 98 * 4 + 77 * -5$ (**solution ✅**) |
| 3 | 0  | ❌ | $-3 - 2 * 4 = -11$ | $4 - 2 * -5=14$ | $0 = 98 * -11 + 77 * 14$ |

Of course, we are doing this because **this one was hard**, but if you got $5 * a + 7 * b = 5 \wedge 7 = 1$ then you could find almost immediately that you can use $a=3$ and $b=-5$.