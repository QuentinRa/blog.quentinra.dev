=====================================
2. Exercice Noté IUTSF
=====================================

Étant donné n (quelconque) pointeurs f1,f2,...,fn sur des fonctions à valeur
void et sans paramètre, on se propose d'écrire une fonction forkn réalisant la création
de n processus, le i-ème fils lancé exécutant la fonction \*fi. La fonction renverra le nombre
de processus fils effectivement créés. La signature est:

.. code:: c

	int forkn(void (*tabFonc[])(void), int nbFils, pid_t *tabPid);

Une utilisation possible :

.. code:: c

		#define MAX_PROC 10 /* nb max de fils */
		int nproc; /* nb effectif de fils */
		int rep; /* valeur de retour du forkn */

		void (*tabFonc[MAX_PROC])(void); /* def. du tab de ptr sur fonctions */
		pid_t tabPid[MAX_PROC]; /* def. tab des pid des fils */

		extern void f0(void), f1(void), ...; /* proto des fonctions à pointer */

		...
		tabFonc[0] = f0; // initialisation du tableau
		tabFonc[1] = f1;
		...
		rep = forkn(tabFonc, nproc, tabPid);
		...