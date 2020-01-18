<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

// Commentaire de début de cette phase.
function add_some_extra2(&$Commentairestour)
{
    $Commentairestour .= '</br> Début de la production des biens';
}
add_some_extra2($Commentairestour);

$applicationvariationdutour = $bdd->prepare("	UPDATE utilisateurs SET biens = 
												(CASE WHEN (biens < ?) THEN 0 ELSE (biens - ?) END)
												where id = ? ");
// Ajout au stock actuel.
$reponse = $bdd->query('SELECT idjoueur, prodbiens, consobiens FROM variationstour');
while ($donnees = $reponse->fetch())
{
$variation = $donnees['consobiens'] - $donnees['prodbiens'] ; 
$applicationvariationdutour->execute(array($variation, $variation, $donnees['idjoueur'])); 
}
$reponse->closeCursor();

// Commentaire de fin de cette phase.
function add_some_extra3(&$Commentairestour)
{
    $Commentairestour .= '</br> Fin de la production des biens';
}
add_some_extra3($Commentairestour);

?>