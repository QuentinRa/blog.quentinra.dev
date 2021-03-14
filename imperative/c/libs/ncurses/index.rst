.. _ncurses:

================================
Librairies en C
================================

| :math:`\color{grey}{Version \ 0.3.9}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/03/2021}`

NCurses est une librairie graphique sous Linux vous permettant de faire des interfaces
graphiques en ligne de commande. Elle est par exemple utilisée pour l'interface
de vim ou nano ou encore l'outil htop.

1. Introduction
=================

Tout d'abord, je compile sous Windows avec CLion sauf que j'ai pas ncurses.h mais curses.h
uniquement de disponible donc ce tutoriel sera limité. Voici mon CMakelist.

.. code:: cmake

		find_package( Curses REQUIRED )
		include_directories( ${CURSES_INCLUDE_DIRS} )
		# main est le nom de ma cible
		target_link_libraries( main ${CURSES_LIBRARIES} )

Je compile en utilisant avec comme compilateur ma WSL sous debian (voir
cours CLion). Je lance ensuite un terminal comme vu dans la partie Remote Working
avec CLion et je copie-colle dedans le chemin de l'exécutable. Si vous n'avez pas le chemin
de l'exécutable, alors appuyez sur la flèche habituelle pour exécuter, sur la première
ligne vous aurez un chemin de la forme :code:`/mtn/...` qui est le chemin à copié collé.

Sous linux avec CLion vous n'aurez aucun problème et pourrez juste faire la flèche
verte pour lancer.

Si vous avez besoin d'aide, ce site est super sympa
`HOWTO <https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/>`_.

Voici un exemple

.. code:: c

		#include <curses.h>
		#include <stdio.h>
		#include <stdlib.h>
		#include <string.h>

		int main(void) { // print "Hello, world!", you must press a key to exit
		  char* text = "Hello, world!";

		  // init ncurses
		  if ( initscr() == NULL ) {
		    fprintf(stderr, "Error initialising ncurses.\n");
		    return EXIT_FAILURE;
		  }

		  // write and refresh
		  // form: y, x, text
		  mvaddstr(LINES/2, COLS/2 - (int) strlen(text)/2, text);
		  refresh();

		  getch(); // wait for input

		  endwin();
		  return EXIT_SUCCESS;
		}

2. Démarrage
=================

Tout d'abord, il faut initialiser la librairie avec :code:`initscr()`
et libérer ce qui a été créé à la fin avec :code:`endwin()`.

Vous allez ensuite manipuler des fenêtres. Par défaut si une fonction
ne demande pas de fenêtre, alors vous manipulez la fenêtre crée par :code:`initscr()`
soit votre terminal.

Il existe deux constantes très utiles qui sont :code:`LINES` et :code:`COLS`
qui ont pour valeur la taille de votre terminal, sachant qu'une case corresponds
à un caractère soit 1 pixel.

Après avoir modifié le contenu d'une fenêtre, n'oubliez pas de refresh !
On refresh avec :code:`refresh()` ou :code:`wrefresh(window)`.

Si vous voulez vider une fenêtre, utilisez :code:`wclear(window)`
ou :code:`clear()`.

Et enfin, attention, les coordonnées sont données dans l'ordre y, x et non
x y donc faites attention.

3. Écrire du texte
========================

Vous avez beaucoup de fonctions pour écrire du texte, les fonctions
pennant une window écrirons dans une autre fenêtre que directement dans le terminal

	* :code:`printw(texte)` : affiche du texte (1)
	* :code:`wprintw(texte)` : (1) mais dans window
	* :code:`addstr(texte)` : affiche du texte, mais le curseur à la fin (2)
	* :code:`waddstr(texte)` : (2) mais dans window
	* :code:`mvprintw(y, x, texte)` : (1) mais à une position x,y
	* :code:`mvwprintw(window, y, x, texte)` : (1) mais à la position x,y dans window
	* :code:`mvaddstr(y, x, texte)` : (2) mais à une position x,y
	* :code:`mvwaddstr(window, y, x, texte)` : (2) mais à la position x,y dans window

Ces fonctions fonctionnent comme printf, donc vous pouvez utiliser des %d ou autre
dedans et mettre des arguments après le texte. En fait l'argument texte devra
s'appeler format comme dans printf mais je l'ai appelé texte.

Plus de détails

	* https://manpages.debian.org/unstable/ncurses-doc/addstr.3ncurses.en.html
	* https://manpages.debian.org/testing/ncurses-doc/printw.3ncurses.en.html
	* https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/printw.html

Notez que vous pouvez écrire du texte en gras, en couleurs ou autre en définissant
des attributs avant d'écrire. Il faut

	* activer l'attribut avec : :code:`attron(attribut)` ou :code:`wattron(window, attribut)`
	* le désactiver avec : :code:`attroff(attribut)` ou :code:`wattroff(window, attribut)`

Les attributs sont

	* une couleur :code:`COLOR_PAIR(code)`
	* gras :code:`A_BOLD`
	* italique :code:`A_ITALIC`
	* normal :code:`A_NORMAL`
	* surligne, le met en avant  :code:`A_STANDOUT`

Les codes de couleurs sont

	* :code:`COLOR_RED`
	* :code:`COLOR_GREEN`
	* :code:`COLOR_BLUE`
	* :code:`COLOR_WHITE`
	* :code:`COLOR_BLACK`
	* :code:`COLOR_CYAN`
	* :code:`COLOR_YELLOW`
	* :code:`COLOR_MAGENTA`

.. danger::

	Attention, vérifiez que les couleurs peuvent être utilisées dans votre terminal
	avec un if :code:`if(has_colors() == FALSE) { ... }`.

4. Récupérer la saisie
=========================

Vous pouvez récupérer les clics et les touches sur pressées. Je n'ai pas encore
touché aux clics mais voici comment faire avec les touches.

Premièrement, il faut activer la gestion du clavier avec
:code:`keypad(stdscr, TRUE);` (stdscr est le nom de la variable contenant l'écran du terminal, mais
vous pouvez mettre une window que vous avez créé si vous voulez)

Ensuite

	* :code:`getch()` : mets le programme en pause, attends un caractère
	* :code:`wgetch(window)` : pareil
	* :code:`getstr()` : pareil mais avec une phrase
	* ...

Attention, il existe plusieurs options de saisie à définir

	* :code:`echo()` ou :code:`noecho()` : les caractères saisis sont affichés à l'écran, noecho c'est l'inverse
	* :code:`cbreak()` ou :code:`nocbreak()` : getch() ou autre n'attends pas l'appui sur entrée, nocbreak c'est l'inverse

Cela peut être utilise si vous faites un jeu qui utilise les touches du clavier pour se
déplacer, vous allez probablement faire :code:`noecho();cbreak();`.

Vous pouvez devenir le caractère, soit la touche appuyée avec un switch
par exemple la code suivant peut vous inspirer, sachant qu'il existe
des constantes pour de nombreuses touches

.. code:: c

    switch (getch()) {
     case '\n': break;
     case KEY_RIGHT: //touche flèche droite
      break;
     case KEY_ENTER: //touche entrée
      break;
    }

Vous pouvez faire apparaître/disparaître le curseur de saisie
avec :code:`curs_set(FALSE);` et :code:`curs_set(TRUE);`.

5. Fenêtres et curseur
==========================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.youtube.com/watch?v=DtHO5DBZQHw
	* https://www.linuxjournal.com/content/about-ncurses-colors-0
	* https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/color.html
	* https://www.linuxjournal.com/content/creating-adventure-game-terminal-ncurses
	* https://www.linuxjournal.com/content/programming-text-windows-ncurses
	* https://www.cplusplus.com/forum/general/75406/
	* http://gnuwin32.sourceforge.net/packages/ncurses.htm
	* https://notcurses.com/notcurses.3.html
	* https://tldp.org/HOWTO/html_single/NCURSES-Programming-HOWTO/
	* https://rhardih.io/2010/04/using-ncurses-in-c-for-text-user-interfaces-featuring-xcode/
	* https://stackoverflow.com/questions/35159634/how-to-link-curses-h-in-cmake
	* https://github.com/wmcbrine/PDCurses/blob/master/wincon/README.md
	* https://www.viget.com/articles/game-programming-in-c-with-the-ncurses-library/
	* https://stackoverflow.com/questions/35159634/how-to-link-curses-h-in-cmake
	* https://stackoverflow.com/questions/10463201/getch-and-arrow-codes
	* https://github.com/orangeduck/imgcurses
	* https://gist.github.com/XVilka/8346728
	* https://www.reddit.com/r/vim/comments/5oypb4/how_does_vim_support_truecolor_but_still_use/
	* http://www.leonerd.org.uk/code/libtickit/
	* https://www.etcwiki.org/wiki/Best_ncurses_linux_console_programs