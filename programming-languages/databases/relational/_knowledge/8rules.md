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

The association `Belong` below:

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

#### Rule 3: n..* to 0..1 or 1 relationships

The association `Belong` below:

<div class="text-center">

![_uml/rule3.pu](_uml/rule3.svg)
</div>

Correspond to the relation:

```php!
Agent(name: String, #secretCode: String, #unitName: Unit.name, age: int)

Unit in Agent
```

What rules to apply?

* Given `A(0..1)` and `B(???)`, the identifier is A is added in B <small>(🔄️)</small>
* Given `A(1)` and `B(???)`, the identifier of A in B is NOT NULL <small>(🔄️)</small>
* Given `A(???)` and `B(1..*)`, every identifier in A must appear in B at least once<small>(🔄️)</small>
* The association class goes to the side with `n..*`

</div><div>

#### Rule 4: 1 or 0..1 to 0..1 or 1 relationships

Missing.

<br>

#### Rule 5: self relationships

A self-relationship is the same as a relationship between two classes. Refer to rules 2 to 4.

<br>

#### Rule 6: generalizations

Missing.

<br>

#### Rule 7: n-ary associations

Missing.
</div></div>