================
Installation
================

Commencez par `télécharger`_ une version de LWJGL (utiliser la version stable est recommandé).
On note que parler d'installation est un abus de langage car on n'installe pas LWJGL, on ne peut qu'uniquement
la télécharger et la charger à chaque compilation.

.. image:: /assets/imperative/lwjgl/Options.png

Vous pouvez optionnel choisir de télécharger les sources ainsi que la documentation qui est accessible `lwjgl doc`_
ou celle de `GLFW`_.

.. image:: /assets/imperative/lwjgl/Natives.png

Les natives représentent les fichiers qu'il faudra charger lors de la compilation du langage de la machine virtuelle
à notre langage machine (c'est le travail effectué par la commande java). Vous pouvez télécharger les natives de
Windows, Linux et macOs pour pouvoir lancer votre programme depuis presque n'importe quel système d'exploitation.

A partir de maintenant, nous ne traiteront que la compilation à la ligne de commande, si vous utiliser un IDE,
alors il existe déjà des tutoriels sur le site officiel concernant l'installation `lwjgl IDE`_.

Vous devez avoir précédemment installé le jdk (openjdk conseillé) par exemple avec la commande
:code:`sudo apt-get install openjdk-11-jdk` sous ubuntu.

Une fois les fichiers téléchargés (et je jdk), regroupez tous les fichiers natives dans un dossier par exemple
natives/ et par système d'exploitation natives/linux/ ; natives/windows ... et on met tout le reste dans un dossier
lib/

Donc pour le fichier natives de windows ça donnerait ça

.. image:: /assets/imperative/lwjgl/NativesWin.png

.. image:: /assets/imperative/lwjgl/OptionNone.png

.. _télécharger: https://www.lwjgl.org/customize
.. _lwjgl doc: https://javadoc.lwjgl.org/overview-summary.html
.. _lwjgl IDE: https://github.com/LWJGL/lwjgl3-wiki/wiki/1.2.-Install
.. _GLFW: https://javadoc.lwjgl.org/org/lwjgl/glfw/GLFW.html