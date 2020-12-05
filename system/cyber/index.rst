.. _cyber:

================================
CyberCriminalité
================================

| :math:`\color{grey}{Version \ 1.0.4}`
| :math:`\color{grey}{Dernière \ édition \ le \ 05/12/2020}`

Ce cours a pour objectif de contenir de nombreuses
connaissances utiles aux cyber-experts tel que

	* du vocabulaire
	* des connaissances générales
	* les grandes attaques informatiques
	* cybersécurité en france et ailleurs
	* les attaques
	* les moyens de ce défendre
	* les problèmes/failles de sécurités connues
	* cyber-expert

Ce cours présente en grande partie des connaissances générales mais la dernière partie
demande des connaissances en programmation (web: SQL, PHP, JavaScript, POST, GET, ..., linux: commandes, ...)
car elle détaille des procédés pour réaliser et se protéger de failles connues.

1. Vocabulaire
===================================

.. toctree::
	 :maxdepth: 1

			Mots clefs cyber          <voc/all>
			Vocabulaire courant       <voc/keyword>
			As a service              <voc/aas>

2. Grands attaques
===============================

Voici une liste de quelques grandes attaques

.. toctree::
	 :maxdepth: 1

			1ère grand attaque : Estonie    <bestof/keyword>
			Stuxnet                         <bestof/stuxnet>
			WannaCry                        <bestof/wanna>
			Autres                          <bestof/all>

3. Cybersécurité en ...
==============================

... France

	Séparation de l’attaque et la défense.

		* Attaque (LIO, par la DGSE)
			*	Lutte informatique offensive, à la charge de la DGSE et de l’armée, dirigée par le général des armées Didier Tisseyre.
			*	Création en 2017, 3400 cyber combattants (4000 d’ici 2025, 4400 réservistes). Budget de 250 millions d’euros par an.
			*	Mission : Conception, planification et conduite des opérations militaires de cyberdéfense
		* Défense (par l’ANSII)
			*	L’agence nationale de la sécurité des SI (2009) est chargée de s’occuper de la défense. Elle est dirigée par Guillaume Poupard.
			*	391 attaques (hors OIV), 16 attaques majeures, 14 opérations de cyberdéfense en 2018.
			*	Environ 600 personnes, turnover important dû à la différence de salaire entre le privé et le public.

			Missions
				*	détecter les attaques
				*	prévenir la menace (livre blanc, entraide)
				*	conseiller les administrations et OIV
				*	informer régulièrement les entreprises/le grand public

	Nicolas Arpagian, à la tête d’orange cyberdéfense.
	La France fait appel à Palantir ((E) américaine liée à Donald Trump) car elle en a besoin pour gérer son armée. (risque)

	PRA
		Les 250 entreprises clef français (OIV) doivent avoir un Plan de reprise d’activité (PRA),
		ie être capable de reprendre rapidement leur activité après une attaque.

... US
	Création en 2007 (effective en 2009) de cyber command qui regroupe l’attaque et la défence.

	Barrack Obama a décrit le web comme un actif stratégique.

... Autres
	La quadrature du net est une association qui milite pour la liberté sur internet.

4. CyberExpert
=====================

Vous pouvez être un expert en cybersécurité en attaque (offense) et/ou en défense.

Offense
	En tant qu'agent de la cyber-offensive, vous allez testez des attaques
	donc attaquer l'entreprise et ses produits et essayer de trouver des failles.

	Il est important d'avoir une bonne connaissance du web (et des langages associés comme
	PHP, Javascript, HTML/CSS, ....) et en réseau (architecture linux, cloud, ...).

Defense
	L'objectif est de détecter et stocker les attaques le plus rapidement possible. Vous devez
	analyser l'état du système et détecter tout comportement anormal, et pour ça il est important
	de connaitre de nombreuses attaques ainsi que leur fonctionnement.

	En cas d'attaque, un responsable des incidents (Incident Responder) vient généralement vous épauler
	afin de déterminer les objectifs et les conséquences de l'attaque.

	Enfin, comprendre le fonctionnement de l'attaque, du malware est très utile a se protéger
	d'éventuelles prochaines attaques. Certaines entreprises choisissent de partager les informations
	de l'attaque pour crééer un réseau solidaire qui s'ent

5. CyberSécurité
==============================

Les attaques

.. toctree::
	 :maxdepth: 1

		La fraude au président/Spoofing          <cyber/a/fraude_pres>
		Typo jacking                             <cyber/a/typo_jacking>
		Attaque via sous-traitants               <cyber/a/filiale>
		Phishing                                 <cyber/a/phishing>
		Ransomware                               <cyber/a/ransomware>
		Cross-site scripting (XSS)               <cyber/a/xss>
		Crypto jacking                           <cyber/a/crypto_jacking>

Autres types d'attaques

	* Intrusion sur les appareils connectés (IOT)
	* Malwares mobiles
	* Attaques géopolitiques
	* Attaques cyber-physiques (systèmes électriques...)
	* Attaques contre hôpitaux (hackeurs qui peuvent ajouter/retirer un cancer...)
	* Attaques contre les véhicules autonomes
	* Attaques contre le cloud

Les méthodes de défense

.. toctree::
	 :maxdepth: 1

		Deceptive security                      <cyber/d/ds>
		EDR                                     <cyber/d/err>
		Réagir a une attaque                    <cyber/d/ra>

Failles de sécurité

.. toctree::
	 :maxdepth: 1

		 Les problèmes du web (général)                  <cyber/f/web>
		 Les problèmes du web (connexion)                <cyber/f/web1>
		 Les problèmes du web (exploration)              <cyber/f/web2>
		 Les problèmes du web (injections)               <cyber/f/web3>

-----

**Crédits**
	* Anabelle DEMULE THENON (enseignante à l'IUT de Sénart-Fontainebleau)
	* TRY HACK ME (https://tryhackme.com/)
	* Julien CARCAU (étudiant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://tryhackme.com/
	* https://tryhackme.com/path/outline/beginner
	* https://www.cybersecurityeducation.org/careers/incident-responder/
	* https://www.tutorialspoint.com/splunk/index.htm
	* https://www.hackerone.com/
	* https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet
	* https://github.com/payloadbox/sql-injection-payload-list
	* https://www.youtube.com/watch?v=Trb1c2HqCA4&ab_channel=Capgemini
	* https://www.youtube.com/watch?v=ih0SC-dN6MU&ab_channel=TechBeacon
