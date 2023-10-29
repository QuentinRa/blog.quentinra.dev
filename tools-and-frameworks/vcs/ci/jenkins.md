# Jenkins

<div class="row row-cols-lg-2"><div>

[Jenkins](https://www.jenkins.io/) <small>(21.2k ⭐)</small> is an open-source automation server. It means that it's not a server hosting code, but it can be connected to a GIT server <small>(GitLab, GitHub...)</small> to process [CI/CD](index.md) workflows.

The biggest strength of Jenkins is that it has a great number of [plugins](https://plugins.jenkins.io/), such as plugins to visualize CI results <small>(tests, coverage...)</small>.
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* master/slaves (a.k.a. workers)
* freestyle projects (web interface) vs pipeline jobs (as code)
* Jenkinsfile (groovy)
</div><div>

<details class="details-n">
<summary>Basic file</summary>

```java
pipeline {
    agent any
    stages {
        stage('xxx') {
            steps {
                git 'https://github.com/example/my-java-app.git'
                git branch: env.BRANCH_NAME, url: 'URL'
                sh 'xxx'
            }
        }
    }
}
```
</details>

<details class="details-n">
<summary>Add options</summary>

```java
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', daysToKeepStr: '7'))
    }
```
</details>

<details class="details-n">
<summary>Poll SCM or webhooks to trigger a pipeline</summary>

```java
    triggers {
        cron('H H(0-7) * * 1-5')
        webhook('')
    }
```
</details>

<details class="details-n">
<summary>Artifacts are the output of the build</summary>

```java
    post {
        always {
            junit '*.xml'
        }
        success {
            archiveArtifacts '*.xml'
        }
    }
```
</details>

<details class="details-n">
<summary>Bonus</summary>

```java
stage('xxx') {
    when {
        branch 'development'
    }
}
```

```java
// https://plugins.jenkins.io/warnings-ng/
recordIssues(
    tools: [clangTidy(pattern: 'clang-tidy-report.txt')]
)
```
</details>
</div></div>