<?php
session_start();
include("../include/BDDconnection.php");

echo $_SESSION['id'] . ' id du joueur </br>';
echo $_POST['arme'] . ' id du composant arme </br>';
echo $_POST['soute'] . ' id du composant soute </br>';
echo $_POST['coque'] . ' id du composant coque </br>';
echo $_POST['moteur'] . ' id du composant moteur </br>';
// header("Location: ../design.php"));

// Créer design global.
$reqcreerdesign = $bdg->prepare('INSERT INTO designvaisseau (idjoueurdesign, prixbiendesign, prixtitanedesign) VALUES (?, ?, ?)'); 
$reqcreerdesign->execute(array(-$_SESSION['id'], 0, 0));

echo LAST_INSERT_ID() ' id de la ligne créée </br>'; 


// Récupérer ID + mettre joueur à -ID du joueur.

// Créer composants du design

// Updater le design du vaisseau avec les prix et l'ID du joueur.

?>