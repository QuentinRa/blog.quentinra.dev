=====================================
Installation OCaml (Windows)
=====================================

1. Solution WSL (OCaml et emacs/sublime text/vim/...)
**********************************************************

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

2. Solution Christophe Mouilleron (OCaml 4-08 et VSC/...)
*************************************************************

Source : http://web4.ensiie.fr/~christophe.mouilleron/Teaching/IPF-S2/install.html

1. Télécharger l'archive ici (:download:`ocaml_4-08.zip <https://chadok.info/~cmouille/ocaml_4-08.zip>`)
2. Décompresser cette archive dans le dossier C:\\ (ou adaptez tout le reste).
3. Vérifier que tout est bon en lançant la commande C:\ocaml\bin\ocaml (vous pouvez faire shift+clic droit et cliquer sur ouvrir un invite de commande/powershell ici)
4. Ajouter le dossier :code:`C:\ocaml\bin` dans votre :code:`%PATH%`.

	* dans la barre de recherche en bas à gauche, tapez "var" et cliquez sur "modifier les variables ... pour votre compte"
	* cliquez sur la ligne Path
	* cliquez sur modifier
	* cliquez sur nouveau
	* écrivez :code:`C:\ocaml\bin`
	* sauvegardez (ok) et quittez

5. Testez en tapant :code:`ocaml` dans un nouveau terminal (car les anciens n'ont pas le bon PATH)

3. Solution calistro (OCaml et IntelliJ)
**********************************************

Suivez ce tutoriel : https://fdopen.github.io/opam-repository-mingw/installation/
donc téléchargez et installez via l'installer graphique 64bits Opam64. Si vous faites
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