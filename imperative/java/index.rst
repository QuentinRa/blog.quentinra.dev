.. _java:

================================
JAVA
================================

| :math:`\color{grey}{Version \ 0.8.17}`
| :math:`\color{grey}{Dernière \ édition \ le \ 01/02/2021}`

1. Introduction  :code:`théorique`
===================================

Java est un langage dont le code fonctionne sur n'importe qu'elle machine
(Write once, run anywhere). La compilation d'un fichier java (.java)
produit un fichier au langage machine (.class).

Java est un langage orienté objet ce qui veux dire que tout
(8 exceptions = 8 types primitifs) est représenté par ce qu'on appelle une classe.

Le vocabulaire est requis avant de continuer. Avoir Java d'installé, ça aide.

.. toctree::
	 :maxdepth: 1

		Historique       <intro/historique>
		Vocabulaire      <intro/vocab>
		Installation     <intro/install>

Java implémente le paradigme de l'iceberg. Les classes sont des conteneurs
privés dont vous ne voyez que le nom de la classe et les méthodes/attributs publics. Ainsi, le
code des méthodes est caché et peut être changé.

2. Introduction :code:`code`
==============================

.. toctree::
	 :maxdepth: 1

		Compilation                    <base/compilation>
		Types                          <base/types>
		Structures et Opérateurs       <base/struct>
		Les instructions basiques      <base/inst>

La javadoc

	* JDK 7 : https://docs.oracle.com/javase/7/docs/api/overview-summary.html
	* JDK 10 : https://docs.oracle.com/javase/10/docs/api/overview-summary.html
	* JDK 14 : https://docs.oracle.com/en/java/javase/14/docs/api/index.html

sont des documentations des classes et des méthodes. N'hésitez pas à les utiliser
pour trouver les import a effectuer par exemple (qui sont manquants désolé!).

En java, il n'existe pas de notion d'adresse. Les types primitifs sont passés par valeurs
aux fonctions tandis que les objets sont passés par référence
(ce qui reviens à un passage par adresse en C).

3. Implémentation de concepts (simple)
===============================================

.. toctree::
	 :maxdepth: 1

		Création d'une classe                 <code/s/start>
		Tableaux                              <code/s/tab>
		Héritage et Substitution de liskov    <code/s/legacy>
		Abstraction et Interfaces             <code/s/abs>
		Exceptions                            <code/s/except>
		Javadoc                               <code/s/doc>
		Packages                              <code/s/packages>

4. Implémentation de concepts (avancé)
=========================================

.. toctree::
	 :maxdepth: 1

		Tableaux dynamiques   <code/a/sc2>
		Dictionnaires         <code/a/dic>
		Pile et Files         <code/a/sc>
		Généricité            <code/a/gen>
		Méthodes variadiques  <code/a/var>
		Énumérations          <code/a/enum>

5. Implémentation de concepts (pro)
=========================================

.. toctree::
	 :maxdepth: 1

		Threads                    <code/p/threads>
		Base de données (interne)  <code/p/bdi>
		Base de données (externe)  <code/p/bde>
		Réseau                     <code/p/net>

6. Autres concepts
======================

.. toctree::
	 :maxdepth: 1

		Manipulation de flux    <code/o/flux>
		Tris                    <code/o/tris>
		Récursivité             <code/o/rec>

7. Interfaces graphiques
===============================

Ce cours utilise les librairies graphiques :code:`java.awt`
et :code:`javax.swing`. Si vous voulez apprendre une autre librairie, regardez
dans le cours sur les librairies.

.. toctree::
	 :maxdepth: 1

		JComponent et Composants graphiques  <code/i/jc>
		Mise en page (Layout)                <code/i/layout>
		Dessins                              <code/i/draw>
		Événements                           <code/i/event>

8. Les mystiques
========================

Ici, en vrac, quelques trucs que vous n'allez probablement jamais utiliser.

.. toctree::
	 :maxdepth: 1

		Annotations             <code/m/annotation>
		Constructeurs statique  <code/m/static>
		Caractères unicode      <code/m/unicode>
		Lambda expressions      <code/m/lambda>
		Manipulation des Jar    <code/m/jar>
		Gradle et Maven         <code/m/mvg>
		Classes particulières   <code/m/classes>

9. Mise en production de code JAVA
====================================

Cette partie concerne ceux qui veulent faire un .exe ou un .jar
plus ou moins sécurisé.

.. toctree::
	 :maxdepth: 1

		Sécuriser son jar                <prod/obs>
		Créer un .exe et son installeur  <prod/ins>

-----

**Crédits**
	* Florent MADELAINE (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* David ROUSSEL (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikibooks.org/wiki/Programmation_Java/Annotations
	* https://www.lwjgl.org/
	* https://libgdx.com/
	* https://docs.oracle.com/javase/tutorial/deployment/jar/build.html
	* https://search.maven.org/
	* https://www.baeldung.com/gradle-build-to-maven-pom
	* https://mvnrepository.com/artifact/org.springframework.security
	* https://justinmahar.github.io/easyjre/

**Autres**

	* https://stackoverflow.com/questions/6101311/what-is-the-native-keyword-in-java-for
	* https://stackoverflow.com/questions/4577424/distinguish-between-a-single-click-and-a-double-click-in-java
	* https://github.com/srikanth-lingala/zip4j
	* https://stackoverflow.com/questions/758083/how-do-i-put-a-java-app-in-the-system-tray
	* https://stackoverflow.com/questions/5349642/how-to-set-icon-for-jframe-window-and-tray
	* https://stackoverflow.com/questions/3542018/how-can-i-get-list-of-all-drives-but-also-get-the-corresponding-drive-type-remo
	* https://www.yworks.com/products/yguard
	* https://www.guardsquare.com/en/products/proguard
	* https://www.baeldung.com/java-download-file
	* https://docs.spring.io/spring-security/site/docs/4.2.4.RELEASE/apidocs/org/springframework/security/crypto/password/Pbkdf2PasswordEncoder.html
	* https://www.devglan.com/online-tools/jasypt-online-encryption-decryption
	* https://softwareengineering.stackexchange.com/questions/400077/how-to-protect-software-from-being-deleted-by-antivirus

	* innodb

		* https://stackoverflow.com/questions/12951327/inno-setup-check-if-file-exist-in-destination-or-else-if-doesnt-abort-the-ins
		* https://stackoverflow.com/questions/15638663/creating-an-installer-that-will-perform-an-update-if-an-older-version-is-already
		* https://stackoverflow.com/questions/14685149/creating-an-installer-for-java-desktop-application#14686023
		* http://izpack.org/
		* http://jrsoftware.org/ishelp/index.php?topic=consts&anchor=userappdata
		* http://stackoverflow.com/questions/13728902/powershell-script-after-install
		* http://stackoverflow.com/questions/252226/signing-a-windows-exe-file