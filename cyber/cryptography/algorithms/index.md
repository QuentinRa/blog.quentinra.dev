# Algorithms in Cryptography

Cryptography is the knowledge related to the encryption and decryption of messages via one, or more algorithms. There are two kind of algorithms: symmetric algorithms, and asymmetric algorithms.

<details class="details-e">
<summary>Symmetric algorithms</summary>

In symmetric algorithms, **both** of the sender and the receiver know the key: k.

* **A** use an algorithm C to encrypt the message with the key k, generating a cipher (`message encrypté`) c : `c = C(k, m)`
* **B** use an angorithm D to decrypt the message with the same key k : `m = D(k, c)`
</details>

<details class="details-e">
<summary>Asymmetric algorithms</summary>

...
</details>

<hr class="sl">

## Caesar, and Substitution cipher

<details class="details-e">
<summary>Caesar cipher (<code>Code de César</code>)</summary>

Caesar was replacing letters like this $a \to d,\ b \to e,\ ...,\ z \to c$. Each letter is associated with another one "k" letters forward (k=3 in the previous example), modulus the number of letters (26). To decrypt, for each letter, go backward by "k" letters to get back the decrypted letter.

* **Possible values for k**: $26$
* **Secure**: weak
  * Bruteforce attack
  * Entropy attack
* **Try it online**: [Caesar cipher online (cryptii.com)](https://cryptii.com/pipes/caesar-cipher)

</details>

<details class="details-e">
<summary>Substitution cipher</summary>

On the same idea as the caesar cipher, the **substitution cipher** is associating each letter by another like $a \to w,\ b \to e,\ etc.$. The key is a dictionary of 26 letters (a-z).

* **Possible values for k**: $26! ≈ 2^{88.4}$
* **Secure**: weak
    * Entropy attack
</details>

<hr class="sr">

## One Time Pad (OTP)

...

<hr class="sl">

## Main idea

You will **encrypt** your **message** with a **key** using an **algorithm**, generating a **cipher** (`message encrypté`): $E(\text{key}_1, \text{message})=^{algo}c$. The receiver will receive your **cipher**, decrypt it using a **key** and **an algorithm**: $D(\text{key}_2, c)=^{algo}\text{message}$.

* **Note**: $k_1$ should be different from $k_2$ <small>(otherwise, it will be broken)</small>
* **Note**: The algorithm is well-known <small>(ex: AES, DES, RSA, SSL, ...)</small>

We will use the terms

* **public key**: a key used to encrypt a message that is shared with everyone. Only the one generating the key is supposed to be able to decrypt a message.
* **private key**: a key associated with the public key, not shared, used to decrypt messages encrypted with the public key

<hr class="sl">

## Some algorithms

Most of them aren't used, either because they are inefficient or because they were broken. You can move to the next section if you are not interested 🧐.

<details class="details-e">
<summary>Vigenère cipher (<code>Cryptage en bloc de Vigenère</code>)</summary>

This is the same as the Caesar cipher/Substitution cipher. We are working on letters. But, this time we are splitting letters into groups. The problem is that if we got the key, we can easily get back the message.

* **message**: `memorize`
* **key**: `vgn`
* **cipher text**: `memorize+vgnvgnv=hkzjxvuk`
  * $M=12$, $V=21$, $12+21=33\equiv 7\ (mod\ 26)=H$
  * $E=4$, $G=6$, $4+6=10\equiv 10\ (mod\ 26)=K$
  * $M=12$, $N=13$, $12+13=25\equiv 25\ (mod\ 26)=Z$
  * ...
* **decrypt**: `hkzjxvuk+vgnvgnv=memorize`
  * $H=7$, $V=21$, $7 - 21 + 26 \equiv 12\ (mod\ 26)=M$
  * $K=10$, $G=6$, $10 - 6 + 26 \equiv 4\ (mod\ 26)=E$
  * $Z=25$, $N=13$, $25 - 13 + 26 \equiv 12\ (mod\ 26)=M$
  * $J=9$, $V=21$, $9 - 21 + 26 \equiv 14\ (mod\ 26)=O$
  * ...
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

You got a "bag/Knapsack" of numbers (ex: 23, 5, 11, 2, 55). Your message is made of `0` and `1`, and using this method `1` means you picked something from the bag, `0` means you didn't. Then, make the sum of the numbers you picked in the bag to create the **cipher**. Note that you **will have to split the message into groups** having the size of the knapsack.

* **Knapsack** (private key): $2, 5, 11, 23, 55$ (up to you, size=6)
* **Message**: $1100111001 = 11001\ 10001$ (group of 6)
* **Cipher**
  * $2 + 5 + 0 + 0 + 55 = 62$ (first group)
  * $2 + 0 + 0 + 0 + 55 = 57$ (second group)
* **Cipher text**: $62, 57$

But, it is too easy to find what generated this cipher. So we are using the **super-increasing knapsack problem** to **generate a public key**, and **this easy key as the private key**. We will pick a value $N$ greater than the sum of the values in the Knapsack, and a number $W$, so that $N \wedge W|1$ (=no common divisor aside 1).

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