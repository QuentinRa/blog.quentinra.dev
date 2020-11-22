================================================================
2. Spécificité du C - Les Types et le casting
================================================================

Toutes les variables ont un type, parmi la liste suivante. Les types
les plus utilisés sont int (entier), char (caractère) et float/double (réel).

Un type signed prends toutes les valeurs positives >= 0 sur le nombre de bit indiqué.
Un type unsigned prends 2^n-1 bits négatifs (<=) et 2^n bits positifs (>0).


==================== ================================= ========= =======
Types                Formats                           Notation  Bits
==================== ================================= ========= =======
void                 \                                 \         ?
(signed) char        %c %hhd %hhi                      \'c\'     8
unsigned char        %c %hhd %hhu %hhx %hho            \'t\'     8
short int            %hd %hi                                     16
unsigned short int   %hu %ho %hx %hX                             16
int                  %d %i                             xxx       32
unsigned int         %u %X                             xxxU      32
long int             %ld %li                           xxxL      64
unsigned long int    %llu %llo %llx %llX               xxxUL     64
long long int        %lld %lli                         xxxULL    64
float                %f %e (...*10°) %E (+E2) %g %a    xx.xf     32
double               %lf %le %lE %lg %la               xx.x      64
long double          %Lf %Le %LE %Lg %La               xxx.xL    80
==================== ================================= ========= =======

Note sur les chaines de caractères
--------------------------------------

Une chaine de caractères (string) est une suite de caractères (ex: "Hello World").
Ce type n'existe pas en C, cependant une chaine de caractères n'est qu'un tableau
de caractères, et cela existe en C.

Un caractère est noté \'c\' et une string est notée \"Hello World\".

Pour indiquer qu'une chaine est finie, on ajoute un caractère blanc noté \'\\0\'.

Les caractères spéciaux
--------------------------------

Il existe des caractères qui sont particuliers :

=========== ============================================
Caractère	  Interprétation
=========== ============================================
\\n         Saut de ligne
\\r         Retour chariot
\\t         Tabulation
\\b         Espace négatif
\\a         Alarme (bip)
\\caractère Protéger un caractère spécial
\\          Empêcher un slash d'être interprété
=========== ============================================

Constantes
-----------------------------

On déclare une constante en C en mettant const devant.

.. code::

	const int UNE_CONSTANTE = 5; // nom toujours en majuscules par convention

Casting
-------------------------

On appelle casting, le fait de forcer une variable a prendre un certain type.
C'est utile

	* si une fonction attends un argument d'un type et que vous avez une variable bonne mais d'un autre type
	* pour forcer une variable à prendre un type explicitement

.. code:: c

		type1 a;
		type2 b = (type2) a; // conversion de a en une variable de type "type2"

Type générique : void
-----------------------------

void est un type qui indique rien, par exemple une fonction ne retourne rien, ou ne prends
pas d'arguments.

On peut cependant coder des fonctions génériques, c'est à dire qui marchent pour des arguments
de n'importe quel type, on utilise alors le type void.

.. code:: c

		// met un nombre au carré
		void carre(void argument){
			return argument * argument;
		}

		//appels
		carre((void) 5); //int/double
		carre((void) 10.0); //double
		carre((void) 3.5f); //float
		carre((void) 3f); //float