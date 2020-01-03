<?php
session_start();
include("BDDconnection.php");

echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idrecherche'] . '</br>';

$reqrechercheafaire = $bdd->prepare(
    "SELECT idrech, avrech , rechnesc
    FROM rech_joueur
    WHERE idjoueurrecherche =  ? AND idrech = ?");
$reqrechercheafaire->execute(array($_SESSION['id'] , $_POST['idrecherche']));
$reprechafaire = $reqrechercheafaire->fetch();

$supanciennerech = "DELETE FROM rech_joueur WHERE idjoueurrecherche = ? AND idrech = ? " ;
$bdd->prepare($supanciennerech)->execute([$_SESSION['id'], $_POST['idrecherche']]);

$_SESSION['message1'] = $_POST['combien'];
$_SESSION['message2'] = $info[0];
header('Location: ../recherche.php?message=17');
    ?>