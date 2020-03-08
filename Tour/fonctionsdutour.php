<?php
// Fonction permettant de créer une recherche :
function creerrecherche($idrecherche, $idjoueur)
  {
  include("../include/BDDconnection.php");
  $reqrechercheexistedeja = $bdg->prepare('SELECT idrechprinc FROM rech_joueur WHERE idrech = ? AND idjoueurrecherche = ?');
  $reqrechercheexistedeja->execute(array($idrecherche, $idjoueur));
  $reprechercheexistedeja = $reqrechercheexistedeja->fetch();

  if ($reprechercheexistedeja['idrechprinc'] == 0)
    {
    $prixrech = $bdd->prepare("SELECT prixrecherche, nomrecherche FROM recherche WHERE idrecherche = ? ");
    $reqcreerrecherche = $bdg->prepare("INSERT INTO rech_joueur(idjoueurrecherche, ordrerecherche, idrech, rechnesc) VALUES (?,?,?,?)");  
    
    $prixrech->execute(array($idrecherche));
    $repprixrech = $prixrech->fetch();
    $aleatoirerecherche = rand(100 , 200) ;
    $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
    $reqcreerrecherche->execute(array($idjoueur, 1, $idrecherche, $reelprixrech));
    $dernierIDrecherche = $bdg->lastInsertId(); 

    $requpdaterecherche = $bdg->prepare('UPDATE rech_joueur SET ordrerecherche = ? WHERE idrechprinc = ?');
    $requpdaterecherche->execute(array($dernierIDrecherche, $dernierIDrecherche));

    $reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
    
    $mess = 'Nous pouvons maintenant recherche "'.$repprixrech['nomrecherche'].'". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.'; 
    $reqmessageinterne->execute(array('Ministre de la recherche', $idjoueur, 0, 'Nouvelle recherche disponible', $mess));
    }
  }
// À utiliser :  creerrecherche( X (= num recherche) , $replvl['id']);

function nombrealeatoireavecpoid(array $ValeurPoid)
  {
  $rand = RAND(1, (int) array_sum($ValeurPoid));
  foreach ($ValeurPoid as $key => $value)
    {
    $rand -= $value;
    if ($rand <= 0)
      {
      return $key;
      }
    }
  }
?>