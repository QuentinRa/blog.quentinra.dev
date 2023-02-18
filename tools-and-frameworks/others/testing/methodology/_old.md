# Testing Methodology

* **test-driven** and behavior-driven development
* how to find tests
* what are **assertions**

<hr class="sr">

## Find tests

The parts above are useful to understand preconditions and postconditions. That should help you test your code. Remember that you must test

* good scenarios (code working)
* bad scenarios (code returning the right error code, ...)

The mnemonic **RightBicep** is summarizing what you need to check

* <kbd>C</kbd>: Conform (are arguments ok?)
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