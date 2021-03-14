.. _ncurses:

================================
Librairies en C
================================

| :math:`\color{grey}{Version \ 0.0.1}`
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