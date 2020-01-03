<?php
session_start();
include("../script/BDDconnection.php");
?>

<?php
$Commentairestour = 'Le tour commence.' ;

// Changer le numéro du tour.
include("incrementerletour.php");

// Vider table des messages
include("vidertable.php");

// Évènements aléatoires qui arrivent aux joueurs qui ne sont pas dans une chaine d'évènements.
include("eventaleatoire.php");

// Évènements aléatoires qui arrivent aux joueurs qui ne sont pas dans une chaine d'évènements.
include("eventsuite.php");

// Début de changement des pops avec retrait des ressources. 
include("debchangpop.php");

// Permet de remplir la table *variationstour* qui permet de gérer après les chantiers et les biens.
include("proddutour.php");

// Applique la production du tour des biens sur les stocks et la consommation des pops.
include("gestionbiens.php");

// Fin changement des pops + annulation des ordres.
include("finchangpop.php");

// Si stocks arrivent à 0 ... 
include("criseeconomique.php");

// Applique la production du tour de recherche sur les recherches en cours.
include("recherchetour.php");

// Faire augmenter la pop.
include("croissancepop.php");

// Gestion de la page chantier et utilise 'proddutour'.
include("construction.php");

// Mouvement de la flotte + exploration
include("deplacementvaisseau.php");

// Évents lors de l'exploration de l'univers du joueur !
include("explorationuniv0.php");

// Mise à jour des limites des joueurs (pop, bat).
include("limitesjoueurs.php");

// Mise à jour des niveaux des joueurs.
include("niveaux.php");

// Permet de créer un résumé du tour pour vérifier les bugs.
include("resumetour.php");

header('Location: ../Passerletourmanuellement?voir=');
?>