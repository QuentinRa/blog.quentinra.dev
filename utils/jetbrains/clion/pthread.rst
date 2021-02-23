=================================
Utiliser la librairie pthread
=================================

Lien : https://stackoverflow.com/questions/1620918/cmake-and-libpthread

Résumé

.. code:: cmake

		set(THREADS_PREFER_PTHREAD_FLAG ON)
		find_package(Threads REQUIRED)
		target_link_libraries(my_app PRIVATE Threads::Threads)