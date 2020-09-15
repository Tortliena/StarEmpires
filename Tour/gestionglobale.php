<?php
session_start();
include("../include/bddconnection.php");

$Commentairestour = 'Le tour commence.';

// Rien n'est fait ici. Juste contient des fonctions.
include("01_fonctionsdutour.php");
include("../conception_vaisseau/fonction/caracteristiquesvaisseau.php");
include("../function/consommercreeritemsplanetemultiple.php");
include("../function/variable.php");
include("../hangars/fonction/flotte.php");
include("../conception_vaisseau/fonction/structurevaisseau.php");

// Changer le numéro du tour.
include("05_incrementerletour.php");

// Vider table des messages
include("10_vidertable.php");

// Début de changement des pops avec retrait des ressources. 
include("20_organisationplanete.php");

// Début de changement des pops avec retrait des ressources. 
include("22_environnementplanete.php");

// Début de changement des pops avec retrait des ressources. 
include("25_debchangpop.php");

// Calcul de la structure de la flotte pour l'entretien 
include("28_calculstructureflotte.php");

// Permet de remplir la table *variationstour* qui permet de gérer après les chantiers et les biens.
include("30_proddutour.php");

// Applique la production du tour des biens sur les stocks et la consommation des pops. Gestion des crises economiques aussi.
include("35_gestionbiens.php");

// Fin changement des pops + annulation des ordres.
include("40_finchangpop.php");

// Faire augmenter la pop.
include("45_croissancepop.php");

// Gestion de la page chantier et utilise 'proddutour'.
include("50_construction.php");

// Lance des batailles avec la flotte attaquante avec toutes les flottes en défense.
include("51_aidesflottesneutres.php");

// Lance des batailles avec la flotte attaquante avec toutes les flottes en défense.
include("52_preparationinvasionplanetaire.php");

// Boum ! ! 
include("55_combat.php");

// Mouvement de la flotte + exploration
include("60_deplacementvaisseau.php");

// Évents lors de l'exploration de l'univers du joueur !
include("65_exploration.php");

// Applique la production du tour de recherche sur les recherches en cours.
include("70_recherchetour.php");

// Destruction des bâtiments.
include("72_destructionbatiment.php");

// Mise à jour des limites des joueurs (pop, bat).
include("75_limiteplanete.php");

// MAJ vaisseaux
include("80_gestionvaisseau.php");

// Mise à jour des niveaux des joueurs.
include("85_niveaux.php");

// Permet de créer les joueurs spéciaux ou les lieux spéciaux.
include("88_creationuniverspremiertour.php");

// Créer des planètes en cas de manque de mondes dans l'univers 2.
include("89_creerplanetes.php");

// Creation des asteroides dans l'univers
include("90_creerasteroides.php");

// Creation des asteroides au neutrinos
include("91_neutrinos.php");

// Creation de planetes dans lunivers
include("92_disparitionflotte.php");

// Creation de planetes dans lunivers
include("94_creationflottealienne.php");

// Permet de créer un résumé du tour pour vérifier les bugs.
include("95_resumetour.php");

//exit;
header('Location: /administration/administration.php?voir=');
?>