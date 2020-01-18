<?php 
session_start();
include("BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['choix'] . '</br>' ;

// Récupérer les choix possibles pour le joueur.
$reqvaleurpossibleprochainevent = $bdd->prepare('SELECT	eventsuite1, eventsuite2, eventsuite3 FROM choixevents WHERE idjoueurevent = ?');
$reqvaleurpossibleprochainevent->execute(array($_SESSION['id']));
$repvaleurpossibleprochainevent = $reqvaleurpossibleprochainevent->fetch();

echo $repvaleurpossibleprochainevent['eventsuite1'] . '</br>' ; 
echo $repvaleurpossibleprochainevent['eventsuite2'] . '</br>' ; 
echo $repvaleurpossibleprochainevent['eventsuite3'] . '</br>' ; 

// Vérifier si c'est possible d'avoir ce choix.
if ($_POST['choix'] == $repvaleurpossibleprochainevent['eventsuite1'] OR $_POST['choix'] == $repvaleurpossibleprochainevent['eventsuite2'] OR $_POST['choix'] == $repvaleurpossibleprochainevent['eventsuite3'])
	{// Changer le prochain évent dans ce cas.
	$reqchangerevent = $bdd->prepare('UPDATE utilisateurs SET ideventsuivant = ? WHERE id = ?');
	$reqchangerevent->execute(array($_POST['choix'], $_SESSION['id']));
	header('Location: ../Capitale.php?message=27');
	exit();
	}


// Sinon, retour page capitale.

?>