# Windows Active Directory (AD)

<div class="row row-cols-md-2"><div>

**Security Principals** ([doc](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-principals))

These are objects that can be authenticated. This includes users, and computers.

For the latter, an account is automatically created with a username corresponding to the machine name appended with a dollar (`$`), while the password is a randomly generated string of 120 characters. A computer account is the local administrator of the machine.
</div><div>
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

</div><div>

**Group Policy Objects (GPO)** are a set of policies/rules that can be applied to an OU. For instance, we may want to force every user to have a password of at least $n$ characters. Inside the GPO OU, we can create our policies. The **Scope** determines where the GPO will be applied. Simply drag and drop the policies to an OU, and the OU along with every child will have the GPO applied to them. Changes are distributed to the network via a network share called SYSVOL (`C:\Windows\SYSVOL\sysvol\`). It may take time for the changes to applies, but they can be forced with `gpupdate /force`.
</div></div>

<hr class="sep-both">

## Kerberos

This is the authentication system in Windows domains, replacing NetNTLM. Users will log in to the Kerberos service and receive a ticket called **Ticket Granting Ticket (TGT)**. They will use this ticket when requesting access to a share/database/... If the request is accepted, Kerberos will give them a **Ticket Granting Service (TGS)** allowing them to access the service. Then, they will use the TGS to log in to the service. No credentials are sent over the network.

<hr class="sep-both">

## Namespace

It's possible to fragment the Windows domain into sections. We refer to the whole Windows domains as a Tree. It's possible to use multiple Windows domain, in which case the whole is called a Forest. We can establish Trust Relationships between them, allowing them to interact with each other.

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2 mt-3"><div>

Users+Computers accounts. Schema that define what is a user... Can be extended.

</div><div>

Domains: DC + Users/Computer accounts. Can create a sub-domain for another place with different policies/... Subdomain, they inherit the schema. two-way implicit transitive (trust other subdomains) trust. **Tree**. one way explicit trust (from B to A). Then B is able to use users from A, and give them permissions to access their tree.
</div></div>