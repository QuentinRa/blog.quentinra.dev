================================
Processus
================================

Niveau débutant
***********************

1. Processus
------------------------

Créer un programme avec un processus 1 qui a deux fils 2 et 3.

Créer un programme avec un processus qui a deux fils 2 et 3.
2 a deux fils et 3 à un fils.

Chaque processus devra afficher "je suis le processus <n> - <pid>".

Vous utiliserez la fonction sleep pour faire en sorte que les processus parents
ne meurent pas avant les enfants.

| :code:`[TAG] IUTSF ASR TP1 2019 S3`

2. Générateur de processus
----------------------------

Écrivez un programme qui demande en boucle à l'utilisateur de tapper A ou B.

	*
		A : on demande la saisie d'un entier (<40) qui corresponds au nombre de secondes d'endormissement.
		Un message devra être affiché quand le processus s'endort et se réveille.
	*
		B : créé un processus qui affiche "je travaille depuis X secondes" toutes les 5 secondes pendant 30 secondes

| :code:`[TAG] IUTSF ASR TP1 2019 S3`

3. Exploration
---------------------

Cette exercice est libre. Vous devez vérifier et trouver des éléments qui sont ou ne
sont pas partagés entre le père et le fils.

	* tester stdin, stdout, stderr
	* un fichier ouvert
	* père partage un fichier créé par le fils
	* ...

| :code:`[TAG] IUTSF ASR TP1 2019 S3`

4. Petit problème
------------------------

.. code:: c

	#include <stdio.h>
	#include <unistd.h>
	FILE *f;
	int main(){
	 f = fopen("toto","w");
	 printf("abcd");
	 fprintf(stderr, "ABCDE");
	 fprintf(f "123456\n");
	 if (fork() == 0) { // processus fils
	  printf("fils\n");
	  printf(stderr, "FILS\n");
	  printf(f, "789fils\n");
	 } else { // processus père
	  sleep(1);
	  printf("pere\n");
	  printf(stderr, "PERE\n");
	  printf(f, "789pere\n");
	 }
	}

Qu'est-ce que ce programme illustre? Faites d'autres tests pour confirmer ou infirmer vos hypothèses.

| :code:`[TAG] IUTSF ASR TP2 2019 S3`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Pierre VALARCHER (enseignant à l'IUT de Sénart-Fontainebleau)