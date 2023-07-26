# Jenkins

<div class="row row-cols-md-2"><div>

[Jenkins](https://www.jenkins.io/) <small>(21.2k ⭐)</small> is an open-source automation server. It means that it's a server hosting code, but it's a server that can be integrated to a GIT server <small>(GitLab, GitHub...)</small> to process CI/CD workflows.

The biggest strength of Jenkins is that is has a great number of [plugins](https://plugins.jenkins.io/), such as plugins to visualize CI results <small>(tests, coverage...)</small>.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* master/slaves
* freestyle projects (web interface) vs pipeline jobs (as code)
* Jenkinsfile (groovy)

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

* Options

```java
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', daysToKeepStr: '7'))
    }
```
</div><div>

* Poll SCM or webhooks to trigger a pipeline

```java
    triggers {
        cron('H H(0-7) * * 1-5')
        webhook('')
    }
```

* Artifacts are the output of the build

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

Bonus:

```
stage('xxx') {
    when {
        branch 'development'
    }
}
```
</div></div>