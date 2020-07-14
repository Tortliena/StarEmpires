<?php 
function vitesseflotte($idflotte) 
  { 
  require __DIR__ . '/../include/BDDconnection.php';   // $vitesse = vitesseflotte($idflotte) ;
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
  require __DIR__ . '/../include/BDDconnection.php'; // $souteflotte = souteflotte($idflotte) ;
  // Capacité de cargo : faire la somme de tous les vaisseaux.
  $capacitedesoute = 0 ; 
  $reqcapacitedesoute = $bdg->prepare("SELECT SUM(capacitedesoute) as soutetotale FROM vaisseau WHERE idflottevaisseau = ?");
  $reqcapacitedesoute->execute(array($idflotte));
  $repcapacitedesoute = $reqcapacitedesoute->fetch();
  return $repcapacitedesoute['soutetotale']; 
  }

function cargaisonflotte($idflotte) 
  { 
  require __DIR__ . '/../include/BDDconnection.php'; // $quantitetransportee = cargaisonflotte($idflotte) ;
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
  require __DIR__ . '/../include/BDDconnection.php'; // $minageflotte = minageflotte($idflotte) ;
  // Capacité de minage : Prendre la plus grande valeur. 
  $minage = 1 ; 
  $reqminage = $bdg->prepare("SELECT capaciteminage FROM vaisseau WHERE idflottevaisseau = ?");
  $reqminage->execute(array($idflotte)); 
  while ($repminage = $reqminage->fetch()) 
    { 
    $minage = max($minage, $repminage['capaciteminage']);
    } 
  return $minage; 
  }

// présence d'arme

// Présence d'un module de colonisation.
function colonisateur($idflotte) 
  { 
  require __DIR__ . '/../include/BDDconnection.php'; // $peutcoloniser = colonisateur($idflotte) ;
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
?>