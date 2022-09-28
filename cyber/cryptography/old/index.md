# Mathematical references

<details class="details-e" open>
<summary>Greatest common divisor (<code>Plus grand diviseur commun</code>)</summary>

$D(a,b)$ is the set of the common divisors between $a$ and $b$. We are calling "**greatest common divisor**" (**GCD** or `PGCD`), the greatest value of $D(a,b)$, written $GCD(a,b)$ or $a \wedge b$.

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

<hr class="sr">

## Bézout's identity (`Thèorème de Bezout`) 

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

<hr class="sl">

## Prime numbers (`Nombres premiers`)

<details class="details-e">
<summary>📚 Definition 📚</summary>

**Note**: If $p$ and $q$ are prime numbers, and $p \neq q$, then $p \wedge q = 1$.<br>
**Note**: $\phi(n)$ is called Euler's totient function (`indicatrice d'Euler`) and is the number of prime numbers with $n$.
</details>

<details class="details-e">
<summary>🧺 Prime Factorization 🧺</summary>

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

<hr class="sr">

## Playing with binaries 0️⃣1️⃣

A binary is a number in base 2, so we are using only 0 and 1. You will need to do a lot of operations on binaries. 

* **Addition**: note that $1+0=1$, while $0+0=0$, and $1+1=0$
  * Generalization: $1+1+1=3\equiv1\ \(mod\ 2)$
  * Ex: $(10101)_2 + (11000)_2 = (01101)_2$
* **Conversion**: convert a number from base 10 to base 2
  * We know that $2^0={\color{blue}1},\ 2^1={\color{blue}2},\ 2^2={\color{blue}4},\ 2^3={\color{blue}8}, ...$ (16, 32, 64, 128, 256, 512, etc.)
  * Ex: $56 = 32 + 16 + 8$
  * Ex: $56 = 2^5 + 2^4 + 2^3 = {\color{grey} 0\*2^0 + 0\*2^1 + 0\*2^2} + {\color{grey} 1*} 2^3 + {\color{grey} 1*} 2^4 + {\color{grey} 1*} 2^5  $
  * Ex: $(56)_{10} = (000111)_2$
* **Conversion**: from base 2 to base 10
  * Ex: $(000111)_2$
  * $(000111)_2 = {\color{grey} 0 * 2^0 + 0 * 2^1 + 0 * 2^2} + {\color{grey} 1*} 2^3 + {\color{grey} 1*} 2^4 + {\color{grey} 1*} 2^5$
  * $(000111)_2 = (8+16+32)\_{10} = (56)\_{10}$