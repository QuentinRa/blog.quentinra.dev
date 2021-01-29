======================
Notation nom1.nom
======================

Il se peut que certains fonctions aient un nom de la forme :code:`nom1.nom`
(par exemple data.frame). Généralement cela ne veut rien dire mais certaines
fois cela sert à grouper des fonctions (nom1 référé comme une méthode
générique) ou faire une séparation classe/objet (voir ?formula).

La fonction :code:`methods("nom")` affiche tous les dérivations de la fonction
générique.