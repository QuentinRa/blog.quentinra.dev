=====================================
Installation OCaml (Windows)
=====================================

1. Solution WSL
************************

Sous Windows, vous pouvez installer une WSL (windows store -> debian) puis

	* faire les commandes sous linux
	* faire :code:`sudo apt-get update;` et :code:`sudo apt-get install sublime-text;`
	* installer Xming (+Xming Fonts : http://www.straightrunning.com/XmingNotes/)
	* enfin tester Ocaml
	* :code:`ocaml` (CTRL-D) pour quitter, si c'est bon alors ok
	* lancez Xming (à refaire à chaque démarrage)
	* :code:`subl -c` pour lancer la version graphique de sublime text.
	* :code:`emacs -c` pour lancer la version graphique d'emacs (si installé).
	* :code:`idea.sh -c` pour lancer la version graphique d'IntelliJ si installé et vous avez idea.sh dans le path

Vous avez un compilateur bytecode : :code:`ocamlc`. Pour compiler, faire
comme en c (-o pour renommer, ...).

2. Solution calistro
************************

Suivez ce tutoriel : https://fdopen.github.io/opam-repository-mingw/installation/
donc téléchargez et installer via l'installer graphique 64bits Opam64. Si vous faites
l'installation manuelle, n'oubliez pas l'option :code:`--disable-sandboxing`.

Ensuite, vous allez installer IntelliJ (voir cours sur jetbrains). Puis installer
le plugin ReasonML.

Dans Project SDK, mettez votre compilateur OCaml qui était chez moi dans
:code:`C:\OCaml64\home\nom_ici\.opam\4.11.1+mingw64c`.

Cliquez sur use cygwin et mettez le chemin vers :code:`C:\OCaml64\bin\bash.exe`.

Vous pouvez utiliser try.ocaml.pro pour compiler votre code en le copiant dedans
ou alors utiliser dune (dans tous les cas c'est plus relou qu'utiliser emacs et la solution
1 mais il y a la correction syntaxique ici).

Ensuite créez un :code:`dune-project` dans le dossier à la racine de votre projet
et un fichier :code:`dune`.

dune-project

.. code:: none

	(lang dune 2.8)

dune

.. code:: none

		(executable
		 (name main))

On considère ici un main.ml qui contient le code. Pour compiler,
ouvrez le terminal (en bas) puis allez dans le dossier de main.ml et faites
:code:`dune build main.exe`. Personnellement, il faut ensuite faire :code:`./_build/default/src/main.exe`
pour voir le résultat. La compilation se fait également automatiquement en sauvegardant,
vous pouvez voir les détails en bas dans l'onglet dune.

3. Solution Christophe Mouilleron
***********************************

Source : http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPF-S2/install.html*

1. Télécharger l'archive ici
Décompresser cette archive dans le dossier C:\ .
Attention: emplacement non modifiable
Vérifier que tout est bon en lançant la commande C:\ocaml\bin\ocaml --version dans un invité de commande (cmd), un PowerShell, ou via l'onglet Terminal de Visual Studio Code.
Ajouter le dossier C:\ocaml\bin dans votre %PATH%.
Pour cela, je vous recommande TRÈS vivement de passer par l'outil graphique afin d'éviter les grosses bêtises. Personnellement, sous Windows 10 (en anglais), je l'ouvre via :
Start → Settings
recherche du mot "environment"
choix de "Edit environment variables for your account"
Installer l'extention Ocaml Tuareg-master dans Visual Studio Code
Vous devriez pouvoir exécuter un bloc de code OCaml dans Visual Studio Code en vous plaçant au début du bloc et en tapant Ctrl+Alt+: (vérifier le raccourci exact dans la description de l'extension).