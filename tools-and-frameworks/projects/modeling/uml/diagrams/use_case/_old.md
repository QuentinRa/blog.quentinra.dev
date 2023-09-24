# Generalization between actors

Let's say you got a regular user and a logged user for the system "website". If a logged user can do everything that the regular can do and even more. You can factorize this with a generalization.

![Generalization example](images/u-HqA2v9B2efpStXukIqyibFJqzDKGWjJYsoKaWiLd1CoStC0qa4fQQNvYGMGMLiQdHruN8EgNafGEq0.png)

This is called Generalization and not inheritance (`Héritage`) since inheritance isn't a UML concept but an implementation one. Here, a Logged User got every use case available for the Regular User, on top of his own use cases.