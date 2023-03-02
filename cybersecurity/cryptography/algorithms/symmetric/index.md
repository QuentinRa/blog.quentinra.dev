# Symmetric algorithms

<div class="row row-cols-md-2 mt-3"><div>

Symmetric algorithms <small>(a.k.a. secret key algorithm)</small> are algorithms in which the **same key** is used to encrypt and decrypt a cypher.

🔑 The key length must be at least 128 bits to be acceptable. The longer the key, the more secure the encryption.
</div><div>

**Encryption**: we generate a cypher (`c`) from a message (`m`) using a key (`k`) using an algorithm `C`: `c = C(k, m)`

**Decryption**: we generate back the message (`m`) from the cypher (`c`) using the same key (`k`) using an algorithm `D`: `m = D(k, c)`
</div></div>