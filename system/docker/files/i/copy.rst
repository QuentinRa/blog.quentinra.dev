=======
COPY
=======

| Forme: :code:`COPY [--chown={user}:{group}] {src} ... {dest}`
| Forme: :code:`COPY [--chown={user}:{group}] ["src", ...,"dest"]`

Copie une ou plusieurs sources à une destination.
Sous linux uniquement, chown permet de définir les permissions du fichier.

Typiquement, vous allez probablement copier les fichiers de votre application
(dossier :code:`.`) dans le WORKDIR.