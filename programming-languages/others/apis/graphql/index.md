# GraphQL

<div class="row row-cols-lg-2"><div>

[GraphQL](https://en.wikipedia.org/wiki/GraphQL) (Graph Query Language) is an open-source query language for APIs. It's used by GitHub, Shopify, and Facebook internally.

* [GraphQL Documentation](https://graphql.org/) <small>(⛪)</small>
* [GitHub](https://github.com/graphql/graphql-js) <small>(19.8k ⭐)</small>

It was designed to provide a more efficient, powerful, and flexible alternative to traditional REST APIs.
</div><div>

To query the `id,username` of the `user` with `id=123`:

```graphql
query {
  user(id: 123) {
    id
    username
  }
}
```
</div></div>

<hr class="sep-both">

## Introspection 🗺️

[![graphql](../../../../cybersecurity/_badges/hacktricks/graphql.svg)](https://book.hacktricks.xyz/network-services-pentesting/pentesting-web/graphql)
[![graphql_introspection](../../../../cybersecurity/_badges/rootme/web_server/graphql_introspection.svg)](https://www.root-me.org/en/Challenges/Web-Server/GraphQL-Introspection)

<div class="row row-cols-lg-2"><div>

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
</div><div>
</div></div>