<?php
session_start();
include("../include/BDDconnection.php");


// Pour lvl 6 à 7
$reqvaisseau = $bdg->prepare("SELECT idvaisseau, HPmaxvaisseau, HPvaisseau FROM vaisseau WHERE HPmaxvaisseau <> HPvaisseau");
$reqvaisseau->execute(array());
$repvaisseau = $reqvaisseau->fetch();


echo $repvaisseau['idvaisseau'] . 'id du vaisseau !'; 

?>