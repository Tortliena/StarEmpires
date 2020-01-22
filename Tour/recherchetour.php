<?php
/*
session_start();
include("../script/BDDconnection.php");
*/

/* Commentaire de début de cette phase.
function debutdesconstructions(&$Commentairestour)
{
    $Commentairestour .= '</br> Début de la production des biens';
}
debutdesconstructions($Commentairestour);
*/
$reqrecherencours = $bdd->prepare(" SELECT avrech , rechnesc
                                    FROM rech_joueur
                                    WHERE idjoueurrecherche = ? AND rechposs = 0
                                    ORDER BY idrechprinc DESC LIMIT 1 ");

$avancement = $bdd->prepare(" UPDATE rech_joueur
                              SET avrech =  avrech + ? , rechposs = ?
                              WHERE rech_joueur.idjoueurrecherche = ? AND rechposs = 0
                              ORDER BY idrechprinc DESC LIMIT 1 ");

$message = $bdd->prepare("  INSERT INTO messagetour (idjoumess , message , domainemess)
                            VALUES (?, ?, ?)");

$reponse = $bdd->query('SELECT idjoueur , recherche FROM variationstour ORDER BY idjoueur');
  while ($infojoueur = $reponse->fetch())
    {
    $reqrecherencours ->execute(array($infojoueur['idjoueur']));
    while ($reprecherencours = $reqrecherencours->fetch())
          { // Si pas assez de recherche, avancer la recherche. 
       if ($infojoueur['recherche'] + $reprecherencours['avrech'] < $reprecherencours['rechnesc'])
            {
            $avancement->execute(array($infojoueur['recherche'], 0, $infojoueur['idjoueur']));
            } 
           
        // Si assez de recherche, alors avancer la rechercher + la marquée comme possédée. 
          else
            {
            $avancement->execute(array($infojoueur['recherche'], 1, $infojoueur['idjoueur']));
            $message->execute(array($infojoueur['idjoueur'], 'Vous venez de finir une recherche', 'recherche'));
            }
          }
       }
$reqrecherencours->closeCursor();
$reponse->closeCursor();

/*
// Commentaire de fin de cette phase.
function findesconstructions(&$Commentairestour)
{
    $Commentairestour .= '</br> Fin de la production des biens';
}
findesconstructions($Commentairestour);
*/
?>