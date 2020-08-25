<?php 
function vitesseflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/BDDconnection.php';   // $vitesse = vitesseflotte($idflotte) ;
  // Récupérer les vitesse de tous les vaisseaux et prendre la valeur minimale.
  $vitesse = 0 ; 
  $reqvitessevaisseau = $bdg->prepare("SELECT vitesse FROM vaisseau WHERE idflottevaisseau = ?");
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
  require __DIR__ . '/../../include/BDDconnection.php'; // $souteflotte = souteflotte($idflotte) ;
  // Capacité de cargo : faire la somme de tous les vaisseaux.
  $capacitedesoute = 0 ; 
  $reqcapacitedesoute = $bdg->prepare("SELECT SUM(capacitedesoute) as soutetotale FROM vaisseau WHERE idflottevaisseau = ?");
  $reqcapacitedesoute->execute(array($idflotte));
  $repcapacitedesoute = $reqcapacitedesoute->fetch();
  return $repcapacitedesoute['soutetotale']; 
  }

function cargaisonflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/BDDconnection.php'; // $quantitetransportee = cargaisonflotte($idflotte) ;
  // Cargo actuel : Faire la somme de tout ce qui est transporté.
  $quantitetransportee = 0; 
  $reqcargo = $bdg->prepare("  SELECT SUM(c.quantiteitems) as cargaison
                                    FROM cargovaisseau c
                                    INNER JOIN vaisseau v ON c.idvaisseaucargo  = v.idvaisseau
                                    WHERE v.idflottevaisseau = ?") ;
  $reqcargo->execute(array($idflotte));
  $repcargo = $reqcargo->fetch();
  $quantitetransportee = 0 + $repcargo['cargaison']; 
  return $quantitetransportee; 
  }

function minageflotte($idflotte) 
  { 
  require __DIR__ . '/../../include/BDDconnection.php'; // $minageflotte = minageflotte($idflotte) ;
  // Capacité de minage : Prendre la plus grande valeur. 
  $minage = 0; 
  $reqminage = $bdg->prepare("SELECT capaciteminage FROM vaisseau WHERE idflottevaisseau = ?");
  $reqminage->execute(array($idflotte)); 
  while ($repminage = $reqminage->fetch()) 
    { 
    $minage = max($minage, $repminage['capaciteminage']);
    } 
  return $minage; 
  }

// Présence d'un module de colonisation.
function colonisateur($idflotte) 
  { 
  require __DIR__ . '/../../include/BDDconnection.php'; // $peutcoloniser = colonisateur($idflotte) ;
  // Présence d'un vaisseau colonisateur dans la flotte. 
  $colonisateur = false ; 
  $reqmodulecolonisateur = $bdg->prepare("  SELECT c.idvaisseaucompo
                                            FROM composantvaisseau c
                                            INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucompo
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

// Présence de noyaux sur toute la flotte
function touslesvaisseauxontunnoyau($idflotte) 
  { 
  require __DIR__ . '/../../include/BDDconnection.php'; // $touslesvaisseauxontunnoyau = touslesvaisseauxontunnoyau($idflotte) ;
  $nombredevaisseau = 0;
  $nombredenoyaux = 0;
  $niveaudesnoyaux = 0 ;

  // requete pour passer les vaisseaux par un.
  $reqnoyausurlevaisseau = $bdg->prepare("    SELECT c.totalbonus
                                              FROM composantvaisseau cv
                                              INNER JOIN datawebsite.composant c ON c.idcomposant = cv.iditemcomposant
                                              WHERE cv.idvaisseaucompo = ? AND c.typebonus = ?");

  $reqvaisseaudanslaflotte = $bdg->prepare("  SELECT idvaisseau
                                              FROM vaisseau
                                              WHERE idflottevaisseau = ?");
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
  require __DIR__ . '/../../include/BDDconnection.php'; // $estarme = armement($idflotte) ;
  // Présence d'un vaisseau armé dans la flotte.
  $arme = false;
  $reqarmedansflotte = $bdg->prepare("  SELECT c.idvaisseaucompo
                                        FROM composantvaisseau c
                                        INNER JOIN vaisseau v ON v.idvaisseau = c.idvaisseaucompo
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