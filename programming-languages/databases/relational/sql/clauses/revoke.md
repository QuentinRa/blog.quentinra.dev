# SQL REVOKE Clause

<div class="row row-cols-md-2"><div>

The opposite of [GRANT](grant.md) to take back privilege on users/roles.

```sql!
REVOKE xxx ON sometable TO someuser;
```
</div><div>

If A granted privilege to B, but we revoke a privilege for A, then B will also be revoked, unless they still have a "granter" with the privilege.
</div></div>