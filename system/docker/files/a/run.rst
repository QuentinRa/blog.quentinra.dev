=======
RUN
=======

| Forme: :code:`RUN {command}`
| Forme: :code:`RUN "command1;command2;..."`
| Forme: :code:`RUN ["command","arg1","arg2"]`

La commande RUN permet d'exécuter des commandes. Les modifications sont sauvegardés dans l'image créé.
Cette commande à pour but de préparer ce qu'il faut pour les prochaines instructions.

On peut par exemple installer des paquets, faire une compilation, ...