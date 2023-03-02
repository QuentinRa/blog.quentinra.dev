# Symmetric algorithms

<div class="row row-cols-md-2 mt-3"><div>

Symmetric algorithms <small>(a.k.a. secret key algorithm)</small> are algorithms in which the **same key** is used to encrypt and decrypt a cypher.

🔑 The key length must be at least 128 bits to be acceptable. The longer the key, the more secure the encryption.
</div><div>

**Encryption**: we generate a cypher (`c`) from a message (`m`) using a key (`k`) using an algorithm `C`: `c = C(k, m)`

**Decryption**: we generate back the message (`m`) from the cypher (`c`) using the same key (`k`) using an algorithm `D`: `m = D(k, c)`
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
  * Bruteforce attack
  * Frequency analysis
* **Try it online** 🌍: [Caesar cipher online (cryptii.com)](https://cryptii.com/pipes/caesar-cipher)
</div></div>

<hr class="sep-both">

## Substitution cipher

<div class="row row-cols-md-2 mt-3"><div>

Similar to caesar cipher. Each letter is associated with another: $a \to w,\ b \to e,\ etc.$ The key is a dictionary of 26 letters (a-z).

**Encryption**: use the key to replace each letter

**Decryption**: apply the reverse operation 🔄️
</div><div>

* **Possible values for k** 🦄: $26! ≈ 2^{88.4}$
* **Attacks** 🧨
  * Frequency analysis
  * Cribbing attack
* **Try it online** 🌍: [Substitution cipher (dcode.fr)](https://www.dcode.fr/substitution-cipher)
</div></div>