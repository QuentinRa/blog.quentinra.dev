# Multiples authors

[Go back](../../../dev/git/index.md#advanced-concepts)

If you're committing someone else (=author) work (=committer), or you worked with someone else on something, you can both be attributed the commit ([source and tutorial on GitHub](https://docs.github.com/en/github/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)).

```bash
git commit -m "a short inline description

Co-authored-by: name <name@example.com>
Co-authored-by: another-name <another-name@example.com>"
```