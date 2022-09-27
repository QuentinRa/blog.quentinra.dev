# Algorithms in Cryptography

...

There are two kind of algorithms: symmetric algorithms, and asymmetric algorithms.

<details class="details-e">
<summary>Symmetric algorithms</summary>

In symmetric algorithms, **both** of the sender and the receiver know the key: k.

* **A** use an algorithm C to encrypt the message with the key k, generating a cipher (`message encrypté`) c : `c = C(k, m)`
* **B** use an angorithm D to decrypt the message with the same key k : `m = D(k, c)`
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