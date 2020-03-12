<?php
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
<<<<<<< HEAD

=======
>>>>>>> master
    $HPmax = $repinformationcomposant['HPmaxvaisseau'] ;
    $HPvaisseau = $HPvaisseau + $repinformationcomposant['HPcomposant'];
    $totalprixbien = $totalprixbien + $repinformationcomposant['coutbien'];
    $totalprixtitane = $totalprixtitane + $repinformationcomposant['couttitane'];
    }

<<<<<<< HEAD
  $requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ? WHERE idvaisseau = ?'); 
  // Updater le design du vaisseau avec les prix et l'ID du joueur.
  $requpdatedesignvaisseau->execute(array($totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $idvaisseau));

  if ($HPmax != $HPvaisseau)
    {
=======
  $requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET idjoueurvaisseau = ?, biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ? WHERE idvaisseau = ?'); 
  // Updater le design du vaisseau avec les prix et l'ID du joueur.
  $requpdatedesignvaisseau->execute(array($idjoueur, $totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $idvaisseau));

  if ($HPmax != $HPvaisseau)
    {
    echo $HPmax.'a !</br>';
    echo $HPvaisseau.'a !</br>';
    echo 'a !</br>';
>>>>>>> master
    $requpdatePVvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
    $requpdatePVvaisseau->execute(array($HPvaisseau, $idvaisseau));
    }
  }
?>