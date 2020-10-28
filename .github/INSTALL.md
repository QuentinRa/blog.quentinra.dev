### Compiler la doc chez soi

Pas encore de tutoriel pour compiler la documentation
mais voici

* commandes utiles
```bash
pip install graphviz
pip install mathjax
pip install sphinx
pip install sphinx-rtd-theme
```

* conseils sous windows
    * il faut ajouter au PATH
        * votre dossier Python (fait de base)
        * le dossier {dossier python}/Script (non fait de base)
        
* Graphviz (permet de tracer des graphes)
    * sous Windows, j'ai dû exécuter la commande dot.exe -c
    la toute première fois
    
* la commande `make html` compile dans _build/html la documentation