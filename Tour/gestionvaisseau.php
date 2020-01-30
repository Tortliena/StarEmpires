<?php

$reqmajvitessevaisseau = $bdg->prepare('UPDATE vaisseau SET vitesse = ? WHERE idvaisseau = ?');

$reqinformationvaisseau = $bdg ->query('
    SELECT c.idcomposant, c.typebonus, c.totalbonus, v.idvaisseau
    FROM gamer.composantvaisseau cv
    INNER JOIN gamer.vaisseau v ON v.idvaisseau = cv.idvaisseaucompo 
    INNER JOIN datawebsite.composant c ON c.idcomposant = cv.iditemcomposant
    ORDER BY v.idvaisseau');
 while ($repinformationvaisseau = $reqinformationvaisseau->fetch())
    {
    echo $repinformationvaisseau['idcomposant'] . '</br>' ;
    echo $repinformationvaisseau['typebonus'] . '</br>' ;
    echo $repinformationvaisseau['totalbonus'] . '</br>' ;
    echo $repinformationvaisseau['idvaisseau'] . '</br>' ;
   
    if ($repinformationvaisseau['typebonus'] == 1)
        { // 1 = bonus à la vitesse.
        $reqmajvitessevaisseau->execute(array($repinformationvaisseau['totalbonus'], $repinformationvaisseau['idvaisseau']));
        } 
    }

?>
