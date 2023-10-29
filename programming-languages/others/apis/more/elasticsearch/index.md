# Elasticsearch

<div class="row row-cols-lg-2"><div>

[Elasticsearch](https://github.com/elastic/elasticsearch) (63.8k ⭐) is a RESTful open-source search engine with an API and clients in many languages.

You can install version 8.7 using [Docker](/operating-systems/others/virtualization/docker/index.md) as follows:

```ps
$ docker network create elastic
$ docker pull docker.elastic.co/elasticsearch/elasticsearch:8.7.0
$ docker run --name elasticsearch --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -t elasticsearch:8.7.0
# in another terminal
$ docker pull docker.elastic.co/kibana/kibana:8.7.0
$ docker run --name kibana --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:8.7.0
```

Note down the username/password and enrollment token. You can terminate both and start them again from the docker desktop app.
</div><div>

Navigate to the URL prompted by Kibana: `http://localhost:5601/?code=xxxx` or `http://localhost:5601/` afterward. You can log in from there, and access the elasticsearch dashboard.

**API notes**

Elasticsearch will ask you to [index](https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-index_.html) the searchable documents first. Once you did, you will be able to [search](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-search.html) for them.
</div></div>

<hr class="sep-both">

## Elasticsearch in PHP

<div class="row row-cols-lg-2"><div>

After setting up elasticsearch, you need to install [elasticsearch-php](https://github.com/elastic/elasticsearch-php):

```ps
$ composer require elasticsearch/elasticsearch
```

You can obtain the certificate using:

```ps
# output "http_ca.crt" in the current directory
$ docker cp elasticsearch:/usr/share/elasticsearch/config/certs/http_ca.crt .
```

The starter code would look like this:

```php!
$client = ClientBuilder::create()
    ->setHosts(['https://localhost:9200'])
    ->setBasicAuthentication('elastic', 'password here')
    ->setCABundle('path/to/http_ca.crt')
    ->build();

// version
$response = $client->info();
echo $response['version']['number'];
```

You can index a document as follows. The `id` is optional, while both the `index` and the `body` are up to you, and it can be JSON too.

```php!
$client->index([
    'id'=>'some_id_here',
    'index'=>'some_index_here',
    'body'=> [
        "xxx" => "I want to say 'Hello, World'!"
    ],
]);
```
</div><div>

To search for something, you can use `query.match` with `xxx` a key from the user-defined `body`.

```php!
$params = [
    'index' => 'same_index_as_before',
    'query' => [
        'match' => [
            'xxx' => 'hello world'
        ]
    ]
];
$response = $client->search($params);

echo "<pre>";
printf("Total docs: %d\n", $response['hits']['total']['value']);
printf("Max score : %.4f\n", $response['hits']['max_score']);
printf("Took      : %d ms\n", $response['took']);
print_r($response['hits']['hits']); // documents
echo "</pre>";
```

You can delete all documents in an index using:

```php!
$client->deleteByQuery([
    'index' => 'same_index_as_before',
    'body'=> [
        'query' => ['match_all' => (object)[]]
    ]
]);
```
</div></div>