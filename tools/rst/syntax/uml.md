# UML

[Go back](..#writing-rst-documents)

You can write some UML using PlantUML syntax
but you may need to set up some configuration
beforehand.

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

Please refer to the UML course to learn how to write
UML in PlantUML.