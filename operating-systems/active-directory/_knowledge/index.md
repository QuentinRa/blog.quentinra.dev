# Active Directory (AD)

<div class="row row-cols-md-2 mt-4"><div>

Active directory is a centralized database of every network resources:

* 🖥️ Computers, Servers, Printers
* 🧑‍🍼️ Users and Groups
* 🚧️ Permissions to access files/apps/...
* ⚖️️ Policies <small>(ex: password length/...)</small>
* 🏡 Shared folders/drives
* ...

It provides services to manage and authenticate these resources. It's a centralized and highly scalable tool that is used by many large organizations <small>(with many employees, multiple offices/sites...)</small>.

➡️ LDAP is a protocol used to communicate with Active Directory.
</div><div>

**Active Directory Domain Services (ADDS)** is the main service that system admins will interact with. 📌 Because of that, Active directory and ADDS are often used interchangeably.

It's widely used to manage organisation/schools/... They can configure for each user, or groups of users

* 🎯 What files/folders/shared they can access
* 🏡 Which application they can launch
* ...
* 🌿 Basically, their permissions over every resource

🎉 For users, it's convenient, as they log in once, and from any machine over the network and access their files/...
</div></div>

<hr class="sep-both">

## Forest and domains

<div class="row row-cols-md-2"><div>

A **schema** 🪨 is a definition on an entity, such as a user. It defines its attributes such as `"Firstname"`, `"Lastname"`... A schema can be extended, meaning, we can add new attributes.

An **Object** 💰 is a concrete instance of a schema. For instance, the user "John Doe", the computer "PC-B2006-06", or the printer XXX...

A **domain** 🧵 is a logical group of objects... For instance, the domains `example.com`, `eu.example.com`, and `na.example.com`... `eu` and `na` are subdomains of `example.com`. The tree is called **domain tree** 🕸️.

👉 You should own the domain name to avoid merging problems.
</div><div>

There is at least one **Domain controller** 👑 (DC) on each domain. It's used to manage objects on the domain. They all have their own database to store information about their objects.

A **site** 🏘️ is a group of objects that are physically located in the same place, such as a branch office. We usually have one DC per site, which can mean multiple DC for one domain. The DC is replicated, and this allows faster response time, and reduce network traffic.

A **forest** 🌴  is a collection of one or more domain trees. They share a common schema, along configurations, and global catalogs.

A **global catalog** 📰 stores a copy of the most used attributes of every object, allowing us to search for object across the whole forest.
</div></div>

<hr class="sep-both">

## Getting started

<div class="row row-cols-md-2"><div>

If starting from scratch, you will create a forest 🌴, with only one domain inside 🧵, for instance, `example.com`. To do so, you will need a computer that will serve as a domain controller 👑.

You will install on this computer **Windows Server** 2019/2022/... As a student, you can get an image for free [on azure website](https://azureforeducation.microsoft.com/devtools).

➡️ If you're using Virtual Box, [see these notes](/tools-and-frameworks/others/virtualization/virtualbox/index.md#active-directory-notes).

After installing the ISO, when starting the machine, the **Server Manager** will automatically open itself. From there, you will be able to install **ADDS** and many other services/tools 📌.
</div><div>

Before installing ADDS, you should:

<details class="details-n">
<summary>Freeze and configure your server IP address</summary>

👉 This is a best practice to give a fixed IP address to your domain controller before installing ADDS.

* Control Panel
* Network and Internet
* Network And Sharing Center
* Select your network <small>(ex: Ethernet 2)</small>
* Properties > IPV4 > Properties
    * IP: X.X.X.2
    * Mask: 255.255.255.0
    * Default gateway: X.X.X.1
    * DNS: X.X.X.2
</details>

<details class="details-n">
<summary>Set your DC name</summary>

👉 This is optional too. The DC name can be used to referencing in commands. For instance, you will be able to use the name instead of the IP address.

* Click on "Local Server"
* Click on your computer name (in blue)
* Click on "Change"
* Set the name your want
* Restart
</details>

Then, you can process with the installation:

<details class="details-n">
<summary>Installation ADDS</summary>

* Start the **Server Manager**
* Click on "Add roles and features"
* Press Next twice
* In Server Roles, select ADDS
* Press Next twice, then Install
* Click on the notification icon with a warning (⚠️)
* Click on "Promote this server to a domain controller"

**Select "Add a new forest"** <small>(for your first domain controller/...)</small>

* Give a root domain name (ex: `example.com`)
* Add a "restore password"
* Press "Next" 4 times
* Press "Install"
* Done

**Select "Add a new domain to an existing forest"** <small>(to add a subdomain to an existing forest)</small>

* Click on "Select"
* Enter the `domain\username` of the parent domain. For instance, `example.com\administrator`. Select `example.com`.
* In the "New domain name", you could add `eu`.
* Process with the setup of `eu.example.com`
</details>
</div></div>

<hr class="sep-both">

## Manage users and computers

<div class="row row-cols-md-2"><div>

We use **Organizational Units (OUs)** 📂 to sort the great number of objects within a domain: users, computers, printers, security groups...

They are basically folders. You could have one OU per 

* 🌍 **site**: Paris, New-York, Montreal...
* 🏢 **business unit**: Direction, Marketing, IT...
* ...

🔥 For instance, inside an OU called Paris, you could have OUs for each business unit. You could also do it the other way around too.
</div><div>

* Start the Server Manager
* Go to Tools > Active Directory Users and Computers

<details class="details-n">
<summary>Create an OU</summary>

* Right-click on your domain
* New > Organizational Unit
* Give it a name
</details>

<details class="details-n">
<summary>Delete an OU</summary>

* Click on View > Advanced features
* Right-click on your OU
* Go to Properties > Object
* Unselect "Protect object from accidental deletion"
* Apply, then close
* Right-click on your OU, and click on delete
</details>

<details class="details-n">
<summary>Create Users</summary>

* Right-click on your domain
* New > User
* You must at least add a "Full name" and a "logon"
* Add a password that matches your password policy
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* Microsoft System Center Configuration Manager (SCCM)
* Namespace
* Change domain (users and computers)
* `gpresult /R`
</div><div>
</div></div>
