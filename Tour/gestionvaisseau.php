<?php

$reqmajvitessevaisseau = $bdg->prepare('UPDATE vaisseau SET vitesse = ? WHERE idvaisseau = ?');
$reqmajsoutevaisseau = $bdg->prepare('UPDATE vaisseau SET capacitedesoute = ? WHERE idvaisseau = ?');
$reqmajcapaciteminage = $bdg->prepare('UPDATE vaisseau SET capaciteminage = ? WHERE idvaisseau = ?');

$reqinformationvaisseau = $bdg ->query('
    SELECT c.idcomposant, c.typebonus, c.totalbonus, v.idvaisseau
    FROM gamer.composantvaisseau cv
    INNER JOIN gamer.vaisseau v ON v.idvaisseau = cv.idvaisseaucompo 
    INNER JOIN datawebsite.composant c ON c.idcomposant = cv.iditemcomposant
    ORDER BY v.idvaisseau');
 while ($repinformationvaisseau = $reqinformationvaisseau->fetch())
    {
    switch ($repinformationvaisseau['typebonus'])
        { 
        case 1: // 1 = bonus à la vitesse.
        $reqmajvitessevaisseau->execute(array($repinformationvaisseau['totalbonus'], $repinformationvaisseau['idvaisseau']));
        break;

        case 2: // capacité des soutes.
        $reqmajsoutevaisseau->execute(array($repinformationvaisseau['totalbonus'], $repinformationvaisseau['idvaisseau']));
        break;
        case 3: // capacité du minage.
        $reqmajcapaciteminage->execute(array($repinformationvaisseau['totalbonus'], $repinformationvaisseau['idvaisseau']));
        break;
        } 
    }

$reqcomposant = $bdg ->prepare('SELECT c.HPcomposant, i.coutbien, i.couttitane
    FROM gamer.composantvaisseau cv
    INNER JOIN datawebsite.composant c ON c.idcomposant = cv.iditemcomposant
    INNER JOIN datawebsite.items i ON c.idcomposant = i.iditem
    WHERE cv.idvaisseaucompo = ? ORDER BY cv.idtable');

$requpdatePVmaxvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPmaxvaisseau = ? , HPvaisseau = ? , biensvaisseau = ? , titanevaisseau = ? WHERE idvaisseau = ?');

$reqvaisseau = $bdg ->query('SELECT idvaisseau, HPmaxvaisseau FROM vaisseau ORDER BY idvaisseau');
 while ($repvaisseau = $reqvaisseau->fetch())
    {
    $coutbien = 100;
    $couttitane = 0;
    $HPvaisseau = 3;
    $reqcomposant->execute(array($repvaisseau['idvaisseau']));
    while ($repcomposant = $reqcomposant->fetch())
        {
        $HPvaisseau = $HPvaisseau + $repcomposant['HPcomposant'];
        $coutbien = $coutbien + $repcomposant['coutbien'];
        $couttitane = $couttitane + $repcomposant['couttitane'];
        }

    if ($repvaisseau['HPmaxvaisseau'] != $HPvaisseau)
        {
        $requpdatePVmaxvaisseau->execute(array($HPvaisseau, $HPvaisseau, $coutbien, $couttitane, $repvaisseau['idvaisseau']));
        }
    }
?>