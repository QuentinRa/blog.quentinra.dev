# Change Log

## v5.5.0 (2021-08-21)

The website moved from `memorize.lgs-games.com` to memorize.be 🎉.

**Added**

* `feature`: replacing style.css by style.css.min
* `feature`: adding more backup in references
* `feature`: you can now use Markdown Tables
* `feature`: adding the pages about, privacy policy, and terms of services
* `features`: you can preview the latex inside the web editor
* `features`: the code is highlighted inside the web editor
* `features`: you can now open internal links inside the web editor
* `features`: you can now see internal images inside the web editor

**Changed**

* `seo`: cleaning and remove useless css
* `seo`: improving caching
* `seo`: moving to HTTP2.0
* `feature`: we are now using both Grammarly and LanguageTool to check for typos

**Fixed**

* `rendering`: some pages were too large on mobile
* `rendering`: dark reader wasn't properly rendering the website

## v5.4.2 (2021-08-10)

**Added**

* `feature`: some website are now backed in memorize-references
* `seo`: make titles longer, adding an invisible h1 if a page didn't have one (:D)

**Fixed**

* `internal`: fixing the broken page (500) when an almost-valid url was submitted
* `seo`: do not index refs.md
* `seo`: some page were having the wrong description

## v5.4.1 (2021-08-10)

**Added**

* `rendering`: we are showing a small icon right after each header to get a permalink to it
* `seo`: almost all pages have a proper title
* `seo`: almost all pages have a canonical url
* `seo`: we added a cache control header
* `seo`: adding a sitemap

**Changed**

* `internal`: edit is now a button
* `seo`: we replaced the previous favicon

**Fixed**

* `rendering`: remade of the 404 page
* `internal`: the 404 page is now returning 404 (not found) instead of 200 (ok) as it was supposed to be
* `seo`: removing broken links

## v5.4.0 (2021-08-05)

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

## v5.3.2 (2021-07-31)

**Added**

* `rendering`: we are randomly picking an image as the background
* `rendering`: the code inside a dark table is now properly rendered
* `seo`: adding apple touch icon

## v5.3.1 (2021-07-29)

**Change**

* `rendering`: we change the UI, it should be way more readable and enjoyable.

**Fixed**

* `rendering`: some images were not having a value for "alt"

## v5.3.0 (2021-07-28)

**Added**

* `feature`: this is unused, but a JSON in .summary may split the courses into arrays.
* `rendering`: hide edit on "print"
* `rendering`: images will always have a title/alt, even if they don't have one in the Markdown

**Change**

* `feature`: moving every resource or backup to memorize-references.
* `feature`: enabling latex equations inside `$$` and `@@`

## v5.2.0 (2021-06-23)

**Added**

* `feature`: adding a Search bar.
* `rendering`: enabling task list in Markdown.

**Change**

* `rendering`: the footer is now "Provided by Legendary games studio / {repository_link}".

## v5.1.0 (2021-06-03)

**Added**

* `feature`: adding separators (`<div class="sl"></div>` and sr).
* `feature`: the courses of a category are in a JSON inside ".summary".
* `feature`: we can make trigger the downloading of a file using `href="download:url"`.

**Fixed**

* `rendering`: a link inside a blockquote is not anymore almost transparent.

## v5.0.1 (2021-05-22)

**Added**

* `feature`: adding category "Special".

**Fixed**

* `rendering`: images are now taking up to 100% of the width (previously, they were taking their preferred size).

## v5.0.0 (2021-05-19)

I moved from ReadTheDocs, and the domains learngo/memorize. The courses aren't in RST, and I'm planning to make things easier for anyone who want to contribute.

- The website is now in `Markdown`,
- The domain is now `memorize.lgs-games.com`,
- I made my own website,
  - We can edit a course from the website.
  - Only the courses are hosted on GitHub.
  - I'm using GitHub API to get a course.
  - I'm using League/CommonMark to parse a course .
- I'm using Grammarly to check the courses.
- The courses are in English.