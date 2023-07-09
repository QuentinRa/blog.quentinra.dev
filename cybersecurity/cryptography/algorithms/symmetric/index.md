# Symmetric algorithms

[![encryptioncrypto101](../../../_badges/thm/encryptioncrypto101.svg)](https://tryhackme.com/room/encryptioncrypto101)

<div class="row row-cols-md-2 mt-3"><div>

Symmetric algorithms <small>(a.k.a. secret key algorithm)</small> are algorithms in which the **same key** is used to encrypt and decrypt a cipher.

🔑 The key length must be at least 128 bits to be acceptable. The longer the key, the more secure the encryption.
</div><div>

**Encryption**: we generate a cipher (`c`) from a message (`m`) using a key (`k`) and an algorithm `C` giving us: `c = C(k, m)`

**Decryption**: we generate back the message (`m`) from the cipher (`c`) and the same key (`k`) using an algorithm `D` giving us: `m = D(k, c)`

➡️ They are usually faster, with a smaller key, and easier to set up.
</div></div>

<hr class="sep-both">

## Two types of algorithms 👪

<div class="row row-cols-md-2"><div>

#### Stream cipher (<code>chiffrement par flot</code>)

These algorithms encrypt the message bit by bit/byte by byte. They produce a continuous stream of encrypted data which is combined (XORed) with the plaintext to produce the ciphertext.

👉 Examples: One Time Pad, RC4...

</div><div>

#### Block cipher (<code>chiffrement par bloc</code>)

These algorithms split the message into blocks of fixed size `n`. If a block is not "full", some **padding** is added. Each block is encrypted using an algorithm, generating a block of the final ciphertext. Each key has the same length `n` as the block.

👉 Examples: ECB, AES...

➡️ Since the key, the block, and the cipher all have the same length, the output `c` can be viewed as a permutation of `m`.

➡️ `n` is usually 128 bits.
</div></div>

<hr class="sep-both">

## Caesar cipher (<code>Code de César</code>)

<div class="row row-cols-md-2 mt-3"><div>

Caesar 👑 was replacing letters such as: $a \to d,\ b \to e,\ ...,\ z \to c$. We shift each letter by amount which is the key ($k=3$ here).

**Encryption**: shift each letter $k$ times

**Decryption**: apply the reverse operation 🔄️
</div><div>

* **Possible values for k** 🦄: 26
* **Attacks** 🧨
  * Brute force attack
  * Frequency analysis
* **Try it online** 🌍: [Caesar cipher online (cryptii.com)](https://cryptii.com/pipes/caesar-cipher)
* **Still used?** 🟥: no
</div></div>

<hr class="sep-both">

## Substitution cipher (<code>Chiffrement par substitution</code>)

<div class="row row-cols-md-2 mt-3"><div>

Similar to Caesar's cipher. Each letter is associated with another: $a \to w,\ b \to e,\ etc.$ The key is a dictionary of 26 letters (a-z).

**Encryption**: use the key to replace each letter

**Decryption**: apply the reverse operation 🔄️
</div><div>

* **Possible values for k** 🦄: $26! ≈ 2^{88.4}$
* **Attacks** 🧨
  * Frequency analysis
  * Cribbing attack
* **Try it online** 🌍: [Substitution cipher (dcode.fr)](https://www.dcode.fr/substitution-cipher)
* **Still used?** 🟥: no
</div></div>

<hr class="sep-both">

## Vigenère cipher (<code>Cryptage en bloc de Vigenère</code>)

<div class="row row-cols-md-2 mt-3"><div>

This is a Caesar cipher but split into blocs. The goal was to prevent frequency analysis because the same letter will *most likely* be enciphered as different ciphertext letters.

<details class="details-n">
<summary>Example of encryption/decryption</summary>

* message ✉️: `memorize`
* key 🔑: `vgn`
* **ciphertext**: `memorize+vgnvgnv=hkzjxvuk`
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
</div><div>

* **Possible values for k** 🦄: variable
* **Attacks** 🧨
  * Kasiski examination
  * Friedman test
* **Try it online** 🌍: [Vigenère cipher (cryptii.com)](https://cryptii.com/pipes/vigenere-cipher)
* **Still used?** 🟨: yes, but in niche applications
</div></div>

<hr class="sep-both">

## One Time Pad (`Masque jetable`)

<div class="row row-cols-md-2 mt-3"><div>

The **One Time Pad**, or One Time password, abbreviated as **OTP**, is theoretically unbreakable if used correctly. It's not quite used because the key must be as long as the message.

* $C = m \oplus k$
* $D = c \oplus k$

Since both $m$ and $k$ are letters, we need to convert them to binary to use the $\oplus$ (XOR, `ou exclusif`) operator using ASCII encoding <small>(a=77)</small>.
</div><div class="align-self-center">

* **Possible values for k** 🦄: random, unique, and as long as $m$
* **Attacks** 🧨
  * Known plaintext attack
  * Key reuse/two-time pad
* **Try it online** 🌍: [One Time Pad (boxentriq.com)](https://www.boxentriq.com/code-breaking/one-time-pad)
* **Still used?** 🟨: yes, but in niche applications
</div></div>

<hr class="sep-both">

## Advanced Encryption Standard (AES)

<div class="row row-cols-md-2 mt-3"><div>

The **Advanced Encryption Standard**, abbreviated as **AES**, is a part of the **Block ciphers** algorithms.

<details class="details-n">
<summary>AES-ECB (Electronic Code Book)</summary>

Using this mode, each block is encrypted using the same key. 

* **Attacks** 🧨
  * Brute force attack
  * Known plaintext attack
  * Dictionary attack
* **Still used?** 🟨: yes, in some applications, mostly for integrity rather than confidentiality.
</details>

<details class="details-n">
<summary>AES-CBC (Cipher Block Chaining)</summary>

Using this mode with AES, we introduce a new parameter IV <small>(unique and not inferable)</small> to encrypt the first block. Then, we use the generated cipher of the previous block to encrypt the next block...

* **Attacks** 🧨
  * Padding oracle attack
  * Bit-flipping attack
* **Still used?** 🟩: yes, it's widely used, but there are better
</details>
</div><div>

* **Possible values for k** 🦄: a string of 128/192/256 bits
* **Attacks** 🧨
  * Brute force attack
  * Known plaintext attack
  * Side-channel/timing attacks
* **Try it online** 🌍: [One Time Pad (boxentriq.com)](https://www.boxentriq.com/code-breaking/one-time-pad)
* **Still used?** 🟩: yes, it's widely used <small>(AES-GCM/AES-CCM/...)</small>
</div></div>