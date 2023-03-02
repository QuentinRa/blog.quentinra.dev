# Asymmetric algorithms

<div class="row row-cols-md-2 mt-3"><div>

Asymmetric algorithms <small>(a.k.a. public-key algorithm)</small> are algorithms in which **different keys** are used to encrypt and decrypt a cypher.

👉 Used in key exchange <small>(SSL...)</small>, digital signatures...
</div><div>

**Encryption**: we generate a cypher (`c`) from a message (`m`), encrypted with a public key (`pk`) using an algorithm `C`: `c = C(pk, m)`

**Decryption**: we generate back the message (`m`) from the cypher (`c`), a private key (`sk`), and using an algorithm `D`: `m = D(sk, c)`

</div></div>