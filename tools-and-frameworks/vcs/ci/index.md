# CI/CD workflow

<div class="row row-cols-md-2"><div>

**Continuous integration** (CI) 🏭 refers to the implementation of an ongoing workflow that is executed regularly within the development process. Common tasks often found in CI workflows:

* **Code Compilation** 📦: compile the project
* **Testing** 🧪: execute unit tests, ui tests...
* **Code analysis** 🪲: execute static and/or dynamic code analysis... to find bugs, code smells, dead code...
* **Code quality** 🫧: formatting, code style...
* ...
</div><div>

**Continuous development** (CD) 🚚 further extend it with the continuous deployment of artifacts. Common tasks are:

* **Monitoring** 📝: generate and alert about metrics such as tests failed, code analysis failed, code quality not met...
* **Documentation** 📚: deploy generated documentation website
* **Release** 🌍: deploy a release build
* ...

All tasks may be executed on-demand or on specific events.
</div></div>

<hr class="sep-both">

## Benefits

<div class="row row-cols-md-2"><div>

#### Testing

You can configure your workflow to test your code in different environments <small>(ex: Linux, Windows, macOS)</small> and using different versions of tools <small>(ex: different versions of node-js/java/...)</small>.
</div><div>

#### Isolation

Continuous workflow can work in isolated reproducible environment, hence ensuring that the code do work on other machines.

#### Save time

It may take some time to implement complex CI/CD workflows, but once implemented, it reduces the time taken to manually perform tasks that could be automated.
</div></div>