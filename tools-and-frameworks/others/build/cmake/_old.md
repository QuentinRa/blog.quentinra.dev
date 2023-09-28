# Basic CMakeLists.txt

<hr class="sep-both">

## Libraries

<div class="row row-cols-md-2"><div>

#### Using math.h

```scss!
target_link_libraries(my_program PRIVATE m)
```
</div><div>

#### Using pthread.h

```scss!
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(my_app PRIVATE Threads::Threads)
```
</div></div>