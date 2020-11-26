-- création de personne
CREATE TABLE Personne(
id_personne varchar(10) primary key,
nom varchar(50),
prenom varchar(50)
);

-- création de guichetier
CREATE TABLE Guichetier(
    -- clef étrangère
    -- ON DELETE CASCADE = si la personne n'existe plus, alors le guichetier non plus
    -- par défaut, bloque la suppression
    id_guichetier varchar(10) primary key references Personne ON DELETE CASCADE
);

-- création de spectacle
CREATE TABLE Spectacle(
n_spectacle integer primary key,
nom varchar(100) NOT NULL, -- Le nom d’un spectacle doit etre renseigné
-- on considère que durée contient des minutes car on peut représenter plus de durées
duree int check ( duree between 60 AND 240), -- La durée d’un spectacle est comprise entre une et quatre heures.
s_type enum('danse','théâtre', 'concert')
);


-- création de la table salle
CREATE TABLE Salle(
n_salle integer primary key,
nb_places integer check ( nb_places between 100 AND 500)
);

-- création de la table représentation
CREATE TABLE Representation(
-- le numéro de la salle doit pointer sur une salle. On peut pas supprimer
-- la salle sans supprimer d'abord les représentations (RESTRICT, par défaut)
n_salle integer references Salle ON DELETE RESTRICT,
r_date date,
prix integer check ( prix BETWEEN 10 AND 50), -- Le prix d’une representation varie entre 10 et 50 euros.
-- supprimer un spectacle supprime la représentation
-- Le numéro du spectacle doit être spécifié
n_spectacle integer NOT NULL references Spectacle ON DELETE CASCADE,
PRIMARY KEY (n_salle, r_date)
);

-- création de la table billet
CREATE TABLE Billet(
n_billet serial primary key,
n_salle integer,
b_date date,
nom_client varchar(50) NOT NULL,
-- spectacle supprimé alors on supprime les billets
n_spectacle integer references Spectacle(n_spectacle) ON DELETE CASCADE,
-- si la salle/date du spectacle est changée, alors on change la salle/date du billet
FOREIGN KEY (n_salle, b_date) REFERENCES Representation (n_salle, r_date) ON UPDATE CASCADE
);