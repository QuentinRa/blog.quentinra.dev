===========================================================================
8. Flux et Fichiers - Manipulation de flux via appels système linux
===========================================================================

La logique est que l'on va représenter un fichier par un descripteur (un entier). Lorsque
le fichier est ouvert, le système garde toutes les informations à un endroit, et si vous
voulez lire/écrire ou faire n'importe quel action sur le fichier, alors vous
donner le descripteur aux fonctions et elles travaillerons sur le fichier en question.

Il existe trois flux pré-ouverts pour vous et que vous n'avez pas a fermer

	*	stdin (descripteur 0) : saisie à la console
	*	stdout (descripteur 1) : écriture à la console
	*	stderr (descripteur 2) : écriture à la console d'erreur