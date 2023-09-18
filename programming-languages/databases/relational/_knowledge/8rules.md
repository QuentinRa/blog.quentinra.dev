# From database diagram to relational representation

<div class="row row-cols-md-2"><div>

#### Rule 1: a class translates to a relation

The class below:

<div class="text-center">

![_uml/rule1.pu](_uml/rule1.svg)
</div>

Correspond to the relation:

```php!
Patriarch(name: String, #clanName: String, age: int)
```

<br>

#### Rule 2: n..* to m..* relationships

The class below:

<div class="text-center">

![_uml/rule2.pu](_uml/rule2.svg)
</div>

Correspond to the relation:

```php!
Patriarch(name: String, #clanName: String, age: int)
Member(name: String, #secretCode: String)
Leads(#clanName=>Patriarch.clanName, #secretCode=>Member.secretCode, years: int)

clan IN Leads
```

➡️ Alternatives syntax are `#clanName=>Patriarch(clanName)`/...
</div><div>

...
</div></div>