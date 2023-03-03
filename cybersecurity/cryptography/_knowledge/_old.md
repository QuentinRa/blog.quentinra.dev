# Basics of Cryptography

<details class="details-e">
<summary>🧺 Prime Factorization 🧺</summary>

* **French**: `Décomposition en produit de facteurs premiers`
* **Definition**: Every number ($\ge 2$) can be expressed as a product of prime numbers
* Examples
    * $27 = 3 * 9 = 3^3$
    * $60 = 6 * 10 = 2 * 3 * 5 * 2 = 2^2 * 3 * 5$
</details>

<details class="details-e">
<summary>🐱‍🏍 Manually find $r$ for a complex $a$ 🐱‍🏍</summary>

If you need to evaluate the value $r$ given modulus $m$ **of a complex value** $a$, then simply rewrite $a$ as a product of factors, and evaluate the modulus on each one.

* Ex: $256\ \text{mod}\ 7 = 2^8 = 2^3 * 2^3 * 2^2$
  * $2^3 = 8 \equiv 1\ (\text{mod}\ 7)$
  * $2^2 = 4 \equiv 4\ (\text{mod}\ 7)$
  * Giving us $256 \equiv 1 * 1 * 4 \equiv 4 \ (\text{mod}\ 7)$
* Ex: $2021\ \text{mod}\ 3 = 2000 + 20 + 1 = 2 * 10^3 + 2 * 10^2 + 1$
  * $10 \equiv 1\ \text{mod}\ 3$
  * $10^2 = 10 * 10 \equiv 1 \ (\text{mod}\ 3)$
  * $10^3 = 10 * 10 * 10 \equiv 1 \ (\text{mod}\ 3)$
  * $2021= 2 * 1 + 2 * 1 + 1 = 5 \equiv 2 \ (\text{mod}\ 3)$

This is called **Euler theorem** ([wiki](https://en.wikipedia.org/wiki/Euler%27s_theorem)).
</details>