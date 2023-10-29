# Human-machine interfaces

<div class="row row-cols-lg-2"><div>

Human-machine interfaces (HMI, `IHM`, `Interfaces Homme-machine`) are interfaces connecting humans and machines, for instance, a mail client. More broadly, this includes any programs or websites. 

You must think a lot about how you should create one, and that's the purpose of this course. You will need to **think 🤔** about

* **where** 🗺️: layout of your application
* **what** 🗃️: which element is required, and which one isn't...
* **how** 🖇️: what are your menus, are they simple and intuitive?

We usually create a **mockup** (`maquette`) first. Each screen of the application is called **a wireframe**. Once every screen is created, you will add actions between your screens, which include stuff like what happens when the user hover/press/click/... on a button/... The final output with interconnected wireframes is called **a wireflow**.
</div><div>

You can create wireframes/wireflows using

* [Justinmind](https://www.justinmind.com/) <small>(paid, free trial, really good 🚀)</small>
* [Moqups](https://moqups.com/) <small>(free with a limit, account required, quite good 📌)</small>
* [Diagrams](https://app.diagrams.net/) <small>(fast, poor quality)</small>
* [Sketch](https://www.sketch.com/) <small>(macOS, 👻)</small>
* [Photoshop](https://www.adobe.com/products/photoshop.html) (<small>paid, for professionals)</small>
* [Bootstrap](https://getbootstrap.com/) <small>(my favorite 😍, require advanced Bootstrap+CSS skills)</small>

<br>

Other tools

* [optimalworkshop](https://www.optimalworkshop.com/) <small>(think about your menus/...)</small>
</div></div>

<hr class="sr">

## 👲 Users 👲

<div class="row row-cols-lg-2"><div>

Before coding some application, you must think about what kinds of users will use it

* Language/country
* Age
* Color-blind, partially sighted ...
* Culture
* Devices (computer? Keyboard? Mouse?)
* Screen orientation, Screen size
* Day/Night mode
* Knowledge about computers/...
* Illiterate?
</div><div>

You can't make something that would be perfect for everyone, but try to make some categories of users and provide them with an application, that would aim to satisfy most of their requests. For instance, you can

* Make a website/app per country,
* Add a settings tab to enable the day/night mode,
* Think about the color-blind users when designing,
* Make your website/app responsive
* ...
</div></div>

<hr class="sl">

## 📄 Steps 📄

<div class="row row-cols-lg-2"><div>

Usual steps

1. Create some categories of users
2. Ask people matching your categories where they would go to find XXX in the menus, ... to test your interface.
3. Create **UML**'s diagrams to formalize the interactions between the application and users
4. Make a static mock-up
5. Test your mock-up
6. Make a dynamic mock-up (links working, some code, ...)
7. Test again
</div><div>

OR you can follow my steps

1. Create a dynamic mock-up
2. And repeat these steps
   1. Test and reviews by users
   2. Sort changes to be made
   3. Implement one or more changes
</div></div>

<hr class="sr">

## Jakob Nielsen

Jakob Nielsen wrote the **10 principles** that you should <s>MUST 😠</s> take into account. See [ten usability heuristics](https://www.nngroup.com/articles/ten-usability-heuristics/).

<div class="row row-cols-lg-2"><div>

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
</div><div>

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
</div></div>

<hr class="sl">

## Additional notes

<div class="row row-cols-lg-2"><div class="mt-3">

* 🤔️ It's better to have one relatively long loading time rather than many for resources that the user is likely to request
</div><div class="mt-3">

* 🦣 A screen will most likely have more width than height, so you should exploit the width.

* 🧼 If you need more than 3 clicks to do one action, and you do this action often, then you MUST re-think your interface.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Skeuomorph
</div><div>

Tools

* [axure](https://www.axure.com/)
* [figma](https://www.figma.com/)
* [balsamiq](https://balsamiq.com/)
* [lunacy](https://icons8.com/lunacy)
* [zeplin](https://zeplin.io/)
* [avocode](https://avocode.com/)

</div></div>