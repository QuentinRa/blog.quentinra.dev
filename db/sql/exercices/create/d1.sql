-- création de personne
CREATE TABLE Personne(
id_personne VARCHAR(10),
nom VARCHAR(50),
prenom VARCHAR(50),
-- contrainte "pk_personne" qui fait de "id_personne" une clef primaire
CONSTRAINT pk_personne PRIMARY KEY (id_personne));

-- création de guichetier
CREATE TABLE Guichetier(
id_guichetier VARCHAR(10),
-- clef
CONSTRAINT pk_guichetier PRIMARY KEY (id_guichetier),
-- clef étrangère
-- ON DELETE CASCADE = si la personne n'existe plus, alors le guichetier non plus
-- par défaut, bloque la suppression
CONSTRAINT fk_personne_guichetier
FOREIGN KEY (id_guichetier) REFERENCES Personne(id_personne) ON DELETE CASCADE);

-- création de spectacle
CREATE TABLE Spectacle(
n_spectacle INTEGER,
nom VARCHAR(100),
duree INTEGER, -- on considère c'est des minutes
s_type VARCHAR(10),
-- clef
CONSTRAINT pk_spectacle PRIMARY KEY (n_spectacle),
-- contrainte durée, on aurait pu mettre between
CONSTRAINT dom_duree_spectacle CHECK (duree >= 60 AND duree <= 240),
-- contrainte valeur
CONSTRAINT dom_type_spectacle CHECK (s_type IN ('theatre', 'danse', 'concert'))
);

-- création de la table salle
CREATE TABLE Salle(
n_salle INTEGER,
nb_places INTEGER,
-- clef
CONSTRAINT pk_salle PRIMARY KEY (n_salle),
-- contrainte places, on aurait pu mettre between
CONSTRAINT dom_places_salle CHECK (nb_places >= 100 AND nb_places <= 500)
);

-- création de la table représentation
CREATE TABLE Representation(
r_date DATE,
n_salle INTEGER,
prix INTEGER,
n_spectacle INTEGER,
-- clef avec deux attributs
CONSTRAINT pk_representation PRIMARY KEY (n_salle, r_date),
-- supprimer un spectacle supprime la représentation
CONSTRAINT fk_representation_spectacle
FOREIGN KEY (n_spectacle) REFERENCES Spectacle (n_spectacle) ON DELETE CASCADE,
-- le numéro de la salle doit pointer sur une salle. On peut pas supprimer
-- la salle sans supprimer d'abord les représentations (RESTRICT, par défaut)
CONSTRAINT fk_representation_salle
FOREIGN KEY (n_salle) REFERENCES Salle (n_salle) ON DELETE RESTRICT,
-- contrainte prix, on aurait pu mettre between
CONSTRAINT dom_prix_representation CHECK (prix >= 50 and prix <= 300)
);

-- création de la table billet
CREATE TABLE Billet(
n_billet SERIAL,
n_salle INTEGER,
b_date DATE,
nom_client VARCHAR(50) NOT NULL,
n_spectacle INTEGER,
-- clef
CONSTRAINT pk_billet PRIMARY KEY (n_billet),
-- spectacle supprimé alors on supprime les billets
CONSTRAINT fk_billet_spectacle
FOREIGN KEY (n_spectacle) REFERENCES Spectacle(n_spectacle) ON DELETE CASCADE,
-- si la salle/date du spectacle est changée, alors on change la salle/date du billet
CONSTRAINT fk_billet_representation
FOREIGN KEY (n_salle, b_date)
REFERENCES Representation (n_salle, r_date) ON UPDATE CASCADE
);