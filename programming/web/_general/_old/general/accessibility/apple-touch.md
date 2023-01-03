# Apple touch icon

[Go back](../index.md#websites-improvements-summary)

> "Similar to the Favicon, the Apple touch icon or apple-touch-icon.png is a file used for a web page icon on the Apple iPhone, iPod Touch, and iPad. When someone bookmarks your web page or adds your web page to their home screen, this icon is used. If this file is not found these Apple products use the screenshot of the web page, which often looks like no more than a white square."
> 
> [According to this article](https://www.computerhope.com/jargon/a/appletou.htm).

The explication was good, but I'm not using their solution as [as we have to pick multiples resolutions](https://webhint.io/docs/user-guide/hints/hint-apple-touch-icons/).

<hr class="sl">

## Solution

```html
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png" />

<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png" />
```