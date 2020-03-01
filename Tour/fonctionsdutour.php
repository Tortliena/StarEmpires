<?php
// Fonction permettant de créer une recherche :
function creerrecherche($idrecherche, $idjoueur)
  {
  include("../include/BDDconnection.php");
  $reqrechercheexistedeja = $bdg->prepare('SELECT COUNT(*) AS nb FROM rech_joueur WHERE idrech = ? AND idjoueurrecherche = ?');
  $reqrechercheexistedeja->execute(array($idrecherche, $idjoueur));
  $reprechercheexistedeja = $reqrechercheexistedeja->fetch();

  if ($reprechercheexistedeja['nb'] == 0)
    {
    $prixrech = $bdd->prepare("SELECT prixrecherche, nomrecherche FROM recherche WHERE idrecherche = ? ");
    $reqcreerrecherche = $bdg->prepare("INSERT INTO rech_joueur(idjoueurrecherche, ordrerecherche, idrech, rechnesc) VALUES (?,?,?,?)");  
    
    $reqdernieridderecherche = $bdg->query('SELECT idrechprinc FROM rech_joueur ORDER BY idrechprinc DESC LIMIT 1');
    $repdernieridderecherche = $reqdernieridderecherche->fetch();

    $prixrech->execute(array($idrecherche));
    $repprixrech = $prixrech->fetch();
    $aleatoirerecherche = rand(100 , 200) ;
    $reelprixrech = $aleatoirerecherche * $repprixrech['prixrecherche'] / 100 ;
    $reqcreerrecherche->execute(array($idjoueur, $repdernieridderecherche['idrechprinc'], $idrecherche, $reelprixrech));
      
    $reqmessageinterne = $bdg->prepare('INSERT INTO messagerieinterne (expediteur , destinataire , lu , titre , texte) VALUES (?, ?, ?, ?, ?)');
    
    $mess = 'Nous pouvons maintenant recherche "'.$repprixrech['nomrecherche'].'". Vous pouvez prioritiser cette recherche sur la page dediee a la recherche.'; 
    $reqmessageinterne->execute(array('Ministre de la recherche', $idjoueur, 0, 'Nouvelle recherche disponible', $mess));
    }
  }
// À utiliser :  creerrecherche( X (= num recherche) , $replvl['id']);

function creerconsommeritems ($iditemdepart, $iditemarrivee, $idjoueur)
  {
  include("../include/BDDconnection.php");
  // Gestion silo :
  $reqverifsilo = $bdg->prepare('SELECT quantite FROM silo WHERE idjoueursilo = ? AND iditems = ?');
  $reqcreersilo = $bdg->prepare('INSERT INTO silo (idjoueursilo, iditems, quantite) VALUES (?, ?, ?)');
  $diminutionsilo = $bdg->prepare('UPDATE silo SET quantite = quantite - 1 WHERE idjoueursilo = ? AND iditems = ?' );
  $augmentersilo = $bdg->prepare('UPDATE silo SET quantite = quantite + 1 WHERE idjoueursilo = ? AND iditems = ?' );
  $reqsupprimersilo = $bdg->prepare('DELETE FROM silo WHERE idjoueursilo = ? AND iditems = ?');

  if ($iditemdepart > 0)
    {
    // Requete pour vérifier si j'en ai en stock    
    $reqverifsilo->execute(array($idjoueur, $iditemdepart));
    $repverifsilodepart = $reqverifsilo->fetch();

    // Si oui, alors augmenter le stock
    if ($repverifsilodepart['quantite'] > 1)
        {
        $diminutionsilo->execute(array($idjoueur, $iditemdepart));
        }

    // Sinon, on supprime le stock 
    elseif ($repverifsilodepart['quantite'] == 1)
        {
        $reqsupprimersilo->execute(array($idjoueur, $iditemdepart));
        }

    // Si on a pas de stock, on ne va pas créer le nouvel équipement après.
    else
        { // Faire un break ici ?!
        goto a;
        }
    }

  if ($iditemarrivee > 0)
    {
    // Requete pour vérifier si j'en ai en stock    
    $reqverifsilo->execute(array($idjoueur, $iditemarrivee));
    $repverifsiloarrivee = $reqverifsilo->fetch();
                
    // Si oui, alors augmenter le stock
    if (isset($repverifsiloarrivee['quantite']))
        {
        $augmentersilo->execute(array($idjoueur, $iditemarrivee));
        }

    // Sinon, créer le stock stock  
    else
        {
        $reqcreersilo->execute(array($idjoueur, $iditemarrivee, 1));
        }
    }
  a:
  }

function caracteristiquesvaisesau ($idvaisseau, $idjoueur)
  {
  include("../include/BDDconnection.php");
  $totalprixbien = 50;
  $totalprixtitane = 0;
  $vitesse = 1;
  $capacitedesoute = 3;
  $capaciteminage = 1;
  $HPvaisseau = 3;
  $HPmax = 3;

  $reqmajvitessevaisseau = $bdg->prepare('UPDATE vaisseau SET vitesse = ? WHERE idvaisseau = ?');
  $reqmajsoutevaisseau = $bdg->prepare('UPDATE vaisseau SET capacitedesoute = ? WHERE idvaisseau = ?');
  $reqmajcapaciteminage = $bdg->prepare('UPDATE vaisseau SET capaciteminage = ? WHERE idvaisseau = ?');
  $requpdatePVmaxvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPmaxvaisseau = ? , HPvaisseau = ? , biensvaisseau = ? , titanevaisseau = ? WHERE idvaisseau = ?');

  $reqinformationcomposant = $bdg ->prepare('
      SELECT c.idcomposant, c.typebonus, c.totalbonus, c.HPcomposant, i.coutbien, i.couttitane, v.HPmaxvaisseau
      FROM gamer.composantvaisseau cv
      INNER JOIN datawebsite.composant c ON cv.iditemcomposant = c.idcomposant
      INNER JOIN datawebsite.items i ON cv.iditemcomposant = i.iditem
      INNER JOIN gamer.vaisseau v on cv.idvaisseaucompo = v.idvaisseau
      WHERE cv.idvaisseaucompo = ?');
  $reqinformationcomposant->execute(array($idvaisseau));
  while ($repinformationcomposant = $reqinformationcomposant->fetch())
    {
    if ($repinformationcomposant['typebonus'] > 0)
      {
      switch ($repinformationcomposant['typebonus'])
        { 
        case 1: // 1 = bonus à la vitesse.
        $vitesse = $repinformationcomposant['totalbonus'];
        break;

        case 2: // capacité des soutes.
        $capacitedesoute = $repinformationcomposant['totalbonus'];
        break;

        case 3: // capacité du minage.
        $capaciteminage = $repinformationcomposant['totalbonus'];
        break;
        }
      }
    $HPmax = $repinformationcomposant['HPmaxvaisseau'] ;
    $HPvaisseau = $HPvaisseau + $repinformationcomposant['HPcomposant'];
    $totalprixbien = $totalprixbien + $repinformationcomposant['coutbien'];
    $totalprixtitane = $totalprixtitane + $repinformationcomposant['couttitane'];
    }

  $requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET idjoueurbat = ?, biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ? WHERE idvaisseau = ?'); 
  // Updater le design du vaisseau avec les prix et l'ID du joueur.
  $requpdatedesignvaisseau->execute(array($idjoueur, $totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $idvaisseau));

  if ($HPmax != $HPvaisseau)
    {
    echo $HPmax.'a !</br>';
    echo $HPvaisseau.'a !</br>';
    echo 'a !</br>';
    $requpdatePVvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
    $requpdatePVvaisseau->execute(array($HPvaisseau, $idvaisseau));
    }
  }

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