# Cmake

[Go back](..)

Create a ``CmakeLists.txt`` if not already created.

```cmake
cmake_minimum_required(VERSION 3.16.3) # or 17
project(nom_projet C) # project name
set(CMAKE_C_STANDARD 99) # standard

# create a target with a name
# and add all the files
add_executable(name main.c main.h ...)
```

If the name is ``prim`` then after compiling your
CMakelist you will have it here

![targets](targets.png)

and you can

1. compile
2. select this target as the compiled one/runed one
3. change the profile
4. run this target

(A profile is a configuration. You may use theses
if you want to try to build/run using different
configurations but that should not be the case most
of the time).