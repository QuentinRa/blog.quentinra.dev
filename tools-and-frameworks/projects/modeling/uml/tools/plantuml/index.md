# PlantUML

<div class="row row-cols-md-2"><div>

[PlantUML](https://plantuml.com/) (8.6k ⭐) is a tool and a website to generate UML diagrams from code instructions.

* [Documentation](https://plantuml.com/sitemap) <small>(⛪)</small>
* [Online Converter](https://www.plantuml.com/plantuml/uml/) <small>(💫)</small>
* [Unofficial Online Converter](https://www.planttext.com/)  <small>(✍️)</small>
* [PlantUML GUI](https://plantuml.com/gui) <small>(☕)</small>
</div><div>

You can install the converter using [docker](/operating-systems/others/virtualization/docker/index.md):

```shell!
$ docker pull plantuml/plantuml
```

To convert `sample.pu` <small>(in the current folder)</small> to `sample.svg`:

```shell!
$ docker run --rm -v $(pwd):/data plantuml/plantuml -tsvg /data/sample.pu
CMD> docker run --rm -v %cd%:/data plantuml/plantuml -tsvg /data/sample.pu
```
</div></div>

<hr class="sep-both">

## Sample diagrams

<div class="row row-cols-md-2"><div>

#### Class Diagram

```php!
@startuml
class ClassName {
  attribute: Type
  <u>underlined attribute</u>: Type
}
@enduml
```
</div><div>
</div></div>