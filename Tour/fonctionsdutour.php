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

function gestiondegats($idvaisseau, $pvvaisseau, $degatdutir, $idarme, $idvaisseauoffensif)
  {
  include("../include/BDDconnection.php");

  $reqdiminuernbtir = $bdg->prepare("UPDATE composantvaisseau SET tirrestant = tirrestant-1 WHERE idtable = ?");
  $reqdiminuernbtir->execute(array($idarme));

  $nvpv = $pvvaisseau - $degatdutir;

  if ($nvpv < 0)
    {
    $reqinfopvvaisseau = $bdg->prepare('
      SELECT *
      FROM vaisseau WHERE idvaisseau = ?');
    $reqinfopvvaisseau->execute(array($idvaisseau));
    $repinfopvvaisseau = $reqinfopvvaisseau->fetch();

    $reqcreerasteroides = $bda->prepare('INSERT INTO champsasteroides (xaste , yaste , uniaste, typeitemsaste, quantite) VALUES (?, ?, ?, ?, ?)');

    if ($repinfopvvaisseau['idjoueurbat'] != 0)
      { // On envoit ce message uniquement aux joueurs.
      $textemessage = 'Nous avons perdu le vaisseau ' . $repinfopvvaisseau['nomvaisseau'] . ' en ' . $repinfopvvaisseau['x'] . '-' . $repinfopvvaisseau['y'] . ' lors d\'une bataille spatiale.' ; 
      $reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
      $reqmessageinterne->execute(array('Amirauté', $repinfopvvaisseau['idjoueurbat'], 0, 'Perte d\'un vaisseau', $textemessage));
      }
  
    // Créer champs d'astéroides : Reprendre le prix du vaisseau
    $nbchampsastebien = floor(($repinfopvvaisseau['biensvaisseau'] / 150));
    $nbchampsastetitane = floor(($repinfopvvaisseau['titanevaisseau'] / 30));

    if ($nbchampsastebien > 0)
      {
      $reqcreerasteroides->execute(array($repinfopvvaisseau['x'], $repinfopvvaisseau['y'], $repinfopvvaisseau['univers'], 6, $nbchampsastebien));
      }
    if ($nbchampsastetitane > 0)
      {
      $reqcreerasteroides->execute(array($repinfopvvaisseau['x'], $repinfopvvaisseau['y'], $repinfopvvaisseau['univers'], 8, $nbchampsastetitane));
      }
    if ($repinfopvvaisseau['typevaisseau'] == 2)
      { // Cas d'un vaisseau trouvé dans le 1er univers
      $reqcreerasteroides->execute(array($repinfopvvaisseau['x'], $repinfopvvaisseau['y'], $repinfopvvaisseau['univers'], 16, 1));
      $reqcreerasteroides->execute(array($repinfopvvaisseau['x'], $repinfopvvaisseau['y'], $repinfopvvaisseau['univers'], 18, 1));
      }

    // Bataille défenseur ou attaquant
    $reqdeletebataille = $bdg->prepare("DELETE FROM bataille WHERE idvaisseauoffensif = ? OR idvaisseaudefensif = ?");
    $reqdeletebataille->execute(array($idvaisseau, $idvaisseau));

    // cargovaisseau
    $reqdeletecargo = $bdg->prepare("DELETE FROM cargovaisseau WHERE idcargovaisseau = ?");
    $reqdeletecargo->execute(array($idvaisseau));

    // composantvaisseau
    $reqdeletecomposant = $bdg->prepare("DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?");
    $reqdeletecomposant->execute(array($idvaisseau));

    // vaisseau
    $reqdeletevaisseau = $bdg->prepare("DELETE FROM vaisseau WHERE idvaisseau = ?");
    $reqdeletevaisseau->execute(array($idvaisseau));

    // ordredeplacement
    $reqsupprimerordreprecedent = $bdg->prepare("DELETE FROM ordredeplacement WHERE idvaisseaudeplacement = ?");
    $reqsupprimerordreprecedent->execute(array($idvaisseau));
    $reqsupprimerordreprecedent->execute(array($idvaisseauoffensif));
    }
  else
    {
    $reqdiminuerpvvaisseau = $bdg->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
    $reqdiminuerpvvaisseau->execute(array($nvpv, $idvaisseau));
    }
  }

function disparitionvaisseau($idvaisseau)
  {
  include("../include/BDDconnection.php");
    // cargovaisseau
    $reqdeletecargo = $bdg->prepare("DELETE FROM cargovaisseau WHERE idcargovaisseau = ?");
    $reqdeletecargo->execute(array($idvaisseau));

    // composantvaisseau
    $reqdeletecomposant = $bdg->prepare("DELETE FROM composantvaisseau WHERE idvaisseaucompo = ?");
    $reqdeletecomposant->execute(array($idvaisseau));

    // vaisseau
    $reqdeletevaisseau = $bdg->prepare("DELETE FROM vaisseau WHERE idvaisseau = ?");
    $reqdeletevaisseau->execute(array($idvaisseau));
  }
?>