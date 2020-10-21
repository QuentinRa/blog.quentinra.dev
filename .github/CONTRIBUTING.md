# Comment contribuer ?

Vous devez créer une nouvelle branche, sur laquelle vous allez faire vos modifications, tel que
* corriger des fautes d'orthographe
* corriger des erreurs
* ajouter des cours/exercices

Une fois vos modifications terminées, vous devez créer une PullRequest (merge). Nous nous occuperons
alors d'ajouter vos modifications au site.

Merci de votre contribution !

## Conventions

* Les cours et exercices seront écrits en Restructured text
* Les cours sont classés dans des thèmes (maths, imperative, system, ...) et
il faut placer votre cours dans un thème/section pertinente.
* Vous devez expliciter toute source et donner tout crédit approprié
* Les commits sont atomiques : un changement par commit (un cours modifié, etc.)
ou alors vous devez décrire tout ce qui a été modifié :
```bash
git commit -m "petite description
>
> une description
> plus complète de tous
> les changements"
```