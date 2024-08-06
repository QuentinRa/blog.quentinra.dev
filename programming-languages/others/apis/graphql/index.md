# GraphQL

[![graphql](../../../../cybersecurity/_badges/hacktricks/graphql.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/graphql)
[![graphql_introspection](../../../../cybersecurity/_badges/rootme/web_server/graphql_introspection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Introspection)
[![graphql_injection](../../../../cybersecurity/_badges/rootme/web_server/graphql_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Injection)
[![graphql_mutation](../../../../cybersecurity/_badges/rootme/web_server/graphql_mutation.svg)](https://www.root-me.org/fr/Challenges/Web-Serveur/GraphQL-Mutation)

<div class="row row-cols-lg-2"><div>

[GraphQL](https://en.wikipedia.org/wiki/GraphQL) (Graph Query Language) is an open-source query language for APIs. It's used by GitHub, Shopify, and Facebook internally.

* [GraphQL Documentation](https://graphql.org/) <small>(⛪)</small>
* [GitHub](https://github.com/graphql/graphql-js) <small>(19.8k ⭐)</small>

It was designed to provide a more efficient, powerful, and flexible alternative to traditional REST APIs. It solves a problem of REST APIs which is under- and over-fetching.

There is only one endpoint. We can perform multiple queries in one request. Look for: `/api/graphql`, `/graphql`, `/graphiql`, etc.

Look into the JavaScript Source Code and you may find if it's used.
</div><div>

 To query the `id,username` of the `user` with `id=123`:

```graphql
query {
  # if available, list all users as "users"
  users: user { id, username }
  # query one user
  user(id: 123) {
    id
    username
  }
}
```
</div></div>

<hr class="sep-both">

## GraphQLMap

[![graphql_introspection](../../../../cybersecurity/_badges/rootme/web_server/graphql_introspection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Introspection)
[![graphql_injection](../../../../cybersecurity/_badges/rootme/web_server/graphql_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Injection)
[![graphql_mutation](../../../../cybersecurity/_badges/rootme/web_server/graphql_mutation.svg)](https://www.root-me.org/fr/Challenges/Web-Serveur/GraphQL-Mutation)

<div class="row row-cols-lg-2"><div>

[GraphQLMap](https://github.com/swisskyrepo/GraphQLmap) <small>(1.3k ⭐, 2023 🪦)</small> was developed by the owner of PayloadsAllTheThings. It allows us to send GraphQL queries to an endpoint rather easily. It also provide a few utilities.

```shell!
$ pipx install git+https://github.com/swisskyrepo/GraphQLmap
$ pipx runpip graphqlmap install requests
$ graphqlmap -h
```

It can dump the schema and present it in a nice representation.
</div><div>

A basic usage:

```shell!
$ graphqlmap -u 'https://example.com/api/graphql' --headers '{"Authorization": "Bearer ..."}' --method POST
prompt> query { account(username: "admin") { id, username, password } }
```
</div></div>

<hr class="sep-both">

## Introspection 🗺️

[![graphql_introspection](../../../../cybersecurity/_badges/rootme/web_server/graphql_introspection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Introspection)

Introspection refer to dumping the API schema. It's often disabled in production.

<div class="row row-cols-lg-2"><div>

#### Introspection — Manual Queries

Each object has a type. Each type has attributes. The type may have a constructor with arguments that are required to query an object.

```text!
{__schema{types{name}}}
{__schema{types{name,fields{name}}}}
{__schema{types{name,fields{name},description}}}
{__schema{types{name,fields{name,args{name,description,type{name,kind,ofType{name, kind}}}}}}}
```

After identifying the types and their arguments, we can query them:

```text!
{MyType{field1, field2}}
{MyType(arg:value){field1, field2}}
```

➡️ When errors are enabled, you can receive suggestions from GraphQL like a type or attribute name that is similar to your input.
</div><div>

#### Introspection — Graphical WebUI

[GraphQL Voyager](https://graphql-kit.com/graphql-voyager/) <small>(7.7k ⭐)</small> can take the input from your introspection query or from tools such as [clairvoyance](#introspection--clairvoyance) and display it as a graph.

<br>

#### Introspection — clairvoyance

[clairvoyance](https://github.com/nikitastupin/clairvoyance) <small>(1.0k ⭐)</small> can be used to dump the schema:

```shell!
$ pipx install git+https://github.com/nikitastupin/clairvoyance
$ clairvoyance 'https://example.com/api/graphql' -o schema.json
```

</div></div>

<hr class="sep-both">

## GraphQL Injections

<div class="row row-cols-lg-2"><div>

#### GraphQL Query Injection

[![graphql_injection](../../../../cybersecurity/_badges/rootme/web_server/graphql_injection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Injection)
[![graphql_mutation](../../../../cybersecurity/_badges/rootme/web_server/graphql_mutation.svg)](https://www.root-me.org/fr/Challenges/Web-Serveur/GraphQL-Mutation)

Much like SQL, you can manipulate a query if user input is added directly to the query without any sanitization.

```graphql
query {
  product(name: "$prodname") {
    id
    name
    description
  }
}
```

The normal expected input would be:

```js!
prodname = "toy"
```

But a malicious user could use the code below. We use `#` to avoid handling the rest of the request.

```js!
username = 'toy"){\nid\n}\naccount(username:"admin"){\nid,username,password\n}#'
```

Another alternative would be to close the `query{` by using `\n}`.
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [How to exploit GraphQL endpoint: introspection, query, mutations & tools](https://www.yeswehack.com/learn-bug-bounty/how-exploit-graphql-endpoint-bug-bounty)
* [pentest101](https://escape.tech/blog/pentest101/)
* [inigo](https://inigo.io/blog/graphql_injection_attacks)
* InQL
</div><div>

Remediation

* RateLimit alone is not very useful as multiple queries in one request
* SizeLimit should be enforced to block long requests
* Access Control should be implemented (ex: JWT)
* The server should validate types and values
</div></div>