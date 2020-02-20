<?php

$reqselectionvaisseau = $bdg->query('SELECT idvaisseau, idjoueurbat FROM vaisseau WHERE univers <> -1 ORDER BY idvaisseau');
while ($repselectionvaisseau = $reqselectionvaisseau->fetch())
    {
    caracteristiquesvaisesau ($repselectionvaisseau['idvaisseau'], $repselectionvaisseau['idjoueurbat']); 
    }
?>