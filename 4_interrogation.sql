
-- 1



select Immatriculation, Marque, Modele, Statut_Disponibilite
from VEHICULE
where Marque like 'Peugeot%';


select Immatriculation, Marque, Modele, kilometrage_Actuel
from VEHICULE
where kilometrage_Actuel between 15000 and 50000
order by kilometrage_Actuel desc;


select distinct Ville_Agence 
from AGENCE;

select Num_facture, Montant_Total_TTC, Statut_Paiement
from FACTURE
where Statut_Paiement in ('En attente', 'Annulee');


select Nom_client, Prenom_client, Email_client
from CLIENT
where Nom_client like 'D%' and Email_client is not null;

-- 2

select code_categorie, count(Immatriculation) as Nombre_Vehicules
from VEHICULE
group by code_categorie;


select Motif, sum(Cout_Intervention) as Cout_Total
from INTERVENTION
group by Motif;


select Marque, avg(kilometrage_Actuel) as Kilometrage_Moyen
from VEHICULE
group by Marque
having avg(kilometrage_Actuel) > 20000;


select Code_Agence, count(matricule_employe) as Effectif
from EMPLOYE
group by Code_Agence
having count(matricule_employe) > 2;


select Statut_Paiement, sum(Montant_Total_TTC) as Chiffre_Affaires
from FACTURE
group by Statut_Paiement;

-- 3
select V.Immatriculation, V.Marque, V.Modele, C.libelle_categorie, C.tarif_journalier
from VEHICULE V
inner join CATEGORIE C on V.code_categorie = C.code_categorie;


select V.Immatriculation, V.Marque, I.Motif, I.Date_debut
from VEHICULE V
left join INTERVENTION I on V.ID_intervention = I.ID_Intervention;


select CO.Num_Contrat, E.matricule_employe, CL.Nom_client, CL.Prenom_client
from CONTRAT CO
inner join EMPLOYE E on CO.matricule_employe = E.matricule_employe
inner join RESERVATION R on CO.Num_Reservation = R.Num_Reservation
inner join CLIENT CL on R.Num_Reservation = CL.Num_Reservation;


select I.Date_debut, I.Motif, I.Cout_Intervention, P.ID_partenaire
from INTERVENTION I
inner join PARTENAIRE P on I.ID_Intervention = P.ID_Intervention_1;


select C.Num_Contrat, C.Immatriculation, C.DateHeure_Restitution_Reelle, F.Montant_Total_TTC, F.Montant_Penalites
from CONTRAT C
inner join FACTURE F on C.Num_facture = F.Num_facture;



-- 4

select Nom_client, Prenom_client
from CLIENT
where Num_Reservation in (
    select Num_Reservation 
    from RESERVATION 
    where code_categorie = 'CAT5'
);


select Nom_Agence, Ville_Agence
from AGENCE A
where not exists (
    select 1 
    from EMPLOYE E 
    where E.Code_Agence = A.Code_Agence
);


select Immatriculation, Marque, Modele, kilometrage_Actuel
from VEHICULE
where kilometrage_Actuel >= all (
    select kilometrage_Actuel 
    from VEHICULE
);


select libelle_categorie, tarif_journalier
from CATEGORIE
where tarif_journalier > any (
    select Tarif_option_Defaut 
    from `OPTION`
);


select V1.Immatriculation, V1.Marque, V1.kilometrage_Actuel, V1.code_categorie
from VEHICULE V1
where V1.kilometrage_Actuel > (
    select avg(V2.kilometrage_Actuel)
    from VEHICULE V2
    where V2.code_categorie = V1.code_categorie
);