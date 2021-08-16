# Tests

You must do some tests to check if your code 
or your project is working correctly.
In futures versions, they might help you find some bugs.

To write tests, you need to find 
the parts of your code that needs to be tested,
and that can be hard. 
You may also have to think about what you
are going to test given a function/bloc of code.

So in this course, you will see

* the theory behind tests
* contact-programming methodology
* defensive-programming
* **test-driven** and behavior-driven development
* how to find tests
* what are **assertions**

This course will focus on the theory, but you
should be able to find a section about tests,
in the **Java** course, the **PHP** course, etc.

**edit 15/07/2021**: I recently learned the
notion of **coverage**. A lot of tools, introduced
in the Git course, inside the fancy notes section,
are scanning your code and telling you which **paths**
of your code are covered by tests. Now, I think that
programmers should have a clear idea of what
they have to tests, and it makes things easier, 
as *all they have to do* now
is to write the most meaningful tests 😎.

<hr class="sl">

## Testing

You can be in one of those cases

* White-box testing: you know about the underlying code
* Black-box testing: you only know about things code 
  from the documentation, meaning the inputs and the outputs
* Grey-box testing: we got a mix of both

You will usually pick one and write your tests accordingly.
Most of the time, tests are **unit tests**: 
you test a part of the code.
Here are some good practices before starting.

<hr class="sr">

## Design by contract

You are writing some code while making the contract
with the caller that 

* if the program (arguments, ...)
* is in a correct state 
* then after running this code 
* it will still be in a correct state``

So you might see one of these words often

* **preconditions**: the conditions that must
  be valid before the call (attributes, parameters, ...)
* **postconditions**: the conditions that will
  be valid after the execution of our code
* **invariant**: something that won't be changed
<span class="tms">
(ex: when counting elements in a list, the size of the list before
and after the call must be the same).
<span>  

You will have to remember these while analyzing your code to find
some tests. The robustness of a function is determined by the number
of preconditions that you verified to make sure that,
in all cases, your preconditions are valid
so your code did it's job.

<hr class="sl">

## Defensive programming

As seen above, we are depending on the fact that some
**preconditions** are set for your contract
to be valid. As a defensive programmer, you should
**always** test and assert that your preconditions
are correct.

* check if objects/addresses are null/undefined/...
* check the range (RGB : [0,255] but that may be an int)
* check the size, the type, ...
* check runtime conditions (is login called
  before logout?)
  
As a programmer, you should use some constants
or enums instead of writing magik constants
like ``"a value"`` or `5` in your code as MOST peoples do.
You can also used named argument if your language
allows you to.

Remember the rules

* do not trust other programmers
* do not trust the rest of the code
* do not trust data from the user
* do not trust anyone

<hr class="sr">

## Find tests

The parts above are useful to understand preconditions
and postconditions. That should help you test your code.
Remember that you must test 

* good scenarios (code working)
* bad scenarios (code returning the right error code, ...)

The mnemonic **RightBicep** is summarize what you need
to check

* <kbd>Right</kbd>: is the result what we expected? Is the job done?
* <kbd>B</kbd>: see **CORRECT**
* <kbd>I</kbd> (inverse): if we have a method which
is the inverse of yours, then try testing your code with it
* <kbd>C</kbd> (cross-check): a test using other methods
* <kbd>E</kbd> (errors): test errors
* <kbd>P</kbd> (performance): test performances

And **CORRECT**

* <kbd>C</kbd>: Conform (are arguments ok?)
* <kbd>O</kbd>: Order (in the right order?)
* <kbd>R</kbd>: Range
* <kbd>R</kbd>: Reference (is the method referencing external code?)
* <kbd>E</kbd>: Empty (is null?)
* <kbd>C</kbd>: Cardinal (if we are changing size, is the method still working?)
* <kbd>T</kbd>: time (is logout called before login?)

These are the main questions/topics that you might
want to check.

<hr class="sl">

## How should I code tests?

We will now introduce the concept of **assertions**. 
An assert is something that returns true
if what we are asserting is true. 
Otherwise, it's raising an error.

You will usually write a lot of classes/files, having
methods/functions usually called **testWhatIamTesting**
and inside, you are writing some code using assertions
<span class="tms">(such as ``assertTrue(a_condition_here)``)</span>.

Check out your language course now, and it will be explain here
how to write these assertions.

<hr class="sr">

## Test-driven development (TDD)

You will write tests, then code and try to pass one test.
Then pass another, ... until all of them passed.

This may look like something easy, but you need 

* to think about your tests
* while not having any classes, methods, ... at hand

To do some efficient TDD, you may

1. write some UML, like a class diagram, or use Model-driven
   (check UML course) to write a good class diagram
2. write your tests easily since you got the structure
3. just repeat the usual tests

    1. code a method
    2. run tests, one less fail after each run
    3. optimize your code
    
And then you will end speeding your developments
because you suffered at the beginning doing some UML.

<hr class="sl">

## Behavior-driven development (BDD)

Usually done before TDD but not a lot of people do
know of this one. You can use this extreme-development method
to think a bit more about your functions before coding.

* ``Given`` an action done by the user
* ``When`` I do this action
* ``Then`` I will do this code
* ``And`` ... will happen.

You do that for all functionalities, normal and error cases
and you might find some things that you may have missed. You need
to think

* what my function should do?
* adding my function will do what we want?
* what problems adding my function might cause?

<hr class="sr">

## Sources

* <https://luc-hermitte.developpez.com/tutoriels/c++/programmation-par-contrat/partie-1-un-peu-theorie/>
* <https://julien-blanc.developpez.com/articles/cpp/Programmation_par_contrat_cplusplus/>
* <https://www.developpez.com/actu/109767/Quelques-points-cles-sur-la-programmation-defensive-destinee-a-assurer-la-fonction-continue-d-un-logiciel-dans-des-circonstances-imprevues/>
* <https://openclassrooms.com/fr/courses/3504461-testez-linterface-de-votre-site/4270561-pourquoi-ecrire-des-tests>
* <https://duckduckgo.com/?q=d%C3%A9veloppement+pilot%C3%A9+par+les+tests&ia=web&atb=v230-1>