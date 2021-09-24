# Cryptography

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

<hr class="sr">

## Bézout's identity (`Thèorème de Bezout`) 

The formula is $a \wedge b = a * u + b * v$. **Bézout coefficients** $u$ and $v$ are **not unique**. Sometimes, this is easy to find the coefficients, but **if this isn't**, use a table (tip: read the example first)

| k | $r_k$ | $q_k$ | $u_k$ | $v_k$ | Bézout |
|---|---|---|---|---|---|
| 0 | a | ❌ | 1 | 0 | |
| 1 | b | the q in a/b | 0 | 1 | |
|...|the r in a/b|...|$u_{k-2}-q_{k-1}*u_{k-1}$|$v_{k-2}-q_{k-1}*v_{k-1}$|$r_k=a*u_k+b\*v_k$|

Example: $a=98$ and $b=77$.

| k | $r_k$ | $q_k$ | $x_k$ | $y_k$ | Bézout |
|---|---|---|---|---|---|
| 0 | 98 | ❌ | ${\color{red}1}$ | 0 | $98 = 98 * 1 + 77 * 0$ |
| 1 | 77 | ${\color{green}1}$ | ${\color{blue}0}$ | 1 | $77 = 98 * 0 + 77 * 1$ |
| 2 | 21 | 3 | ${\color{red}1}-{\color{green}1}*{\color{blue}0}=1$ | $0 - 1*1=-1$ | $21 = 98 * 1 + 77 * -1$ |
| 3 | 14 | 1 | $0 - 3 * 1 = -3$ | $1 - 3 * -1=4$ | $14 = 98 * -3 + 77 * 4$ |
| 3 | 7  | 2 | $1 - 1 * -3 = 4$ | $-1 - 1 * 4=-5$ | $7 = 98 * 4 + 77 * -5$ (**solution ✅**) |
| 3 | 0  | ❌ | $-3 - 2 * 4 = -11$ | $4 - 2 * -5=14$ | $0 = 98 * -11 + 77 * 14$ |

Of course, we are doing this because **this one was hard**, but if you got $5 * a + 7 * b = 5 \wedge 7 = 1$, then you could find almost immediately that you can use $a=3$ and $b=-2$ giving us $15 - 14 = 1$ (you got 10 and -9 too, etc.).

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

<hr class="sr">

## Congruence

Let a and b two numbers. We are saying that $a$ is **congruent** (`congru`, $\equiv$) with $b$ **modulus** (`modulo`) $m$, if we can find a $q$ giving us

@
a = b + m * q
@

We are using one of the notations below

<div>
\[
\begin{align}
a \equiv b\ (m)\\
a \equiv b\ (mod\ m)\\
a \equiv [b]\\
\end{align}
\]
</div>

> **Ex**: $27\ \text{mod}\ 12 \equiv 3\ (mod\ 12)$ as we have $12*2 + 3$<br>
> **Formula**: Given $a = m * q + r$, then $a \equiv r\ (mod\ m)$

<details class="details-e">
<summary>🐱‍🏍 Find $r$ for a complex $a$ 🐱‍🏍</summary>


If you need to evaluate the value $r$ given modulus $m$ **of a complex value** $a$, then simply split rewrite your value $a$ as a product of factors, and evaluate the modulus on each one.

* Ex: $256\ \text{mod}\ 7 = 2^8 = 2^3 * 2^3 * 2^2$
  * $2^3 = 8 \equiv 1\ (\text{mod}\ 7)$
  * $2^2 = 4 \equiv 4\ (\text{mod}\ 7)$
  * Giving us $256 \equiv 1 * 4 \equiv 4 \ (\text{mod}\ 7)$
* Ex: $2021\ \text{mod}\ 3 = 2 * 10^3 + 2 * 10^2 + 1$
  * $10 \equiv 1\ \text{mod}\ 3$
  * $10^2 = 10 * 10 \equiv 1 \ (\text{mod}\ 3)$
  * $10^3 = 10 * 10 * 10 \equiv 1 \ (\text{mod}\ 3)$
  * $2021= 2 * 1 + 2 * 1 + 1 = 5 \equiv 2 \ (\text{mod}\ 3)$

This is called **Euler theorem** ([wiki](https://en.wikipedia.org/wiki/Euler%27s_theorem)).
</details>

<details class="details-e" open>
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

## Main idea

You will **encrypt** your **message** with a **key** using an **algorithm**, generating a **cipher** (`message encrypté`): $E(\text{key}_1, \text{message})=^{algo}c$. The receiver will receive your **cipher**, decrypt it using a **key** and **an algorithm**: $D(\text{key}_2, c)=^{algo}\text{message}$.

* **Note**: $k_1$ should be different from $k_2$ <small>(otherwise, it will be broken)</small>
* **Note**: The algorithm is well-known <small>(ex: AES, DES, RSA, SSL, ...)</small>

We will use the terms

* **public key**: a key used to encrypt a message that is shared with everyone. Only the one generating the key is supposed to be able to decrypt a message.
* **private key**: a key associated with the public key, not shared, used to decrypt messages encrypted with the public key

<hr class="sr">

## Playing with binaries 0️⃣1️⃣

A binary is a number in base 2, so we are using only 0 and 1. You will need to do a lot of operations on binaries. 

* **Addition**: note that $1+0=1$, $0+0=0$, and $1+1=0$
  * Generalization: $1+1+1=3=1\ \(mod\ 2)$
  * Ex: $(1+0+1+0+1)_2 + (1+1+0+0+0)_2 = (0+1+1+0+1)_2$
* **Conversion**: convert a number from base 10 to base 2
  * We know that $2^0=1, 2^1=2, 2^2=4, 2^3=8, ...$
  * Ex: $56 = 32 + 16 + 8$
  * Ex: $56 = 2^5 + 2^4 + 2^3 + = {\color{grey} 0 * 2^0 + 0 * 2^1 + 0 * 2^2} + {\color{grey} 1*} 2^3 + {\color{grey} 1*} 2^4 + {\color{grey} 1*} 2^5  $
  * Ex: $(56)_{10} = (000111)_2$
* **Conversion**: from base 2 to base 10
  * Ex: $(000111)_2$
  * $(000111)_2 = {\color{grey} 0 * 2^0 + 0 * 2^1 + 0 * 2^2} + {\color{grey} 1*} 2^3 + {\color{grey} 1*} 2^4 + {\color{grey} 1*} 2^5$
  * $(000111)_2 = (56)\_{10}$

<hr class="sl">

## Some algorithms

Most of them aren't used, either because they are inefficient or because they were broken. You can move to the next section if you are not interested 🧐.

<details class="details-e">
<summary>Caesar cipher (<code>Code de César</code>)</summary>

Caesar was replacing letters like this $a \to c,\ b \to d,\ etc.$. On the same idea, the **substitution cipher** is replacing each letter by another like $a \to w,\ b \to e,\ etc.$.

Unfortunately, we can try to replace the most common letters in the cipher text, or the most commons groups of letters, with the most common letters (or group of letters) in a Language. And break the cipher.
</details>

<details class="details-e">
<summary>One-time pad</summary>

This algorithm is creating a **key as long or longer than the message**, so even though it is secure, we can't use it. For each message, both user are agreeing on a key (ex: $01010$), and the Algorithm is **XOR** (`ou exclusif`, $0+0=1+1=0$ and $1+0=0+1=1$).

* **Message**: $10011$
* **Key** (encrypt): $01010$
* **Cipher text**: $11001$
* **Key** (decrypt): $01010$
* **Message**: $10011$
</details>

<details class="details-e">
<summary>Knapsack problem (<code>sac-à-dos</code>) of Merkle-Hellman</summary>

You a got a "bag/Knapsack" of numbers (ex: 23, 5, 11, 2, 55). Your message is made of `0` and `1`, and using this method `1` means you picked something from the bag, `0` means you didn't. Then, make the sum of the numbers you picked in the bag to create the **cipher**. Note that you **will have to split the message into groups** having the size of the knapsack.

* **Knapsack** (private key): $2, 5, 11, 23, 55$ (up to you, size=6)
* **Message**: $1100111001 = 11001\ 10001$ (group of 6)
* **Cipher**
  * $2 + 5 + 0 + 0 + 55 = 62$ (first group)
  * $2 + 0 + 0 + 0 + 55 = 57$ (second group)
* **Cipher text**: $62, 57$

But, this is too easy to find what generated this cipher. So we are using the **super-increasing knapsack problem** to **generate a public key**, and **this easy key as the private key**. We will pick a value $N$ greater than the sum of the values in the Knapsack, and a number $W$, so that $N \wedge W|1$ (=no common divisor aside 1).

* We are picking $N=113$, $W=27$
* We got $W^{-1} = 67\ (\text{mod}\ 113)$
* **Knapsack** (public key)
  * We are multiplying the private key by $W$, modulus $N$
  * $54, 22, 71, 56, 16$ (ex: $27 * 2 = 54\ (\text{mod}\ 113)$)
* **private cipher**
  * $54 + 22 + 0 + 0 + 16 = 92$ (first group)
  * $54 + 0 + 0 + 0 + 16 = 70$ (second group)
* **Cipher text**: $92, 70$
* **decrypt** (given N and W)
  * We are multiplying the public key by $W$, modulus $N$
  * we get back the private key: $2, 5, 11, 23, 55$
  * we can easily find that: $2 + 5 + 0 + 0 + 55 = 62$ and ...
  * so the message was: $1100110001$
</details>

<details class="details-e">
<summary>Diffie–Hellman key exchange</summary>

A is sending a message to B. Both are agreeing on two numbers $p$ and $g$ with $(p-1) \wedge g\ |\ 1$ (=the only divisor is 1), and they are picking a private number (resp. $a$ and $b$, lesser than $p$).

A is sending $g^a\ (mod\ p)$ to B (resp. b for B to A). The common key for A is $(g^a)^b\ (mod\ p)$ and for B, it is $(g^b)^a\ (mod\ p)$. They **both** have the same number, but they do not know about the exponent of the other.
</details>

<hr class="sr">

## Rivest–Shamir–Adleman (RSA)

We are picking two **prime numbers** $p$ and $q$, and deducting both $n = p * q$ and $\phi(n) = (p-1) * (q-1)$. The, use **Bézout** to find the coefficients that we will call $d$ and $e$.

* **Public key**: $(n, e)$ (used by others to encrypt)
* **Private key**: $(n, d)$ (used by only me, to decrypt)

To encrypt a message $T$, simply do $S = T^e\ (mod\ n)$, while the message is supposed to be a number $\lt n$.

To decrypt a message $S$, simply do $T = S^d\ (mod\ n)$.

> This is working, because an attacker would have a lot of prime numbers to test ($10^{497}$ for $n \approx 10^{1000}$) to find back $\phi(n) = (p-1) * (q-1)$ from $n$.

<hr class="sl">

## Sources

* Oleg L. (My teacher when I was in the IUT of Sénart-Fontainebleau) 🚀
* [Online Cryptography Course](https://crypto.stanford.edu/~dabo/courses/OnlineCrypto/)
* <https://en.wikipedia.org/wiki/Table_of_divisors>
* <https://en.wikipedia.org/wiki/Prime_number>
* <https://en.wikipedia.org/wiki/Modular_arithmetic>
* <https://en.wikipedia.org/wiki/Euler%27s_theorem>