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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [old](_old.md)
* Microsoft System Center Configuration Manager (SCCM)
* Namespace
</div><div>
</div></div>
