<?php
function caracteristiquesvaisseau ($idvaisseau)
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
      SELECT c.idcomposant, c.typebonus, c.totalbonus, c.HPcomposant, i.coutbien, i.couttitane, c.structure
      FROM gamer.composantvaisseau cv
      INNER JOIN datawebsite.composant c ON cv.iditemcomposant = c.idcomposant
      INNER JOIN datawebsite.items i ON cv.iditemcomposant = i.iditem
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
        $HPvaisseau = $HPvaisseau + $repinformationcomposant['HPcomposant'];
        $totalprixbien = $totalprixbien + $repinformationcomposant['coutbien'];
        $totalprixtitane = $totalprixtitane + $repinformationcomposant['couttitane'];
        $structure = $repinformationcomposant['structure'] + $structure;
        }
    
    $reqPVvaisseau = $bdg ->prepare('SELECT HPmaxvaisseau FROM vaisseau WHERE idvaisseau = ?');
    $reqPVvaisseau->execute(array($idvaisseau));
    $repPVvaisseau = $reqPVvaisseau->fetch();
    
    $capacitedesoute = MAX($capacitedesoute, 1);
    // echo 'Id du vaisseau : '.$idvaisseau.'. Caracteristiques : '.$totalprixbien .' prix bien, ' .$vitesse.' Vitesse. '.$HPvaisseau. ' HP vaisseau. '.$repPVvaisseau['HPmaxvaisseau'].' = Ancien HP du vaisseau.<br>' ;
    $requpdatedesignvaisseau = $bdg->prepare('UPDATE vaisseau SET biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ?, structure = ? WHERE idvaisseau = ?'); 
    // Updater le design du vaisseau avec les prix et l'ID du joueur.
    $requpdatedesignvaisseau->execute(array($totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $structure, $idvaisseau));

    if ($repPVvaisseau['HPmaxvaisseau'] != $HPvaisseau)
        {
        // echo 'On passe par la boucle permettant de changer les PV. PV max avant : '.$repPVvaisseau['HPmaxvaisseau'].'. PV max apres et appliques : '.$HPvaisseau.'.<br>';
        $requpdatePVvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
        $requpdatePVvaisseau->execute(array($HPvaisseau, $idvaisseau));
        }
    }
?>