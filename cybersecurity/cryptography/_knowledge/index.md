# Cryptography

<div class="row row-cols-md-2"><div>

Cryptography has three main objectives:

* 🔐 protect confidentiality <small>(encryption)</small>
* 🧬 ensure integrity <small>(checksum)</small>
* ✅ ensure authenticity <small>(certificate, signatures)</small>

There are two kind of cryptographic algorithms

* [Symmetric algorithms](/cybersecurity/cryptography/algorithms/symmetric/index.md): one shared private key
* [Asymmetric algorithms](/cybersecurity/cryptography/algorithms/asymmetric/index.md): one public key, one private key
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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* [justcryptography](https://justcryptography.com/)
* [angelique-renaud](https://www.angelique-renaud.com/cryptage.php)
* [wikipedia portal](https://fr.wikipedia.org/wiki/Portail:Cryptologie)
</div><div>

* SRM
* [RsaCtfTool](https://github.com/RsaCtfTool/RsaCtfTool) (4.2k ⭐)
* [rsatool](https://github.com/ius/rsatool) (0.9k ⭐)
</div></div>