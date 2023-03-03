# Basics of Cryptography

<hr class="sl">

## Prime numbers (`Nombres premiers`)

A prime number is a number **greater or equals to 2**, which is **only divisible by 1 and itself**.

* ✅: 2, 3, 5, 7, 11, 13, etc.
* ❌: 4 (→2), 6 (→2, →3), 9 (→3), 10 (→2, →5), etc.

<details class="details-e">
<summary>🧺 Prime Factorization 🧺</summary>

* **French**: `Décomposition en produit de facteurs premiers`
* **Definition**: Every number ($\ge 2$) can be expressed as a product of prime numbers
* Examples
    * $27 = 3 * 9 = 3^3$
    * $60 = 6 * 10 = 2 * 3 * 5 * 2 = 2^2 * 3 * 5$
</details>

<hr class="sl">

<details class="details-e">
<summary>🐱‍🏍 Manually find $r$ for a complex $a$ 🐱‍🏍</summary>


If you need to evaluate the value $r$ given modulus $m$ **of a complex value** $a$, then simply rewrite $a$ as a product of factors, and evaluate the modulus on each one.

* Ex: $256\ \text{mod}\ 7 = 2^8 = 2^3 * 2^3 * 2^2$
  * $2^3 = 8 \equiv 1\ (\text{mod}\ 7)$
  * $2^2 = 4 \equiv 4\ (\text{mod}\ 7)$
  * Giving us $256 \equiv 1 * 1 * 4 \equiv 4 \ (\text{mod}\ 7)$
* Ex: $2021\ \text{mod}\ 3 = 2000 + 20 + 1 = 2 * 10^3 + 2 * 10^2 + 1$
  * $10 \equiv 1\ \text{mod}\ 3$
  * $10^2 = 10 * 10 \equiv 1 \ (\text{mod}\ 3)$
  * $10^3 = 10 * 10 * 10 \equiv 1 \ (\text{mod}\ 3)$
  * $2021= 2 * 1 + 2 * 1 + 1 = 5 \equiv 2 \ (\text{mod}\ 3)$

This is called **Euler theorem** ([wiki](https://en.wikipedia.org/wiki/Euler%27s_theorem)).
</details>

<hr class="sr">

## Modular Arithmetic (`Arithmétique modulaire`)

<details class="details-e">
<summary>📚 Notes on Prime numbers 📚</summary>

**Note**: If $p$ and $q$ are prime numbers, and $p \neq q$, then $p \wedge q = 1$.<br>
**Note**: $\phi(n)$ is called Euler's totient function (`indicatrice d'Euler`) and is the number of prime numbers with $n$.

We are calling $\xi_p(n)$, the exponent of $p$ in the factorization of a number $n$ with prime numbers (`puissance de p dans n`, ex: $\xi_3(27) = 3$ or $\xi_5(60)=1$).
</details>

<details class="details-e">
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

<details class="details-e">
<summary>Bézout's identity (<code>Thèorème de Bezout</code>) </summary>

The formula is $a \wedge b = a * u + b * v$. **Bézout coefficients** $u$ and $v$ are **not unique**. Sometimes, this is easy to find the coefficients, but **if this isn't**, use a table (tip: read the example first)

| k | $r_k$                       | $q_k$                                     | $u_k$ | $v_k$ | Bézout             |
|---|-----------------------------|-------------------------------------------|---|---|--------------------|
| 0 | $a$                         | ❌                                         | 1 | 0 | a = a * 1 + b * 0  |
| 1 | $b$                         | $q_k= \lfloor \frac{r_{k-1}}{r_k} \rfloor$ | 0 | 1 | b = a * 0 + b * 1  |
|...| $r_k=r_{k-2}\ mod\ r_{k-1}$ | ...                                       |$u_{k-2}-q_{k-1}*u_{k-1}$|$v_{k-2}-q_{k-1}*v_{k-1}$| $r_k=a*u_k+b\*v_k$ |

Example: $a=98$ and $b=77$.

| k | $r_k$ | $q_k$ | $x_k$ | $y_k$ | Bézout |
|---|---|---|---|---|---|
| 0 | 98 | ❌ | ${\color{red}1}$ | 0 | $98 = 98 * 1 + 77 * 0$ |
| 1 | 77 | ${\color{green}1}$ | ${\color{blue}0}$ | 1 | $77 = 98 * 0 + 77 * 1$ |
| 2 | 21 | 3 | ${\color{red}1}-{\color{green}1}*{\color{blue}0}=1$ | $0 - 1*1=-1$ | $21 = 98 * 1 + 77 * -1$ |
| 3 | 14 | 1 | $0 - 3 * 1 = -3$ | $1 - 3 * -1=4$ | $14 = 98 * -3 + 77 * 4$ |
| 3 | 7  | 2 | $1 - 1 * -3 = 4$ | $-1 - 1 * 4=-5$ | $7 = 98 * 4 + 77 * -5$ (**solution ✅**) |
| 3 | 0  | ❌ | $-3 - 2 * 4 = -11$ | $4 - 2 * -5=14$ | $0 = 98 * -11 + 77 * 14$ |

Of course, we are doing this because **this one was hard**, but if you got $5 * a + 7 * b = 5 \wedge 7 = 1$, then you could find almost immediately that you can use $a=3$ and $b=-2$ giving us $15 - 14 = 1$ (you got 10 and -7 too, etc.).

> **Note**: Bézout's identity is a diophantine equation (`Équation diophantienne`, [wiki](https://en.wikipedia.org/wiki/Diophantine_equation)).
</details>

<details class="details-e">
<summary>🧐 Invertible numbers 🧐</summary>

A number $a$ is invertible modulus $m$ if, $\exists a^{-1}$ giving us $a * a^{-1} \equiv 1\ (mod\ m)$. To find $a^{-1}$, you can use Bézout: $a u + m v = 1 \Leftrightarrow a u = 1\ (mod\ m) \Leftrightarrow a^{-1} \equiv u\ (mod\ m)$ with $u \gt 0$.

* **Condition**: $a \wedge m\ |\ 1$
* **Ex**: in Bézout example, we had $98 * 4 + 77 * 5 = 7$
  * ❌: not invertible
* **Ex**: we found that $5 * 3 + 7 * -2 = 1$
  * $m = 7$, and $a = 5$
  * $5^{-1} = 3\ (\text{mod}\ 7)$
  * **check**: $5 * 3 = 15 = 1\ (\text{mod}\ 7)$
  * $7^{-1} = -2 = 3\ (\text{mod}\ 5)$
  * **check**: $3 * 7 = 21 = 1\ (\text{mod}\ 5)$
</details>