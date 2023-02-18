# Tests

You must do some tests to check if your code or your project is working correctly. In futures versions, they might help you find some bugs. This is also a way to prove that your tool is working.

To write tests, you need to find the parts of your code that needs to be tested, and that can be hard. You may also have to think about what you are going to test given a function/block of code.

So in this course, you will see

* the theory behind tests
* design by contract (Contract programming)
* defensive-programming
* **test-driven** and behavior-driven development
* how to find tests
* what are **assertions**

This course will focus on the theory, but you should be able to find a section about tests, in the **Java** course, the **PHP** course, etc.

**Edit 15/07/2021**: I recently learned the notion of **coverage**. A lot of tools introduced in the Git course, inside the section about advanced concepts, are scanning your code and telling you which **paths** of your code are covered by tests. Now, I think that programmers should have a clear idea of what they have to test, and it makes things easier, as *all they have to do* now is to write the most meaningful tests 😎.

<hr class="sl">

## Testing

You can be in one of those cases

* White-box testing: you know about the underlying code
* Black-box testing: you only know about things code from the documentation, meaning the inputs and the outputs
* Grey-box testing: we got a mix of both

You will usually pick one and write your tests accordingly. Most of the time, tests are **unit tests**: you test a part of the code. Here are some good practices before starting.

<hr class="sr">

## Design by contract

You are writing some code while making the contract with the caller that 

* if the program (arguments, ...)
* is in a correct state 
* then after running this code 
* it will still be in a correct state``

So you might see one of these words often

* **Preconditions**: the conditions that must be valid before the call (attributes, parameters, ...)
* **Postconditions**: the conditions that will be valid after the execution of our code
* **Invariant**: something that won't be changed <small> (ex: when counting elements in a list, the size of the list before and after the call must be the same).</small>  

You will have to remember these while analyzing your code to find some tests. The robustness of a function is determined by the number of preconditions that you verified to make sure that, in all cases, your preconditions are valid, so your code did its job.

<hr class="sl">

## Defensive programming

As you have read above, we are relying on the fact that the **preconditions** are valid for your **postconditions** to be valid. As a defensive programmer, you should **always** test and assert that your preconditions are correct.

* check if objects/addresses are null/undefined/...
* check the range (RGB : [0,255] but that may be an int)
* check the size, the type, ...
* check runtime conditions (is login called
  before logout?)
  
As a programmer, you should use some constants or create an enum instead of writing magic constants like ``"a value"`` or `5` in your code, as MOST peoples do. You can also use named arguments instead of constants, if your language allows you to.

Remember the rules

* do not trust other programmers
* do not trust the rest of the code
* do not trust data from the user
* do not trust anyone

<hr class="sr">

## Find tests

The parts above are useful to understand preconditions and postconditions. That should help you test your code. Remember that you must test 

* good scenarios (code working)
* bad scenarios (code returning the right error code, ...)

The mnemonic **RightBicep** is summarizing what you need to check

* <kbd>Right</kbd>: is the result what we expected? Is the job done?
* <kbd>B</kbd>: see **CORRECT**
* <kbd>I</kbd> (inverse): if we have a method which is the inverse of yours, then try testing your code with it
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

These are the main questions/topics that you might want to check.

<hr class="sl">

## How should I code tests?

We will now introduce the concept of **assertions**. An assertion (assert) is something that returns true if what we are asserting is true, and raising an exception/failing otherwise.

You will usually write a lot of classes/files, having methods/functions usually called **testWhatIamTesting** and inside, you are writing some code using assertions <small>(such as ``assertTrue(a_condition_here))</small>.

You can now check out your language course, as it should be explained how to write these assertions.

<hr class="sr">

## UI testing

This is something that I wasn't aware of, as it seems developers' often forgot, but we should write the tests of our interface. 

You can write in a text file, a story of you using your app ("user story") which is a test. Write as many as needed. The tools checking the coverage of your code won't help us here. If you need to check everything, it might take a while. 

This is a compilation of notes, mainly for testing a website, but you should be able to use them everywhere.

* check for consistency
  * same menus and at the same place
  * same colors for buttons
  * same format for TITLES
* check your spelling/typos (🙄)
  * check every language, if every text is translated
  * check if the UI is still good, in every language
* check that the components are working
  * test your forms (good/bad uses)
    * required?
    * limits on size/...?
  * test for injections
  * test removing fields, is it robust?
  * test if your website is **usable** 
    * not tiring to use
    * you may check the [HMI course](../../../_it/project/hmi/index.md)
  * test that the animations are working (hover, click, ...)
* check for adaptivity (mobile, tablet, other resolutions)
  * configured to work on mobiles (the viewport line)
  * if a text is too long, is the UI going wild?
  * is a feature disabled/not available on a browser?
  * is a feature required by a browser? ([polyfill](https://polyfill.io/v3/) might help)
  * **I think** you should make sure your app is working perfectly inside ONE browser or ONE platform before targeting many of them
* other checks
  * test printing a page, is this what you expected?
  * don't forget to test error messages

You might as well use logs and check if the logs are what you expected according to the user story.

**edit 28/08/2021**: I found the website [Chromatic](https://www.chromatic.com/) which seems to provide a free tool to test your UI. I haven't tested yet. Same for [katalon](https://www.katalon.com/).

<hr class="sl">

## Test-driven development (TDD)

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

* [JUnit in Java](../../../_kmp/_archives/info/programming/java/index.md#tests-with-junit)
* [PHPUnit in PHP](../../info/php/index.md#tests-with-phpunit)
* ...

<hr class="sr">

## Behavior-driven development (BDD)

Usually, before a TDD, we do this. Not a lot of people do know of this one trough, and no many are using it. You can use this extreme-development method to think a bit more about your functions before coding. Try explaining each functionality like this

* <kbd>Given</kbd> an action done by the user
* <kbd>When</kbd> I did this action
* <kbd>Then</kbd> I will run this code
* <kbd>And</kbd> [...] will happen.

You will do that for all of your functionalities, and as always, do not forget to include the error cases. You need to think

* What my function is supposed to do?
* Will adding my function, do what we want?
* What problems adding my function might cause?

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* A/B testing
* SOLID
</div><div>


</div></div>