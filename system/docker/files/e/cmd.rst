====
CMD
====

| Forme: :code:`CMD {command}`
| Forme: :code:`CMD "command1;command2;..."`
| Forme: :code:`CMD ["command","arg1","arg2"]`

| Il ne peut y avoir qu'une seule instruction CMD par Dockerfile.
| Il s'agit d'une commande qui sera exécutée à l'exécution du docker.
| Elle sert à définir les paramètres par défaut du docker.

C'est typiquement une commande fait au lancement donc par exemple
l'exécution d'un exécutable par exemple.