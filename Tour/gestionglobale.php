<?php
session_start();
include("../include/bddconnection.php");

$Commentairestour = 'Le tour commence.';


// Détermine le type de tour et si on peut passer le tour.
include("01_autorisationpourpasserletour.php");
// Donne la varible $tourrestraint = 'oui' = demande noob de passer le tour, sinon $tourrestraint = 'non' = tour passé par un admin ou par le CRON.

// Rien n'est fait ici. Juste contient des fonctions.
include("03_fonctionsdutour.php");
include("../conception_vaisseau/fonction/caracteristiquesvaisseau.php");
include("../function/consommercreeritemsplanetemultiple.php");
include("../function/variable.php");
include("../function/planeteperteniveau.php");
include("../hangars/fonction/flotte.php");
include("../conception_vaisseau/fonction/structurevaisseau.php");

if ($tourrestraint == 'non')
    {
    // Changer le numéro du tour. Bloque le tour si le précédent n'est pas fini.
    include("05_incrementerletour.php");
    }

// Vider table des messages
include("10_vidertable.php");

// Permet d'améliorer l'organisation des planètes.
include("20_organisationplanete.php");

if ($tourrestraint == 'non')
    {
    // Permet de gérer le prestige et le niveau des planètes. Pas accessible à bas niveau.
    include("21_prestigeetniveauplanete.php");
    
    // Permet d'améliorer l'environnement des planètes. Pas accessible à bas niveau.
    include("22_environnementplanete.php");
    }

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

if ($tourrestraint == 'non')
    {
    // Lance des batailles avec la flotte attaquante avec toutes les flottes en défense.
    include("51_aidesflottesneutres.php");
    
    // Lance des batailles avec la flotte attaquante avec toutes les flottes en défense.
    include("52_preparationinvasionplanetaire.php");
    }

// Boum ! ! 
include("55_combat.php");

// Mouvement de la flotte + exploration
include("60_deplacementvaisseau.php");

if ($tourrestraint == 'non')
    {
    // Transfert des vaisseaux. Initier transferts + diminuer temps + finir transfert.
    include("63_transfertvaisseau.php");
    }

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

if ($touractuel['id'] == 1 AND $tourrestraint == 'non')
    {     // Permet de créer les joueurs spéciaux ou les lieux spéciaux. 
    include("88_creationuniverspremiertour.php");
    }

if ($tourrestraint == 'non')
    {
    // Créer des planètes en cas de manque de mondes dans l'univers 2.
    include("89_creerplanetes.php");

    // Creation des asteroides dans l'univers
    include("90_creerasteroides.php");

    // Creation des asteroides au neutrinos
    include("91_neutrinos.php");
    }

// Creation de planetes dans lunivers
include("92_disparitionflotte.php");

if ($tourrestraint == 'non')
    {
    // Creation de planetes dans lunivers
    include("94_creationflottealienne.php");
    // Permet de créer un résumé du tour pour vérifier les bugs.
    include("95_resumetour.php");
    }

    /*
if ($tourrestraint == 'non')
    {
    header('Location: /administration/administration.php?voir=');
    }
else
    {
    header('Location: /capitale/capitale.php?message=85');
    }
*/


/*
Fonction CRON :

Exporter BDD :
0 	0 	* 	* 	* wget ­-q https://starsempire.go.yj.fr/administration/script/exporterbdd.php?table=autre&backup=oui&mdp=lrsngrlsntjls >/dev/null 2>&1

Passer le tour :
0 	10 	* 	* 	* wget ­-q https://starsempire.go.yj.fr/tour/gestionglobale.php?mdp=lrsngrlsntjls >/dev/null 2>&1

*/
?>