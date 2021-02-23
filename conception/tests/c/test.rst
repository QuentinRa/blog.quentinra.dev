============================
Structure d'un test
============================

Comme en java ou en php, vous allez utiliser des assertions. Par exemple

.. code:: c

		#include <CUnit/Basic.h>

		// ou test_nom_de_nom_test mais il faut test devant
		void testNomDeMonTest(void) {
		 // code
		 // ...
		 CU_ASSERT(...);
		}

On a des version pour chaque test qui peuvent
être fatals (CU_nom_FATAL) c'est-à-dire une version de l'assertion qui stop l'exécution
des tests et mets fin à la fonction.

On a les fonctions suivantes (#include <CUnit/CUnit.h>)

	* :code:`CU_PASS("message")` : fait réussir le test
	* :code:`CU_FAIL("message")` : fait échouer le test
	* :code:`CU_ASSERT_TRUE(valeur)` : check valeur true
	* :code:`CU_ASSERT_FALSE(valeur)` : check valeur false
	* :code:`CU_ASSERT_PTR_NULL(valeur)` : check pointeur null
	* :code:`CU_ASSERT_PTR_NOT_NULL(valeur)` : check pointeur non null
	* :code:`CU_ASSERT_EQUAL(valeur, attendu)` : check valeur égales
	* :code:`CU_ASSERT_NOT_EQUAL(valeur, attendu)` : check valeur non-égales
	* :code:`CU_ASSERT_STRING_EQUAL(valeur, attendu)` : pareil mais pour des chaine de caractères
	* :code:`CU_ASSERT_STRING_NOT_EQUAL(valeur, attendu)` : pareil mais pour des chaine de caractères

Lorsqu'un test échoue, vous pouvez voir la valeur avec :code:`CU_get_error()`
et obtenir un message avec :code:`CU_get_error_msg`.