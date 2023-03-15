# Main features

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

</div><div>

<details class="details-n">
<summary>Notes Kerberos</summary>

This is the authentication system in Windows domains, replacing NetNTLM. Users will log in to the Kerberos service and receive a ticket called **Ticket Granting Ticket (TGT)**. They will use this ticket when requesting access to a share/database/... If the request is accepted, Kerberos will give them a **Ticket Granting Service (TGS)** allowing them to access the service. Then, they will use the TGS to log in to the service. No credentials are sent over the network.
</details>

</div></div>
