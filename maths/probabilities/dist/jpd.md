# Joint probability distribution

[Go back](..)

We are calling  Joint probability distribution (X,Y)
or ``loi d’un couple/conjointe``

@
\forall{i,j}\hspace{1cm} \mathbb{P}(X = x_i \cap Y = y_j)
@

<hr class="sr">

## Contingency table

When $Card(X)$ and $Card(Y)$ are small, you may
use a contingency table/`tableau à double entrées`.

We are throwing 2 dices, X = "the minimum is $x_i$"
and Y = "the maximum is $y_j$". We can
make this a table like this

<table class="table table-bordered">
    <thead>
        <tr>
            <td>X \ Y</td>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>1/36</td>
            <td>2/36</td>
            <td>2/36</td>
            <td>2/36</td>
            <td>2/36</td>
            <td>2/36</td>
        </tr>
        <tr>
            <td>2</td>
            <td>0</td>
            <td>1/36</td>
            <td>2/36</td>
            <td>2/36</td>
            <td>2/36</td>
            <td>2/36</td>
        </tr>
        <tr>
            <td>3</td>
            <td>0</td>
            <td>0</td>
            <td>1/36</td>
            <td>2/36</td>
            <td>2/36</td>
            <td>2/36</td>
        </tr>
        <tr>
            <td>4</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>1/36</td>
            <td>2/36</td>
            <td>2/36</td>
        </tr>
        <tr>
            <td>5</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>1/36</td>
            <td>2/36</td>
        </tr>
        <tr>
            <td>1</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>1/36</td>
        </tr>
    </tbody>
</table>

All values below the diagonal are 0 because
if $x_i > y_i$ then $x_i$ can't be the minimum.

For all other issues, you should remember that when
throwing 2 dices, you got 36 results like

* (1,1)
* (1,2)
* (2,1)
* (2,2)
* ...

Now for $X=1,\ Y=1$, you should ask yourself "how many
issues got two ones?". The answer is 1 so the
probability is $1/36$ for (1,1).

For $X=1,\ Y=2$, you can find two issues (1,2)
and (2,1) so that's $2/36$.