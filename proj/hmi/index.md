# Human-machine interfaces

Human-machine interfaces (`IHM = Ìnterfaces Homme-machine`) are interfaces connecting the interactions between humans and machines. For instance, this could be a program or a website.

You must think a lot about how you should create one, and that's the purpose of this course.

<hr class="sl">

## Introduction

You will need

* to think about where you put the elements of your interfaces, by creating `wireframes` 
* you will need to think about what elements you need in your interfaces
* you must think about how you will sort things like your menus to make them simple and intuitive
  
A wireframe is literally a frame of your application, you can draw it by yourself or use tools like

* PowerPoint (no, don't)
* [Diagrams](https://app.diagrams.net/)
* [Sketch](https://www.sketch.com/) (macOS)
* Photoshop (paid, for professionals)
* [Justinmind](https://www.justinmind.com/) (trial available but paid, **the best of all**)
* [Moqups](https://moqups.com/) (**the best for free**, account required)
* Or simply in HTML using Bootstrap, simple and efficient (**my favorite alternative**)

You can use this great website to think about menus or make optimal choices : [optimalworkshop](https://www.optimalworkshop.com/).

<hr class="sr">

## Users

Before coding some application, you must think about what kinds of persons will use it

* Language/country
* Age
* Color-blind, partially sighted ...
* Culture
* Devices (computer? Keyboard? Mouse?)
* Screen orientation, the size on tablet/phone
* Day/Night mode
* Knowledge about computers/...
* Illiterate?

You can't make something that would be perfect for everyone, but try to make some categories of users and provide them an application, that would aim to satisfy most of their requests. For instance, you can 

* Make a website/app per country,
* Add a settings tab to enable the day/night mode,
* Think about the color-blind users when designing,
* Make your website/app responsive
* ...

<hr class="sl">

## Steps

1. Create some categories of users
2. Ask persons matching your categories where they would go to find XXX in the menus, ... to test your interface.
3. Create **UML**'s diagrams to formalize the interactions between the application and users
4. Make a static mock-up
5. Test your mock-up
6. Make a dynamic mock-up (links working, some code, ...)
7. Test again

OR you can follow my steps

1. Create a dynamic mock-up
2. And repeat these steps
    1. Test and reviews by users
    2. Filter changes to be made 
    3. Implement one or more changes

<hr class="sr">

## Jakob Nielsen

Jakob Nielsen wrote the **10 principles** that you should <s>MUST 😠</s> take into account.

1. Keep the user updated on what's happening

   > * if something is being loaded, ... tell it to the user.
   > * the user should know where he is (ex: which page?)
   > * buttons should have a visual change when they are hovered/pressed/...

2. Do not do something complex, follow the conventions

   > * ex: the close button is at the top-right of the screen
   > * Skeuomorph design: we are expecting an online book to work the same as a real one

3. Let the user be free

   > * allow the user to cancel an action
   > * user must see they can "escape"

4. Norms, directives, habits

   > * ex: we are expecting a software of the same family to be similar
   > * we are expecting a 🛒 shopping cart on a marketing website to see the list of our items

5. Prevents errors

   > * do not let the user make mistakes, you should code or use the right kind of input field if you expect a specific kind of value.
   > * asking the user confirmation might also be a good practice.
   > * you may add a small help, an example, or a message saying what you are expecting

6. Users shouldn't need to learn

   > A MCQ is easier than an open question... Make it so that the user will recognize instead of remembering. You may use a particular kind of style or you may add tips.

7. Flexibility

   > * make it easy to learn
   > * and easy for pros to skip some steps, for example using shortcuts.

8. Aesthetic

   > Do not write hundreds of words, add useless images, ... to say something that would fit in less than 10 words. **Be clear and concise**.

9. Robustness

   > You should handle any kind of error or mistake.

10. Documentation

    > As a last resort, you may add documentation for complex applications.

<hr class="sl">

## Last tips

It may be better to load everything needed at the start of the application, rather than using lazy practices and making the user wait a lot of times.

A screen will most likely have more width than height, so you should exploit the width.

If you need more than 3 clicks to do one action, and you do this action often, then you MUST re-think your interface.

<hr class="sr">

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
