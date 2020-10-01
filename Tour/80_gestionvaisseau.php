<?php
/*
session_start();
include("../include/bddconnection.php");
include("../function/caracteristiquesvaisseau.php");
*/

$reqselectionvaisseau = $bd->query('SELECT idvaisseau FROM c_vaisseau ORDER BY idvaisseau');
while ($repselectionvaisseau = $reqselectionvaisseau->fetch())
    {
    caracteristiquesvaisseau($repselectionvaisseau['idvaisseau']); 
    }
?>