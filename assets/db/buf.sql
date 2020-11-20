DROP TABLE IF EXISTS Personne;
DROP TABLE IF EXISTS Guichetier;
DROP TABLE IF EXISTS Billet;
DROP TABLE IF EXISTS Representation;
DROP TABLE IF EXISTS Salle;
DROP TABLE IF EXISTS Spectacle;

CREATE TABLE Personne(
                         id_personne varchar(10) primary key,
                         nom varchar(50),
                         prénom varchar(50)
);

CREATE TABLE Guichetier(
    id_guichetier varchar(10) references Personne ON DELETE CASCADE
);

CREATE VIEW V_Guichetier(id_guichetier, nom, prénom)
as SELECT id_guichetier, nom, prénom
   FROM Guichetier JOIN Personne P on P.id_personne = Guichetier.id_guichetier;

CREATE TABLE Spectacle(
                          n_spectacle integer primary key,
                          nom varchar(100) NOT NULL, -- Le nom d’un spectacle doit etre renseigné
                          durée int check ( durée between 1 AND 4), -- La duree d’un spectacle est comprise entre une et quatre heures.
                          s_type enum('danse','théâtre', 'concert')
);

CREATE TABLE Salle(
                      n_salle integer primary key,
                      nb_places integer check ( nb_places between 100 AND 500)
);

CREATE TABLE Représentation(
                               n_salle integer references Salle ON DELETE RESTRICT,
                               r_date date,
                               prix integer check ( prix BETWEEN 10 AND 50), -- Le prix d’une representation varie entre 10 et 50 euros.
                               n_spectacle integer NOT NULL references Spectacle, -- Le numero du spectacle doit être spécifié
                               PRIMARY KEY (n_salle, r_date)
);

CREATE TABLE Billet(
                       n_billet serial primary key,
                       n_salle integer references Représentation(n_salle),
                       b_date date references Représentation(r_date),
                       nom_client varchar(50) NOT NULL,
                       n_spectacle references Spectacle
);

