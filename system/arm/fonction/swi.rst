============================================
4. Fonctions - Appel d'un appel système
============================================

L'appel système :code:`int write(1, "test", 5);` par exemple prends un premier argument

	* 1er argument : 1 donc dans r0 (=stdout, constante ou constante immédiate)
	* 2e argument : "test" donc dans r1
	* 3e argument : 5 donc dans r2 (=taille du texte, constante ou constante immédiate ou variable)

Il faut ensuite mettre dans le registre :code:`r7`, la valeur correspondant à l'appel système
write (chercher avec man) par exemple 4 (sous ubuntu).

On procède à l'appel de write avec l'appel swi.

Exemple (notez l'appel a EXIT pour terminer le programme)

.. code:: ca65

    .equ SYS_EXIT, 1
    .equ SYS_WRITE, 4
        .arm
        .data

    texte: .asciz "test"
    texte_len: .word 5

        .text
        .global _start

    _start :

        mov r0, #1
        ldr r1, =texte
        ldr r2, =texte_len
        mov r7, #SYS_WRITE

        swi #0	; software interaction, execution de l'appel système 4 avec (1,"test",5);

        ; rappel, write retourne le nombre de caractères écris, soit ici 5 normalement
        ; cette valeur est sauvegardé dans r0 après l'appel de swi
        ; de façon générale, les registres sont remplis par les fonctions/appels systèmes avec des résultats

        ; quitte le programme

        mov r0, #0
        mov r7,#SYS_EXIT
        swi #0
    .end

