<?php
/*
session_start();
include("../include/BDDconnection.php");
include("../function/caracteristiquesvaisseau.php");
*/

$reqselectionvaisseau = $bdg->query('SELECT idvaisseau FROM vaisseau ORDER BY idvaisseau');
while ($repselectionvaisseau = $reqselectionvaisseau->fetch())
    {
    caracteristiquesvaisseau ($repselectionvaisseau['idvaisseau']); 
    }
?>