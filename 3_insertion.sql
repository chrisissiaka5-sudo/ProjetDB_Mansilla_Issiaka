-- 1. Tables indépendantes
INSERT INTO ENTREPRISE (ID_Entreprise, Raison_Sociale, Num_SIRET) VALUES
('ENT001', 'TechCorp', '12345678901234'),
('ENT002', 'GlobalLogistics', '23456789012345'),
('ENT003', 'Innovatech', '34567890123456'),
('ENT004', 'AlphaConsulting', '45678901234567'),
('ENT005', 'EcoBuild', '56789012345678'),
('ENT006', 'WebSolutions', '67890123456789'),
('ENT007', 'DesignPro', '78901234567890'),
('ENT008', 'AgriFood', '89012345678901'),
('ENT009', 'PharmaCare', '90123456789012'),
('ENT010', 'EduServices', '01234567890123');

INSERT INTO AGENCE (Code_Agence, Nom_Agence, Ville_Agence) VALUES
('AG001', 'Pay2Drive Paris Centre', 'Paris'),
('AG002', 'Pay2Drive Lyon Part-Dieu', 'Lyon'),
('AG003', 'Pay2Drive Marseille St-Charles', 'Marseille'),
('AG004', 'Pay2Drive Bordeaux Mérignac', 'Bordeaux'),
('AG005', 'Pay2Drive Strasbourg Gare', 'Strasbourg');

INSERT INTO CATEGORIE (code_categorie, libelle_categorie, tarif_journalier) VALUES
('CAT1', 'Citadine', 35.00),
('CAT2', 'Berline', 60.00),
('CAT3', 'SUV', 85.00),
('CAT4', 'Utilitaire', 50.00),
('CAT5', 'Luxe', 150.00);

INSERT INTO `OPTION` (Code_Option, Libelle_Option, Tarif_option_Defaut) VALUES
('OPT01', 'GPS', 10.00),
('OPT02', 'Siège enfant', 15.00),
('OPT03', 'Conducteur additionnel', 20.00);

INSERT INTO ASSURANCE (Code_Assurance, Nom_Assurance) VALUES
('ASS01', 'Assurance Tous Risques'),
('ASS02', 'Assurance Tiers Plus'),
('ASS03', 'Assurance Bris de Glace');

INSERT INTO INTERVENTION (ID_Intervention, Date_debut, Motif, Cout_Intervention) VALUES
('INT001', '2024-01-15', 'Révision annuelle', 150.00),
('INT002', '2024-02-10', 'Changement pneus', 300.00),
('INT003', '2024-03-05', 'Réparation carrosserie', 500.00);

-- Génération d'un échantillon de factures (Statut: En attente, Payee, Annulee)
INSERT INTO FACTURE (Num_facture, Montant_Penalites, Montant_Total_TTC, Statut_Paiement) VALUES
('FAC001', 0.00, 105.00, 'Payee'),
('FAC002', 15.00, 195.00, 'Payee'),
('FAC003', 0.00, 255.00, 'En attente'),
('FAC004', 0.00, 300.00, 'Annulee'),
('FAC005', 50.00, 500.00, 'Payee');

-- 2. Tables dépendantes (Niveau 1)
INSERT INTO EMPLOYE (matricule_employe, Code_Agence) VALUES
('EMP001', 'AG001'), ('EMP002', 'AG001'), ('EMP003', 'AG001'),
('EMP004', 'AG002'), ('EMP005', 'AG002'), ('EMP006', 'AG002'),
('EMP007', 'AG003'), ('EMP008', 'AG003'), ('EMP009', 'AG003'),
('EMP010', 'AG004'), ('EMP011', 'AG004'), ('EMP012', 'AG004'),
('EMP013', 'AG005'), ('EMP014', 'AG005'), ('EMP015', 'AG005');

INSERT INTO RESERVATION (Num_Reservation, DateHeure_Depart_Prevue, DateHeure_Retour_Prevu, code_categorie, Code_Agence, Code_Agence_1) VALUES
('RES001', '2024-05-01 10:00:00', '2024-05-04 10:00:00', 'CAT1', 'AG001', 'AG001'),
('RES002', '2024-05-10 14:00:00', '2024-05-12 14:00:00', 'CAT2', 'AG002', 'AG003'),
('RES003', '2024-06-15 09:00:00', '2024-06-20 18:00:00', 'CAT3', 'AG004', 'AG004'),
('RES004', '2024-07-01 08:00:00', '2024-07-01 20:00:00', 'CAT4', 'AG001', 'AG002'),
('RES005', '2024-08-10 10:00:00', '2024-08-15 10:00:00', 'CAT5', 'AG005', 'AG005');

INSERT INTO VEHICULE (Immatriculation, Marque, Modele, kilometrage_Actuel, Statut_Disponibilite, ID_intervention, code_categorie) VALUES
('AB-123-CD', 'Peugeot', '208', 15000, 'Disponible', NULL, 'CAT1'),
('BC-234-DE', 'Renault', 'Clio', 22000, 'Loue', NULL, 'CAT1'),
('CD-345-EF', 'Volkswagen', 'Golf', 35000, 'Disponible', NULL, 'CAT2'),
('DE-456-FG', 'Peugeot', '3008', 45000, 'Entretien', 'INT001', 'CAT3'),
('EF-567-GH', 'Mercedes', 'Classe C', 12000, 'Disponible', NULL, 'CAT5'),
('FG-678-HI', 'Renault', 'Master', 80000, 'Disponible', NULL, 'CAT4'),
('GH-789-IJ', 'Audi', 'A3', 25000, 'Loue', NULL, 'CAT2'),
('HI-890-JK', 'BMW', 'X5', 18000, 'Disponible', NULL, 'CAT3');

-- 3. Tables dépendantes (Niveau 2)
INSERT INTO CLIENT (ID_client, Nom_client, Prenom_client, Email_client, Telephone_client, Num_permis, Num_Reservation, ID_Entreprise) VALUES
('CLI001', 'Martin', 'Sophie', 'sophie.martin@email.com', '0601020304', 'PERM123456', 'RES001', NULL),
('CLI002', 'Dubois', 'Jean', 'jean.dubois@entreprise.fr', '0611223344', 'PERM234567', 'RES002', 'ENT001'),
('CLI003', 'Rousseau', 'Amina', 'amina.rousseau@mail.com', '0622334455', 'PERM345678', 'RES003', NULL),
('CLI004', 'Chen', 'Wei', 'wei.chen@techcorp.com', '0633445566', 'PERM456789', 'RES004', 'ENT001'),
('CLI005', 'Diop', 'Fatou', 'fatou.diop@email.com', '0644556677', 'PERM567890', 'RES005', NULL);

INSERT INTO CONTRAT (Num_Contrat, DateHeure_Restitution_Reelle, kilometrage_Retour, Num_facture, matricule_employe, Num_Reservation, Immatriculation) VALUES
('CON001', '2024-05-04 09:45:00', 15300, 'FAC001', 'EMP001', 'RES001', 'AB-123-CD'),
('CON002', '2024-05-12 15:30:00', 35600, 'FAC002', 'EMP004', 'RES002', 'CD-345-EF'),
('CON003', '2024-06-20 17:50:00', 18500, 'FAC003', 'EMP010', 'RES003', 'HI-890-JK'),
('CON004', NULL, NULL, 'FAC004', 'EMP002', 'RES004', 'FG-678-HI'), -- Annulée/Non restituée
('CON005', '2024-08-15 10:15:00', 12800, 'FAC005', 'EMP013', 'RES005', 'EF-567-GH');

-- 4. Tables de jointure et Partenaires
INSERT INTO PARTENAIRE (ID_partenaire, ID_intervention, Date_debut, Motif, Cout_Intervention, ID_Intervention_1) VALUES
('PART01', 'INT001', '2024-01-15', 'Révision', 150.00, 'INT001'),
('PART02', 'INT002', '2024-02-10', 'Pneus', 300.00, 'INT002');

INSERT INTO RATTACHER (Code_Agence, ID_intervention) VALUES
('AG001', 'INT001'),
('AG002', 'INT002'),
('AG003', 'INT003');

INSERT INTO SOUSCRIR (Num_Contrat, Code_Option, Code_Assurance) VALUES
('CON001', 'OPT01', 'ASS01'),
('CON002', 'OPT02', 'ASS02'),
('CON003', 'OPT01', 'ASS01'),
('CON005', 'OPT03', 'ASS03');