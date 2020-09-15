<?php 
function vitesseflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/bddconnection.php';   // $vitesse = vitesseflotte($idflotte) ;
  // Récupérer les vitesse de tous les vaisseaux et prendre la valeur minimale.
  $vitesse = 0 ; 
  $reqvitessevaisseau = $bd->prepare("SELECT vitesse FROM c_vaisseau WHERE idflottevaisseau = ?");
  $reqvitessevaisseau->execute(array($idflotte)); 
  while ($repvitessevaisseau = $reqvitessevaisseau->fetch()) 
    { 
    if ($vitesse == 0)
      {
      $vitesse = $repvitessevaisseau['vitesse'] ;
      }
    $vitesse = min($vitesse, $repvitessevaisseau['vitesse']);
    } 
   return $vitesse; 
  } 

function souteflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/bddconnection.php'; // $souteflotte = souteflotte($idflotte) ;
  // Capacité de cargo : faire la somme de tous les vaisseaux.
  $reqcapacitedesoute = $bd->prepare("SELECT SUM(capacitedesoute) as soutetotale FROM c_vaisseau WHERE idflottevaisseau = ?");
  $reqcapacitedesoute->execute(array($idflotte));
  $repcapacitedesoute = $reqcapacitedesoute->fetch();
  return $repcapacitedesoute['soutetotale']; 
  }

function cargaisonflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/bddconnection.php'; // $quantitetransportee = cargaisonflotte($idflotte) ;
  // Cargo actuel : Faire la somme de tout ce qui est transporté.
  $quantitetransportee = 0; 
  $reqcargo = $bd->prepare("SELECT SUM(c.quantiteitems) as cargaison
                            FROM c_cargovaisseau c
                            INNER JOIN c_vaisseau v ON c.idvaisseaucargo  = v.idvaisseau
                            WHERE v.idflottevaisseau = ?") ;
  $reqcargo->execute(array($idflotte));
  $repcargo = $reqcargo->fetch();
  $quantitetransportee = 0 + $repcargo['cargaison']; 
  return $quantitetransportee; 
  }

function minageflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/bddconnection.php'; // $minageflotte = minageflotte($idflotte) ;
  // Capacité de minage : Prendre la plus grande valeur. 
  $minage = 0; 
  $reqminage = $bd->prepare("SELECT capaciteminage FROM c_vaisseau WHERE idflottevaisseau = ?");
  $reqminage->execute(array($idflotte)); 
  while ($repminage = $reqminage->fetch()) 
    { 
    $minage = $minage + $repminage['capaciteminage'];
    } 
  return $minage; 
  }

// Présence d'un module de colonisation.
function colonisateur($idflotte) 
  { 
  require __DIR__ . '/../../include/bddconnection.php'; // $peutcoloniser = colonisateur($idflotte) ;
  // Présence d'un vaisseau colonisateur dans la flotte. 
  $colonisateur = false ; 
  $reqmodulecolonisateur = $bd->prepare(" SELECT c.idvaisseaucompo
                                          FROM c_composantvaisseau c
                                          INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucompo
                                          WHERE v.idflottevaisseau = ? AND c.iditemcomposant = 23");
  // 23 = ID du composant de colonisation.
  $reqmodulecolonisateur->execute(array($idflotte));
  $repmodulecolonisateur = $reqmodulecolonisateur->fetch();
  if ($repmodulecolonisateur['idvaisseaucompo'] > 0)
    { 
    $colonisateur = true ; 
    } 
  return array ($colonisateur, $repmodulecolonisateur['idvaisseaucompo']);
  }

// Capacité de térratormation en fonction des modules.
function terraformation($idflotte) 
  {
  require __DIR__ . '/../../include/bddconnection.php'; // $peutterra = terraformation($idflotte);
  // Présence d'un terraformeur dans la flotte. 
  $reqmoduleterra = $bd->prepare(" SELECT sum(case when c.iditemcomposant = '39' then 1 else 0 end) restauration,
                                          sum(case when c.iditemcomposant = '40' then 1 else 0 end) amélioration
                                          FROM c_composantvaisseau c
                                          INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucompo
                                          WHERE v.idflottevaisseau = ?");
  // 39 = Module de restauration ; 40 = module d'amélioration.

  $reqmoduleterra->execute(array($idflotte));
  $repmoduleterra = $reqmoduleterra->fetch();
  if ($repmoduleterra['amélioration'] > 0 AND $repmoduleterra['restauration'])
    {
    $terraformer = '3' ; 
    }
  elseif ($repmoduleterra['amélioration'] > 0)
    {
    $terraformer = '2' ; 
    }
  elseif ($repmoduleterra['restauration'] > 0)
    {
    $terraformer = '1' ; 
    }
  else
    {
    $terraformer = '0' ; 
    }
  return array ($terraformer);
  }

// Présence de noyaux sur toute la flotte
function touslesvaisseauxontunnoyau($idflotte) 
  { 
  require __DIR__ . '/../../include/bddconnection.php'; // $touslesvaisseauxontunnoyau = touslesvaisseauxontunnoyau($idflotte) ;
  $nombredevaisseau = 0;
  $nombredenoyaux = 0;
  $niveaudesnoyaux = 0 ;

  // requete pour passer les vaisseaux par un.
  $reqnoyausurlevaisseau = $bd->prepare(" SELECT c.totalbonus
                                          FROM c_composantvaisseau cv
                                          INNER JOIN a_composant c ON c.idcomposant = cv.iditemcomposant
                                          WHERE cv.idvaisseaucompo = ? AND c.typebonus = ?");

  $reqvaisseaudanslaflotte = $bd->prepare(" SELECT idvaisseau FROM c_vaisseau WHERE idflottevaisseau = ?");
  $reqvaisseaudanslaflotte->execute(array($idflotte));
  while($repvaisseaudanslaflotte = $reqvaisseaudanslaflotte->fetch())   
    {
    $reqnoyausurlevaisseau->execute(array($repvaisseaudanslaflotte['idvaisseau'], 5)); // type bonus = 5 = capacité à voyager entre les dimensions.
    $repnoyausurlevaisseau = $reqnoyausurlevaisseau->fetch();
    if(isset($repnoyausurlevaisseau['totalbonus']))
      {
      if ($nombredevaisseau == 0)
        { // Permet d'armorcer : Au premier tour, on est au niveau du noyau du 1er vaisseau.
        $niveaudesnoyaux = 2*$repnoyausurlevaisseau['totalbonus'];
        }
      elseif ($nombredevaisseau != $nombredenoyaux)
        { // Si on a un nombre de vaisseaux différents de celui des noyaux, alors on a une flotte incapable de voyager.
        $niveaudesnoyaux = 1;
        }
      else
        {
        if ($niveaudesnoyaux != 2*$repnoyausurlevaisseau['totalbonus'])
          { // Si la flotte possède un vaisseau avec un noyau différent de celui actuellement calculé
          $niveaudesnoyaux = min($niveaudesnoyaux, 2*$repnoyausurlevaisseau['totalbonus']) + 1;
          }
        }
      $nombredenoyaux++;
      }
    $nombredevaisseau++;
    }

/* 
  if($niveaudesnoyaux == 0)
    { // Aucun vaisseau n'a de noyau
    $touslesvaisseauxontunnoyau = 0;
    }
  elseif ($niveaudesnoyaux == 1)
    { // Certains vaisseaux ont des noyaux, mais pas tous.
    $touslesvaisseauxontunnoyau = 2;
    }
  elseif ($niveaudesnoyaux == 2)
    { // Tous les vaisseaux ont un noyau de niveau 1
    $touslesvaisseauxontunnoyau = 1;
    }
  elseif ($niveaudesnoyaux == 3)
    { // Tous les vaisseaux ont un noyau de niveau 1 et certains ont un niveau supérieur
    $touslesvaisseauxontunnoyau = 1;
    }
  elseif ($niveaudesnoyaux == 4)
    { // Tous les vaisseaux ont un noyau de niveau 2
    $touslesvaisseauxontunnoyau = 1;
    }
*/
  return $niveaudesnoyaux;
  }

// Présence d'une arme
function armement($idflotte)
  {
  require __DIR__ . '/../../include/bddconnection.php'; // $estarme = armement($idflotte) ;
  // Présence d'un vaisseau armé dans la flotte.
  $arme = false;
  $reqarmedansflotte = $bd->prepare("   SELECT c.idvaisseaucompo FROM c_composantvaisseau c
                                        INNER JOIN c_vaisseau v ON v.idvaisseau = c.idvaisseaucompo
                                        WHERE v.idflottevaisseau = ? AND c.typecomposant = 'arme'");
  // 23 = ID du composant de colonisation.
  $reqarmedansflotte->execute(array($idflotte));
  $reparmedansflotte = $reqarmedansflotte->fetch();
  if ($reparmedansflotte['idvaisseaucompo'] > 0)
    {
    $arme = true;
    }
  return $arme;
  }
?>