# UML

[Go back](..)

You can write some uml using plantuml syntax
but you may need to set up some configuration
before hand.

```rest
.. uml::

	@startuml
	class Personne {
		{field} <u>n_personnes
		{field} nom
		{field} prénom
		{field} adresse
		{field} ∗ email
		{field} téléphone
 	}
 	@enduml
```

Please refer to uml course to learn how to write
uml in plantuml.