# Google dorking/hacking

[![googledorking](../../../_badges/thm/googledorking.svg)](https://tryhackme.com/room/googledorking)
[![contentdiscovery](../../../_badges/thm/contentdiscovery.svg)](https://tryhackme.com/room/contentdiscovery)
[![adventofcyber4](../../../_badges/thm/adventofcyber4/day3.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Search engines are using bots, called **crawlers** to index websites. They go from one page to another, or from one website to another, by following links. The file **robots.txt** is listing the pages that "good" crawlers shouldn't index, along with the path to a file called **sitemap** which is literally a map of every page/resource of the websites, allowing crawlers to easily crawl the website.

Most search engines, Google being the most famous one, allow us to make **advanced queries**. This was known as advanced search, but some authors populazied the term **Google Dorking**.

👉 For Google, there is the [advanced search](https://www.google.com/advanced_search) page to make advanced queries, while you may also directly use special tokens in your search bar. There you can find a [long list of Google Search Operators](https://ahrefs.com/blog/google-advanced-search-operators/).

📌 [See Google Hacking Database](https://www.exploit-db.com/google-hacking-database) for juicy queries to exploit this.
</div><div>

* `site:example.com`: search only results on "example.com"
* `site:.com`: search only results on ".com" domains
* `cache:example.com`: cached versions of "example.com"
* `-word`: search results that do not have this word
* `"some word"`: search results that must have "some word"
* `filetype:pdf`: search PDF files
* `intitle:"Hello World"`: search for websites having "Hello World" in their title
* `intext: (password | passcode)`: search for a word in the text
* `inurl:admin`: search for URLs containing the word "admin"

You may also use

* `imagesize:1920x1080`: search only images on "1920 by 1080"
* `@twitter`: search results on Twitter
* `$400` or `$50..$100`: search for a price
* `#hashtag`: search for a hashtag
* `xxx OR yyy`: search both xxx and yyy
</div></div>

<hr class="sep-both">

## Examples

<div class="row row-cols-lg-2"><div>

#### Subdomains

[![subdomainenumeration](../../../_badges/thmp/subdomainenumeration.svg)](https://tryhackme.com/room/subdomainenumeration)

Find domains/subdomains of `example.com`:

```makefile!
site:example.com site:*.example.com
```
</div><div>
</div></div>