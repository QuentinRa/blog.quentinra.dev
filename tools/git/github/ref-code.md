# Referencing code in PR/issues

[Go back](..#advanced-concepts)

You can reference some lines of code in an issue or a pull request, as long as they are from a file in this repository.

* go to a file
* click on the line number of the line you want to reference
* you may click on a number, then another while pressing shift to select an internal
* click on "..."
* copy permalink
* then simply paste the code into an issue/pull request

This is a follow-up of this [tutorial](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-code), and officially [explained here]().

<hr class="sl">

## Referencing Markdown files

The format of a referencing link is

* "PERMALINK#LX" (a line $X$)
* "PERMALINK#LX-LY" (an interval of lines $X \to Y$)

And you can get the permalink of a file with the "..." next to "Go to file". You can "edit the file", to get the lines numbers.