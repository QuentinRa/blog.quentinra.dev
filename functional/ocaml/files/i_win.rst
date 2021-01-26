=====================================
Installation OCaml (Windows)
=====================================

Sous Windows, vous pouvez installer une WSL (windows store -> debian) puis

	* faire les commandes sous linux
	* faire :code:`sudo apt-get update;` et :code:`sudo apt-get install sublime-text;`
	* installer Xming (+Xming Fonts : http://www.straightrunning.com/XmingNotes/)
	* enfin tester Ocaml
	* :code:`ocaml` (CTRL-D) pour quitter, si c'est bon alors ok
	* lancez Xming (à refaire à chaque démarrage)
	* :code:`subl -c` pour lancer la version graphique de sublime text.
	* :code:`emacs -c` pour lancer la version graphique d'emacs (si installé).

Vous avez un compilateur bytecode : :code:`ocamlc`. Pour compiler, faire
comme en c (-o pour renommer, ...).