<?php
function caracteristiquesvaisesau ($idvaisseau, $idjoueur)
  {
  include("../include/BDDconnection.php");
  $totalprixbien = 40;
  $totalprixtitane = 0;
  $capacitedesoute = 0;
  $capaciteminage = 0;
  $HPvaisseau = 3;
  $structure = -11;
  $vitesse = 1;

  $reqinformationcomposant = $bdg ->prepare('
      SELECT c.idcomposant, c.typebonus, c.totalbonus, c.HPcomposant, i.coutbien, i.couttitane, v.HPmaxvaisseau, c.structure
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
        $capacitedesoute = $repinformationcomposant['totalbonus'] + $capacitedesoute ;
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
    $structure = $repinformationcomposant['structure'] + $structure;
    }

  $capacitedesoute = MAX($capacitedesoute, 1);
  echo $totalprixbien .'prix bien, ' .$vitesse.' Vitesse. '.$HPvaisseau. ' HP vaisseau' ;
  $requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ?, structure = ? WHERE idvaisseau = ?'); 
  // Updater le design du vaisseau avec les prix et l'ID du joueur.
  $requpdatedesignvaisseau->execute(array($totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $structure, $idvaisseau));

  if (isset($HPmax))
    {
    if ($HPmax != $HPvaisseau)
      {
      $requpdatePVvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
      $requpdatePVvaisseau->execute(array($HPvaisseau, $idvaisseau));
      }
    }
  }
?>