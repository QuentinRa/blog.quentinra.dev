============================================
2. Coder en ARM - Structure du code
============================================

.. code-block:: ca65

    .equ nom, valeur       ; Déclaration de constantes
                           ; appelés : #constante
            .arm           ; Type d'assemblage

    @ ------------------ Partie où on traite les données------------------------------ @

            .data          ; déclarations ...

    nom: type valeur       ; déclaration d'un pointeur
    nom= valeur            ; déclaration d'une variable

    @ -------------------- Partie où on met les instructions --------------------------- @

            .text
            .global _start ; étiquette de lancement

    _start:                ; début du code

        @ instructions ...

    .end                   ; fin

Explications

	* La toute première partie de votre code est la déclaration des constantes avec :code:`.equ` si vous en avez
	* vous mettez ensuite :code:`.arm` pour indiquer que vous allez coder en assembleur
	* la partie :code:`.data` vous permet de déclarer toutes vos variables
	* ensuite vous mettez :code:`.text` car vous allez écrire du code
	* les commentaires se font avec :code:`@` ou :code:`;`

On a un fichier par fonction, la fonction main en assembleur est représenté par l'étiquette _start.
Vous pouvez déclarer globalement max par exemple si vous allez coder une fonction max (on ne précise
pas les arguments ni le type de retour).

	* vous mettez ensuite :code:`_start` pour indiquez que vous commencez à écrire votre code, et :code:`.end` pour indiquer la fin.
	* vous pouvez voir le principe d'étiquettes dans le cours avancé de C (:ref:`language-c-advanced`).

Opération
	Il s'agit d'une instruction possible en assembleur par exemple :code:`ADD` (addition), qui prends
	des registres contenant des valeurs, possiblement des valeurs dites constantes immédiates et met
	le résultat dans des registres.