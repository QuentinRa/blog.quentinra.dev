# Test-driven development (TDD)

This is quite a famous methodology. You will

* write your tests, before coding
* then you will write some code to pass **1** test
* then you try to pass **2** etc. until all of them passed

This may look like something easy, but you need to think about your tests while not having any classes, methods, ... at hand (since they do not exist yet). To increase your efficiency, you may follow these steps

1. create UML diagrams, like a class diagram, or use Model-driven (check UML course) to write a good class diagram
2. write your tests more easily since you got the structure
3. just repeat the usual steps
    1. code a method
    2. run tests, one less fail after each run
    3. optimize your code (beware of premature optimization)

And then you will end speeding the development through you suffered at the beginning doing some UML.

You will do that for all of your functionalities, and as always, do not forget to include the error cases. You need to think

* What my function is supposed to do?
* Will adding my function, do what we want?
* What problems adding my function might cause?