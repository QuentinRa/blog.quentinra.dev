# Doxygen

<div class="row row-cols-md-2"><div>

Doxygen is a widely used documentation generation tool, especially for C/C++ projects. It generates documentation from specially formatted comments within the source code ✨.

* [GitHub](https://github.com/doxygen/doxygen) <small>(5.0k ⭐)</small>
* [Manual](https://www.doxygen.nl/manual/index.html) <small>(⛪)</small>
* [Quick reference](https://www.mitk.org/images/1/1c/BugSquashingSeminars$2013-07-17-DoxyReference.pdf) <small>(unofficial, 💎)</small>

You can download doxygen from the [GitHub Release page](https://github.com/doxygen/doxygen/releases). You can also download the manual as a PDF from there 📚.

➡️ Doxygen folder on Windows: `C:\Program Files\doxygen\bin`.
</div><div>

To get started, generate a doxygen configuration file.

```ps
$ doxygen -g Doxyfile  # generate
$ less Doxyfile        # to look at the contents 
                       # use "more" on Windows
```

To build the documentation, use:

```ps
$ doxygen Doxyfile
```

Open the `index.html` file in your browser <small>(ex: double-click on it)</small>.
</div></div>

<hr class="sep-both">

## Doxyfile

<div class="row row-cols-md-2"><div>

The Doxyfile allows you to define doxygen settings. You can edit it manually, or you can use `doxywizard`.

```ps
$ doxywizard Doxyfile
```

The only setting that is required to set is **INPUT**. You will most likely set **EXTRACT_ALL** and maybe **GENERATE_TREEVIEW** too.


#### Project metadata

* `PROJECT_NAME = "..."`: project name
* `PROJECT_NUMBER = "..."`: a version such as `0.0.5`
* `PROJECT_BRIEF = "desc"`: project description
* `PROJECT_LOGO = "path"`: project logo

#### HTML settings

* `USE_MATHJAX = TRUE`: enable mathjax.js (for LaTeX)
* `GENERATE_TREEVIEW = YES`: add a navigation panel
* `LAYOUT_FILE = "path"`: a layout to change documentation layout
* `HTML_HEADER = ./header.html`: add your own `header.html`
* `HTML_FOOTER = ./footer.html`: add your own `footer.html`
* `HTML_EXTRA_STYLESHEET = style.css`: load a CSS file
* `HTML_EXTRA_FILES = file.js`: load a JS file
</div><div>

#### Input/Output settings

Input

* `INPUT = path` and `INPUT += path`: you need to add your source folders here for their documentation to be generated.
* `RECURSIVE = YES`: recursively browser input folders
* `EXTRACT_ALL = YES`: add to the website entries with no documentation <small>(yet?)</small>

Output

* `OUTPUT_DIRECTORY = "path"`: generate website folder
* `OUTPUT_LANGUAGE = "English"`: documentation language

Others

* `EXCLUDE = path` and `EXCLUDE += path`: exclude some path
* `IMAGE_PATH = path`: to use image in your documentation, the folder with images must be added to IMAGE_PATH.

#### Verbose

* `WARN_IF_UNDOCUMENTED`: warnings for missing documentation
* `WARN_IF_DOC_ERROR`: warnings for invalid documentation
* `QUIET = YES`: not verbose, keep it quiet
</div></div>

<hr class="sep-both">

## Getting started

<div class="row row-cols-md-2"><div>

#### File documentation

Unless using `EXTRACT_ALL`, **doxygen comments** that are **in a file with no documentation attached to it** are **ignored** ⚠️.

```cpp
/*!
* \file main.cpp
*/
```

➡️ This kind of comment is usually at the top of each file.

<br>

#### Workflow

Doxygen will parse all comments that use its syntax. Inside each comment, we can write **tags** 🏷️.

Tags can use either `\someTag` or `@someTag` syntax.

You can document absolutely everything, from `variables` to `files`, passing by `functions`, `classes`, `structures`, and `imports`...
</div><div>

#### Doxygen comments

Doxygen comments are those using one of the syntaxes below:

```cpp
/**
* Block Comment
* Above the target
*/
xxx

//! Inline Comment | Above the target
xxx

xxx //!< Inline Comment | Same line as the target
xxx /*!< Inline Comment | Same line as the target
    May be on multiple lines. */
```
</div></div>

<hr class="sep-both">

## Doxygen m.css theme

<div class="row row-cols-md-2"><div>

A popular Doxygen theme is [m.css](https://github.com/mosra/m.css) 😎. You can see what it looks like by browsing the [magnum](https://doc.magnum.graphics/magnum/) project documentation.

The documentation can be found [here](https://mcss.mosra.cz/documentation/doxygen/). You'll need [Python](/programming-languages/high-level/scripting/python/index.md).

```ps
$ pip3 install jinja2 Pygments
$ git clone http://github.com/mosra/m.css
$ cat DoxyfileMCSS
@INCLUDE                = Doxyfile
GENERATE_HTML           = NO
GENERATE_XML            = YES
XML_PROGRAMLISTING      = NO
XML_NS_MEMB_FILE_SCOPE  = YES
$ python3 m.css/documentation/doxygen.py DoxyfileMCSS
```

➡️ Note that `doxygen` must be in the PATH or the script will fail.

⚠️ **M.CSS** ignores the **EXTRACT_ALL** option. You need to comment on everything, including directories; otherwise the view will be empty.
</div><div>

🫧 You can clean `m.css` folder and only keep:

```text!
documentation
├── doxygen.py
├── favicon-dark.png
├── favicon-light.png
├── __init__.py
├── python.py
├── search.js
├── _search.py
└── templates
plugins
css
```

<details class="details-n">
<summary>Customize the navbar 🎧</summary>

The navbar is defined with two variables. You can use links or use a pre-defined name such as `pages`, `namespaces`, `annotated` or `files`.

```js!
M_LINKS_NAVBAR1 = \
"<a href=\"some_html.html\">Some text</a>" \
"pages" \
"namespaces" \
"annotated"
M_LINKS_NAVBAR2 = \
"files" \
"<a href=\"a_link\">GitHub</a>"
```
</details>
</div></div>

<hr class="sep-both">

## Common tags

<div class="row row-cols-md-2"><div>

#### File and folders

You can use:

* `\file filename`: make a file visible in the documentation. It's required if you have functions within this file.
* `\dir dirname`: make a folder visible in the documentation. 
* `\package dirname`: folders are called `packages` in object-oriented

For directories, we usually create a file `index.dox` and we put some doxygen comment inside using `\dir` tag.

#### Metadata

You can use:

* `\author name`: use it multiple times, or provide a list of authors
* `\version version`: some version, any format
* `\date d`: some date, any format

#### Semantic

Code-wise, you can use:

* `\deprecated why`: if deprecated and why
* `\bug desc`: if there is a bug, add a description
* `\note desc`: used to add informational notes

#### References

* `\see something`: tag to reference something
* `{@link something}`: macro to reference something in a description

`something` could be a file, a folder, a class...
</div><div>

#### Descriptions

Every comment may have a brief and/or a long description. The long description can be written anywhere within the comment.

```cpp
/**
 * \brief short description
 *
 * This is a long description
 * that may be on multiple lines.
 */
```

➡️ You can use [HTML](/programming-languages/web/html/index.md) in descriptions.

#### Functions

You can use `\param` for arguments:

* `\param name`: same as a parameter in
* `\param[in] name`: read-only parameter, may be `const`
* `\param[out] name`: a parameter that will be modified
* `\param[in,out] name`: a parameter that we may read and modify

And `\return` for the return type:

* `\return ...`: describe what's returned by the function
</div></div>

<hr class="sep-both">

## Tags mainly used in C

<div class="row row-cols-md-2"><div>

#### Define

```c
/**
 * \def NAME Brief description.
 * Detailed description.
 */
#define NAME VALUE
```

#### Structure

```c
/*!
 * \struct NAME
 */
struct NAME {
    int id; //!< brief description of this attribute
    char* key; /*!< @brief
        * This is a long description of this attribute
        * that I'm writing here.
        */
};
```

#### Enum

```c
/**
 * \enum NAME
 */
enum NAME {
    A_VALUE //!< brief description
};
```
</div><div>

#### typedef

It's quite common to use `typedef` with `struct` or `enum`. In such case, you must add `\typedef` must be **before** `\enum`/`struct`/...

```c
/**
 * \typedef NEW_NAME
 * \enum NAME
 */
typedef enum NAME {} NEW_NAME;

/*!
 * \typedef NEW_NAME
 * \struct NAME
 */
typedef struct NAME {
} NEW_NAME; //!< brief description of this struct
```

If the declaration and the typedef are separated:

```c
/*!
 * \typedef NEW_NAME
 */
typedef struct NAME NEW_NAME;
```
</div></div>

<hr class="sep-both">

## Object-oriented tags

<div class="row row-cols-md-2"><div>

#### Classes

```cpp
/**
 * \class ClassName
 */
class ClassName {};
```

#### Exceptions

```cpp
/**
 * \throws XXXException reason
 */
void xxx() {
    throw XXXException();
}
```
</div><div>

#### Inheritance

```cpp
/**
 * \inheritance{Parent}
 */
class Child : public Parent {}
```

#### Interfaces

```cpp
/**
 * \interface XXXInterface
 */
class XXXInterface {
    virtual void xxx() = 0;
};
```
</div></div>

<hr class="sep-both">

## Additional tags

<div class="row row-cols-md-2"><div>

#### Design By Contract

These tags are related to [Design By Contract](/tools-and-frameworks/others/testing/methodology/index.md#design-by-contract):

```c!
/**
 * \pre describe preconditions
 * \post describe postconditions
 * \invariant describe invariants
 */
```
</div><div>

#### Test cases

You can use `\test` to document test cases or test-related information.

```c!
/**
 * \test xxx
 */
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [doxygen-awesome-css](https://github.com/jothepro/doxygen-awesome-css)
</div><div>
</div></div>