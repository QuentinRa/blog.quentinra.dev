# Generating Function Example

<hr class="sep-both">

## Dices Generating Function Example

<div class="row row-cols-lg-2"><div>

Assume we got two dices ($m=2$). Each dice range from $1$ to $6$.

<div>
\[
\begin{split}
G(x) = (\sum_{i=1}^{6} x^i) * (\sum_{i=1}^{6} x^i)\\
= (x+x^2+x^3+x^4+x^5+x^6)^2 \\
= 
x^2 + 
2 x^3 +
3 x^4 + 
4 x^5 + 
5 x^6 + 
6 x^7 + \\
5 x^8 + 
4 x^9 + 
3 x^{10} + 
2 x^{11} + 
x^{12}
\end{split}
\]
</div>

📚 You can use online tools to expand expressions <small>(ex: [wolframalpha](https://www.wolframalpha.com/input/?i=%28x%2Bx%5E2%2Bx%5E3%2Bx%5E4%2Bx%5E5%2Bx%5E6%29%5E2))</small>.
</div><div>

* $card(\text{"A=The sum is 1"}) = 1$
* ...
* $card(\text{"A=The sum is 7"}) = 6$
* $card(\text{"A=The sum is 8"}) = 5$
* ...

We are reading the coefficients to get the cardinal.
</div></div>

<hr class="sep-both">

## Cakes Generating Function Example

<div class="row row-cols-lg-2"><div>

We have $12$ cakes with different flavors: chocolate, vanilla, and strawberry. There is an equal number of cakes of each flavor.

* each person must have at least two flavors 🍰
* each person can't have chocolate more than 4 times 🍫

<div>
\[
\sum_{i=2}^{12} x^i *
\sum_{i=2}^{12} x^i *
\sum_{i=2}^{4} x^i
\]
</div>

Chocolate ranges from 2 to 4. Others range from 2 to 12. Using online tools to expand the expression, we have:

<div>
\[
x^{28} + ... + 18 x^{12} + ... + x^6
\]
</div>
</div><div>
</div></div>