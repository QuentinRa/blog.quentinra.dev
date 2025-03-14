# Apache CouchDB

[![5984_pentesting_couchdb](../../../../cybersecurity/_badges/hacktricks/network_services_pentesting/5984_pentesting_couchdb.svg)](https://book.hacktricks.xyz/network-services-pentesting/5984-pentesting-couchdb)
[![couch](../../../../cybersecurity/_badges/thm-p/couch.svg)](https://tryhackme.com/r/room/couch)

<div class="row row-cols-lg-2"><div>

[Apache CouchDB](https://docs.couchdb.org/en/stable/) is an open-source NoSQL database implement the document-based model store with JSON documents.

* [GitHub Repository](https://github.com/apache/couchdb) <small>(6.4k ⭐)</small>
* **Port(s)** 🐲: 5984 <small>(HTTP)</small>, 6984 <small>(HTTPS)</small>

The database may have a management page at `/_utils`.
</div><div>

Common endpoints:

* `/_all_dbs`: list all databases
* `/<db_name>/_all_docs`: list all documents IDs
* `/<db_name>/<doc_id>`: fetch a document
* ...
</div></div>