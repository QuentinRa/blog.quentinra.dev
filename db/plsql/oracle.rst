.. _plsql_oracle:

============================================
PL/SQL (Procedural Language) - Oracle
============================================

| :math:`\color{grey}{Version \ 2.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 25/11/2020}`

.. warning::

	Ce cours est a lire parallèlement de la théorie expliqué ici : :ref:`plsql`.

1. Vocabulaire
======================

Par défaut, la sortie standard n'est pas affichée, donc vous ne verrez pas les print/echo
donc les affichages de votre procédure. Utilisez la commande suivante
pour l'activer : :code:`set serveroutput on`.

Pour afficher quelque chose, on utilise

.. code:: sql

	dbms_output.put_line('texte');

Vous pouvez appeler show erreurs pour avoir le détails des erreurs : :code:`show errors`.

2. Les procédures
=========================

Voici les différentes parties pour coder une procédure

.. toctree::
	 :maxdepth: 1

	 Déclaration d'une procédure       <oracle/declare>
	 Déclaration des variables         <oracle/variables>
	 Structures (IF, WHILE, ...)       <oracle/structures>
	 Déclaration des curseurs          <oracle/cursor>
	 Capturer des exceptions           <oracle/exceptions>

3. Triggers/Déclencheurs
===========================

.. note::

	Cette partie n'est pas encore disponible

-----

**Crédits**
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune