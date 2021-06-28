# HMI

Human-machines interfaces are the interfaces
that the final user will use to use a program,
website, ...

You must think a lot about how you should create one,
and that's the purpose of this course.

<div class="sl"></div>

## Introduction

You will need

* to think about where you put the elements
of your interfaces, by creating ``wireframes``
* you would need to think about what elements
do you need in your interfaces
* you must think about how to sort things like
menus to make them simple and intuitive
  
A wireframe is literally a frame of your application,
you can draw it by yourself or use tools like

* powerpoint
* [diagrams](https://app.diagrams.net/)
* [sketch](https://www.sketch.com/) (macOS)
* Photoshop (paid)
* [Justinmind](https://www.justinmind.com/)
  (trial available but paid, **the best of all**)
* [moqups](https://moqups.com/) (**the best for free**, account required)
* or simply in HTML using Boostrap, simple and efficient
  (**my favorite alternative**)

You can use this great website to think about menus
or make optimal choices : [optimalworkshop](https://www.optimalworkshop.com/).

<div class="sr"></div>

## Users

Before coding some application, one must think about the
future users

* lang/country
* age
* colour-blind, partially sighted ...
* culture
* devices (computer ? keyboard ? mouse ?)
* screen orientation, size on tablet/phone
* day/night mode
* knowledge about computer/...
* illiterate ?

You can't make something that would be perfect and good for everyone
but try to make some categories of users and provide them
an application that would aim to satisfy most of their
requests.

<div class="sl"></div>

## Steps

1. create some categories of users
2. ask some real persons matching your categories
where they would go to find XXX in the menus, ...
in order to test your interface.
3. create some ``UML`` diagrams to formalize
the interactions between the application and users
4. make a static mockup
5. test your mockup
6. make a dynamic mockup (links working, some code, ...)
7. test again

OR you can follows theses steps

1. categories of users / tests on some users
2. create a dynamic mockup
3. and repeat theses steps

    1. test and reviews by users
    2. filter changes to be made 
    3. implement one or more changes

<div class="sr"></div>

## Jakob Nielsen

Because if you need more than a bit of theory,
Jakob Nielsen wrote the **10 principles** that
you MUST take into account.

1. keep the user updated on what's happening

   > * if something is being loaded, ... tell it to the user.
   > * the user should know the page where he is
   > * buttons should have a change when hovered

2. Do not do something complex, follow the conventions

   > * close is a the top-right
   > * Skeuomorph design : we are expecting a online book
   > to work like a real book

3. Let the user be free

   > * allow the user to cancel an action
   > * user must see they can escape

4. Norms, directives, habits

   > * we are expecting in a family of software
   > to be similar
   > * we are expecting a 🛒 shopping cart on a marketing
   > website to see the list of our items

5. Prevents errors

   > * do not let the user make mistakes, you should
   > code or use the right input fields if you expect
   > some value.
   > * asking the user confirmation might also
   > be a good practice.
   > * you should add a little of help or a message
   > saying what you are expecting

6. Users shouldn't need to learn

   > A MCQ is easier that an open question... Make it
   > so that the user can remember something instead
   > of learning it like using some kind of style
   > or tips.

7. Flexibility

   > * make it easy to learn
   > * and easy for pros to skip some steps, for example
   > using shortcuts.

8. Aesthetic

   > Do not write hundred of words, add useless images, ...
   > to say something that
   > would require less than five. Be clear, short and
   > concise.

9. Robustness

   > Handles all cases of errors or mistakes.

10. Documentation

    > In last resort, adding some documentation
    > for complex applications is the way to go.

<div class="sl"></div>

## Last tips

It may be better to load everything needed at the start
of the application rather that using `lazy` practices
and making the user wait a lot of times.

Screens will most likely be larger rather that longer
so you should exploit the width.

If you need more that 3 clicks to do one action, and
you do this action ofter then you MUST re-think your
interface.

<div class="sr"></div>

## Sources

* <https://fr.wikipedia.org/wiki/Skeuomorphisme>
* <https://www.nngroup.com/articles/ten-usability-heuristics/>
* <https://duckduckgo.com/?q=card+sorting&ia=web&atb=v230-1>
* <https://www.optimalworkshop.com/>
* <https://www.axure.com/>
* <https://www.sketch.com/>
* <https://www.figma.com/>
* <https://balsamiq.com/>
* <https://medium.com/sketch-app-sources/how-i-started-using-sketch-app-in-windows-756e7091b0bc>
