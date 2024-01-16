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