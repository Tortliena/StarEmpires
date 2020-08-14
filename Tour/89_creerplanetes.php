<?php
/*
session_start();
require __DIR__ . '/../include/BDDconnection.php';
require __DIR__ . '/../tour/fonctionsdutour.php';
*/

$reqcreerplanete = $bdg->prepare('INSERT INTO planete (
    nomplanete, xplanete, yplanete, universplanete, idjoueurplanete,
    biens, titane, taille, lune, organisation, efficacite)
    VALUES (?,?,?,?,?,?,?,?,?,?,?);');
$reqcompterplanete = $bdg->prepare('SELECT COUNT(idplanete) AS nb FROM planete WHERE universplanete = ?');
$reqcompterplanete->execute(array(-2));
$repcompterplanete =$reqcompterplanete->fetch();
if ($repcompterplanete['nb'] < 50 OR !isset($repcompterplanete['nb']))
    {
    $xymax = 20;
    $x = rand(1, $xymax);
    $y = rand(1, $xymax);
    
    $reqplanete->execute(array(-2, $x, $y));
    $repplanete =$reqplanete->fetch();
    if (!isset($repplanete['idplanete']))
        {
        $taille = rand(3,6);
        $lune = rand(0,3);
        $nom = generateurdenom(10);
        
        $reqcreerplanete->execute(array($nom, $x, $y, -2, 0, 10, 0, $taille, $lune, 10, 0));
        }
    }
?>