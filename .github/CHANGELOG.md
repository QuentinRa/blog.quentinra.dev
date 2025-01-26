# Change Log

## v6.2.0 (2025-01-25)

**Added**

* `course`: Hundreds of courses over all categories
* `feature`: Added a link to the source for each page

## v6.1.0 (2024-01-27)

**Added**

* `course`: Added "games" category
* `course`: Added "math" category
* `course`: Added "cybersecurity" category
* `course`: Hundreds of courses over all categories
* `feature`: Added Search bar
* `feature`: Badges for cybersecurity platforms
* `feature`: Added Breadcrumb navigation

**Changed**

* `rendering`: improved small screens/mobile rendering
* `internal`: removed emojis characters from URLs
* `feature`: added some redirections when courses were moved

**Removed**

* `feature`: removed the centralized to-do list

## v6.0.0 (2022-11-23)

**Major changes**

* Discontinuation of `memorize.be`
* New domain: `blog.quentinra.dev`
* Changing everything, for the last time

## v5.1.0-pre (2022-11-23)

**Added**

* `course`: Adding course "Android"
* `course`: Adding course "Kotlin"

**Changed**

* `rendering`: fix dark render not rendering background correctly

## v5.1.0 (2022-10-8)

**Added**

* `feature`: new category "cybersecurity"
* `feature`: can hide courses
* `feature`: Roadmap
* `course`: Adding course "Linux" "Linux (commands)" "Linux (Network)" "Linux (scripts)"

**Changed**

* `course`: Remade of SQL (done)
* `internal`: now the title of the page is the same as the content of the course header
* `rendering`: Markdown syntax reference 1.7

**Removed**

* category "ensiie"

## v5.0.0 (2021-11-1)

**Added**

* `feature`: new category "games"
* `feature`: adding slides (Agile-Scrum only)
* `course`: Adding course "Cryptography"
* `course`: Adding course "C++"
* `course`: Adding course "Data languages"
* `course`: Adding courses "Unity", "Unity 2D", "Unity 3D" (and many related courses)

**Changed**

* `course`: Remade of OCaml
* `course`: Remade of Agile-Scrum
* `course`: Remade of SQL (separating PL/SQL)
* `course`: Remade of PL/SQL
* `course`: Remade of NoSQL
* `internal`: updating dependencies
* `rendering`: Markdown syntax reference 1.5 and 1.6

## v5.0.0-ea (2021-09-07)

**Note**: I have temporarily disabled some courses, as I have yet to move them to v5.0.0.

**Added**

* `feature`: dark mode 🐱‍👤
* `feature`: the language of the repository is Markdown (none previously)
* `feature`: adding [CODEOWNERS](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-code-owners) file
* `feature`: adding the [Markdown syntax reference](https://memorize.be/syntax)
* `feature`: loading images and files from a CDN
* `feature`: button to add "co-author"
* `feature`: human.txt added
* `feature`: thanks and "gift" ✨ (on edit)
* `seo`: Mathjax is dynamically disabled for the pages that do not use LaTeX yet (it reduces the loading time by around 0.5s)

**Changed**

* `seo`: replacing h4 by h2 for courses in the list of courses
* `seo`: the titles and the descriptions of the pages displaying a list of courses, are now inside the JSON
* `seo`: the description and the title of each file of a course, including the main page, is now generated from the first line of the course and the first header h1.
* `internal`: preview was replaced by side-by-side (inside the editor)
* `internal`: static pages are now hosted in this repository
* `internal`: cleaning HTML files (removing tags, CSS classes)
* `internal`: moving CSS to SCSS
* `rendering`: Markdown tables border is now dark
* `rendering`: inline code is now blue (was pink/red)
* `rendering`: removing dark tables in the light version

**Fixed**

* `seo`: fixing headers missing for the associated meta tag
  * Canonical link
  * X-Robots-Tag
* `internal`: after successfully editing a course, you were sent to the wrong page (😖)
* `rendering`: I corrected the message shown if you forgot the captcha
* `rendering`: links inside a dark table are now more visible
* `internal`: go back is now dynamically replace with the URL you were on

**Removed**

* `feature`: removing `href="download:url"`, you should use the following repository [memorize-references](https://github.com/memorize-code/memorize-references).

## v4.5.0 (2021-08-20)

The website moved from `memorize.lgs-games.com` to `memorize.be` 🎉.

**Added**

* `feature`: replacing style.css by style.css.min
* `feature`: backing new websites in references
* `feature`: you can now use Markdown Tables
* `feature`: adding the pages about, privacy policy, and terms of services
* `features`: you can preview the latex inside the web editor
* `features`: the code is highlighted inside the web editor
* `features`: you can now open internal links inside the web editor
* `features`: you can now see internal images inside the web editor

**Changed**

* `seo`: cleaning and remove useless CSS
* `seo`: improving caching
* `seo`: moving to HTTP2.0
* `feature`: we are now using both Grammarly and LanguageTool to check for typos

**Fixed**

* `rendering`: some pages were too large on mobile
* `rendering`: dark reader wasn't properly rendering the website

## v4.4.2 (2021-08-10)

**Added**

* `feature`: backing new websites in memorize-references
* `seo`: make titles longer, adding an invisible h1 if a page didn't have one (:D)

**Fixed**

* `internal`: fixing the broken page (500) when an almost-valid URL was submitted
* `seo`: do not index refs.md
* `seo`: some pages were having the wrong description

## v4.4.1 (2021-08-10)

**Added**

* `rendering`: we are showing a small icon right after each header to get a permalink to it
* `seo`: almost all pages have a proper title
* `seo`: almost all pages have a canonical URL
* `seo`: we added a cache-control header
* `seo`: adding a sitemap

**Changed**

* `internal`: edit is now a button
* `seo`: we replaced the previous favicon

**Fixed**

* `rendering`: remade of the page "404 - not found"
* `internal`: the page "404 - not found" is now returning 404 (not found) instead of 200 (ok) as it was supposed to be
* `seo`: removing broken links

## v4.4.0 (2021-08-05)

**Added**

* `security`: adding new headers
  * Content-Security-Policy
  * Cross-Origin-Resource-Policy
  * Referrer-Policy
  * X-XSS-Protection
  * Permissions-Policy
* `security`: adding `rel="noopener noreferrer"`

**Changed**

* `feature`: removing /en/
* `feature`: fixing typo in header
* `seo`: backgrounds images are now .webp instead of .jpg
* `internal`: I rewrote almost all the code
* `internal`: I rewrote the README.md
* `internal`: I move to CommonMarkV2

## v4.3.2 (2021-07-31)

**Added**

* `rendering`: we are randomly picking an image as the background
* `rendering`: the code inside a dark table is now properly rendered
* `seo`: adding apple-touch icons

## v4.3.1 (2021-07-29)

**Change**

* `rendering`: we change the UI, it should be way more readable and enjoyable.

**Fixed**

* `rendering`: some images were not having a value for "alt"

## v4.3.0 (2021-07-28)

**Added**

* `feature`: this is unused, but a JSON in .summary may split the courses into arrays.
* `rendering`: hide edit on "print"
* `rendering`: images will always have a title/alt, even if they don't have one in the Markdown

**Change**

* `feature`: moving every resource or backup to memorize-references.
* `feature`: enabling latex equations inside `$$` and `@@`

## v4.2.0 (2021-06-23)

**Added**

* `feature`: adding a search bar.
* `rendering`: enabling task list in Markdown.

**Change**

* `rendering`: the footer is now "Provided by Legendary games studio / {repository_link}".

## v4.1.0 (2021-06-03)

**Added**

* `feature`: adding separators (`<div class="sl"></div>` and sr).
* `feature`: the courses of a category are in a JSON inside ".summary".
* `feature`: we can make trigger the downloading of a file using `href="download:url"`.

**Fixed**

* `rendering`: the links inside a blockquote were almost transparent, they are more visible now.

## v4.0.1 (2021-05-22)

**Added**

* `feature`: adding category "Special".

**Fixed**

* `rendering`: images are now taking up to 100% of the width (previously, they were taking their preferred size).

## v4.0.0 (2021-05-19)

I moved from ReadTheDocs, and the domains learngo/memorize. The courses aren't in RST, and I'm planning to make things easier for anyone who wants to contribute.

- The website is now in `Markdown`,
- The domain is now `memorize.lgs-games.com`,
- I made my own website,
  - We can edit a course from the website.
  - Only the courses are hosted on GitHub.
  - I'm using GitHub API to get a course.
  - I'm using League/CommonMark to parse a course.
- I'm using Grammarly to check the courses.
- The courses are in English.

## v3.0.0 (2020-10)

*Omitted*, Courses were in ReStructuredText, hosted on ReadTheDocs.

## v2.0.0 (2020-06)

*Omitted*, Courses were HTML/PHP, hosted on my personal website.

## v1.0.0 -  (2020-02)

*Omitted*, Courses were in HTML/PHP, the website was called RpgDatabase, and was only about RPG-related stuff.