===============================
Utiliser des libraires/.h/.a
===============================

En théorie (non testé), cette fonction ajoute un dossier de .h à toutes les cibles de votre projet.
Ce n'est pas récursif (donc sous-dossiers non ajoutés).

.. code:: cmake

	include_directories(chemin/du/dossier)

Généralement pour trouver une librairie (chemin local donc dans le projet) on fait le code
suivant. J'ai remarqué avec CUnit qui compile avec :code:`-lcunit` que le mot
LINK_PUBLIC était remplacé par cunit si ça aide.

.. code:: cmake

		find_library(VAR_NAME nom_lib chemin)
		target_link_libraries(target LINK_PUBLIC ${VAR_NAME})

Alternativement, vous pouvez faire

.. code:: cmake

	# une librairie à compiler
	add_library(ma_lib STATIC mes_fichiers)
	# puis normalement (non testé)
	target_link_libraries(target LINK_PUBLIC ma_lib)