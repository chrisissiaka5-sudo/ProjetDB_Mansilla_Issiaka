# ProjetDB_Mansilla_Issiaka
## Projet Système d'Information — Pay2Drive

Ce dépôt contient le dossier complet d'analyse pour la conception du système d'information de l'entreprise **Pay2Drive**, conçu selon la méthode **MERISE**.

---

## 1. Cahier des Charges & Instructions (Prompt d'Origine)

> **Prompt d'analyse initial :**
> 
> Tu travailles dans le domaine de location de voiture. Ton entreprise « Pay2Drive » a comme activité de mettre en location des voitures. C’est une entreprise comme Europcar Mobility Group et SIXT.
> 
> À partir des informations trouvées sur Europcar Mobility Group et SIXT, nous avons principalement étudié :
> * les clients ;
> * les véhicules ;
> * les agences ;
> * les réservations ;
> * les locations ;
> * les contrats ;
> * les paiements ;
> * les tarifs ;
> * les disponibilités des véhicules ;
> * les catégories de véhicules ;
> * les services proposés ;
> * les employés ;
> * les partenaires ;
> * les entreprises clientes ;
> * les retours de véhicules ;
> * l’entretien des véhicules ;
> * les assurances ;
> * la facturation.
> 
> Ces éléments nous ont servi de base pour réfléchir aux informations nécessaires au fonctionnement de notre entreprise fictive de location de voitures. Inspire-toi des sites web suivants : https://www.europcar-mobility-group.com/ et https://www.sixt.fr/
> 
> Ton entreprise « Pay2Drive » veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.
> 
> D’abord, établis les règles de gestion des données de ton « Pay2Drive », sous la forme d'une liste à puces. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information. Veille à bien inclure la gestion des partenaires, le suivi de l'entretien et des disponibilités des véhicules, ainsi que le processus complet de retour et de facturation.
> 
> Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
> 
> Fournis donc les règles de gestion et le dictionnaire de données.

---

## 2. Présentation du Projet

**Pay2Drive** est une entreprise spécialisée dans la location de véhicules légers. Elle s'appuie sur un réseau d'agences physiques, une gestion fine des catégories de véhicules, un suivi en temps réel du parc auto, un réseau de partenaires externes (entretien/inspection) et un processus rigoureux allant de la réservation à la facturation post-restitution.

---

## 3. Règles de Gestion Métier

* Un client crée un profil chez Pay2Drive soit en tant que particulier, soit au nom d'une entreprise cliente dûment identifiée par son numéro de SIRET.
* Le réseau Pay2Drive est constitué de plusieurs agences physiques. Chaque employé travaille exclusivement pour une seule agence.
* La flotte est segmentée en catégories de véhicules (citadine, berline, SUV, etc.). Le tarif journalier de base est fixé par catégorie et non par véhicule.
* Un véhicule physique unique est identifié par sa plaque d'immatriculation et possède un statut de disponibilité actualisé en temps réel (disponible, en cours de location, ou en entretien).
* Le client réserve une catégorie de véhicule pour des dates et heures précises, en spécifiant une agence de départ et une agence de retour.
* Le contrat de location est généré le jour du départ : c'est uniquement à ce moment-là qu'un véhicule physique spécifique et disponible est rattaché à la location.
* Le client peut enrichir son contrat en y associant des assurances complémentaires et des services optionnels (conducteur additionnel, siège enfant, GPS).
* Pay2Drive fait appel à des partenaires externes (garages franchisés, centres de nettoyage, experts automobiles) qui sont rattachés à nos différentes agences pour opérer sur la flotte.
* Le suivi de l'entretien est strict : si un véhicule signale une avarie, subit un sinistre ou atteint son palier kilométrique de révision, il est immédiatement passé en statut "indisponible". Il est alors confié à un partenaire pour une intervention ayant une date de début, un motif et un coût.
* Le processus de retour exige qu'un employé réceptionne le véhicule, enregistre la date et l'heure réelles d'arrivée, relève le nouveau kilométrage et procède à une inspection de l'état de la carrosserie et de l'habitacle.
* La facturation est clôturée après le retour : le système édite une facture unique qui compile le tarif de base, les services et assurances, et y ajoute d'éventuelles pénalités (retard de restitution, dépassement du forfait kilométrique, ou frais de remise en état suite à des dommages).
* Le paiement solde la facture et archive le dossier de location.

---

## 4. Dictionnaire de Données Brutes

| Signification de la donnée | Type | Taille (caractères ou chiffres) |
| :--- | :--- | :--- |
| Numéro d'identification interne du client | Alphanumérique | 10 |
| Nom de famille du client | Alphabétique | 50 |
| Prénom du client | Alphabétique | 50 |
| Adresse e-mail de contact | Alphanumérique | 100 |
| Numéro de téléphone mobile | Alphanumérique | 15 |
| Numéro d'enregistrement du permis de conduire | Alphanumérique | 20 |
| Raison sociale de l'entreprise cliente | Alphabétique | 50 |
| Numéro SIRET de l'entreprise cliente | Numérique | 14 |
| Code d'identification de l'agence | Alphanumérique | 5 |
| Nom commercial de l'agence | Alphabétique | 50 |
| Ville d'implantation de l'agence | Alphabétique | 50 |
| Matricule RH de l'employé | Alphanumérique | 8 |
| Plaque d'immatriculation du véhicule | Alphanumérique | 9 |
| Marque constructeur du véhicule | Alphabétique | 30 |
| Modèle exact du véhicule | Alphanumérique | 50 |
| Kilométrage total actuel du véhicule | Numérique | 7 |
| Statut de disponibilité (disponible, loué, entretien) | Alphabétique | 20 |
| Code d'identification de la catégorie | Alphanumérique | 4 |
| Libellé descriptif de la catégorie | Alphabétique | 30 |
| Tarif journalier de base de la catégorie | Numérique (décimal) | 6 |
| Numéro unique de la réservation | Alphanumérique | 12 |
| Date et heure prévues pour le départ | Date/Heure | 16 |
| Date et heure prévues pour le retour | Date/Heure | 16 |
| Numéro officiel du contrat de location | Alphanumérique | 12 |
| Date et heure réelles de restitution | Date/Heure | 16 |
| Libellé du service optionnel souscrit | Alphabétique | 50 |
| Tarif forfaitaire du service optionnel | Numérique (décimal) | 5 |
| Nom de la formule d'assurance | Alphabétique | 50 |
| Numéro d'identification du partenaire externe | Alphanumérique | 10 |
| Nom de l'entreprise partenaire (garage, nettoyage) | Alphabétique | 50 |
| Motif de la mise en entretien (panne, révision...) | Alphanumérique | 100 |
| Coût facturé par le partenaire pour l'entretien | Numérique (décimal) | 7 |
| Numéro comptable de la facture finale | Alphanumérique | 12 |
| Montant des pénalités appliquées au retour | Numérique (décimal) | 6 |
| Montant total TTC facturé au client | Numérique (décimal) | 8 |

---
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/672c471e-b8c8-4a89-b610-aa919210bb2e" />

<img width="1600" height="900" alt="WhatsApp Image 2026-10-30 at 11 12 31" src="https://github.com/user-attachments/assets/6f28b713-c3ff-4ef7-aad5-6928b7941b78" />


5-1) script 

Le responsable de la flotte doit planifier les prochains entretiens des véhicules et évaluer les coûts de réparation récents pour optimiser le budget. Il a aussi besoin de savoir quels véhicules sont actuellement indisponibles à cause de ces interventions.

Liste des données à extraire :

La liste des véhicules (immatriculation, marque, modèle) dont le statut est "Entretien".

Le kilométrage actuel des véhicules par rapport à la moyenne de leur catégorie pour anticiper l'usure.

Le coût total des interventions réalisées sur le dernier trimestre, regroupé par motif d'intervention.

Les coordonnées des partenaires (garages) ayant facturé les interventions les plus chères.

Les véhicules qui n'ont subi aucune intervention depuis plus d'un an.
