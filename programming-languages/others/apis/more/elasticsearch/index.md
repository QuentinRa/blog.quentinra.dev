# Elasticsearch

<div class="row row-cols-md-2"><div>

[Elasticsearch](https://github.com/elastic/elasticsearch) (63.6k ⭐)

```
PS> docker network create elastic
PS> docker pull docker.elastic.co/elasticsearch/elasticsearch:8.7.0
PS> # docker pull elasticsearch:8.7.0
PS> docker run --name elasticsearch --net elastic -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -t elasticsearch:8.7.0

PS> docker pull docker.elastic.co/kibana/kibana:8.7.0
PS> docker run --name kibana --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:8.7.0
http://localhost:5601/?code=xxxx

PS> docker cp elasticsearch:/usr/share/elasticsearch/config/certs/http_ca.crt .
```
</div><div>

* [localhost:9200](http://localhost:9200)
* Elasticsearch-PHP
* `bin/elasticsearch-reset-password -u elastic`: reset password?
* [Doc](https://www.elastic.co/guide/en/elasticsearch/reference/8.7/docker.html)
* [DOC](https://github.com/elastic/elasticsearch-php)

```php
$client = ClientBuilder::create()
    ->setHosts(['https://localhost:9200'])
    ->setBasicAuthentication('elastic', 'password here')
    ->setCABundle('path/to/http_ca.crt')
    ->build();

// version
$response = $client->info();
echo $response['version']['number'];
```
</div></div>