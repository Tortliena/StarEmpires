<?php
function caracteristiquesvaisseau ($idvaisseau)
    {
    require __DIR__ . '/../../include/bddconnection.php';
    $totalprixbien = 40;
    $totalprixtitane = 0;
    $capacitedesoute = 0;
    $capaciteminage = 0;
    $HPvaisseau = 3;
    $structure = -11;
    $vitesse = 1;

    $reqinformationcomposant = $bd ->prepare('  SELECT c.idcomposant, c.typebonus, c.totalbonus, c.HPcomposant,
                                                i.coutbien, i.couttitane, c.structure
                                                FROM c_composantvaisseau cv
                                                INNER JOIN a_composant c ON cv.iditemcomposant = c.idcomposant
                                                INNER JOIN a_items i ON cv.iditemcomposant = i.iditem
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
        }

    $capacitedesoute = MAX($capacitedesoute, 1);

    if ($idvaisseau > 0) // On passe par cette partie seulement durant le tour normalement.
        {
        $reqPVvaisseau = $bd ->prepare('SELECT HPmaxvaisseau FROM c_vaisseau WHERE idvaisseau = ?');
        $reqPVvaisseau->execute(array($idvaisseau));
        $repPVvaisseau = $reqPVvaisseau->fetch();

        $requpdatedesignvaisseau = $bd->prepare('UPDATE c_vaisseau SET biensvaisseau = ?, titanevaisseau = ?, vitesse = ?, capacitedesoute = ?, capaciteminage = ?, HPmaxvaisseau = ? WHERE idvaisseau = ?'); 
        $requpdatedesignvaisseau->execute(array($totalprixbien, $totalprixtitane, $vitesse, $capacitedesoute, $capaciteminage, $HPvaisseau, $idvaisseau));
        
        if ($repPVvaisseau['HPmaxvaisseau'] != $HPvaisseau)
            {
            // echo 'On passe par la boucle permettant de changer les PV. PV max avant : '.$repPVvaisseau['HPmaxvaisseau'].'. PV max apres et appliques : '.$HPvaisseau.'.<br>';
            $requpdatePVvaisseau = $bd->prepare('UPDATE c_vaisseau SET HPvaisseau = ? WHERE idvaisseau = ?');
            $requpdatePVvaisseau->execute(array($HPvaisseau, $idvaisseau));
            }
        }
    else
        {
        return array ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $HPvaisseau);
        // list ($totalprixbien, $totalprixtitane, $capacitedesoute, $capaciteminage, $vitesse, $HPvaisseau) = caracteristiquesvaisseau ($idvaisseau);
        }
    }
?>