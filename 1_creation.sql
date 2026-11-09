CREATE SCHEMA pay2drive_db;
USE pay2drive_db;

CREATE TABLE ENTREPRISE (
    ID_Entreprise VARCHAR(10) PRIMARY KEY,
    Raison_Sociale VARCHAR(50) NOT NULL,
    Num_SIRET VARCHAR(14) NOT NULL
);

CREATE TABLE AGENCE (
    Code_Agence VARCHAR(5) PRIMARY KEY,
    Nom_Agence VARCHAR(50) NOT NULL,
    Ville_Agence VARCHAR(50) NOT NULL
);

CREATE TABLE CATEGORIE (
    code_categorie VARCHAR(4) PRIMARY KEY,
    libelle_categorie VARCHAR(30) NOT NULL,
    tarif_journalier DECIMAL(6,2) NOT NULL
);

CREATE TABLE FACTURE (
    Num_facture VARCHAR(12) PRIMARY KEY,
    Montant_Penalites DECIMAL(6,2) DEFAULT 0,
    Montant_Total_TTC DECIMAL(8,2) NOT NULL,
    Statut_Paiement VARCHAR(20) NOT NULL
);

CREATE TABLE INTERVENTION (
    ID_Intervention VARCHAR(10) PRIMARY KEY,
    Date_debut DATE NOT NULL,
    Motif VARCHAR(100) NOT NULL,
    Cout_Intervention DECIMAL(7,2) NOT NULL
);

CREATE TABLE `OPTION` (
    Code_Option VARCHAR(10) PRIMARY KEY,
    Libelle_Option VARCHAR(50) NOT NULL,
    Tarif_option_Defaut DECIMAL(5,2) NOT NULL
);

CREATE TABLE ASSURANCE (
    Code_Assurance VARCHAR(10) PRIMARY KEY,
    Nom_Assurance VARCHAR(50) NOT NULL
);

CREATE TABLE EMPLOYE (
    matricule_employe VARCHAR(8) PRIMARY KEY,
    Code_Agence VARCHAR(5),
    FOREIGN KEY (Code_Agence) REFERENCES AGENCE(Code_Agence) 
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE RESERVATION (
    Num_Reservation VARCHAR(12) PRIMARY KEY,
    DateHeure_Depart_Prevue DATETIME NOT NULL,
    DateHeure_Retour_Prevu DATETIME NOT NULL,
    code_categorie VARCHAR(4) NOT NULL,
    Code_Agence VARCHAR(5),
    Code_Agence_1 VARCHAR(5),
    FOREIGN KEY (code_categorie) REFERENCES CATEGORIE(code_categorie) 
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (Code_Agence) REFERENCES AGENCE(Code_Agence) 
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Code_Agence_1) REFERENCES AGENCE(Code_Agence) 
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE CLIENT (
    ID_client VARCHAR(10) PRIMARY KEY,
    Nom_client VARCHAR(50) NOT NULL,
    Prenom_client VARCHAR(50) NOT NULL,
    Email_client VARCHAR(100) NOT NULL,
    Telephone_client VARCHAR(15),
    Num_permis VARCHAR(20) NOT NULL,
    Num_Reservation VARCHAR(12),
    ID_Entreprise VARCHAR(10),
    FOREIGN KEY (Num_Reservation) REFERENCES RESERVATION(Num_Reservation) 
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (ID_Entreprise) REFERENCES ENTREPRISE(ID_Entreprise) 
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE VEHICULE (
    Immatriculation VARCHAR(9) PRIMARY KEY,
    Marque VARCHAR(30) NOT NULL,
    Modele VARCHAR(50) NOT NULL,
    kilometrage_Actuel INT NOT NULL,
    Statut_Disponibilite VARCHAR(20) NOT NULL,
    ID_intervention VARCHAR(10),
    code_categorie VARCHAR(4) NOT NULL,
    FOREIGN KEY (ID_intervention) REFERENCES INTERVENTION(ID_Intervention) 
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (code_categorie) REFERENCES CATEGORIE(code_categorie) 
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE CONTRAT (
    Num_Contrat VARCHAR(12) PRIMARY KEY,
    DateHeure_Restitution_Reelle DATETIME,
    kilometrage_Retour INT,
    Num_facture VARCHAR(12),
    matricule_employe VARCHAR(8),
    Num_Reservation VARCHAR(12) NOT NULL,
    Immatriculation VARCHAR(9) NOT NULL,
    FOREIGN KEY (Num_facture) REFERENCES FACTURE(Num_facture) 
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (matricule_employe) REFERENCES EMPLOYE(matricule_employe) 
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Num_Reservation) REFERENCES RESERVATION(Num_Reservation) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Immatriculation) REFERENCES VEHICULE(Immatriculation) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE PARTENAIRE (
    ID_partenaire VARCHAR(10) PRIMARY KEY,
    ID_intervention VARCHAR(10),
    Date_debut DATE,
    Motif VARCHAR(100),
    Cout_Intervention DECIMAL(7,2),
    ID_Intervention_1 VARCHAR(10),
    FOREIGN KEY (ID_Intervention_1) REFERENCES INTERVENTION(ID_Intervention) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE RATTACHER (
    Code_Agence VARCHAR(5),
    ID_intervention VARCHAR(10),
    PRIMARY KEY (Code_Agence, ID_intervention),
    FOREIGN KEY (Code_Agence) REFERENCES AGENCE(Code_Agence) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ID_intervention) REFERENCES INTERVENTION(ID_Intervention) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SOUSCRIR (
    Num_Contrat VARCHAR(12),
    Code_Option VARCHAR(10),
    Code_Assurance VARCHAR(10),
    PRIMARY KEY (Num_Contrat, Code_Option, Code_Assurance),
    FOREIGN KEY (Num_Contrat) REFERENCES CONTRAT(Num_Contrat) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Code_Option) REFERENCES `OPTION`(Code_Option) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Code_Assurance) REFERENCES ASSURANCE(Code_Assurance) 
        ON UPDATE CASCADE ON DELETE CASCADE
);