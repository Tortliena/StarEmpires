<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqdetruireunbatiment = $bdg->prepare('DELETE FROM batiment WHERE typebat = ? AND idplanetebat = ? LIMIT 1');

$reqdestruction = $bdg->query('SELECT idbatimentdestruction, idplanetedestruction FROM destruction');
while($repdestruction = $reqdestruction->fetch())
    {
    $reqdetruireunbatiment->execute(array($repdestruction['idbatimentdestruction'], $repdestruction['idplanetedestruction']));
    }

$reqannulerdestruction = $bdg->query('DELETE FROM destruction');
?>