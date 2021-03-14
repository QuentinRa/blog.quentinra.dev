==================================
8. Ordonnancement - Introduction
==================================

On dispose de

	* tâches à effectuer
	* certaines tâches dépendent de d'autre tâches
	* les tâches prennent un durée à s'effectuer donnée
	* on ne prends pas en compte le fait que certaines tâches ne peuvent pas se faire en même temps (problème de ressources etc...).
	* on ne prends pas en compte le fait si certaines tâches doivent être effectuée avant (ou commencée après) un certain moment

L'ordonnancement permet de trouver le moyen les plus efficace d'ordonner les tâches afin d'obtenir
un résultats en une durée optimale.

Les données traités sont généralement sous la forme d'un tableaux avec tâches, tâches dépendantes et durée.

Il existe deux méthodes qui dépendant dont l'efficacité varie selon votre projet qui sont
Potentiel-tâches et PERT.