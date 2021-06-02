# Actions

[Go back](..)

Actions are some code that is run each
time you make a commit.

For instance, you could create an action
that will verify that your code compiles on
some specific platform that you configured
and return a ``cross`` if a test failed.

I don't know much about complex actions but
but you can check
[github actions](https://github.com/features/actions)
and [github actions tutorial](https://docs.github.com/en/actions/quickstart).

## Action : CodeQL

Allow you to analyze your code, here is my file
for a java project that would be stored at ``.github/workflows/codeql-analysis.yml``.
Github generates most of content of the file.

```yaml
# For most projects, this workflow file will not need changing; you simply need
# to commit it to your repository.
#
# You may wish to alter this file to override the set of languages analyzed,
# or to provide custom queries or build logic.
name: "CodeQL"

on:
  push:
    branches: [master]
  pull_request:
    # The branches below must be a subset of the branches above
    branches: [master]
  schedule:
    - cron: '0 4 * * 5'

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest

    strategy:
      fail-fast: false
      matrix:
        # compile in java
        language: ['java']
        # version 11
        java: [11]
    steps:
    
    # get our repository
    - name: Checkout repository
      uses: actions/checkout@v2
      with:
        fetch-depth: 2

    # If this run was triggered by a pull request event, then checkout
    # the head of the pull request instead of the merge commit.
    - run: git checkout HEAD^2
      if: ${{ github.event_name == 'pull_request' }}

    # run a command, here we move to test and make a git clone
    - run: cd other-repository && git clone ANOTHER_URL_HERE/repository.git
    # copy all files into other-repository, even hidden one then rm repository
    # and go back to root folder
    && cd repository/ && mv * .. && mv .git .gitignore .gradle/ .idea/ .. 
    && cd .. && rm -rf repository && cd ..

    # setup jdk since i must do it myself
    - name: Setup Java JDK
      uses: actions/setup-java@v1.4.3
      with:
        java-version: 11
        # The package type (jre, jdk, jdk+fx)
        java-package: jdk   

    # Initializes the CodeQL tools for scanning.
    - name: Initialize CodeQL
      uses: github/codeql-action/init@v1
      with:
        languages: ${{ matrix.language }}

    # Autobuild attempts to build any compiled languages  (C/C++, C#, or Java).
    - name: Autobuild
      uses: github/codeql-action/autobuild@v1

    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v1
```