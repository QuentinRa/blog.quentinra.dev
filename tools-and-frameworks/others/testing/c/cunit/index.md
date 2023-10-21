# CUnit

<div class="row row-cols-md-2"><div>

[CUnit](https://linux.die.net/man/3/cunit) is a testing framework for the C programming language. It's not a popular testing framework, nor it is commonly used. ☠️

```shell!
$ sudo apt-get update
$ sudo apt-get install libcunit1 libcunit1-doc libcunit1-dev
```

The documentation is [available here](https://cunit.sourceforge.net/).
</div><div>

...
</div></div>

<hr class="sep-both">

## Get Started with CMake

<div class="row row-cols-md-2"><div>

In order to use `cunit` with [cmake](/tools-and-frameworks/others/build/cmake/index.md):

```cmake
find_package(CUnit REQUIRED)
```

You need to create a finder `cmake/modules/FindCUnit.cmake`.

```cmake
find_path(CUNIT_INCLUDE_DIRS CUnit/CUnit.h)
find_library(CUNIT_LIBRARIES NAMES CUnit cunit)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(CUnit
        REQUIRED_VARS CUNIT_INCLUDE_DIRS CUNIT_LIBRARIES
        VERSION_VAR CUNIT_VERSION)
```

And ensure it is tracked with cmake:

```cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules")
```
</div><div>

There is obviously no support for `ctest`, so we can only generate an executable and run it.

```cmake
# Create an executable for your test suite
add_executable(my_testing_target 
    tests/my_suite.c
)

# Link CUnit to your test suite
target_link_libraries(my_testing_target ${CUNIT_LIBRARIES})
```
</div></div>

<hr class="sep-both">

## Basic Test Suite

<div class="row row-cols-md-2"><div>

A suite is a group of tests that share the same purpose, e.g., for instance, test that are specific to one component.

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
</div><div>

Now, we can start writing some tests:

```c
#include <CUnit/CUnit.h>

void test_example(void) {
    CU_ASSERT(1 == 1);
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
</div></div>