<?php
session_start();
include("../include/bddconnection.php");

/*
echo $_SESSION['pseudo'] . '</br>' ;
echo $_SESSION['id'] . '</br>' ;
echo $_POST['idrecherche'] . '</br>';
*/

// Permet de récupérer les infos sur la recherche en cours !
$reqrechercheafaire = $bd->prepare("SELECT ordrerecherche, idrechprinc FROM c_rech_joueur WHERE idjoueurrecherche =  ? AND idrech = ?");
$reqrechercheafaire->execute(array($_SESSION['id'] , $_POST['idrecherche']));
$reprechafaire = $reqrechercheafaire->fetch();

$reqrechercheencours = $bd->prepare("   SELECT ordrerecherche, idrechprinc FROM c_rech_joueur
                                        WHERE idjoueurrecherche =  ? AND rechposs = 0
                                        ORDER BY ordrerecherche ASC LIMIT 1");
$reqrechercheencours->execute(array($_SESSION['id']));
$reprechercheencours = $reqrechercheencours->fetch();

$reprechercheencours['ordrerecherche'];
$reprechafaire['ordrerecherche'];

$requpdaterecherche = $bd->prepare('UPDATE c_rech_joueur SET ordrerecherche = ? WHERE idrechprinc =  ?');
$requpdaterecherche->execute(array($reprechercheencours['ordrerecherche'], $reprechafaire['idrechprinc']));
$requpdaterecherche->execute(array($reprechafaire['ordrerecherche'], $reprechercheencours['idrechprinc']));

header('Location: ../recherche.php?message=17');
?>