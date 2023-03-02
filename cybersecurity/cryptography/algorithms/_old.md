# Algorithms in Cryptography

Cryptography is the knowledge related to the encryption and decryption of messages via one, or more algorithms. There are two kind of algorithms: symmetric algorithms, and asymmetric algorithms.

<hr class="sr">

## One Time Pad (`Masque jetable`)

![Type: Symmetric](https://img.shields.io/badge/Type-Symmetric-7cfc00)&nbsp;&nbsp;
![Complexity: easy](https://img.shields.io/badge/Complexity-easy-7cfc00)

The **One Time Pad**, or One Time password, abbreviated as **OTP**, is a cryptographic algorithm with a good level of security, as long as some considerations are taken, created in 2017.  It is part of the family of **stream cipher** (`chiffrement par flot`).

* `m` is a message of length `n`
* `k` is a key of length `n`
* $C = m \oplus k$
* $D = c \oplus k$

The operator $\oplus$ (XOR, `ou exclusif`) is basically this: $(a+b)%2$, with both arguments binary numbers.

<details class="details-e">
<summary>Example</summary>

* **Message**: $10011$
* **Key** (encrypt): $01010$
* **Cipher text**: $11001$
* **Key** (decrypt): $01010$
* **Message**: $10011$
</details>

<details class="details-e">
<summary>Concerns</summary>

* The key is as long as the message, making it hard to use
* The key must be used only once (**Two Time Pad**)
* OPT do not control/ensure the integrity of the message.
</details>

<hr class="sl">

## AES

![Type: Symmetric](https://img.shields.io/badge/Type-Symmetric-7cfc00)&nbsp;&nbsp;
![Complexity: easy](https://img.shields.io/badge/Complexity-easy-7cfc00)

The **Advanced Encryption Standard**, abbreviated as **AES**, is a part of the **Block ciphers** algorithms.

<details class="details-e">
<summary>Block cipher algorithms</summary>

* a size of a bloc `n` bits
* a message of `n` bits
* a cipher of `n` bits
* a key of `k` bits

Note that because both `m`, and `c` are on `n` bits, we will basically apply a permutation of `m` to get `c` <small>(101 may become 011, same bits, different order)</small>.

</details>

For AES, `n` is 128 bits, and `k` is either 128, 192, or 256 bits. As a message may be bigger, or lower than `n`, we will split the message in blocs of size `n`. We are adding padding to fill the last block if needed. Each block is encoded with a different `k`.

<details class="details-e">
<summary>Electronic Code Book (ECB)</summary>

This is a block cipher in which we are reusing the key. The problem is that parts of the message may have the same cipher, and we can use an entropy attack to break the cipher.
</details>

<details class="details-e">
<summary>AES-CBC</summary>

This is a block cipher in which we are reusing the key, but we are adding a parameter IV (uniq, and not inferable) to encrypt the first bloc, and we are using the cipher of the previous block, to encrypt the next one.
</details>

<hr class="sr">

## Knapsack problem (`sac-à-dos`) of Merkle-Hellman

![Type: Asymmetric](https://img.shields.io/badge/Type-Asymmetric-7cfc00)&nbsp;&nbsp;
![Complexity: intermediate](https://img.shields.io/badge/Complexity-intermediate-7cfc00)

<details class="details-e">
<summary>Knapsack problem</summary>

The most know bag/knapsack problem is the **0-1 knapsack problem**. You got a "bag/Knapsack" of numbers <small>(ex: 23, 5, 11, 2, 55)</small>. Your message is made of `0`, and `1`, and using this method `1` means you picked something from the bag, `0` means you didn't. Then, make the sum of the numbers you picked in the bag to create the **cipher**. Note that you **will have to split the message into groups** having the size of the knapsack.

* **Knapsack**: $2, 5, 11, 23, 55$ (up to you, size=6)
* **Message**: $1100111001 = 11001\ 10001$ (group of 6)
* **Cipher**
  * $2 + 5 + 0 + 0 + 55 = 62$ (first group)
  * $2 + 0 + 0 + 0 + 55 = 57$ (second group)
* **Cipher text**: $62, 57$
</details>

<details class="details-e"> 
<summary>Super-increasing knapsack problem</summary>

An easy knapsack problem is the **super-increasing knapsack problem**, in which every next entry of the bag is greater than the sum of the previous terms. It make it easy to decipher the message without the key, as if the cipher is greater or equals than the current greatest value of the knapsack, then it is inside the knapsack of the message.

* **Knapsack**: $2, 5, 11, 23, 55$
* **Cipher**: 62
* Decipher
  * $62 \ge 55$ ? yes, then 55 is in.
  * $7 \ge 23$ ? no, then 23 is not in
  * $7 \ge 11$ ? no, then 11 is not in.
  * $7 \ge 5$ ? yes, then 5 is in.
  * $2 \ge 2$ ? yes, then 2 is in.
* **Result**: 11001

</details>

Merkle-Hellman knapsack problem is **one of the earliest public-key algorithm**. The private key is a super-increasing knapsack problem, while the public key is the private key modified a bit to be a knapsack problem.

<details class="details-e">
<summary>Generate a public key</summary>

We will pick a value $N$ greater than the sum of the values in the Knapsack, and a number $W$, so that $N \wedge W|1$ (=no common divisor aside 1).

* We are picking $N=113$, $W=27$
* We calculated $W^{-1} = 67\ (\text{mod}\ 113)$
* **Knapsack** (public key)
  * We are multiplying the private key by $W$, modulus $N$
  * Ex: $27 * 2 = 54\ (\text{mod}\ 113)$
  * $((2, 5, 11, 23, 55) * W)\ mod\ N = 54, 22, 71, 56, 16$
  * Public key: $(54, 22, 71, 56, 16)$
</details>

<details class="details-e">
<summary>Public-key exchange</summary>

* **A** is generating a private-key using the super-increasing knapsack ($(2, 5, 11, 23, 55)$)
* **A** is generating a public-key $(54, 22, 71, 56, 16)$, using a $N=113$, and $W=27$ that **B** know
* **A** encrypt a message using the public-key, and send the cipher text to **B**
  * $54 + 22 + 0 + 0 + 16 = 92$ (first group)
  * $54 + 0 + 0 + 0 + 16 = 70$ (second group)
  * **Cipher text**: $92, 70$
* **B** generate the private-key using the public-key, and both $W$, and $N$
  * We are multiplying the public key by $W^{-1}$, modulus $N$
  * We get the private key: $2, 5, 11, 23, 55$
* **B** decrypt the message
  * We multiply the message by $W^{-1}$, modulus $N$
  * We get $62$, and $57$
  * We solve them using the super-increasing knapsack problem
  * The message was: $1100110001$
</details>

It was cracked in polynomial time in 1984 by Adi Shamir published.

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

* IUTSF Teachings 🚀
* ENSIIE Teachings
* UdeS Teachings
* [The Knapsack Problem and Public Key Cryptography](https://nrich.maths.org/2199)
* [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))