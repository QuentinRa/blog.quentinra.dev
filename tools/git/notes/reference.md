# Referencing a user, an issue, or a pull request

[Go back](..#advanced-concepts)

As the title implies, you can reference a user, an issue, or a pull request inside a commit. We are usually doing this, because GitHub will add inside the issue/pull request a link to the commit. 

I took some screens of one of my repositories

![Referencing issue - GitHub](images/ref-commit.png)

![Referencing pull request - GitHub](images/ref-request.png)

How you can do that?

* each pull request/issue got an ID (ex: `#13`)
  * simply write `#13` in the message of the commit
  * GitHub will do the rest
* for a user, you have to write `@username`