# Cryptography

![note: draft](https://img.shields.io/badge/note-draft-orange)

Cryptography is the knowledge related to the **encryption** and **decryption** of messages. This course is more a mathematical course than a programming course, at least for now.

<hr class="sl">

## Mathematical references

A summary of what you need to know.

<details class="details-e">
<summary>Euclidean division (<code>Division euclidienne</code>)</summary>

Dividing $a$ by $b$, mean solving $a = b * q + r$. You need to find **quotient** $q$ and the **remainder** (`reste`) $r$, with $r \lt b$. Both are unique.

We are saying that $b$ is a **divisor** of $a$ if $r = 0$, written $a\ |\ b$. It would also mean that $a$ is a multiple of $b$.

> * $25/5$: $25 = 5 * 5 + 0$ so $5|25$
> * $25/4$: $25 = 4 * 6 + 1$

</details>

<details class="details-e" open>
<summary>Greatest common divisor (<code>Plus grand diviseur commun</code>)</summary>

$D(a,b)$ is the set of the common divisors between $a$ and $b$. We are calling **greatest common divisor** (GCD or `PGCD`) the greatest value of $D(a,b)$, written $GCD(a,b)$ or $a \wedge b$.

> Example: what's the GCD of $(27, 15)$
> <p>
> \begin{split}
> D(27, 15) = D(27-15{\color{grey}*1}, 15)\\ = D(12, 15) = D(12, 15-12{\color{grey}*1})\\ = D(12, 3) = D(12-3*4, 3)\\ = D(0, 3) = 3 = 27 \wedge 15
> \end{split}
> </p>
> 
> **Formula**: $a \wedge b = (a - b * q) \wedge b$

</details>