# Cramer formula

[Go back](../index.md)

``Requirement`` : Matrix invertible

``Process``

* calculate the determinant ``d``

    * for a 1x1 matrix it's ``a``
    * for a 2x2 matrix it's ``ac-bd``
    * for a 3x3 matrix it's ``e1 * det(...) - e2 * det(...) + e3 * (...)``
    * you may refer to matrix course if you don't remember
    
* then for each column of your matrix ``A``

    * replace a column with ``b`` vector
    * evaluates determinant, ``dx`` for the column of x variable
    * then ``x`` value would be `dx / d`
    
``Note`` : **Do not use this !**, not efficient at all.