ALTER TABLE CLIENT 
ADD CONSTRAINT chk_email_format CHECK (Email_client LIKE '%@%');

ALTER TABLE ENTREPRISE
ADD CONSTRAINT chk_siret_length CHECK (LENGTH(Num_SIRET) = 14);

ALTER TABLE VEHICULE 
ADD CONSTRAINT chk_statut_dispo CHECK (Statut_Disponibilite IN ('Disponible', 'Loue', 'Entretien'));

ALTER TABLE FACTURE 
ADD CONSTRAINT chk_statut_paiement CHECK (Statut_Paiement IN ('En attente', 'Payee', 'Annulee'));

ALTER TABLE VEHICULE 
ADD CONSTRAINT chk_km_positif CHECK (kilometrage_Actuel >= 0);

ALTER TABLE CATEGORIE 
ADD CONSTRAINT chk_tarif_positif CHECK (tarif_journalier > 0);

ALTER TABLE INTERVENTION 
ADD CONSTRAINT chk_cout_intervention CHECK (Cout_Intervention >= 0);

ALTER TABLE RESERVATION 
ADD CONSTRAINT chk_dates_reservation CHECK (DateHeure_Retour_Prevu > DateHeure_Depart_Prevue);

ALTER TABLE CONTRAT
ADD CONSTRAINT chk_km_retour CHECK (kilometrage_Retour >= 0);