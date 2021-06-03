# Tests

You must do some tests to check if your code or a project is working correctly.
In futures versions, they might help you find some bugs.

But to write tests, you need to find the
part of your code needs some tests, which ones and
that can be hard.

So in this course, you will see

* the theory behind tests
* contact-programming methodology
* defensive-programming
* test-driven and behavior-driven development
* how to find tests
* What are assertions

After learning theses, you should try writing some
tests by checking the ``tests`` part in others
languages courses such as ``Java``, `C`, `PHP`
or ``JS``. If you are aiming to learn by practicing
then language-specific courses might be more of a help.

<div class="sl"></div>

## Tests

You can be in one of those situations

* White-box testing: you know about the underlying code
* Black-box testing: you only know about things code from the documentation, meaning in and out
* Grey-box testing: we got a mix of both

More than situations, you usually choose one of these
and write tests accordingly. Most of the time, tests
are **unit tests**: you test a part of the code.

Here some good practices before starting.

<div class="sr"></div>

## Design by contract

You are writing some code while making the contract
with the caller that ``if the program (arguments, ...)
is in a correct state then after running this code it will
still be in a correct state``: that's the contact.

So you might see one of these words often

* ``preconditions``: everything is correct before the call
  (attributes, parameters, ...)
* ``postconditions``: we are asserting theses after the execution
of our code
* ``invariant``: something that won't be changed such as
counting elements in a list won't change the size of the list
  
You will have to remember these while analyzing your code to find
some tests. The robustness of a function is determined by the number
of preconditions that you verified to make sure that
in all cases your preconditions are valid.

<div class="sl"></div>

## Defensive programming

As seen above, we are depending on the fact that some
``preconditions`` are set for your contact
to work. As a defensive programmer, you should
**always** test and assert that your preconditions
are correct.

* check for ``null``
* check for range (RGB : [0,255] but that may be an int)
* check for size, type, ...
* check for runtime conditions (is login called
  before logout?)
  
As a programmer, you should use some constants
like ``A_CONSTANT`` or an `enum` and not write
``"a value"`` or `5` in your code as MOST peoples do.

Remember the rules

* do not trust other programmers
* do not trust the rest of the code
* do not trust data from the user
* do not trust anyone

<div class="sr"></div>

## Find tests

The parts above are useful to understand preconditions
and postconditions. That should help you test your code. Remember
that you must test 
* good scenarios
* bad scenarios

Here is the **RightBicep** help

* ``Right``: is the result ok? the job done?
* ``B``: see **CORRECT**
* ``I``: if we have a reverse method then try testing
your code with it
* ``C``: a test using other methods
* ``E``: test errors
* ``P``: test performances

And **CORRECT**

* ``C``: Conform (arguments are ok)
* ``O``: Order (in the right order)
* ``R``: Range
* ``R``: Reference (method reference some external code?)
* ``E``: Empty (null)
* ``C``: Cardinal (if changing size, still working?)
* ``T``: time (logout called before login?)

These are the main questions/topics that you might
want to check.

<div class="sl"></div>

## How should I code tests?

We will now introduce the ``assertion`` concept. An assert
is something that returns true if what we are asserting
is true, or an error if that's not the case.

Writing tests is usually writing a lot of functions,
usually called ``test....()`` and inside called
a lot of assertions such as ``assertTrue(a_condition_here)``.

Check out your language course now and we will explain here
how to do some tests in this language.

<div class="sr"></div>

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

<div class="sl"></div>

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

<div class="sr"></div>

## Sources

* Florent MADELAINE ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Luc HERNANDEZ ([IUT-SF](http://www.iut-fbleau.fr/) teacher)
* Quentin RAMSAMY–AGEORGES ([ENSIIE](https://www.ensiie.fr/) student)

References

* <https://luc-hermitte.developpez.com/tutoriels/c++/programmation-par-contrat/partie-1-un-peu-theorie/>
* <https://julien-blanc.developpez.com/articles/cpp/Programmation_par_contrat_cplusplus/>
* <https://www.developpez.com/actu/109767/Quelques-points-cles-sur-la-programmation-defensive-destinee-a-assurer-la-fonction-continue-d-un-logiciel-dans-des-circonstances-imprevues/>
* <https://openclassrooms.com/fr/courses/3504461-testez-linterface-de-votre-site/4270561-pourquoi-ecrire-des-tests>
* <https://duckduckgo.com/?q=d%C3%A9veloppement+pilot%C3%A9+par+les+tests&ia=web&atb=v230-1>