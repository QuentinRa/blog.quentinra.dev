# Basics of Cryptography

Cryptography is the knowledge related to the **encryption** and **decryption** of messages. This course is more of a mathematical course than a programming course. This is because most of the algorithms are using prime numbers, modulus, and a lot of stuff like this.

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

<hr class="sr">

## Euclidean division (`Division euclidienne`)

Dividing $a$ by $b$, mean solving $a = b * q + r$. You need to find **quotient** $q$ and the **remainder** (`reste`) $r$, with $r \lt b$. Both are unique.

We are saying that $a$ is a **divisor** of $b$ if $r = 0$, written $a\ |\ b$. It would also mean that $a$ is a multiple of $b$.

> **Is 5 a divisor of 25?**<br> $25 = 5 * 5 + 0$, so yes $5|25$<br><br>
> **Is 4 a divisor of 25?**<br> $25 = 4 * 6 + 1$, so no

<hr class="sl">

## Congruence

Let a and b two numbers. We are saying that $a$ is **congruent** (`congru`, $\equiv$) with $b$ **modulus** (`modulo`) $m$, if we can find a $q$ giving us

@
a = b + m * q
@

As you may notice, **$b$ is the same as $r$ in Euclidean division**. We are using one of the notations below

<div>
\[
\begin{align}
a \equiv b\ (m)\\
a \equiv b\ (mod\ m)\\
a \equiv [b]\\
\end{align}
\]
</div>

> **Ex**: $27 \equiv 3\ (mod\ 12)$ as we have $12*2 + 3$ (r=3)<br>
> **Formula**: Given $a = m * q + r$, then $a \equiv r\ (mod\ m)$


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

This is a gathering of "random" topics that were taught along with this two previous ones, but there are way less important in my opinion.

<details class="details-e">
<summary>Bézout's identity (<code>Thèorème de Bezout</code>) </summary>

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

<hr class="sl">

## Sources

* IUTSF Teaching 🚀
* ENSIIE Teaching
* [Online Cryptography Course](https://crypto.stanford.edu/~dabo/courses/OnlineCrypto/)
* <https://en.wikipedia.org/wiki/Table_of_divisors>
* <https://en.wikipedia.org/wiki/Prime_number>
* <https://en.wikipedia.org/wiki/Modular_arithmetic>
* <https://en.wikipedia.org/wiki/Euler%27s_theorem>