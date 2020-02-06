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

$reqcomposant = $bdg ->prepare('SELECT c.HPcomposant 
    FROM gamer.composantvaisseau cv
    INNER JOIN datawebsite.composant c ON c.idcomposant = cv.iditemcomposant
    WHERE cv.idvaisseaucompo = ? ORDER BY cv.idtable');
$requpdatePVmaxvaisseau = $bdg ->prepare('UPDATE vaisseau SET HPmaxvaisseau = ? , HPvaisseau = ? WHERE idvaisseau = ?');

$reqvaisseau = $bdg ->query('SELECT idvaisseau, HPmaxvaisseau FROM vaisseau ORDER BY idvaisseau');
 while ($repvaisseau = $reqvaisseau->fetch())
    {
    $HPvaisseau = 3;
    $reqcomposant->execute(array($repvaisseau['idvaisseau']));
    while ($repcomposant = $reqcomposant->fetch())
        {
        $HPvaisseau = $HPvaisseau + $repcomposant['HPcomposant'];
        }

    if ($repvaisseau['HPmaxvaisseau'] != $HPvaisseau)
        {
        $requpdatePVmaxvaisseau->execute(array($HPvaisseau, $HPvaisseau, $repvaisseau['idvaisseau']));
        }
    }
?>