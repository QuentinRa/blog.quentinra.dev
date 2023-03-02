# Asymmetric algorithms

<div class="row row-cols-md-2 mt-3"><div>

Asymmetric algorithms <small>(a.k.a. public-key algorithm)</small> are algorithms in which **different keys** are used to encrypt and decrypt a cypher.

👉 Used in key exchange <small>(SSL...)</small>, digital signatures...
</div><div>

**Encryption**: we generate a cypher (`c`) from a message (`m`), encrypted with a public key (`pk`) using an algorithm `C`: `c = C(pk, m)`

**Decryption**: we generate back the message (`m`) from the cypher (`c`), a private key (`sk`), and using an algorithm `D`: `m = D(sk, c)`
</div></div>

<hr class="sep-both">

## Knapsack problem (`sac-à-dos`) of Merkle-Hellman

<div class="row row-cols-md-2"><div>

Merkle-Hellman knapsack problem is one of the earliest public-key algorithm 🐣. The private key is a super-increasing knapsack problem, while the public key is the private key transformed enough so that it becomes a knapsack problem.

<details class="details-n">
<summary>Knapsack problem</summary>

The most know bag/knapsack problem is the **0-1 knapsack problem**. You got a "bag/Knapsack" of numbers <small>(ex: 23, 5, 11, 2, 55)</small>. Your message is made of `0`, and `1`, and using this method `1` means you picked something from the bag, `0` means you didn't. Then, make the sum of the numbers you picked in the bag to create the **cipher**. Note that you **will have to split the message into groups** having the size of the knapsack.

* **Knapsack**: $2, 5, 11, 23, 55$ (up to you, size=6)
* **Message**: $1100111001 = 11001\ 10001$ (group of 6)
* **Cipher**
    * $2 + 5 + 0 + 0 + 55 = 62$ (first group)
    * $2 + 0 + 0 + 0 + 55 = 57$ (second group)
* **Cipher text**: $62, 57$
</details>

<details class="details-n"> 
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
</div><div class="align-self-center">

* **Length of pk** 🌻: size of the backpack
* **Length of sk** 🦄: usually greater than pk
* **Attacks** 🧨
  * Cracked by Adi Shamir (1984)
  * Meet-in-the-middle attack (known plaintext attack)
  * Lattice reduction attack
* **Still used?** 🟥: no
</div></div>