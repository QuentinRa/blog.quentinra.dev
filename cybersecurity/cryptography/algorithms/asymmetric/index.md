# Asymmetric algorithms

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)

<div class="row row-cols-lg-2"><div>

Asymmetric algorithms <small>(a.k.a. public-key algorithm)</small> are algorithms in which **different keys** are used to encrypt and decrypt a cipher.

👉 Used in key exchange <small>(SSL...)</small>, digital signatures...
</div><div>

**Encryption**: we generate a cipher (`c`) from a message (`m`), encrypted with a public key (`pk`) using an algorithm `C`: `c = C(pk, m)`

**Decryption**: we generate back the message (`m`) from the cipher (`c`), a private key (`sk`), and using an algorithm `D`: `m = D(sk, c)`
</div></div>

<hr class="sep-both">

## Knapsack problem (`sac-à-dos`) of Merkle-Hellman

<div class="row row-cols-lg-2"><div>

Merkle-Hellman knapsack problem is one of the earliest public-key algorithms 🐣. The private key is a super-increasing knapsack problem, while the public key is the private key transformed enough so that it becomes a knapsack problem.

<details class="details-n">
<summary>Knapsack problem</summary>

The most well-known bag/knapsack problem is the **0-1 knapsack problem**. You got a "bag/Knapsack" of numbers <small>(ex: 23, 5, 11, 2, 55)</small>. Your message is made of `0`, and `1`, and using this method `1` means you picked something from the bag, `0` means you didn't. Then, make the sum of the numbers you picked in the bag to create the **cipher**. Note that you **will have to split the message into groups** having the size of the knapsack.

* **Knapsack**: $2, 5, 11, 23, 55$ (up to you, size=6)
* **Message**: $1100111001 = 11001\ 10001$ (group of 6)
* **Cipher**
    * $2 + 5 + 0 + 0 + 55 = 62$ (first group)
    * $2 + 0 + 0 + 0 + 55 = 57$ (second group)
* **Cipher text**: $62, 57$
</details>

<details class="details-n"> 
<summary>Super-increasing knapsack problem</summary>

An easy knapsack problem is the **super-increasing knapsack problem**, in which every next entry of the bag is greater than the sum of the previous terms. It makes it easy to decipher the message without the key, as if the cipher is greater than or equal to the current greatest value of the knapsack, then it is inside the knapsack of the message.

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

<details class="details-n">
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

<details class="details-n">
<summary>Public-key exchange</summary>

* **A** is generating a private-key using the super-increasing knapsack ($(2, 5, 11, 23, 55)$)
* **A** is generating a public key $(54, 22, 71, 56, 16)$, using a $N=113$, and $W=27$ that **B** knows
* **A** encrypt a message using the public key, and send the cipher text to **B**
    * $54 + 22 + 0 + 0 + 16 = 92$ (first group)
    * $54 + 0 + 0 + 0 + 16 = 70$ (second group)
    * **Cipher text**: $92, 70$
* **B** generate the private-key using the public key, and both $W$, and $N$
    * We are multiplying the public key by $W^{-1}$, modulus $N$
    * We get the private key: $2, 5, 11, 23, 55$
* **B** decrypt the message
    * We multiply the message by $W^{-1}$, modulus $N$
    * We get $62$, and $57$
    * We solve them using the super-increasing knapsack problem
    * The message was: $1100110001$
</details>
</div><div class="align-self-center">

* **Length of pk** 🌻: size of the backpack
* **Length of sk** 🦄: usually greater than pk
* **Attacks** 🧨
  * Cracked by Adi Shamir (1984)
  * Meet-in-the-middle attack (known plaintext attack)
  * Lattice reduction attack
* **Still used?** 🟥: no
</div></div>

<hr class="sep-both">

## Diffie–Hellman key exchange

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![introductiontonetworking](../../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)

<div class="row row-cols-lg-2"><div>

It allows two parties to establish a shared secret key over an insecure communication channel. It works as follows:

* Both parties agree to a large prime number **p** and a generator **g** with $(p-1) \wedge g\ |\ 1$ <small>(=the only divisor is 1)</small>
* Alice chooses a secret number **a** and computes $A = g^a\ (mod\ p)$
* Bob chooses a secret number **b** and computes $B = g^b\ (mod\ p)$
* Both exchange their computed value
* The shared key is $B^a\ (mod\ p)$ for Alice, and $A^b\ (mod\ p)$ for Bob.
</div><div>

* **Length of p** 🌻: at least 2048 bits
* **Length of each secret number** 🦄: at least as long as p
* **Attacks** 🧨
    * Man-in-the-middle attacks
    * Brute-force attacks
* **Still used?** 🟩: yes, in combination with other security mechanisms
</div></div>

<hr class="sep-both">

## Rivest–Shamir–Adleman (RSA)

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)
[![introductiontonetworking](../../../../cybersecurity/_badges/htb/introductiontonetworking.svg)](https://academy.hackthebox.com/course/preview/introduction-to-networking)

<div class="row row-cols-lg-2"><div>

* 🔨 Choose two large prime numbers: **p** and **q**
* ⛏️ Compute their product: $n = p * q$
* ⚒️ Compute phi(n): $\phi(n) = (p-1) * (q-1)$
* 🔒 Compute the exponent used for encryption **e**. $e$ must be coprime with $\phi(n)$, meaning that $gcd(k,\ \phi(n)) = 1$. It must be greater than 3, and it is usually equal to $2^{16}+1=65537$.
* 🔑 Compute the exponent used for decryption **d** using the formula: $d = e^{−1}\ mod\ \phi(n)$.

The public key is **public key is $(n,e)$**, while the **private key is $(n,d)$**.

* **Encrypt**: $C(m, n, e) = m^e\ (mod\ n)$
* **Decrypt**: $D(c, n, d) = c^d\ (mod\ n)$
</div><div>

<details class="details-n">
<summary>You can use Bezout to find $d$</summary>

You can use Bézout on $\phi(n)$, and $e$, to find $d$.

* Solve $B(k,\ \phi(n)) = e * u + phi(n) * v = 1$
* $d = u$

<details class="details-n">
<summary>Example: RSA(n=35, e=7)</summary>

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

* **Length of key** 🦄: at least 2048 bits in 2022
* **Attacks** 🧨
    * Factorization attacks
    * Brute-force attacks
    * Side-channel/timing attacks
* **Still used?** 🟩: yes, in combination with other security mechanisms

An attacker would have a lot of prime numbers to test ($10^{497}$ for $n \approx 10^{1000}$) to find back $\phi(n) = (p-1) * (q-1)$ from $n$.
</div></div>

<hr class="sep-both">

## Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### Cracking RSA

[![weak_rsa](../../../_badges/htb-c/weak_rsa.svg)](https://app.hackthebox.com/challenges/Weak%20RSA)

You can install and use [RsaCtfTool](https://github.com/RsaCtfTool/RsaCtfTool) (5.0k ⭐):

```ps
$ cd /opt
$ sudo git clone https://github.com/RsaCtfTool/RsaCtfTool.git rsactftool
$ cd rsactftool && pip install -r requirements.txt
$ sudo ln -s /opt/rsactftool/RsaCtfTool.py /usr/bin/rsactftool
$ rsactftool -h
$ rsactftool --publickey key.pub --private
$ rsactftool --publickey key.pub --private --output key.priv
```
</div><div>

...
</div></div>