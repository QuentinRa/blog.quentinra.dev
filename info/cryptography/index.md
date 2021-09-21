# Cryptography

![note: draft](https://img.shields.io/badge/note-draft-orange) <small>(upcoming)</small>

Cryptography is the knowledge related to the **encryption** and **decryption** of messages. This course is more a mathematical course than a programming course, at least for now (sorry 😖).

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

$D(a,b)$ is the set of the common divisors between $a$ and $b$. We are calling **greatest common divisor** (**GCD** or `PGCD`), the greatest value of $D(a,b)$, written $GCD(a,b)$ or $a \wedge b$.

> Example: what's the GCD of $(27, 15)$
> <p>
> \begin{split}
> D(27, 15) = D(27-15{\color{grey}*1}, 15)\\ = D(12, 15) = D(12, 15-12{\color{grey}*1})\\ = D(12, 3) = D(12-3{\color{grey}*4}, 3)\\ = D(0, 3) = 3 = 27 \wedge 15
> \end{split}
> </p>
> 
> **Formula**: $a \wedge b = (a - b * q) \wedge b$<br>
> **Pro tip**: $a \wedge b = c \wedge (\frac{b}{c} \wedge \frac{a}{c})$, so $27 \wedge 15 = 3 \wedge (9 \wedge 5) = 3 \wedge 0 = 3 $.
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

Of course, we are doing this because **this one was hard**, but if you got $5 * a + 7 * b = 5 \wedge 7 = 1$ then you could find almost immediately that you can use $a=3$ and $b=-2$ giving us $15 - 14 = 1$ (you got 10 and -9 too, etc.).

> **Note**: Bézout's identity is a diophantine equation (`Équation diophantienne`, [wiki](https://en.wikipedia.org/wiki/Diophantine_equation)).

<hr class="sl">

## Prime numbers (`Nombres premiers`)

<details class="details-e">
<summary>📚 Definition 📚</summary>

A prime number is a number **greater or equals to 2**, which is **only divisible by 1 and itself**.

* ✅: 2, 3, 5, 7, 11, 13, etc.
* ❌: 4 (→2), 6 (→2, →3), 9 (→3), 10 (→2, →5), etc.

**Note**: If $p$ and $q$ are prime numbers, and $p \neq q$, then $p \wedge q = 1$.
</details>

<details class="details-e">
<summary>🧺 Prime Factorization 🧺</summary>

* **French**: `Décomposition en produit de facteurs premiers`
* **Definition**: Every number ($\ge 2$) can be expressed as a product of prime numbers
* Examples
    * $27 = 3 * 9 = 3^3$
    * $60 = 6 * 10 = 2 * 3 * 5 * 2 = 2^2 * 3 * 5$

We are calling $\xi_p(n)$, the exponent of $p$ in the factorization of a number $n$ with prime numbers (`puissance de p dans n`, ex: $\xi_3(27) = 3$ or $\xi_5(60)=1$).
</details>

<details class="details-e" open>
<summary> 🚀 GCP with prime numbers 🚀</summary>

You can calculate the **GCD easily**. Simply express each number with prime numbers. Then, take each **unique** number in both factorizations, they will be in the **GCD**. Their exponent is the lowest exponent that we have for each number in the two factorizations.

<p>
\begin{split}
GCP(a, b) = \prod_{i\ \in\ unique\ prime\ numbers} i^{\min(\xi_i(a),\ \xi_i(b))} \\
98 = 2 * 49 = 2 * 7^2 \\
77 = 7 * 11 \\
GCP(98, 77) = 2^{min(1, 0)} * 7^{min(2, 1)} * 11^{min(0, 1)}
= 1 * 7 * 1 = 7\\
\end{split}
</p>

> **Note**: if you replace **min** with **max**, you will have the **least common multiple** (`Plus petit commun multiple/PPCM`).
</details>