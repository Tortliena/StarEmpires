<?php
session_start();
include("../include/BDDconnection.php");
// Rien n'est fait ici. Juste contient des fonctions.
include("fonctionsdutour.php");
// Permet de créer une recherche lorsqu'on a un artefact en stock.
$reqinfoartefact = $bdg->prepare("SELECT s.idjoueursilo, i.technescessaire FROM silo AS s INNER JOIN datawebsite.items AS i ON s.iditems = i.iditem WHERE typeitem = 'artefact'");
$reqinfoartefact->execute(array());
while ($repinfoartefact = $reqinfoartefact->fetch())
    {
    echo $repinfoartefact['technescessaire'] . 'tech</br>';
    echo $repinfoartefact['idjoueursilo'] . 'tech</br>';
    creerrecherche($repinfoartefact['technescessaire'], $repinfoartefact['idjoueursilo']); 
    }
?>