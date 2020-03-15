<?php
session_start();
include("../include/BDDconnection.php");

$Commentairestour = 'Le tour commence.' ;

// Rien n'est fait ici. Juste contient des fonctions.
include("fonctionsdutour.php");
include("../function/caracteristiquesvaisseau.php");
include("../function/consommercreeritemsplanetemultiple.php");

// Changer le numéro du tour.
include("incrementerletour.php");

// Vider table des messages
include("vidertable.php");

// Évènements aléatoires qui arrivent aux joueurs qui ne sont pas dans une chaine d'évènements.
// include("eventaleatoire.php");

// Évènements aléatoires qui arrivent aux joueurs qui ne sont pas dans une chaine d'évènements.
// include("eventsuite.php");

// Début de changement des pops avec retrait des ressources. 
// include("organisationplanete.php");

// Début de changement des pops avec retrait des ressources. 
include("debchangpop.php");

// Permet de remplir la table *variationstour* qui permet de gérer après les chantiers et les biens.
include("proddutour.php");

// Applique la production du tour des biens sur les stocks et la consommation des pops. Gestion des crises economiques aussi.
include("gestionbiens.php");

// Fin changement des pops + annulation des ordres.
include("finchangpop.php");

// Faire augmenter la pop.
include("croissancepop.php");

// Gestion de la page chantier et utilise 'proddutour'.
include("construction.php");

// Boum ! ! 
include("combat.php");

// Mouvement de la flotte + exploration
include("deplacementvaisseau.php");

// Évents lors de l'exploration de l'univers du joueur !
include("exploration.php");

// Applique la production du tour de recherche sur les recherches en cours.
// include("recherchetour.php");

// Mise à jour des limites des joueurs (pop, bat).
include("limiteplanete.php");

// MAJ vaisseaux
include("gestionvaisseau.php");

// Mise à jour des niveaux des joueurs.
include("niveaux.php");

// Permet de créer un résumé du tour pour vérifier les bugs.
include("resumetour.php");

header('Location: ../administration.php?voir=');
?>