<?php
/*
session_start();
include("../include/bddconnection.php");
*/

$reqdetruireunbatiment = $bd->prepare('DELETE FROM c_batiment WHERE typebat = ? AND idplanetebat = ? LIMIT 1');

if ($tourrestraint == 'non')
    {
    $reqdestruction = $bd->query('SELECT idbatimentdestruction, idplanetedestruction FROM c_destruction');
    }
else
    {
    $reqdestruction = $bd->query('SELECT idbatimentdestruction, idplanetedestruction FROM c_destruction WHERE idplanetedestruction IN ('.$idplanetes.')');
    }
while($repdestruction = $reqdestruction->fetch())
    {
    $reqdetruireunbatiment->execute(array($repdestruction['idbatimentdestruction'], $repdestruction['idplanetedestruction']));
    }

$reqannulerdestruction = $bd->query('DELETE FROM c_destruction');
?>