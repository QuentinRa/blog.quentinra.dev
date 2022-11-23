# alt and opt fragments

[Go back](../index.md)

The fragment <kbd>alt</kbd> (=alternatives) allows us to use an **if else**, and <kbd>opt</kbd> (= optional) is allowing you to use an **if** in a sequence diagram.

![alt](../images/u-HqA2v9B2efpStXukHqpCbCJbNGjLDmoa-oKd0iBSb8pIl9J4uioSpFKmXABInDBIxX0gfBp2b1b_Nt1abmSW9rWWm0cuHXX6DoScf1IMeAI6bgJd4g4Lg2KjDAYw4wybA0f0EG0heM0000.png)

* the ``----`` line is used each time we add an alternative
  * if there is no condition, this is an **else**
  * otherwise, this is an **else if**
* the ``[...]`` is called the **guard**, and it's the condition of the **if**/**else if**