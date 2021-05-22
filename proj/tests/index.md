# Tests

You must do some tests in order to check
if your code, or a project is working correctly.
In futures versions, they might help you find
some bugs.

But in order to write tests, you need to find the
part of your code needing some tests, which ones and
that can be hard.

So in this courses you will see

* the theory behind tests
* contact-programming methodology
* defensive-programming
* test-driven and behaviour-driven development
* how to find tests
* What are assertions

After learning theses, you should try writing some
tests by checking the ``tests`` part in others
languages courses such as ``Java``, `C`, `PHP`
or ``JS``. If you are aiming to learn by practicing
then language specific courses might be more of a help.

## Tests

You can be in one of those situations

* White-box testing : you know about the underlying code
* Black-box testing : you only know about things code from the documentation, meaning in and out
* Grey-box testing : we got a mix of both

More than situations, you usually choose one of theses
and write tests accordingly. Most of the time, tests
are **unit tests** : you test a part of the code.

Here some good practices before starting.

## Design by contract

You are literally writing some code while making the contract
with the caller that ``if the program (arguments, ...)
is in a correct state then after running this code it will
still be in a correct state`` : that's the contact.

So you might see one of theses words often

* ``preconditions`` : everything is correct before the call
  (attributes, parameters, ...)
* ``postconditions`` : we are assert theses after the execution
of our code
* ``invariant`` : something that won't be changed such as
counting elements in a list won't change the size of the list
  
You will have remember theses while analysis your code to find
some tests. The robustness of a function is determined by the number
of preconditions that you verified in order to make sure that
in all cases your preconditions are valid.

## Defensive programming

As see above, we are depending on the fact that some
``preconditions`` are set in order for your contact
to work. As a defensive programmer, you should
**always** test and assert that your preconditions
are correct.

* check for ``null``
* check for range (rgb : [0,255] but that may be an int)
* check for size, type, ...
* check for runtime conditions (is login called
  before logout?)
  
As a programmer, you should use some constants
like ``A_CONSTANT`` or an `enum` and not write
``"a value"`` or `5` in your code as MOST of people do.

Remember the rules

* do not trust other programmers
* do not trust the rest of the code
* do not trust data from the user
* do not trust anyone

## Find tests

The parts above are useful to understand about preconditions
and postconditions. That should help you test your code. Remember
that you must test 
* good scenarios
* bad scenarios

Here is the **RightBicep** help

* ``Right`` : is result ok, work done ?
* ``B`` : see **CORRECT**
* ``I`` : if we have a reverse method then try testing
your code with it
* ``C`` : test using others methods
* ``E`` : test errors
* ``P`` : test performances

And **CORRECT**

* ``C`` : Conform (arguments are ok)
* ``O`` : Order (in the right order)
* ``R`` : Range
* ``R`` : Reference (method reference some external code?)
* ``E`` : Empty (null)
* ``C`` : Cardinal (if changing size, still working?)
* ``T`` : time (logout called before login?)

Theses are the main questions/topics that you might
want to check.

## How should I code tests ?

We will now introduce ce ``assertion`` concept. An assert
is something that returns true if what we are asserting
is true, or an error if that's not the case.

Writing tests is usually writing a lot of functions,
usually called ``test....()`` and inside called
a lot of asserts such as ``assertTrue(a_condition_here)``.

Check out you language course now and we may have explained
how to do some tests in this language.

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