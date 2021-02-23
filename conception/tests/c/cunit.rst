==============================
Utiliser CUnit sous CLion
==============================

Tout d'abord, vous devrez installer CUnit, ce qui se fait avec
les commandes vu précédemment sous linux. Si vous n'avez pas une WSL/Remote
sous Windows alors bon courage sinon installez cunit sous la machine linux puis
configurez CLion (voir cours jetbrains) pour utiliser votre machine.

Ensuite, vous devez copier ce code qui a marché chez moi (source: https://gist.github.com/adobkin/1073354)
mais qui peut sûrement être réduit dans CMakeList.txt

.. code:: cmake

		# https://gist.github.com/adobkin/1073354
		FIND_PATH(CUNIT_INCLUDE_DIR NAMES CUnit/CUnit.h)
		MARK_AS_ADVANCED(CUNIT_INCLUDE_DIR)
		FIND_LIBRARY(CUNIT_LIBRARY NAMES
						cunit
						libcunit
						cunitlib
						)
		MARK_AS_ADVANCED(CUNIT_LIBRARY)
		INCLUDE(FindPackageHandleStandardArgs)
		FIND_PACKAGE_HANDLE_STANDARD_ARGS(CUnit DEFAULT_MSG CUNIT_LIBRARY CUNIT_INCLUDE_DIR)

		IF(CUNIT_FOUND)
				SET(CUNIT_LIBRARIES ${CUNIT_LIBRARY})
				SET(CUNIT_INCLUDE_DIRS ${CUNIT_INCLUDE_DIR})
		ENDIF(CUNIT_FOUND)

		# ici on ajoute à notre cible prim, la librairie chargée
		target_link_libraries(prim cunit ${CUNIT_LIBRARIES})