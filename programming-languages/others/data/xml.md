# XML

<div class="row row-cols-lg-2"><div>

📝 XML (eXtensible Markup Language) is a language like JSON used to store/share data. XML is like HTML: a tree of nodes, with a root, and child elements. An XML file usually starts with a tag called XML prolog.

```xml!
<?xml version="1.0" encoding="UTF-8"?>
<rootElement>
    <child></child>
    <group>
        <child attribute="value">xxx</child>
    </group>
</rootElement>
```
</div><div>

`rootElement`, `child`, `group` are called tags. Names are user-defined. `attribute"=value"` is an example of an attribute.

The names/attributes/hierarchy of tags/... are defined by you!
</div></div>

<hr class="sep-both">

## Document Type Definition (DTD) 🗺️

<div class="row row-cols-lg-2"><div>

Usually, we define a Document Type Definition (DTD) for an XML. It defines which tags, and attributes are allowed, along the hierarchy between tags. It's mainly used to ensure the XML is valid.

After the XML Prolog, add a DOCTYPE tag. For the XML above, we may use a DTD such as the one below <small>(generated in PHPStorm)</small>.
</div><div>

```xml!
<!DOCTYPE rootElement [
        <!ELEMENT rootElement (child|group)*>
        <!ELEMENT child (#PCDATA)>
        <!ATTLIST child
                attribute CDATA #IMPLIED>
        <!ELEMENT group (child)*>
        ]>
<!-- You may put the content above in a file test.dtd -->
<!DOCTYPE rootElement SYSTEM "test.dtd">
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* XML Schema Definition (XSD)
* `xsltproc target.xml -o target.html`
</div><div>
</div></div>