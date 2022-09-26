# Algorithms in Cryptography

...

There are two kind of algorithms: symmetric algorithms, and asymmetric algorithms.

<details class="details-e">
<summary>Symmetric algorithms</summary>

In symmetric algorithms, **both** of the sender and the receiver know the key: k.

* **A** use an algorithm C to encrypt the message with the key k, generating a cipher (`message encrypté`) c : `c = C(k, m)`
* **B** use an angorithm D to decrypt the message with the same key k : `m = D(k, c)`
</details>