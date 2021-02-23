=========================
Cunit remastered
=========================

J'ai essayé de faire le framework
un peu plus modulable mais le code n'est pas très propre.
Peut être ça peut vous inspirer.

**main.c**

.. code:: c

		#include <CUnit/Basic.h>
		#include "tests/tests_utils.h" // convenience methods to factorise tests calls
		// import your suite
		#include "tests/suite1.h"

		#define SUITE_COUNT 1
		/* Run all of our tests  */
		suite_description all_tests[] = {
		 // suite 1, test of [... explain here ...]
		 {
			"Suite_1",init_suite1,clean_suite1,2,
			{
			 {"test of fprintf()", testFPRINTF, 0},
			 {"test of fread()", testFREAD, 0},
			},
		 },
		};

		int main(){
		 // init
		 if (CUE_SUCCESS != CU_initialize_registry()) return CU_get_error();
		 // process tests
		 for (int i = 0; i < SUITE_COUNT; i++) {
		 int r = process_test_suite(all_tests[i]);
		 if( r != CUE_SUCCESS){
			break;
		 }
		 }
		 /* Run all tests using the CUnit Basic interface */
		 CU_basic_set_mode(CU_BRM_VERBOSE);
		 CU_basic_run_tests();
		 CU_cleanup_registry();
		 return CU_get_error();
		}

**tests/tests_utils.h**

.. code:: c

		#ifndef PRIM_TESTS_UTILS_H
		#define PRIM_TESTS_UTILS_H

		/// used to define the array of tests, a bad idea for memory
		#define MAX_TESTS 5

		/// a test : name, function, ignore=0=false or 1=true
		typedef struct suite_tests_desc {
		 char* strName;
		 CU_TestFunc pTestFunc;
		 int ignore;
		} suite_tests_desc;

		/// function that should returns all tests of a suite
		typedef suite_tests_desc* (*get_all_tests)(void);

		/// a suite (name, set up, tear down, getAllTests and testcount)
		typedef struct suite_description {
		 char *suite_name;
		 CU_InitializeFunc pInit;
		 CU_CleanupFunc pClean;
		 int tests_count;
		 suite_tests_desc tests[MAX_TESTS];
		} suite_description;

		/// Test a suite
		/// \param suite the suite that will be tested
		/// \return check CU_get_error
		int process_test_suite(suite_description suite);

		#endif //PRIM_TESTS_UTILS_H

**tests/tests_utils.c**

.. code:: c

		#include <CUnit/Basic.h>
		#include "tests_utils.h"

		int process_test_suite(suite_description suite) {
		 CU_pSuite pSuite = NULL;
		 CU_pTest result = NULL;

		 // create suite
		 pSuite = CU_add_suite(suite.suite_name, suite.pInit, suite.pClean);
		 if (NULL == pSuite) { // ok ?
			CU_cleanup_registry();
			return CU_get_error();
		 }

		 // run all tests
		 for (int i = 0; i < suite.tests_count; i++) {
			// skip ignored
			if (suite.tests[i].ignore == 1) continue;
			// execute test
			result = CU_add_test(pSuite, suite.tests[i].strName, suite.tests[i].pTestFunc);
			if (result == NULL){ // check result
			 CU_cleanup_registry();
			 return CU_get_error();
			}
		 }

		 return CU_get_error();
		}

**tests/suite1.h**

.. code:: c

		#ifndef PRIM_SUITE1_H
		#define PRIM_SUITE1_H

		 #include "tests_utils.h"

		 // beforeAll
		 int init_suite1(void);
		 // afterAll
		 int clean_suite1(void);

		 // tests
		 void testFPRINTF(void);
		 void testFREAD(void);

		#endif //PRIM_SUITE1_H

**tests/suite1.c**

.. code:: c

		#include <stdio.h>
		#include <string.h>
		#include <CUnit/Basic.h>

		#include "suite1.h"

		/* Pointer to the file used by the tests. */
		static FILE* temp_file = NULL;

		/* The suite initialization function.
		 * Opens the temporary file used by the tests.
		 * Returns zero on success, non-zero otherwise.
		 */
		int init_suite1(void)
		{
		 if (NULL == (temp_file = fopen("temp.txt", "w+"))) {
			return -1;
		 }
		 else {
			return 0;
		 }
		}

		/* The suite cleanup function.
		 * Closes the temporary file used by the tests.
		 * Returns zero on success, non-zero otherwise.
		 */
		int clean_suite1(void)
		{
		 if (0 != fclose(temp_file)) {
			return -1;
		 }
		 else {
			temp_file = NULL;
			return 0;
		 }
		}

		/* Simple test of fprintf().
		 * Writes test data to the temporary file and checks
		 * whether the expected number of bytes were written.
		 */
		void testFPRINTF(void)
		{
		 int i1 = 10;

		 if (NULL != temp_file) {
			CU_ASSERT(0 == fprintf(temp_file, ""));
			CU_ASSERT(2 == fprintf(temp_file, "Q\n"));
			CU_ASSERT(7 == fprintf(temp_file, "i1 = %d", i1));
		 }
		}

		/* Simple test of fread().
		 * Reads the data previously written by testFPRINTF()
		 * and checks whether the expected characters are present.
		 * Must be run after testFPRINTF().
		 */
		void testFREAD(void)
		{
		 unsigned char buffer[20];

		 if (NULL != temp_file) {
			rewind(temp_file);
			CU_ASSERT(9 == fread(buffer, sizeof(unsigned char), 20, temp_file));
			CU_ASSERT(0 == strncmp(buffer, "Q\ni1 = 10", 9));
		 }
		}