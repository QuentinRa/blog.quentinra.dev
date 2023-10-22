# CUnit

<div class="row row-cols-md-2"><div>

[CUnit](https://linux.die.net/man/3/cunit) is a testing framework for the C programming language. It's not a popular testing framework, nor it is commonly used. ☠️

```shell!
$ sudo apt-get update
$ sudo apt-get install libcunit1 libcunit1-doc libcunit1-dev
```

The documentation is [available here](https://cunit.sourceforge.net/).
</div><div>
</div></div>

<hr class="sep-both">

## Get Started with CMake

<div class="row row-cols-md-2"><div>

Assuming you want to use `cunit` with a [cmake](/tools-and-frameworks/others/build/cmake/index.md) project, you'll have to manually write some code first. Add to a `CMakeLists.txt`:

```cmake
find_package(CUnit REQUIRED)
```

You need to create a finder `./cmake/modules/FindCUnit.cmake`.

```cmake
find_path(CUNIT_INCLUDE_DIRS CUnit/CUnit.h)
find_library(CUNIT_LIBRARIES NAMES CUnit cunit)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(CUnit
        REQUIRED_VARS CUNIT_INCLUDE_DIRS CUNIT_LIBRARIES
        VERSION_VAR CUNIT_VERSION)
```

Add to a `CMakeLists.txt` before the `find_package` call:

```cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")
```
</div><div>

There is obviously no support for `ctest`. We can only generate an executable and run it.

```cmake
# Create an executable for your test suites
add_executable(my_testing_target 
    tests/runner.c
    tests/my_suite.c
    tests/my_suite.h
    # ...
)

# Link CUnit to your test target
target_link_libraries(my_testing_target ${CUNIT_LIBRARIES})
```
</div></div>

<hr class="sep-both">

## Basic Test Suite

<div class="row row-cols-md-2"><div>

A suite is a group of tests that share the same purpose, e.g., for instance, tests that are specific to one component/function/file.

Let's first define a header `my_suite.h`. It only exposes to others a way to create our suite, which is needed to run it.

```c
#ifndef MY_SUITE_H
#define MY_SUITE_H

int my_suite_createSuite();

#endif //MY_SUITE_H
```

To create a suite, we need to use `CU_add_suite`.

```c
#include <CUnit/CUnit.h>
#include <stdlib.h>

int my_suite_createSuite() {
    CU_pSuite suite = NULL;
    // Add our suite to the registry
    suite = CU_add_suite("Suite_Name", NULL, NULL);
    if (NULL == suite) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    // Add our test to the suite
    // ...

    return EXIT_SUCCESS;
}
```

➡️ `CU_add_suite` allow you to define two methods which are respectively called before and after all tests.
</div><div>

Now, we can start writing some tests:

```c
#include <CUnit/CUnit.h>

void test_example(void) {
    CU_ASSERT(1 == 1);    // test passed if true
    CU_ASSERT_TRUE(1);    // test passed if true
    CU_ASSERT_FALSE(0);   // test passed if false
    CU_ASSERT_PTR_NULL(NULL);     // test passed if null
    CU_ASSERT_PTR_NOT_NULL(NULL); // test pass if not null
    CU_ASSERT_EQUAL(1, 1);        // test passed if equal
    CU_ASSERT_NOT_EQUAL(5, 0)     // test passed if different
    CU_ASSERT_STRING_EQUAL("x", "y")     // test passed if equal
    CU_ASSERT_STRING_NOT_EQUAL("x", "y") // test passed if different
    CU_PASS("msg");     // mark the test as successful
    CU_FAIL("msg");     // mark the test as failed
    // see also: CU_ASSERT_PTR_EQUAL, *_FATAL, etc.
}
```

You will then have to add them to your suite:

```c
    // Add our test to the suite
    if (NULL == CU_add_test(suite, "Test_Name", test_example)) {
        return EXIT_FAILURE;
    }
    // ...
```

If needed, you can get the error message of a failed test using:

```c
char* msg = CU_get_error_msg();
```
</div></div>

<hr class="sep-both">

## Running Tests

<div class="row row-cols-md-2"><div>

To run your tests, you will have to initialize CUnit, declare `listSuite`, and pick a runner. First, to initialize CUnit:

```c
#include <CUnit/CUnit.h>
#include <stdlib.h>

int main() {
    CU_pSuite pSuite = NULL;
    int res;

    /* initialize the CUnit test registry */
    if (CUE_SUCCESS != CU_initialize_registry())
        return CU_get_error();

    for (int i = 0; i < NUMBER_OF_SUITES; i++) {
        res = listSuite[i](pSuite);
        if (res == EXIT_FAILURE) {
            CU_cleanup_registry();
            return CU_get_error();
        }
    }

    /* Run all tests using the ??? interface */
    /* ... */

    /* Clean up registry and return */
    CU_cleanup_registry();
    return CU_get_error();
}
```
</div><div>

The `listSuite` array contains all of your suite initialization methods allowing us to connect them to the runner.

```c
#include "my_suite.h"

// Add all methods to create suites below 
#define NUMBER_OF_SUITES 1
int (*listSuite[NUMBER_OF_SUITES])(CU_pSuite) = {
        my_suite_createSuite
};
```

Using the **basic runner** 📝, tests results are printed to the screen.

```c
#include <CUnit/Basic.h>

/* Run all tests using the basic interface */
CU_basic_set_mode(CU_BRM_VERBOSE);
CU_basic_run_tests();
```

Using the **console runner** 🤖, there is a console interface to run tests:

```c
#include <CUnit/Console.h>

/* Run all tests using the console interface */
CU_console_run_tests();
```
</div></div>