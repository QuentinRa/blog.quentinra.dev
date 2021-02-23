============================
Structure d'un fichier
============================

On rappelle la structure java/php

	* on fait une classe de tests (en C : une suite)
	* on fait des méthodes dans chaque classe (en C : une fonction void f(void))

Le base est la suivante

.. code:: c

		#include <CUnit/Basic.h>
		int main(){
		 // initialisation du framework
		 if (CUE_SUCCESS != CU_initialize_registry()) return CU_get_error();
		 // process tests
		 // ...
		 // choix de l'interface des résultats
		 CU_basic_set_mode(CU_BRM_VERBOSE);
		 // exécution
		 CU_basic_run_tests();
		 // nettoyage et fin
		 CU_cleanup_registry();
		 return CU_get_error();
		}

Ensuite la partie process tests consiste en

	1. créer et initialiser votre suite (classe de tests)
	2. exécuter vos tests
	3. libérer les ressources

.. code:: c

		CU_pSuite pSuite = NULL;
		pSuite = CU_add_suite("nom de la suite", set_up, tear_down);
		if (NULL == pSuite) { // ok ?
		 CU_cleanup_registry();
		 return CU_get_error();
		}

		// exécution d'un test
		if ((NULL == CU_add_test(pSuite, "nom du test", fonction_test))){
		 CU_cleanup_registry();
		 return CU_get_error();
		}

Les fonctions set_up et tear_down (appelées comme vous voulez)
sont les noms généralement données aux fonctions qui seront exécutées
respectivement avant et après tous les tests.

Les "nom du ..." sont juste pour l'affichage, retrouver quel test vient
de s'exécuter.

Vous verrez le format d'une fonction de test juste après.
