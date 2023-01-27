# Windows Active Directory (AD)

<div class="row row-cols-md-2"><div>

Microsoft Active Directory (**AD**) is used by organizations to manage their computers, users, groups, and privileges of every entity... from one computer called **Domain Controller (DC)**.

From the Domain Controller, we can open the **Active Directory Domain Service** (AD DS) from the search bar, to manage entities such as computers/users/... referred to within the application as **objects**.
</div><div>

Objects are organized into **Organizational Units (OUs)** which are basically containers. You have some default ones such as `Builtin` <small>(default groups...)</small>; `Computers`; `Domain Controllers`; `Users` and some others.

Computers are separated between Workstations <small>(the "usual" computer that the user will use to log in to the Windows domain: `DomainName\Username`)</small> and Servers.
</div></div>

<hr class="sep-both">

## Basic notes

<div class="row row-cols-md-2"><div>

**Security Principals** ([doc](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-principals))

These are objects that can be authenticated. This includes users, and computers.

For the latter, an account is automatically created with a username corresponding to the machine name appended with a dollar (`$`), while the password is a randomly generated string of 120 characters. A computer account is the local administrator of the machine.
</div><div>

**Create/Delete OUs**

* You can easily create an OUs with the Right-click menu. Usually, we create an OU matching an existing service such as `Sales`, in which we add the users in the said service.
* To delete an OUs, you first need to disable the protection against accidental removal. Click on View > Advanced Features. Then edit the properties of your OUs, and in Objects, uncheck the protection. Then, you can remove it.
</div></div>

<hr class="sep-both">

## Delegate control

<div class="row row-cols-md-2"><div>

The main use of OUs is to apply policies. For instance, you may want the user XXX to be able to perform the operation YYY on any object of a category, such as one staff being able to reset the password of any client. This is called **delegating control**.

> **Note** that policies are applied to the OU, and on any nested OU.
</div><div>

* Right-click on an organization unit (ex: regular users)
* Select "Delegate control"
* Add users that will be able to use the new privilege
* Then, press next, and select what the selected users will be able to do on the objects contained in this OU.

</div></div>

<hr class="sep-both">

## Group Policy Management

<div class="row row-cols-md-2"><div>

This is another service that can be used to manage **Security Groups**. They are used for convenience, as instead of assigning permissions to each user, we can assign permission to groups, and give groups to users.
</div><div>

**Group Policy Objects (GPO)** are a set of policies/rules that can be applied to an OU. For instance, we may want to force every user to have a password of at least $n$ characters. Inside the GPO OU, we can create our policies. The **Scope** determines where the GPO will be applied. Simply drag and drop the policies to an OU, and the OU along with every child will have the GPO applied to them. Changes are distributed to the network via a network share called SYSVOL (`C:\Windows\SYSVOL\sysvol\`). It may take time for the changes to applies, but they can be forced with `gpupdate /force`.
</div></div>

<hr class="sep-both">

## Kerberos

This is the authentication system in Windows domains, replacing NetNTLM. Users will log in to the Kerberos service and receive a ticket called **Ticket Granting Ticket (TGT)**. They will use this ticket when requesting access to a share/database/... If the request is accepted, Kerberos will give them a **Ticket Granting Service (TGS)** allowing them to access the service. Then, they will use the TGS to log in to the service. No credentials are sent over the network.

<hr class="sep-both">

## Namespace

It's possible to fragment the Windows domain into sections. We refer to the whole Windows domains as a Tree. It's possible to use multiple Windows domain, in which case the whole is called a Forest. We can establish Trust Relationships between them, allowing them to interact with each other.