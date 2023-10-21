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