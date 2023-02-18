# UML

[Go back](..#writing-rst-documents)

You can write some UML using PlantUML syntax, but you may need to set up some configuration beforehand.

```rest
.. uml::

	@startuml
	class User {
		{field} <u>ID
		{field} name
		{field} first_name
		{field} address
		{field} ∗ email
		{field} cellphone
 	}
 	@enduml
```

Please refer to the UML course to learn how to write UML in PlantUML.