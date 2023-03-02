# Algorithms in Cryptography

Cryptography is the knowledge related to the encryption and decryption of messages via one, or more algorithms. There are two kind of algorithms: symmetric algorithms, and asymmetric algorithms.

<hr class="sl">

## Diffie–Hellman key exchange

![Type: Asymmetric](https://img.shields.io/badge/Type-Asymmetric-7cfc00)&nbsp;&nbsp;
![Complexity: intermediate](https://img.shields.io/badge/Complexity-intermediate-7cfc00)

A is sending a message to B. Both are agreeing on two numbers $p$ and $g$ with $(p-1) \wedge g\ |\ 1$ (=the only divisor is 1), and they are picking a private number (resp. $a$ and $b$, lesser than $p$).

A is sending $g^a\ (mod\ p)$ to B (resp. b for B to A). The common key for A is $(g^a)^b\ (mod\ p)$ and for B, it is $(g^b)^a\ (mod\ p)$. They **both** have the same number, but they do not know about the exponent of the other.

<hr class="sr">

## Rivest–Shamir–Adleman (RSA)

![Type: Asymmetric](https://img.shields.io/badge/Type-Asymmetric-7cfc00)&nbsp;&nbsp;
![Complexity: intermediate](https://img.shields.io/badge/Complexity-intermediate-7cfc00)

This is an algorithm that is secure, the more $n$ is bigger. The arguments that must be given are $k$, and $n$. As of 2022, it's recommended that $n$ **must be at least 2048 bits**.

* Given $n$, find two **prime numbers** $p$ and $q$, giving us $n = p * q$ <small>(which one is $p$, or which one is $q$, is up to you)</small>
* Calculate phi(n): $\phi(n) = (p-1) * (q – 1)$
* $k$ must be coprime with $\phi(n)$, meaning that $gcd(k,\ \phi(n)) = 1$.
  * $e = k$
  * $d = e^{−1}\ (mod\ \phi(n))$
* **Encrypt**: $C(m, n, e) = m^e\ (mod\ n)$
* **Decrypt**: $D(c, n, d) = c^d\ (mod\ n)$

The **public key is $(n,e)$**, while the **private key is $(n,d)$**. Senders will use the public key to encrypt a message, while the receiver will use it's private key to decrypt a message.

An attacker would have a lot of prime numbers to test ($10^{497}$ for $n \approx 10^{1000}$) to find back $\phi(n) = (p-1) * (q-1)$ from $n$.

<details class="details-e">
<summary>Use Bezout to find $d$</summary>

You can use Bézout on $\phi(n)$, and $k$, to find $d$, and $e$

* Solve $B(k,\ \phi(n)) = k * u + phi(n) * v = 1$
* $e = k$
* $d = u$

<details class="details-e">
<summary>Example: RSA(n=35, k=7)</summary>

* $35 = 5 * 7$, $p=5$, $q=7$
* $\phi(N) = (5-1) * (7-1) = 24$
* $B(7, 24) = 7 * u + 24 * v = 1$
  * One solution: $u=7$, $v=-2$
* **Encrypt**
  * (2) $2^7 \mod 35 = 23$
  * (3) $3^7 \mod 35 = 17$
  * (4) $4^7 \mod 35 = 4$
* **Decrypt**
  * (23) $23^7 \mod 35 = 2$
  * (17) $17^7 \mod 35 = 3$
  * (4) $4^7 \mod 35 = 4$
</details>
</details>

<details class="details-e">
<summary>Considerations</summary>

* `k` should be at least "3"
* `k` is usually $2^{16}+1=65537$
* **Faulty key generation attack**: $p$, and $q$ shouldn't be too close  
* **Timing attacks** (1995): if the hardware is know in details, then an attacker can guess $d$ based on the decryption time of several ciphers
</details>

<hr class="sl">

## Sources

* [The Knapsack Problem and Public Key Cryptography](https://nrich.maths.org/2199)
* [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))