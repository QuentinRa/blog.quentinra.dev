=====================================
Intégration continues (actions)
=====================================

Les actions sont probablement uniquement disponible sur Github. Il s'agit
de programmer des actions, qui seront exécutées a chaque commit/pull request
pour vérifier que le code suit est valide (utile pour les projets communautaires).

Ceci n'est disponible que pour les dépôts publics.

**Action analyse de code**

Cette action compile votre code et vérifie que la compilation marche. Elle va ensuite
analyser le code et indiquer s'il y a des problèmes/failles de sécurité par exemple
des dépendances.

Vous allez créer un fichier .github/workflows/codeql-analysis.yml

Le fichier est généré pour vous, vous n'aurez probablement rien a changer, voici
un exemple de fichier d'un de mes projets.

.. code:: yaml

		name: "CodeQL"

		on:
			push:
				branches: [master]
			pull_request:
				branches: [master]
			schedule:
				- cron: '0 4 * * 5'

		jobs:
			analyze:
				name: Analyze
				# donne la version à utiliser par docker
				runs-on: ubuntu-latest

				strategy:
					fail-fast: false
					matrix:
						# langage
						language: ['java']
						java: [11]
				steps:
				# indique les opérations a faire
				# moi je veux
				# - checkout (obligatoire si on veut compiler)
				# - faire des commandes (propre a mon projet)
				# - installer la bonne version de java, car ça ne l'a pas fait de base
				# - enfin je compile et j'analyse
				- name: Checkout repository
					uses: actions/checkout@v2
					with:
						fetch-depth: 2

				- run: git checkout HEAD^2
					if: ${{ github.event_name == 'pull_request' }}

				#
				- run: cd nexus && ...ici des commandes bash...

				# j'installe la bonne version du jdk
				- name: Setup Java JDK
					uses: actions/setup-java@v1.4.3
					with:
						java-version: 11
						java-package: jdk

				# Initializes the CodeQL tools for scanning.
				- name: Initialize CodeQL
					uses: github/codeql-action/init@v1
					with:
						languages: ${{ matrix.language }}

				# Autobuild attempts to build any compiled languages  (C/C++, C#, or Java).
				- name: Autobuild
					uses: github/codeql-action/autobuild@v1

				- name: Perform CodeQL Analysis
					uses: github/codeql-action/analyze@v1

Comme vous pouvez le voir, les étapes utilisent souvent des :code:`uses: un dépôt github`.
Il s'agit de dépôts contenant des actions déjà codées donc que vous n'avez qu'a utiliser.