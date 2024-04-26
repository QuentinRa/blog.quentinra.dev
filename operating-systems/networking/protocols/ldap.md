# LDAP

[![attacking_common_applications](../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)

<div class="row row-cols-lg-2"><div>

Lightweight Directory Access Protocol (LDAP) is a protocol used for accessing and managing directory information services.

It's commonly associated with [Active Directory](/operating-systems/cloud/active-directory/_knowledge/index.md) and [openldap](https://www.openldap.org/), which are directory, e.g. databases optimized for read-heavy access.

🐊️ **Ports**: 389 <small>(TCP)</small>

🔥 LDAP communications are not encrypted.

🔒 There is a secure version called LDAPS <small>(port 636, over SSL/TLS)</small>.
</div><div>

LDAP is derived from the X.500 standards. Messages exchanged between LDAP clients and servers are encoded using ASN.1.

A simple un-encoded LDAP message:

```text!
cn=John Doe,ou=Users,dc=example,dc=com
```
</div></div>

<hr class="sep-both">

## LDAP Queries 🛣️

[![attacking_common_applications](../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

<div class="row row-cols-lg-2"><div>

LDAP is using parenthesis `(` and `)` to group expressions.

```md!
(objectClass=user)
```

The star (`*`) refers to "any" string.

```md!
(cn=*doe*)
```

We can use `&` and `|` for logical 'AND' and 'OR.'

```md!
(&(objectClass=user)(sAMAccountName=aaa))
(|(sn=xxx)(sn=yyy))
(&(objectCategory=person)(|(sn=xxx)(sn=yyy))(adminCount=1))
```
</div><div>

We can use [Microsoft Active Directory OIDs](https://oidref.com/1.2.840.113556.1) (or [this ref](https://ldap.com/ldap-oid-reference-guide/)) for advanced filtering. For instance, `1.2.840.113556.1.4.803` allow us to filter objects with a specific [UserAccountControl bit enabled](https://learn.microsoft.com/en-us/troubleshoot/windows-server/active-directory/useraccountcontrol-manipulate-account-properties).

📚 According to the documentation above: `(userAccountControl:1.2.840.113556.1.4.803:=32)` would match users with UAC and no password required <small>(PASSWD_NOTREQD bit)</small>.
</div></div>


<hr class="sep-both">

## LDAP Pentester Notes ☠️

<div class="row row-cols-lg-2"><div>

#### ldapsearch command

[![attacking_common_applications](../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You can use [ldapsearch](https://linux.die.net/man/1/ldapsearch) to find database entries.

```ps
$ ldapsearch -H ldap://ldap.example.com:389 -D "cn=admin,dc=example,dc=com" -w password -b "dc=example,dc=com" "(cn=John Doe)"
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "*"
$ ldapsearch -h IP -x -b "dc=example,dc=com" -s sub "(&(objectclass=user))"
```

* `-H`: use a custom socket
* `-D`/`-w`: specify authentication data
* `-x`: use basic authentication
* `-b`: indicate the root of the search

<br>

#### windapsearch command

[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)

You can use the [windapsearch.py](https://github.com/ropnop/windapsearch) <small>(0.7k ⭐, 2020 🪦)</small> script or the [go](https://github.com/ropnop/go-windapsearch) <small>(0.3k ⭐, 2021 🪦)</small> binary. They make it easier to craft LDAP requests.

```ps
$ python3 windapsearch.py --dc-ip IP -u "" -U
$ python3 windapsearch.py --dc-ip IP -u xxx@example.com -p xxx [...]
```
```ps
-PU             # user with elevated privs
-G              # groups
--da            # domain admins
--members xxx   # members of group 'xxx'
```

<br>

#### LDAP Injection

[![attacking_common_applications](../../../cybersecurity/_badges/htb/attacking_common_applications.svg)](https://academy.hackthebox.com/course/preview/attacking-common-applications)
[![ldap_injection_authentication](../../../cybersecurity/_badges/rootme/web_server/ldap_injection_authentication.svg)](https://www.root-me.org/en/Challenges/Web-Server/LDAP-injection-Authentication)

Web applications using LDAP may be vulnerable to LDAP injection. These two expressions are always true: `(cn=*)` and `(objectClass=*)`.

The most basic authentication bypass is `*` and `*` that authenticates as the first user found.
</div><div>

### LDAP Pass-back Attack

[![active_directory_enumeration_attacks](../../../cybersecurity/_badges/htb/active_directory_enumeration_attacks.svg)](https://academy.hackthebox.com/course/preview/active-directory-enumeration--attacks)
[![breachingad](../../../cybersecurity/_badges/thm/breachingad.svg)](https://tryhackme.com/r/room/breachingad)
[![return](../../../cybersecurity/_badges/htb-p/return.svg)](https://app.hackthebox.com/machines/Return)

LDAP Pass-back attack is possible when we have access to the LDAP configuration from a web interface of a device.

We may be able to make the device send its LDAP requests to US by changing the LDAP server IP to ours.

We can set up a [responder](/cybersecurity/red-team/tools/utilities/networking/responder.md), but it doesn't always work.

```shell!
$ sudo responder -I lo # and simulate a device sending cleartext credentials:
$ ldapsearch -x -LLL -H ldap:// -D "bind_dn" -w "password" -b "base_dn" -s sub "(uid=username)"
```

Some devices may be vulnerable to downgrade attacks and can even send cleartext credentials. Responder *may not* be able to do that, so we may need to run our own LDAP server:

```shell!
$ sudo apt-get update && sudo apt-get -y install slapd ldap-utils && sudo systemctl enable slapd
$ sudo dpkg-reconfigure -p low slapd
$ cat changes.lidf
dn: cn=config
changetype: modify
replace: olcLogLevel
olcSaslSecProps: noanonymous,minssf=0,passcred
$ sudo ldapmodify -Y EXTERNAL -H ldapi:// -f changes.lidf
$ sudo cat /etc/ldap/slapd.d/cn=config.ldif # OK?
$ sudo service slapd restart
$ sudo service slapd stop
```

<details class="details-n">
<summary>LDAP Server On Docker</summary>

We can use [docker-ldap](https://github.com/osixia/docker-openldap) <small>(3.9k ⭐)</small>, but I failed to configure it to only allow cleartext authentication.

```dockerfile!
FROM osixia/openldap

ENV LDAP_ORGANISATION="My Organization" \
    LDAP_DOMAIN="za.tryhackme.com" \
    LDAP_ADMIN_PASSWORD="admin_password"

# Import LDIF modifications
ENV CONFIG_PATH="/container/service/slapd/assets/config/bootstrap/ldif"
RUN rm -rf ${CONFIG_PATH}/*
COPY config.ldif ${CONFIG_PATH}/01-config-password.ldif
RUN echo "" > ${CONFIG_PATH}/02-security.ldif
```

As for `config.ldif`, the code below is incorrect:

```text!
dn: cn=config
changetype: modify
add: olcSaslSecProps
olcSaslSecProps: noanonymous,minssf=0,passcred
```

Build with:

```ps
$ docker build . -t xxx:v0.01 --no-cache
$ docker run --name xxx -p 389:389 -d xxx:v0.01
```

Test with:

```ps
$ ldapsearch -H ldap:// -x -LLL -s base -b "" supportedSASLMechanisms
```
</details>

<br>

#### Additional Notes

You can use [nxc](/cybersecurity/red-team/tools/cracking/auth/nxc.md) for many operations, such as to collect everything for bloodhound, enumerate users, etc.

Refer to [Active Directory Pentest LDAP](/operating-systems/cloud/active-directory/security/index.md#pentester--ldap-access) for additional notes.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* On Legacy systems, anyone can initiate LDAP requests. It seems to be called LDAP null bind.
* `CN=Users,DC=INLANEFREIGHT,DC=LOCAL`

Discovery <small>(Linux OpenLDAP and AD have different schemas)</small>

```shell!
$ cat newou.ldif
dn: ou=NewOU,dc=domain,dc=local
changetype: add
objectClass: organizationalUnit
ou: NewOU
$ ldapmodify -H ldap:// -x -D "cn=admin,dc=rootme,dc=local" -w 'xxx' -f newou.ldif
$ ldapsearch -H ldap:// -x -b "" -s base namingContexts
$ ldapsearch -H ldap:// -x -D "cn=admin,dc=domain,dc=local" -w 'xxx' -b "dc=domain,dc=local" -s sub "*"
$ ldapadd -H ldap:// -x -D "cn=admin,dc=domain,dc=local" -w 'xxx' -f user.ldif
```

</div><div>

[![windows_ldap_user_kerberoastable](../../../cybersecurity/_badges/rootme/forensic/windows_ldap_user_kerberoastable.svg)](https://www.root-me.org/en/Challenges/Forensic/Windows-LDAP-User-KerbeRoastable)
[![windows_ldap_user_asreproastable](../../../cybersecurity/_badges/rootme/forensic/windows_ldap_user_asreproastable.svg)](https://www.root-me.org/en/Challenges/Forensic/Windows-LDAP-User-ASRepRoastable)

* [ldap2json](https://github.com/p0dalirius/ldap2json)

```shell!
$ DEST="$HOME/tools/ldap2json"
$ git clone -b "master" https://github.com/p0dalirius/ldap2json $DEST
$ python $DEST/analysis/analysis.py -f xxx.json
analysis> searchbase CN=YYY,DC=example,DC=com
analysis> object_by_property_name servicePrincipalName
analysis> object_by_property_name userAccountControl
analysis> object_by_dn CN=XXX,CN=YYY,DC=example,DC=com # to get all information
```
</div></div>