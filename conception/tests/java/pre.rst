=========================================
Programmation par contrat/défensive
=========================================

On utilise des méthodes comme :code:`Object.requireNonNull(Object)`, ...
et on retourne des exceptions comme :code:`IllegalArgumentException` (argument pas bon)
ou :code:`IllegalStateException` (préconditions empêchent de continuer car pas bonnes).

Sinon pour tester les préconditions vous ferez généralement simplement des comparaisons
mais parfois il existe des méthodes déjà faites comme vu plus haut.