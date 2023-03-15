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

*From the users and computers tool, you can right-click on your domain, then "change domain" to manager a subdomain.*

<div class="row row-cols-md-2 mt-4"><div>

We use **Organizational Units (OUs)** 📂 to sort the great number of objects within a domain: users, computers, printers, security groups...

They are basically folders. You could have one OU per 

* 🌍 **site**: Paris, New-York, Montreal...
* 🏢 **business unit**: Direction, Marketing, IT...
* ...

🔥 For instance, inside an OU called Paris, you could have OUs for each business unit. You could also do it the other way around too.

<details class="details-n">
<summary>📂 Create an OU</summary>

* Start the **Server Manager**
* Go to Tools > Active Directory Users and Computers
* Right-click on your domain
* New > Organizational Unit
* Give it a name
</details>

<details class="details-n">
<summary>📁 Delete an OU</summary>

* Start the **Server Manager**
* Go to Tools > Active Directory Users and Computers
* Click on View > Advanced features
* Right-click on your OU
* Go to Properties > Object
* Unselect "Protect object from accidental deletion"
* Apply, then close
* Right-click on your OU, and click on delete
</details>
</div><div>

<details class="details-n">
<summary>Add an user</summary>

* Start the **Server Manager**
* Go to Tools > Active Directory Users and Computers
* Right-click on your domain
* New > User
* You must at least fill the "Full name" and the "logon" fields
* Add a password that matches your password policy
</details>

<details class="details-n">
<summary>Add a workstation</summary>

* Start the Workstation
* Go to "Advanced System Settings"
* Switch to the "Computer name" tab
* Click on "Network ID" and follow the steps

➡️ The local computer account that will be created cannot be used by users. The username is `PC_NAME_HERE$` and the password is a randomly generated string of 120 characters.
</details>

Once the workstation was added to active directory, you will be able to connect to users account created in active directory. To connect to a specific domain, use `domain\username` such as `example.com\username`.

👉 You can also use `username@domain` or the NetBios name instead of the domain giving us "`example\username`" <small>(set during the ADDS setup)</small>.

<details class="details-n">
<summary>Add a Local Administrator to a Workstation</summary>

It's a good practice to create a local administrator account in case there are issues with Active Directory or the network, and there is a need to access the computer to fix the problem.

1. Login using an Administrator account
2. Navigate to "Settings" > "Accounts" > "Other users"
3. Click on "Add someone else to this PC"
4. Select "I don't have this person's sign-in information"
5. Select "Add a user without a Microsoft account"
6. Once created, click on the newly created user
7. Click on "Change account type"
8. Select "Administrator"

➡️ If you're not connected to internet, you can skip 4 and 5.
</details>

To log in to a local account, use `.\username`.
</div></div>

<hr class="sep-both">

## Permissions

<div class="row row-cols-md-2"><div>

We usually don't apply permissions on a user, as it is not scalable. Instead, we create groups or apply permissions to OUs.

A **Security Group** 🪅 is a logical group made to grant or deny access to resources for users that are part of this group. A user can be in multiple groups. There are some builtin ones:

* `Domain Users`: every user on the domain
* `Authenticated Users`: every authenticated user on the domain
* ...

You will also create new security groups. We usually create an OU called `groups` with all security groups inside.

<details class="details-n">
<summary>Create a Security Group</summary>

* Right-click on the OU "groups"
* New > Group

To add members, either

* Right-click on the group, and select "Add to a group"
* Right-click on an object, select properties, go to "member of", and add your security group
</details>

<br>

**Delegate control**

You can delegate the control over an OU to a user, or preferably a group of users. They will be able to do administrative tasks such as:

* 🧑 create, manage, delete user accounts
* 🔑 reset user passwords <small>(ex: helpdesk)</small>
* ...

This can help reduce the workload of the sysadmins and simply processes for HR/Helpdesk/..., but can induce security risks.
</div><div>

A **Group Policy Objects (GPO)** 🦈 is a policy applied on some objects <small>(computers, users, groups, OUs...)</small>. For instance, you may want to deny access to some programs/windows features to some groups of users.

* Start the Server Manager
* Go to Tools > Group Policy Management
* Find the "Group Policy Object" folder
* Right-click on it > New and create a GPO

<p></p>

<details class="details-n">
<summary>✍️ Link a GPO</summary>

Linking a GPO mean associating the GPO with an object. Simply drag-and-drop the GPO on

* an OU
* a domain
* ...

And they will be linked. A GPO can be linked to multiple objects. When clicking on the GPO, all the links are shown in "Location". You can delete a link from there.
</details>

<details class="details-n">
<summary>🎯 Configure a GPO</summary>

After linking the GPO to a target, you may want to filter the scope of the link.

**To apply a GPO only to some groups**

* Click on a GPO
* In the tab "Scope", in "Security filtering"
* You can remove the group "Authenticated users"
* You can add groups for which the policy will be applied

**Apply a GPO to every XXX aside from YYY**

For instance, if you want to apply a policy on every group inside the OU "Paris" aside from the IT group, you can either

* ❌ add every group aside from the IT group in Security filtering, but if there is a new group, you may forget to add it
* 👍 apply the policy on every "authenticated users", and exclude the IT group.

To do that, 

* Navigate to the "Delegation tab"
* Click on "Advanced"
* Add an object to exclude <small>(ex: IT security group)</small>
* Check "deny" for the line "Apply group policy"

</details>

<details class="details-n">
<summary>🔐 Edit a GPO</summary>

Right-click on a GPO > Edit. There are two main configuration

* 💻 **Computer configuration**: applied to every computer in the scope, regardless of the user
* 🧑 **User configuration**: apply to every user in the scope, regardless of the computer

You will usually search on Google to find the setting you want. A lot of settings have moved in Windows Server 2022 <small>(it seems)</small>, so you may have to look around a bit.

<details class="details-n">
<summary>Notes to set up a password policy</summary>

* Start the **Server Manager**
* Go to Tools > Group Policy Management
* Right-click on a GPO > Edit <small>(you could create a GPO and apply it on the whole domain...)</small>

Go to Computer configuration > Policies > Windows Settings > Security Settings > Account Policy.

There, you can enable history, set password length and age <small>(ex: 6 months)</small>, enable complexity requirements, lockout...
</details>
</details>

<br>

➡️ Changes are distributed using a network share called SYSVOL (`C:\Windows\SYSVOL\sysvol\`). It may take time for the changes to be applied, but the update be forced with `gpupdate /force`.

🚀 When clicking on a GPO, in the tab "Settings", you can find what settings are changed by a policy.
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

* Active Directory Federation Services
* Active Directory Backup and Recovery
</div></div>
