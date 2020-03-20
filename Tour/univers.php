<?php
/*
session_start();
include("../include/BDDconnection.php");
*/

$reqcompterplanete = $bdg->prepare('SELECT COUNT(idplanete) AS nb FROM planete WHERE universplanete = ?');

$reqcreerplanete = $bdg->prepare('INSERT INTO planete (
    nomplanete, xplanete, yplanete, universplanete, idjoueurplanete,
    biens, titane, taille, lune, organisation, efficacite)
    VALUES (?,?,?,?,?,?,?,?,?,?,?);');

$reqplanete = $bdg->prepare('SELECT idplanete FROM planete WHERE universplanete = ? AND xplanete = ? AND yplanete = ?');

function random_1($car)
    {
    $string = "";
    $chaine = "abcdefghijklmnpqrstuvwxy";
    srand((double)microtime()*1000000);
    for($i=0; $i<$car; $i++)
        {
        $string .= $chaine[rand()%strlen($chaine)];
        }
    return $string;
    }

$reqcompterplanete->execute(array(-2));
$repcompterplanete =$reqcompterplanete->fetch();
if ($repcompterplanete['nb'] < 50)
    {
    $x = rand(1, 20);
    $y = rand(1, 20);
    
    $reqplanete->execute(array(-2, $x, $y));
    $repplanete =$reqplanete->fetch();
    if (!isset($repplanete['idplanete']))
        {
        $taille = rand(3,6);
        $lune = rand(0,3);
        $nom = random_1(10);
        
        $reqcreerplanete->execute(array($nom, $x, $y, -2, 0, 10, 0, $taille, $lune, 10, 0));
        }
    }


?>