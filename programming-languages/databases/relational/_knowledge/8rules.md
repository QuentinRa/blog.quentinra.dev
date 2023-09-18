# From database diagram to relational representation

<div class="row row-cols-md-2"><div>

#### Rule 1: a class translates to a relation

The class below:

<div class="text-center">

![_uml/rule1.pu](_uml/rule1.svg)
</div>

Correspond to the relation:

```php!
Agent(name: String, #secretCode: String, age: int)
Unit(#name: String, location: String)
```

<br>

#### Rule 2: n..* to m..* relationships

The association `Leads` below:

<div class="text-center">

![_uml/rule2.pu](_uml/rule2.svg)
</div>

Correspond to the relation:

```php!
Belong(#unitName=>Unit.name, #secretCode=>Agent.secretCode, years: int)
```

And the constraint <small>(as there is a 1..*)</small>:

```php!
secretCode IN Belong
```

➡️ Alternatives syntax are `#unitName=>Unit(name)`/...

<br>

#### Rule 3: * to 0..1 or 1 relationships

...
</div><div>

...
</div></div>