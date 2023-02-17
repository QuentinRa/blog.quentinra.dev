# Generating function

[Go back](..)

When dealing with combinatorics, generating functions (`Fonctions génératrices`) can make your life easier!

You will write a function, in which having $a_k * x^k$ means that

* for $n=k$
* the number of distributions is $a_k$

For instance, let's say your result is $5 x^2 + 4 x^3 + ...$ then that's means that if $n=2$ then the number of distributions is $5$...

It's usually defined like this

<div>
\[
G(x) = \sum_{k \in N} a_k * x^k
\]
</div>

<hr class="sl">

## Creating a generating function

If we got $k$ issues and $m$ experiments ($m = Card(X)$ for instance) then we would have

<div>
\[
G(x) = \prod_{j=1}^{m} \sum_{i=k_j}^{n_j} x^i
\]
</div>

* this is a product of sums
* for each value of X (indexed by $j$)
* we calculate a sum,
* from $k_j$ (the minimum of times you want this value)
* to $n_j$ (the maximum of times you want this value)
* once you multiplied and factorized the result, $a$ in $a * x^i$ is the number of distributions for $n=i$.

You may also use the other methods as explained on these websites 

* [math.mit.edu (slides)](https://math.mit.edu/research/highschool/primes/materials/2018/conf/15-1%20Manne.pdf)
* [openmathbooks (text)](http://discrete.openmathbooks.org/dmoi2/section-27.html)

<hr class="sl">

## Example (1)

Let's say you are rolling two dices. You got $m=2$ and each experiment goes from $1$ to $6$, so you have $k_1=k_2=1$ (min) to $n_1=n_2=6$ (max). We will have 

<div>
\[
\begin{split}
G(x) = (\sum_{i=1}^{6} x^i) * (\sum_{i=1}^{6} x^i)
= (x+x^2+x^3+x^4+x^5+x^6)^2 \\
= 
x^2 + 
2 x^3 +
3 x^4 + 
4 x^5 + 
5 x^6 + 
6 x^7 + 
5 x^8 + 
4 x^9 + 
3 x^{10} + 
2 x^{11} + 
x^{12}
\end{split}
\]
</div>

You can develop that easily using websites (😂) like [wolframalpha](https://www.wolframalpha.com/input/?i=%28x%2Bx%5E2%2Bx%5E3%2Bx%5E4%2Bx%5E5%2Bx%5E6%29%5E2).

If you are asked the number of issues/the cardinal

* when the sum is $7$ then it's $6$
* when the sum is $8$ then it's $4$
* ...

Okay, you could actually find that yourself like for the $sum=7$ then we have $(1,6),\ (2,5),\ (3,4)$ so that's 6 (without the order like $1+6=6+1$), but a generating function is scalable and that was not that hard (aside from developing the function 😬).

<hr class="sr">

## Example (2)

You have $n=12$ cakes (chocolate, vanilla, strawberry),

* each person must have **at least two flavors**
* and they **can't have chocolate more than 4 times**

Since we need "at least two", then $k_1=k_2=k_3=2$. Aside from $n_1$, we don't have restrictions on vanilla/strawberry, so $n_2=n_3=12$. As for chocolate, $n_1=4$ (since "up to" 4).

<div>
\[
\sum_{i=2}^{12} x^i *
\sum_{i=2}^{12} x^i *
\sum_{i=2}^{4} x^i
\]
</div>

is [evaluated (using wolframalpha 😶)](https://www.wolframalpha.com/input/?i=%28x%5E2%2Bx%5E3%2Bx%5E4%2Bx%5E5%2Bx%5E6%2Bx%5E7%2Bx%5E8%2Bx%5E9%2Bx%5E10%2Bx%5E11%2Bx%5E12%29*%28x%5E2%2Bx%5E3%2Bx%5E4%2Bx%5E5%2Bx%5E6%2Bx%5E7%2Bx%5E8%2Bx%5E9%2Bx%5E10%2Bx%5E11%2Bx%5E12%29%28x%5E2%2Bx%5E3%2Bx%5E4%29) as

@
x^{28} + ... + 18 x^{12} + ... + x^6
@

So we have 18 ways of distributing our cakes (since $n=12$). If $n=6$ then it would be 1, etc.