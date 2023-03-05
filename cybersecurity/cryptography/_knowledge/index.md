# Cryptography

<div class="row row-cols-md-2"><div>

Cryptography has three main objectives:

* 🔐 protect confidentiality <small>(encryption)</small>
* 🧬 ensure integrity <small>(checksum)</small>
* ✅ ensure authenticity <small>(certificate, signatures)</small>

There are three kind of cryptographic algorithms

* [Symmetric algorithms](/cybersecurity/cryptography/algorithms/symmetric/index.md): one shared private key
* [Asymmetric algorithms](/cybersecurity/cryptography/algorithms/asymmetric/index.md): one public key, one private key
* [Hashing algorithms](/cybersecurity/cryptography/algorithms/hashing/index.md): no key, generate a digest
</div><div>

Cryptanalysis are those with the duty to analyse and find weakness in the underlying maths of cryptographic algorithms.

➡️ Python is quite used in cryptography, because reasons like there are many libraries with cryptographic algorithms, integers are not limited in size, it's popular in mathematical fields...

**Where to learn?**

* [DamnVulnerableCryptoApp](https://damnvulnerablecryptoapp.github.io/DamnVulnerableCryptoApp/) (👻)
* [Cryptohack](https://cryptohack.org/) (👻)
* [Coursera/Crypto](https://www.coursera.org/learn/crypto) (👻)
</div></div>

<hr class="sep-both">

## Terminology

<div class="row row-cols-md-2 mt-4"><div>

In a nutshell, we use these terms:

* The input is a **plaintext** message 💬.

* It is **encrypted** 🔒 <small>(a.k.a. encipher)</small> using a cryptographic algorithm and a **key** 🔑. The output is called a **cyphertext** (`message encrypté`) 🔐. 

* It is **decrypted** 🔓  using a cryptographic algorithm and a **key** 🗝️.
</div><div>

Algorithms can be

* **Weak** 🔥: vulnerableto known attacks/easily broken
* **Acceptable** 🤔: meet the minimum security requirements
* **Secure** 🎩: secure against known attacks, resistant to cryptanalysis
* **Strong** 👑: both secure and efficient
</div></div>

<hr class="sep-both">

## Cryptographic attacks

<div class="row row-cols-md-2 mt-3"><div>

**Brute force attack** 🧨: trying all possible values until the correct one is found.

**Frequency analysis** 🪶: some letters/combinations of letters occur more frequently in a language. For instance, `e` is the most frequent letter in English/French.

* [Characters frequency french](https://www.sttmedia.com/characterfrequency-french)
* [Syllables frequency french](https://www.sttmedia.com/syllablefrequency-french)

**Known-plaintext attack** (KPA) 🔮: an attacker knows both the plaintext and the ciphertext, and tries to deduce the key.
</div><div>

**Cribbing attack**🧞‍♂️(a KPA attack): use information to guess parts of the plaintext and try to deduce the key.

**Entropy attacks** 🦄: find a weakness in the random number generation process used to generate cryptographic keys.

**Side-channel attacks** 🦐: exploit the implementation of the algorithm rather than the algorithm itself.

**Timing attacks** 🕰️: analyze the time it takes to perform different operations to guess a potential weakness in an algorithm
</div></div>

<hr class="sep-both">

## Mathematical fundaments

<div class="row row-cols-md-2"><div>

#### Congruence

Let a and b two numbers. We are saying that $a$ is **congruent** (`congru`, $\equiv$) with $b$ **modulus** (`modulo`) $m$, if we can find a $q$ giving us

@
a = b + m * q
@

This is an **euclidean division with $b = r$ in **. We are using one of the notations below

<div>
\[
\begin{align}
a \equiv b\ (m)\\
a \equiv b\ (mod\ m)\\
a \equiv [b]\\
\end{align}
\]
</div>

> **Ex**: $27 \equiv 3\ (mod\ 12)$ as we have $12*2 + 3$ <small>(b=3)</small>

<br>

#### Euclidean division (`Division euclidienne`)

Dividing $a$ by $b$, mean solving $a = b * q + r$. You need to find **quotient** $q$ and the **remainder** (`reste`) $r$, with $r \lt b$. Both are unique.

We are saying that $a$ is a **divisor** of $b$ if $r = 0$, written $a\ |\ b$. It would also mean that $a$ is a multiple of $b$.

> **Is 5 a divisor of 25?**<br> $25 = 5 * 5 + 0$, so yes $5|25$<br><br>
> **Is 4 a divisor of 25?**<br> $25 = 4 * 6 + 1$, so no
</div><div>

#### Greatest common divisor (<code>Plus grand diviseur commun</code>)

$D(a,b)$ is the set of common divisors between $a$ and $b$. We are calling "**greatest common divisor**" (**GCD** or `PGCD`), the greatest value of $D(a,b)$, written $GCD(a,b)$ or $a \wedge b$.

> Example: what's the GCD of $(27, 15)$
> <p>
> \begin{split}
> D(27, 15) = D(27-15{\color{grey}*1}, 15)\\ = D(12, 15) = D(12, 15-12{\color{grey}*1})\\ = D(12, 3) = D(12-3{\color{grey}*4}, 3)\\ = D(0, 3) = 3 = 27 \wedge 15
> \end{split}
> </p>
>
> **Formula**: $a \wedge b = (a - b * q) \wedge b$<br>
> **Pro tip**: $a \wedge b = c \wedge (\frac{b}{c} \wedge \frac{a}{c})$, so $27 \wedge 15 = 3 \wedge (9 \wedge 5) = 3 \wedge 0 = 3 $.
</div></div>

<hr class="sep-both">

## Modular inverse

<div class="row row-cols-md-2"><div>

#### Bézout's identity (<code>Thèorème de Bezout</code>)

The formula is $a \wedge b = a * u + b * v$. **Bézout coefficients** $u$ and $v$ are **not unique**. Sometimes, this is easy to find the coefficients, but **if this isn't**, use a table (tip: read the example first)

<div class="overflow-scroll">

| k | $r_k$                       | $q_k$                                     | $u_k$ | $v_k$ | Bézout             |
|---|-----------------------------|-------------------------------------------|---|---|--------------------|
| 0 | $a$                         | ❌                                         | 1 | 0 | a = a * 1 + b * 0  |
| 1 | $b$                         | $q_k= \lfloor \frac{r_{k-1}}{r_k} \rfloor$ | 0 | 1 | b = a * 0 + b * 1  |
|...| $r_k=r_{k-2}\ mod\ r_{k-1}$ | ...                                       |$u_{k-2}-q_{k-1}*u_{k-1}$|$v_{k-2}-q_{k-1}*v_{k-1}$| $r_k=a*u_k+b\*v_k$ |
</div>

<details class="details-n mt-3">
<summary>Example: $a=98$ and $b=77$.</summary>
<div class="overflow-scroll">

| k | $r_k$ | $q_k$ | $x_k$ | $y_k$ | Bézout |
|---|---|---|---|---|---|
| 0 | 98 | ❌ | ${\color{red}1}$ | 0 | $98 = 98 * 1 + 77 * 0$ |
| 1 | 77 | ${\color{green}1}$ | ${\color{blue}0}$ | 1 | $77 = 98 * 0 + 77 * 1$ |
| 2 | 21 | 3 | ${\color{red}1}-{\color{green}1}*{\color{blue}0}=1$ | $0 - 1*1=-1$ | $21 = 98 * 1 + 77 * -1$ |
| 3 | 14 | 1 | $0 - 3 * 1 = -3$ | $1 - 3 * -1=4$ | $14 = 98 * -3 + 77 * 4$ |
| 3 | 7  | 2 | $1 - 1 * -3 = 4$ | $-1 - 1 * 4=-5$ | $7 = 98 * 4 + 77 * -5$ (**solution ✅**) |
| 3 | 0  | ❌ | $-3 - 2 * 4 = -11$ | $4 - 2 * -5=14$ | $0 = 98 * -11 + 77 * 14$ |
</div>
</details>

We are using the table because **this one was hard**. If you got $5 * a + 7 * b = 5 \wedge 7 = 1$, then you could find almost immediately that you can use $a=3$ and $b=-2$ giving us $15 - 14 = 1$...
</div><div>

#### Invertible numbers

A number $a$ is invertible modulus $m$ if $\exists a^{-1}$ giving us $a * a^{-1} \equiv 1\ (mod\ m)$. To find $a^{-1}$, you can use Bézout: $a u + m v = 1 \Leftrightarrow a u = 1\ (mod\ m) \Leftrightarrow a^{-1} \equiv u\ (mod\ m)$ with $u \gt 0$

* **Condition**: $a \wedge m\ |\ 1$
* **Ex**: in Bézout example, we had $98 * 4 + 77 * 5 = 7$
    * ❌: not invertible
* **Ex**: we found that $5 * 3 + 7 * -2 = 1$
    * $m = 7$, and $a = 5$
    * $5^{-1} = 3\ (\text{mod}\ 7)$
    * **check**: $5 * 3 = 15 = 1\ (\text{mod}\ 7)$
    * $7^{-1} = -2 = 3\ (\text{mod}\ 5)$
    * **check**: $3 * 7 = 21 = 1\ (\text{mod}\ 5)$
</div></div>

<hr class="sep-both">

## Prime numbers (`Nombres premiers`)

<div class="row row-cols-md-2"><div>

A prime number is a number **greater or equals to 2**, which is **only divisible by 1 and itself**.

* ✅: 2, 3, 5, 7, 11, 13, etc.
* ❌: 4 (→2), 6 (→2, →3), 9 (→3), 10 (→2, →5), etc.

**Note**: If $p$ and $q$ are prime numbers, and $p \neq q$, then $p \wedge q = 1$.<br>
**Note**: $\phi(n)$ is called Euler's totient function (`indicatrice d'Euler`) and is the number of prime numbers with $n$.

We are calling $\xi_p(n)$, the exponent of $p$ in the factorization of a number $n$ with prime numbers (`puissance de p dans n`, ex: $\xi_3(27) = 3$ or $\xi_5(60)=1$).
</div><div>

#### GCP with prime numbers

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
</div></div>

<hr class="sep-both">

## Calculation shortcut

<div class="row row-cols-md-2"><div>

If you need to manually calculate an euclidean division with big numbers, then you may want to use the prime Factorization shortcut.

#### Prime Factorization (`Décomposition en produit de facteurs premiers`)

Every number ($\ge 2$) can be expressed as a product of prime numbers.

* $27 = 3 * 9 = 3^3$
* $60 = 6 * 10 = 2 * 3 * 5 * 2 = 2^2 * 3 * 5$
</div><div>

#### Euclidean division shortcut

Rewrite $a$ as a product of factors, and evaluate each one.

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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [justcryptography](https://justcryptography.com/)
* [angelique-renaud](https://www.angelique-renaud.com/cryptage.php)
* [wikipedia portal](https://fr.wikipedia.org/wiki/Portail:Cryptologie)
</div><div>

* SRM (error-correcting code)
* [RsaCtfTool](https://github.com/RsaCtfTool/RsaCtfTool) (4.2k ⭐)
* [rsatool](https://github.com/ius/rsatool) (0.9k ⭐)
* message authentication codes (MACs)
* HMAC
</div></div>